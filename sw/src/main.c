/*
===============================================================================
 Name        : main.c
 Author      : Olli Usenius
 Version     :
 Copyright   : $(copyright)
 Description :
===============================================================================
*/

#include "main.h"
#include "messages.h"
#include "pin_mappings.h"
#include "can_fsb.h"

#include <uv_utilities.h>
#include <uv_rtos.h>
#include <uv_pwm.h>
#include <uv_eeprom.h>
#include <string.h>

dev_st dev = {};
#define this ((dev_st*) &dev)


#define VND5050_CURRENT_AMPL_UA		4173
#define VN5E01_CURRENT_AMPL_UA		13923


/// Will be called when ignition key changed state
static void ignkey_state_changed(fsb_ignkey_states_e last_state);


uint16_t adc_get_voltage_mv(const uv_adc_channels_e adc_chn) {
	int32_t adc = uv_adc_read(adc_chn);
	return adc * 3300 / ADC_MAX_VALUE;
}


#define LEVEL_0_MV				0
#define LEVEL_100_MV			500
int16_t get_level(uv_adc_channels_e adc) {
	int16_t ret;
	int64_t mv = adc_get_voltage_mv(adc);
	int32_t t = uv_reli(mv, LEVEL_0_MV, LEVEL_100_MV);
	int32_t result = uv_lerpi(t, 0, 100);

	if (result < LEVEL_FAULT_MIN_VAL) {
		ret = LEVEL_FAULT_MIN_VAL;
	}
	else if (result > LEVEL_FAULT_MAX_VAL) {
		ret = LEVEL_FAULT_MAX_VAL;
	}
	else {
		if (result > 100) {
			result = 100;
		}
		ret = result;
	}
	return ret;
}






void init(dev_st* me) {

	// initialize outputs
	uv_output_init(&this->horn, HORN_SENSE, HORN_O, VND5050_CURRENT_AMPL_UA,
			3000, 4000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HORN_OVERCURRENT, FSB_EMCY_HORN_FAULT);
	uv_output_init(&this->radio, RADIO_SENSE, RADIO_O, VND5050_CURRENT_AMPL_UA,
			3000, 5000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_RADIO_OVERCURRENT, FSB_EMCY_RADIO_FAULT);
	uv_output_init(&this->aux, AUX_SENSE, AUX_O, VN5E01_CURRENT_AMPL_UA,
			15000, 50000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_AUX_OVERCURRENT, 0);
	uv_output_init(&this->ui, UI_SENSE, UI_O, VND5050_CURRENT_AMPL_UA, 2000, 3000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_UI_OVERCURRENT, FSB_EMCY_UI_FAULT);
	uv_output_init(&this->heater1, HEATER_SENSE, HEATER1_O, VN5E01_CURRENT_AMPL_UA,
			0xFFFF, 0xFFFF, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERBAT_OVERCURRENT, FSB_EMCY_HEATERBAT_FAULT);
	uv_output_init(&this->heater2, HEATER_SENSE, HEATER2_O, VN5E01_CURRENT_AMPL_UA,
			0xFFFF, 0xFFFF, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERBAT_OVERCURRENT, FSB_EMCY_HEATERBAT_FAULT);

	// initialize inputs
	UV_GPIO_INIT_INPUT(EBERFAN_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_PREHEAT_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_ON_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_START_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(EMCY_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW1_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW2_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(SEATSW_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(VBAT_I, PULL_UP_ENABLED);

	// initialize fuel level sensor module
	uv_sensor_init(&this->fuel_level, FUEL_LEVEL_AIN, FUEL_LEVEL_AVG_COUNT, &get_level);
	uv_sensor_set_warning(&this->fuel_level, FUEL_LEVEL_WARNING_VALUE, FUEL_LEVEL_HYSTERESIS,
			true, FSB_EMCY_FUEL_LEVEL_WARNING);
	uv_sensor_set_fault(&this->fuel_level, LEVEL_FAULT_MIN_VAL, LEVEL_FAULT_MAX_VAL,
			FUEL_LEVEL_HYSTERESIS, FSB_EMCY_FUEL_LEVEL_FAULT);
	this->fuel_level_value = 0;

	this->ignkey = FSB_IGNKEY_STATE_OFF;
	this->emcy = !uv_gpio_get(EMCY_I);
	memset(this->emcy_buffer, 0, sizeof(this->emcy_buffer));
	uv_ring_buffer_init(&this->emcy_ring_buffer, this->emcy_buffer,
			sizeof(this->emcy_buffer) / sizeof(this->emcy_buffer[0]),
			sizeof(this->emcy_buffer[0]));
	this->vbat = 0;
	this->eberfan = uv_gpio_get(EBERFAN_I);
	this->woken_by_eber = this->eberfan;
	uv_moving_aver_init(&this->eberfan_avg, OUTPUT_MOVING_AVG_COUNT);
	this->heaterspeed = 0;
	this->heater_req = 0;
	this->last_heater_req = 0;
	this->doorsw1 = !uv_gpio_get(DOORSW1_I);
	memset(this->doorsw1_buffer, 0, sizeof(this->doorsw1_buffer));
	uv_ring_buffer_init(&this->doorsw1_ringbuffer, this->doorsw1_buffer,
			sizeof(this->doorsw1_buffer) / sizeof(this->doorsw1_buffer[0]),
			sizeof(this->doorsw1_buffer[0]));
	this->doorsw2 = !uv_gpio_get(DOORSW2_I);
	memset(this->doorsw2_buffer, 0, sizeof(this->doorsw2_buffer));
	uv_ring_buffer_init(&this->doorsw2_ringbuffer, this->doorsw2_buffer,
			sizeof(this->doorsw2_buffer) / sizeof(this->doorsw2_buffer[0]),
			sizeof(this->doorsw2_buffer[0]));
	this->seatsw = !uv_gpio_get(SEATSW_I);
	memset(this->seatsw_buffer, 0, sizeof(this->seatsw_buffer));
	uv_ring_buffer_init(&this->seatsw_ringbuffer, this->seatsw_buffer,
			sizeof(this->seatsw_buffer) / sizeof(this->seatsw_buffer[0]),
			sizeof(this->seatsw_buffer[0]));
	uv_moving_aver_init(&this->key_on, IGNKEY_MOVING_AVER_COUNT);
	uv_moving_aver_init(&this->key_preheat, IGNKEY_MOVING_AVER_COUNT);
	uv_moving_aver_init(&this->key_start, IGNKEY_MOVING_AVER_COUNT);

	uv_delay_init(&this->ui_delay, UI_DELAY_MS);

	uv_eeprom_read(&this->assembly, sizeof(this->assembly), ASSEMBLY_EEPROM_ADDR);
	// by default eber is not installed
	if (this->assembly.eber_installed == 0xFF) {
		this->assembly.eber_installed = 0;
		uv_eeprom_write(&this->assembly, sizeof(this->assembly), ASSEMBLY_EEPROM_ADDR);
	}
	if (this->assembly.safety_enable < SAFETY_NONE ||
			this->assembly.safety_enable > SAFETY_ALL) {
		this->assembly.safety_enable = SAFETY_ALL;
		uv_eeprom_write(&this->assembly, sizeof(this->assembly), ASSEMBLY_EEPROM_ADDR);
	}

	//init terminal and pass application terminal commands array as a parameter
	uv_terminal_init(terminal_commands, commands_size());


	// load non-volatile data
	if (uv_memory_load()) {

		uv_memory_save();
	}

	uv_canopen_set_state(CANOPEN_OPERATIONAL);

}

static uint8_t get_gpio(uv_gpios_e gpio) {
	uint8_t val = 0;
	for (uint8_t i = 0; i < UINT8_MAX; i++) {
		val += (uv_gpio_get(gpio)) ? 0 : 1;
	}
	return (val < (UINT8_MAX / 2));

}


void step(void* me) {

	init(this);

	while (true) {
		unsigned int step_ms = 20;

		if (uv_ring_buffer_get_element_count(&this->emcy_ring_buffer) ==
				sizeof(this->emcy_buffer)) {
			uint8_t val;
			uv_ring_buffer_pop(&this->emcy_ring_buffer, &val);
		}
		uint8_t emcy = !uv_gpio_get(EMCY_I);
		uv_ring_buffer_push(&this->emcy_ring_buffer, &emcy);
		emcy = 1;
		for (uint8_t i = 0; i < sizeof(this->emcy_buffer); i++) {
			if (this->emcy_buffer[i] == 0) {
				emcy = 0;
				break;
			}
		}
		this->emcy = (this->assembly.safety_enable & SAFETY_EMCY) ? emcy : 0;

		uv_sensor_step(&this->fuel_level, step_ms);
		this->fuel_level_value = (uint8_t) uv_sensor_get_value(&this->fuel_level);

		if (this->assembly.eber_installed) {
			this->eberfan = uv_moving_aver_step(&this->eberfan_avg, uv_gpio_get(EBERFAN_I));
		}
		else {
			this->eberfan = 0;
		}
		if (uv_ring_buffer_get_element_count(&this->doorsw1_ringbuffer) ==
				sizeof(this->doorsw1_buffer)) {
			uint8_t val;
			uv_ring_buffer_pop(&this->doorsw1_ringbuffer, &val);
		}
		uint8_t doorsw1 = (this->assembly.safety_enable & SAFETY_DOOR) ?
				!uv_gpio_get(DOORSW1_I) : 1;
		uv_ring_buffer_push(&this->doorsw1_ringbuffer, &doorsw1);
		doorsw1 = 0;
		for (uint8_t i = 0;
				i < sizeof(this->doorsw1_buffer) / sizeof(this->doorsw1_buffer[0]); i++) {
			if (this->doorsw1_buffer[i] == 1) {
				doorsw1 = 1;
				break;
			}
		}
		this->doorsw1 = doorsw1;

		if (uv_ring_buffer_get_element_count(&this->doorsw2_ringbuffer) ==
				sizeof(this->doorsw2_buffer)) {
			uint8_t val;
			uv_ring_buffer_pop(&this->doorsw2_ringbuffer, &val);
		}
		uint8_t doorsw2 = (this->assembly.safety_enable & SAFETY_DOOR) ?
				!uv_gpio_get(DOORSW2_I) : 1;
		uv_ring_buffer_push(&this->doorsw2_ringbuffer, &doorsw2);
		doorsw2 = 0;
		for (uint8_t i = 0;
				i < sizeof(this->doorsw2_buffer) / sizeof(this->doorsw2_buffer[0]); i++) {
			if (this->doorsw2_buffer[i] == 1) {
				doorsw2 = 1;
				break;
			}
		}
		this->doorsw2 = doorsw2;

		if (uv_ring_buffer_get_element_count(&this->seatsw_ringbuffer) ==
				sizeof(this->seatsw_ringbuffer)) {
			uint8_t val;
			uv_ring_buffer_pop(&this->seatsw_ringbuffer, &val);
		}
		uint8_t seatsw = (this->assembly.safety_enable & SAFETY_SEAT) ?
				!get_gpio(SEATSW_I) : 1;
		uv_ring_buffer_push(&this->seatsw_ringbuffer, &seatsw);
		seatsw = 0;
		for (uint8_t i = 0;
				i < sizeof(this->seatsw_buffer) / sizeof(this->seatsw_buffer[0]); i++) {
			if (this->seatsw_buffer[i] == 1) {
				seatsw = 1;
				break;
			}
		}
		this->seatsw = seatsw;

		// update watchdog timer value to prevent a hard reset
		// uw_wdt_update();

		uv_output_step(&this->horn, step_ms);
		uv_output_step(&this->radio, step_ms);
		uv_output_step(&this->aux, step_ms);
		uv_output_step(&this->ui, step_ms);
		uv_output_step(&this->heater1, step_ms);
		uv_output_step(&this->heater2, step_ms);

		// terminal step function
		uv_terminal_step();

		this->total_current = uv_output_get_current(&this->horn) +
				uv_output_get_current(&this->radio) +
				uv_output_get_current(&this->aux) +
				uv_output_get_current(&this->ui) +
				uv_output_get_current(&this->heater1) +
				uv_output_get_current(&this->heater2);


		if (this->heater_req && !this->last_heater_req) {
			if (this->heater_req > 0) {
				// increase heater requested
				this->heaterspeed += FSB_HEATER_MAX_SPEED / HEATER_SPEED_STEPS_COUNT;
			}
			else {
				// decrease heater requested
				if (this->heaterspeed >= FSB_HEATER_MAX_SPEED / HEATER_SPEED_STEPS_COUNT) {
					this->heaterspeed -= FSB_HEATER_MAX_SPEED / HEATER_SPEED_STEPS_COUNT;
				}
				else {
					this->heaterspeed = 0;
				}
			}
		}
		this->last_heater_req = this->heater_req;

		// heater. It is also controlled by eber
		if ((this->heaterspeed > FSB_HEATER_MAX_SPEED) ||
				(this->eberfan)) {
			this->heaterspeed = FSB_HEATER_MAX_SPEED;
		}
		uv_output_set_state(&this->heater1,
				(this->heaterspeed && (this->heaterspeed < FSB_HEATER_MAX_SPEED)) ?
						OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
		uv_output_set_state(&this->heater2,
				(this->heaterspeed == FSB_HEATER_MAX_SPEED) ?
						OUTPUT_STATE_ON : OUTPUT_STATE_OFF);


		// vbat
		this->vbat = !uv_gpio_get(VBAT_I);

		// **** ignition key state machine ****
		// Key states are averaged
		uv_moving_aver_step(&this->key_on, uv_gpio_get(KEY_ON_I) ? 100 : 0);
		uv_moving_aver_step(&this->key_preheat, uv_gpio_get(KEY_PREHEAT_I) ? 100 : 0);
		uv_moving_aver_step(&this->key_start, uv_gpio_get(KEY_START_I) ? 100 : 0);

		bool key_on = (uv_moving_aver_get_val(&this->key_on) > 50);
		bool key_preheat = (uv_moving_aver_get_val(&this->key_preheat) > 50);
		bool key_start = (uv_moving_aver_get_val(&this->key_start) > 50);

		fsb_ignkey_states_e last_state = this->ignkey;

		// key off
		if (!key_on &&
				!key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_OFF;
			if (last_state != this->ignkey) {
				ignkey_state_changed(last_state);
			}
		}
		// key on
		else if (key_on &&
				!key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_ON;
			if (last_state != this->ignkey) {
				ignkey_state_changed(last_state);
			}
		}
		// key preheat
		else if (key_on &&
				key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_PREHEAT;
			if (last_state != this->ignkey) {
				ignkey_state_changed(last_state);
			}
		}
		// key start
		else if (key_on &&
				key_preheat &&
				key_start) {
			// send notification if emcy switch is pressed
			this->ignkey = FSB_IGNKEY_STATE_START;
			if (last_state != this->ignkey) {
				ignkey_state_changed(last_state);
			}
		}
		// fault state
		else {
			this->ignkey = FSB_IGNKEY_STATE_OFF;
			if (last_state != this->ignkey) {
				//uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC, FSB_EMCY_IGNKEY_FAULT);
				ignkey_state_changed(last_state);
			}
		}



		// Radio, Aux & UI disabled if Eber did wake us up
		if (this->eberfan && this->woken_by_eber) {
			uv_output_set_state(&this->radio, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->aux, OUTPUT_STATE_OFF);
			// keep ui on if ignkey is not in off position
			uv_output_set_state(&this->ui,
					(this->ignkey == FSB_IGNKEY_STATE_OFF) ? OUTPUT_STATE_OFF : OUTPUT_STATE_ON);
		}
		else {
			// radio and aux power is on when ignkey is ON
			uv_output_set_state(&this->radio,
					(this->ignkey == FSB_IGNKEY_STATE_ON) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
			uv_output_set_state(&this->aux,
					(this->ignkey == FSB_IGNKEY_STATE_ON) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
			// ui
			uv_output_state_e s = uv_output_get_state(&this->ui);
			if (s == OUTPUT_STATE_OVERLOAD ||
					s == OUTPUT_STATE_FAULT) {
				if (uv_delay(&this->ui_delay, step_ms)) {
					uv_output_set_state(&this->ui, OUTPUT_STATE_OFF);
				}
			}
			else {
				uv_output_set_state(&this->ui, OUTPUT_STATE_ON);
				uv_delay_init(&this->ui_delay, UI_DELAY_MS);
			}
		}




		// emcy handling
		if (this->emcy) {
			// note: UI should not be stopped to keep display visible
			uv_output_disable(&this->aux);
			uv_output_disable(&this->radio);
			uv_output_disable(&this->horn);
			uv_output_disable(&this->heater1);
			uv_output_enable(&this->heater2);
		}
		else {
			uv_output_enable(&this->aux);
			uv_output_enable(&this->radio);
			uv_output_enable(&this->horn);
			uv_output_enable(&this->heater1);
			uv_output_enable(&this->heater2);
		}

		uv_rtos_task_delay(step_ms);
	}
}



static void ignkey_state_changed(fsb_ignkey_states_e last_state) {
	// retransmit PDO message where ignkey state is
	uv_canopen_pdo_mapping_update(FSB_IGNKEY_INDEX, FSB_IGNKEY_SUBINDEX);

	if ((this->ignkey == FSB_IGNKEY_STATE_START) &&
			this->emcy) {
		uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC,
				FSB_EMCY_EMCY_NOTIFY);
	}
	else if ((this->ignkey == FSB_IGNKEY_STATE_OFF) &&
			this->heaterspeed) {
		this->heaterspeed = 0;
	}
	else {

	}
}




int main(void) {

	// init the watchdog timer
//	uw_wdt_init(5);

	uv_init(&dev);

	uv_rtos_task_create(step, "step", UV_RTOS_MIN_STACK_SIZE * 5,
			&dev, UV_RTOS_IDLE_PRIORITY + 1, NULL);


	uv_rtos_start_scheduler();


    // Enter an infinite loop
	// never should end up here
    while(1) {
    }
    return 0;
}

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

dev_st dev = {};
#define this ((dev_st*) &dev)


#define VND5050_CURRENT_AMPL_UA		4173
#define VN5E01_CURRENT_AMPL_UA		13923


/// Will be called when ignition key changed state
static void ignkey_state_changed(fsb_ignkey_states_e last_state);



void init(dev_st* me) {

	// initialize outputs
	uv_output_init(&this->horn, HORN_SENSE, HORN_O, VND5050_CURRENT_AMPL_UA,
			3000, 4000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HORN_OVERCURRENT, FSB_EMCY_HORN_FAULT);
	uv_output_init(&this->radio, RADIO_SENSE, RADIO_O, VND5050_CURRENT_AMPL_UA,
			1000, 2000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_RADIO_OVERCURRENT, FSB_EMCY_RADIO_FAULT);
	uv_output_init(&this->aux, AUX_SENSE, AUX_O, VN5E01_CURRENT_AMPL_UA,
			15000, 50000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_AUX_OVERCURRENT, 0);
	uv_output_init(&this->ui, UI_SENSE, UI_O, VND5050_CURRENT_AMPL_UA, 2000, 3000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_UI_OVERCURRENT, FSB_EMCY_UI_FAULT);
	uv_output_init(&this->heater, HEATER_SENSE, HEATER_O, VN5E01_CURRENT_AMPL_UA,
			0xFFFF, 0xFFFF, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERBAT_OVERCURRENT, FSB_EMCY_HEATERBAT_FAULT);

	// initialize inputs
	UV_GPIO_INIT_INPUT(EBERFAN_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_PREHEAT_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_ON_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_START_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(EMCY_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW1_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW2_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(SEATSW_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(VBAT_I, PULL_UP_ENABLED);

	// initialize heater PWM output
	uv_pwm_set(HEATER_PWM, DUTY_CYCLEPPT(0));


	this->ignkey = FSB_IGNKEY_STATE_OFF;
	this->emcy = uv_gpio_get(EMCY_I);
	this->vbat = 0;
	this->eberfan = uv_gpio_get(EBERFAN_I);
	this->heaterspeed = 0;
	this->doorsw1 = uv_gpio_get(DOORSW1_I);
	this->doorsw2 = uv_gpio_get(DOORSW2_I);
	this->seatsw = !uv_gpio_get(SEATSW_I);

	uv_moving_aver_init(&this->key_on, IGNKEY_MOVING_AVER_COUNT);
	uv_moving_aver_init(&this->key_preheat, IGNKEY_MOVING_AVER_COUNT);
	uv_moving_aver_init(&this->key_start, IGNKEY_MOVING_AVER_COUNT);

	//init terminal and pass application terminal commands array as a parameter
	uv_terminal_init(terminal_commands, commands_size());

	// load non-volatile data
	if (uv_memory_load()) {

		uv_memory_save();
	}

	uv_canopen_set_state(CANOPEN_OPERATIONAL);

}




void step(void* me) {

	init(this);

	while (true) {
		unsigned int step_ms = 20;

		this->emcy = uv_gpio_get(EMCY_I);
		this->doorsw1 = uv_gpio_get(DOORSW1_I);
		this->doorsw2 = uv_gpio_get(DOORSW2_I);
		this->seatsw = !uv_gpio_get(SEATSW_I);
		this->eberfan = uv_gpio_get(EBERFAN_I);

		// update watchdog timer value to prevent a hard reset
		// uw_wdt_update();

		uv_output_step(&this->horn, step_ms);
		uv_output_step(&this->radio, step_ms);
		uv_output_step(&this->aux, step_ms);
		uv_output_step(&this->ui, step_ms);
		uv_output_step(&this->heater, step_ms);

		// terminal step function
		uv_terminal_step();

		this->total_current = uv_output_get_current(&this->horn) +
				uv_output_get_current(&this->radio) +
				uv_output_get_current(&this->aux) +
				uv_output_get_current(&this->ui) +
				uv_output_get_current(&this->heater);


		// heater. It is also controlled by eber
		if ((this->heaterspeed > FSB_HEATER_MAX_SPEED) ||
				(this->eberfan)) {
			this->heaterspeed = FSB_HEATER_MAX_SPEED;
		}
		uv_output_set_state(&this->heater,
				(this->heaterspeed) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
		uv_pwm_set(HEATER_PWM, PWM_MAX_VALUE * this->heaterspeed / FSB_HEATER_MAX_SPEED);


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



		// Radio, Aux & UI disabled when Eber is on
		if (this->eberfan) {
			uv_output_set_state(&this->radio, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->aux, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->ui, OUTPUT_STATE_OFF);
		}
		else {
			// radio and aux power is on when ignkey is ON
			uv_output_set_state(&this->radio,
					(this->ignkey == FSB_IGNKEY_STATE_ON) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
			uv_output_set_state(&this->aux,
					(this->ignkey == FSB_IGNKEY_STATE_ON) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
			// ui
			uv_output_set_state(&this->ui, OUTPUT_STATE_ON);
		}




		// emcy handling
//		if (this->emcy) {
//			// note: UI should not be stopped to keep display visible
//			uv_output_disable(&this->aux);
//			uv_output_disable(&this->radio);
//			uv_output_disable(&this->horn);
//			uv_output_disable(&this->heater);
//			uv_pwm_set(HEATER_PWM, 0);
//		}
//		else {
//			uv_output_enable(&this->aux);
//			uv_output_enable(&this->radio);
//			uv_output_enable(&this->horn);
//			uv_output_enable(&this->heater);
//		}

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

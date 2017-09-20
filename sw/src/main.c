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

#define ADC_START()		do { uv_adc_start(HORN_SENSE | \
							RADIO_SENSE | \
							AUX_SENSE | \
							HEATERVDD_SENSE | \
							HEATERBAT_SENSE | \
							ADC0_0); } while (0)



void adc_callback(void) {
	uv_disable_int();
	output_adc(&this->horn);
	output_adc(&this->radio);
	output_adc(&this->aux);
	output_adc(&this->heatervdd);
	output_adc(&this->heaterbat);
	uv_enable_int();

	// start new adc conversion
	ADC_START();
}


void init(dev_st* me) {

	// initialize outputs
	output_init(&this->horn, HORN_SENSE, HORN_O, OUTPUT_2_MOHM,
			0, 4000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HORN_OVERCURRENT, FSB_EMCY_HORN_FAULT);
	output_init(&this->radio, RADIO_SENSE, RADIO_O, OUTPUT_2_MOHM,
			0, 2000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_RADIO_OVERCURRENT, FSB_EMCY_RADIO_FAULT);
	output_init(&this->aux, AUX_SENSE, AUX_O, OUTPUT_2_MOHM,
			0, 10000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_AUX_OVERCURRENT, FSB_EMCY_AUX_FAULT);
	output_init(&this->heatervdd, HEATERVDD_SENSE, HEATERVDD_O, OUTPUT_2_MOHM,
			0, 20000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERVDD_OVERCURRENT, FSB_EMCY_HEATERVDD_FAULT);
	output_init(&this->heaterbat, HEATERBAT_SENSE, HEATERBAT_O, OUTPUT_2_MOHM,
			0, 20000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERBAT_OVERCURRENT, FSB_EMCY_HEATERBAT_FAULT);

	// initialize inputs
	UV_GPIO_INIT_INPUT(EBERFAN_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_PREHEAT_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_ON_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_START_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(EMCY_I, PULL_UP_ENABLED);

	// initialize heater PWM output
	uv_pwm_set(HEATER_PWM, DUTY_CYCLEPPT(0));


	this->ignkey = FSB_IGNKEY_STATE_OFF;
	this->emcy = uv_gpio_get(EMCY_I);
	this->vbat = 0;
	this->eberfan = uv_gpio_get(EBERFAN_I);
	this->heaterspeed = 0;

	//init terminal and pass application terminal commands array as a parameter
	uv_terminal_init(terminal_commands, commands_size());

	// load non-volatile data
	if (uv_memory_load()) {

		uv_memory_save();
	}

	uv_canopen_set_state(CANOPEN_OPERATIONAL);

	ADC_START();
}




void step(void* me) {

	init(this);

	while (true) {
		unsigned int step_ms = 20;
		// update watchdog timer value to prevent a hard reset
		// uw_wdt_update();

		output_step(&this->horn, step_ms);
		output_step(&this->radio, step_ms);
		output_step(&this->aux, step_ms);
		output_step(&this->heatervdd, step_ms);
		output_step(&this->heaterbat,step_ms);

		// terminal step function
		uv_terminal_step();

		this->total_current = output_get_current(&this->horn) +
				output_get_current(&this->radio) +
				output_get_current(&this->aux) +
				output_get_current(&this->heatervdd) +
				output_get_current(&this->heaterbat);

		this->emcy = !uv_gpio_get(EMCY_I);

		// heater
		if (this->heaterspeed > 100) {
			this->heaterspeed = 100;
		}
		uv_pwm_set(HEATER_PWM, DUTY_CYCLEPPT(this->heaterspeed * 10));

		// vbat
		uint16_t vbat = uv_adc_read(VBAT_SENSE);
		vbat = vbat * 3300 / ADC_MAX_VALUE;
		this->vbat = (vbat > 10000) ? 1 : 0;

		// ignition key state machine
		uint8_t key_on = uv_gpio_get(KEY_ON_I);
		uint8_t key_preheat = uv_gpio_get(KEY_PREHEAT_I);
		uint8_t key_start = uv_gpio_get(KEY_START_I);
		// key off
		if (!key_on &&
				!key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_OFF;
		}
		// key on
		else if (key_on &&
				!key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_ON;
		}
		// key preheat
		else if (key_on &&
				key_preheat &&
				!key_start) {
			this->ignkey = FSB_IGNKEY_STATE_PREHEAT;
		}
		// key start
		else if (key_on &&
				key_preheat &&
				key_start) {
			this->ignkey = FSB_IGNKEY_STATE_START;
		}
		// fault state
		else {
			if (this->ignkey != FSB_IGNKEY_STATE_OFF) {
				uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC, FSB_EMCY_IGNKEY_FAULT);
			}
			this->ignkey = FSB_IGNKEY_STATE_OFF;
		}




		uv_rtos_task_delay(step_ms);
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

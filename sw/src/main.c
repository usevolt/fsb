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




void init(dev_st* me) {

	// initialize outputs
	uv_output_init(&this->horn, HORN_SENSE, HORN_O, 2,
			0, 4000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HORN_OVERCURRENT, FSB_EMCY_HORN_FAULT);
	uv_output_init(&this->radio, RADIO_SENSE, RADIO_O, 2,
			0, 2000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_RADIO_OVERCURRENT, FSB_EMCY_RADIO_FAULT);
	uv_output_init(&this->aux, AUX_SENSE, AUX_O, 2,
			0, 10000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_AUX_OVERCURRENT, FSB_EMCY_AUX_FAULT);
	uv_output_init(&this->ui, UI_SENSE, UI_O, 2, 2000, 3000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_UI_OVERCURRENT, FSB_EMCY_UI_FAULT);
	uv_solenoid_output_init(&this->heater, HEATER_PWM, 50, 1, HEATER_SENSE, 2,
			20000, 30000, OUTPUT_MOVING_AVG_COUNT,
			FSB_EMCY_HEATERBAT_OVERCURRENT, FSB_EMCY_HEATERBAT_FAULT);

	// initialize inputs
	UV_GPIO_INIT_INPUT(EBERFAN_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_PREHEAT_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_ON_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(KEY_START_I, PULL_DOWN_ENABLED);
	UV_GPIO_INIT_INPUT(EMCY_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW1_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(DOORSW2_I, PULL_UP_ENABLED);
	UV_GPIO_INIT_INPUT(VBAT_I, PULL_UP_ENABLED);

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

}




void step(void* me) {

	init(this);

	while (true) {
		unsigned int step_ms = 20;
		// update watchdog timer value to prevent a hard reset
		// uw_wdt_update();

		uv_output_step(&this->horn, step_ms);
		uv_output_step(&this->radio, step_ms);
		uv_output_step(&this->aux, step_ms);
		uv_output_step(&this->ui, step_ms);
		uv_solenoid_output_step(&this->heater, step_ms);

		// terminal step function
		uv_terminal_step();

		this->total_current = uv_output_get_current(&this->horn) +
				uv_output_get_current(&this->radio) +
				uv_output_get_current(&this->aux) +
				uv_output_get_current(&this->ui) +
				uv_solenoid_output_get_current(&this->heater);

		this->emcy = uv_gpio_get(EMCY_I);

		// heater
		if (this->heaterspeed > FSB_HEATER_MAX_SPEED) {
			this->heaterspeed = FSB_HEATER_MAX_SPEED;
		}


		// ui
		uv_output_set_state(&this->ui, (this->ignkey == FSB_IGNKEY_STATE_START) ?
				OUTPUT_STATE_OFF : OUTPUT_STATE_ON);

		// vbat
		this->vbat = !uv_gpio_get(VBAT_I);

		// ignition key state machine
		uint8_t key_on = uv_gpio_get(KEY_ON_I);
		uint8_t key_preheat = uv_gpio_get(KEY_PREHEAT_I);
		uint8_t key_start = uv_gpio_get(KEY_START_I);
		// key off
		if (!key_on &&
				!key_preheat &&
				!key_start) {
			if ((this->ignkey != FSB_IGNKEY_STATE_OFF) &&
					this->heaterspeed) {
				this->heaterspeed = 0;
			}
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
			// send notification if emcy switch is pressed
			if ((this->ignkey != FSB_IGNKEY_STATE_START) &&
					this->emcy) {
				uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC,
						FSB_EMCY_EMCY_NOTIFY);
			}
			this->ignkey = FSB_IGNKEY_STATE_START;
		}
		// fault state
		else {
			if (this->ignkey != FSB_IGNKEY_STATE_OFF) {
				uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC, FSB_EMCY_IGNKEY_FAULT);
			}
			this->ignkey = FSB_IGNKEY_STATE_OFF;
		}

		// radio power is always on when ignition key is on
		uv_output_set_state(&this->radio, (key_on) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
		uv_output_set_state(&this->aux, (key_on) ? OUTPUT_STATE_ON : OUTPUT_STATE_OFF);



		// emcy handling
		if (this->emcy) {
			uv_output_set_state(&this->aux, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->radio, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->horn, OUTPUT_STATE_OFF);
			uv_output_set_state(&this->ui, OUTPUT_STATE_OFF);
			uv_solenoid_output_set_state(&this->heater, OUTPUT_STATE_OFF);
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

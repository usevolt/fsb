/*
 * pin_mappings.h
 *
 *  Created on: Jan 27, 2015
 *      Author: usenius
 *
 *  Defines keypad pin mappings for different pcb revisions used
 */

#ifndef UW_MB_SRC_PIN_MAPPINGS_H_
#define UW_MB_SRC_PIN_MAPPINGS_H_

#include <uv_gpio.h>
#include <uv_timer.h>
#include <uv_adc.h>


// Analog inputs
#define AUX_SENSE					ADC1_2
#define HORN_SENSE					ADC0_3
#define RADIO_SENSE					ADC0_2
#define HEATER_SENSE				ADC1_4
#define UI_SENSE					ADC0_0

// Digital inputs
#define EBERFAN_I					P0_1
#define KEY_PREHEAT_I				P0_14
#define KEY_ON_I					P0_15
#define KEY_START_I					P0_13
#define EMCY_I						P0_16
#define DOORSW1_I					P1_9
#define DOORSW2_I					P1_4
#define SEATSW_I					P1_5
#define VBAT_I						P0_2


// Digital outputs
#define HORN_O						P0_4
#define RADIO_O						P0_3
#define AUX_O						P0_18
#define UI_O						P0_7
// refer to uv_hal_config for where PWM0_0 is located
#define HEATER_PWM					PWM0_0




#endif /* UW_MB_SRC_PIN_MAPPINGS_H_ */

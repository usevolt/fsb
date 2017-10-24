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
#define AUX_SENSE					ADC0_11
#define HORN_SENSE					ADC0_9
#define RADIO_SENSE					ADC0_8
#define VBAT_SENSE					ADC0_6
#define HEATERVDD_SENSE				ADC0_5
#define HEATERBAT_SENSE				ADC0_4

// Digital inputs
#define EBERFAN_I					P0_1
#define KEY_PREHEAT_I				P1_4
#define KEY_ON_I					P1_5
#define KEY_START_I					P0_16
#define EMCY_I						P0_17

// Digital outputs
#define HORN_O						P0_26
#define RADIO_O						P0_27
#define AUX_O						P0_28
#define HEATERBAT_O					P0_13
#define HEATERVDD_O					P0_14
#define HEATER_PWM_O				P0_5
#define HEATER_PWM					PWM0_0




#endif /* UW_MB_SRC_PIN_MAPPINGS_H_ */

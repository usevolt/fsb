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
#define AUX_SENSE					ADC0_7
#define HORN_SENSE					ADC0_2
#define RADIO_SENSE					ADC0_3
#define HEATER_SENSE				ADC0_10
#define UI_SENSE					ADC0_5
#define FUEL_LEVEL_AIN				ADC1_4

// Digital inputs
#define EBERFAN_I					P1_6
#define KEY_PREHEAT_I				P0_14
#define KEY_ON_I					P0_15
#define KEY_START_I					P0_13
#define EMCY_I						P0_16
#define DOORSW1_I					P0_9
#define DOORSW2_I					P1_4
#define SEATSW_I					P1_5
#define VBAT_I						P0_2


// Digital outputs
#define HORN_O						P0_7
#define RADIO_O						P0_8
#define AUX_O						P1_0
#define UI_O						P0_4
#define HEATER1_O					P0_31
#define HEATER2_O					P0_30




#endif /* UW_MB_SRC_PIN_MAPPINGS_H_ */

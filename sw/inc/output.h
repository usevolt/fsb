/*
 * output_driver.h
 *
 *  Created on: Jun 13, 2017
 *      Author: usevolt
 */

#ifndef OUTPUT_H_
#define OUTPUT_H_


/// @file: Power output driver module. Monitors the output overcurrent state


#include <uv_utilities.h>
#include <uv_filters.h>
#include <uv_adc.h>
#include <uv_gpio.h>
#include "can_fsb.h"



#define OUTPUT_SENSE_AMPL_DEFAULT	50
#define OUTPUT_SENSE_OFFSET_ADC		200

typedef struct {
	/// @brief: ADC channel of the sense resistor
	uv_adc_channels_e adc_chn;
	/// @brief: Current sense resistor value in milliohms
	uint16_t sense_mohm;
	/// @brief: Current sense resistor amplification (defaults to 50)
	uint16_t sense_ampl;
	/// @brief: Current min limit in milliamps
	uint16_t limit_min;
	/// @brief: Current max limit in milliamps
	uint16_t limit_max;
	uv_moving_aver_st moving_avg;
	/// @brief: Holds the moving average output value
	uint16_t current;
	/// @brief: output module state
	fsb_output_state_e state;
	/// @brief: gpio pin for the gate driving
	uv_gpios_e gate_io;
	/// @brief: EMCY messages to be triggered in overcurrent / undercurrent situations
	fsb_emcy_e emcy_overload;
	fsb_emcy_e emcy_fault;
} output_st;



/// @brief: Initializes the output driver module.
void output_init(output_st *this, const uv_adc_channels_e adc_chn, const uv_gpios_e gate_io,
		const uint16_t sense_mohm, const uint16_t min_val, const uint16_t max_val,
		const uint16_t moving_avg_count, fsb_emcy_e emcy_overload, fsb_emcy_e emcy_fault);


/// @brief: Sets the current sense amplification value. Defaults to 50
static inline void output_set_ampl(output_st *this, const uint16_t value) {
	this->sense_ampl = value;
}


static inline fsb_output_state_e output_get_state(const output_st *this) {
	return this->state;
}

/// @brief: Sets the sense amplification. Defaults to 50.
static inline void output_set_sense_ampl(output_st *this, uint16_t sense_ampl) {
	this->sense_ampl = sense_ampl;
}


static inline uint16_t output_get_current(output_st *this) {
	return uv_moving_aver_get_val(&this->moving_avg);
}


/// @brief: Sets the output state
void output_set_state(output_st *this, const fsb_output_state_e state);


/// @brief: Step function should be called every step cycle.
void output_step(output_st *this, uint16_t step_ms);

/// @brief: Triggers the ADC conversion
void output_adc(output_st *this);












#endif /* OUTPUT_H_ */

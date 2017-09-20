/*
 * mosfet_driver.c
 *
 *  Created on: Jun 13, 2017
 *      Author: usevolt
 */


#include <output.h>
#include <uv_canopen.h>



void output_init(output_st *this, const uv_adc_channels_e adc_chn, const uv_gpios_e gate_io,
		const uint16_t sense_mohm, const uint16_t min_val, const uint16_t max_val,
		const uint16_t moving_avg_count, fsb_emcy_e emcy_overload, fsb_emcy_e emcy_fault) {
	this->adc_chn = adc_chn;
	this->gate_io = gate_io;
	uv_gpio_init_output(this->gate_io, false);
	this->sense_mohm = sense_mohm;
	this->sense_ampl = OUTPUT_SENSE_AMPL_DEFAULT;
	this->limit_min = min_val;
	this->limit_max = max_val;
	uv_moving_aver_init(&this->moving_avg, moving_avg_count);
	this->emcy_overload = emcy_overload;
	this->emcy_fault = emcy_fault;
	this->state = FSB_OUTPUT_STATE_OFF;
	this->current = 0;
}


/// @brief: Sets the output state
void output_set_state(output_st *this, const fsb_output_state_e state) {
	if ((this->state != FSB_OUTPUT_STATE_FAULT) &&
			(this->state != FSB_OUTPUT_STATE_OVERLOAD)) {
		this->state = state;
	}
	else if (state == FSB_OUTPUT_STATE_OFF) {
		this->state = state;
	}
}


/// @brief: Step function should be called every step cycle.
void output_step(output_st *this, uint16_t step_ms) {
	if (this->state == FSB_OUTPUT_STATE_ON) {
		if ((this->current > this->limit_max)) {
			uv_gpio_set(this->gate_io, false);
			output_set_state(this, FSB_OUTPUT_STATE_OVERLOAD);
		}
		else if (this->current < this->limit_min) {
			uv_gpio_set(this->gate_io, false);
			output_set_state(this, FSB_OUTPUT_STATE_FAULT);
		}
		else {
			uv_gpio_set(this->gate_io, true);
		}
	}
	else if (this->state == FSB_OUTPUT_STATE_OVERLOAD) {
		uv_gpio_set(this->gate_io, false);
		// send EMCY message
		if (this->emcy_overload) {
			uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC, this->emcy_overload);
		}
	}
	else if (this->state == FSB_OUTPUT_STATE_FAULT) {
		uv_gpio_set(this->gate_io, false);
		if (this->emcy_fault) {
			uv_canopen_emcy_send(CANOPEN_EMCY_DEVICE_SPECIFIC, this->emcy_fault);
		}
	}
	else {
		uv_gpio_set(this->gate_io, false);
	}

}


/// @brief: Triggers the ADC conversion
void output_adc(output_st *this) {
	int16_t adc = uv_adc_read(this->adc_chn) - OUTPUT_SENSE_OFFSET_ADC;
	if (adc < 0) {
		adc = 0;
	}
	int32_t mv = (int32_t) adc * (3300) / ADC_MAX_VALUE;
	// current is multiplied by inverted resistor value (1 / 0.002) and divided
	// by current sensing amplification
	int32_t current = mv * (1000 / (this->sense_mohm * this->sense_ampl));
	if (current < 0) {
		current = 0;
	}
	this->current = uv_moving_aver_step(&this->moving_avg, current);
}



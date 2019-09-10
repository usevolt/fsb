/*
 * main.h
 *
 *  Created on: Apr 26, 2015
 *      Author: usevolt
 */

#ifndef MAIN_H_
#define MAIN_H_


#include <uv_memory.h>
#include <uv_filters.h>
#include <uv_output.h>
#include <uv_sensor.h>
#include <uv_solenoid_output.h>
#include "can_fsb.h"




#define OUTPUT_MOVING_AVG_COUNT		10
#define IGNKEY_MOVING_AVER_COUNT	5



#define HEATER_MAX_CURRENT_MA		20000

/// @brief: Heater minimum duty cycle
#define HEATER_PWM_DC_MIN			300
/// @brief: Heater maximum duty cycle
#define HEATER_PWM_DC_MAX			1000

#define HEATER_SPEED_STEPS_COUNT	1

#define LEVEL_FAULT_MIN_VAL			0
#define LEVEL_FAULT_MAX_VAL			150
#define FUEL_LEVEL_AVG_COUNT		50
#define FUEL_LEVEL_HYSTERESIS		20
#define FUEL_LEVEL_WARNING_VALUE	30


/// @brief: main data structure.
/// This struct can be save to non-volatile flash memory with
/// a terminal command 'save'.
typedef struct _dev_st {

	uv_output_st horn;
	uv_output_st radio;
	uv_output_st aux;
	uv_output_st ui;
	uv_output_st heater;

	uint16_t total_current;

	fsb_ignkey_states_e ignkey;
	uv_moving_aver_st key_on;
	uv_moving_aver_st key_preheat;
	uv_moving_aver_st key_start;
	uint8_t emcy;
	uv_ring_buffer_st emcy_ring_buffer;
	uint8_t emcy_buffer[25];
	uint16_t vbat;
	uint8_t eberfan;
	// tells if eber was ON when booting
	bool woken_by_eber;
	uv_moving_aver_st eberfan_avg;
	uint8_t heaterspeed;
	int8_t heater_req;
	int8_t last_heater_req;
	uint8_t doorsw1;
	uint8_t doorsw2;
	uint8_t seatsw;
	uv_moving_aver_st seatsw_avg;
	uv_sensor_st fuel_level;
	uint8_t fuel_level_value;

	uv_data_start_t data_start;

	bool safety_disable;

	uv_data_end_t data_end;

} dev_st;


void adc_callback(void);

void step(void* me);

void init(dev_st* me);





#endif /* MAIN_H_ */

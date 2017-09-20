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
#include "output.h"
#include "can_fsb.h"




#define OUTPUT_2_MOHM				2
#define OUTPUT_15_MOHM				15
#define OUTPUT_4_MOHM				4
#define OUTPUT_MOVING_AVG_COUNT		100




/// @brief: main data structure.
/// This struct can be save to non-volatile flash memory with
/// a terminal command 'save'.
typedef struct _dev_st {

	output_st horn;
	output_st radio;
	output_st aux;
	output_st heatervdd;
	output_st heaterbat;

	uint16_t total_current;

	fsb_ignkey_states_e ignkey;
	uint8_t emcy;
	uint16_t vbat;
	uint8_t eberfan;
	uint8_t heaterspeed;

	uv_data_start_t data_start;

	uv_data_end_t data_end;

} dev_st;


void adc_callback(void);

void step(void* me);

void init(dev_st* me);





#endif /* MAIN_H_ */

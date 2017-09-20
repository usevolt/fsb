/*
 * uw_messages.c
 *
 *  Created on: Feb 19, 2015
 *      Author: usenius
 */


#include "main.h"
#include "messages.h"
#include "can_fsb.h"
#include "pin_mappings.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <uv_timer.h>
#include <uv_utilities.h>

extern dev_st dev;
#define this (&dev)




canopen_object_st obj_dict[] = {
		{
				.main_index = FSB_TOTAL_CURRENT_INDEX,
				.sub_index = FSB_TOTAL_CURRENT_SUBINDEX,
				.type = FSB_TOTAL_CURRENT_TYPE,
				.permissions = FSB_TOTAL_CURRENT_PERMISSIONS,
				.data_ptr = &this->total_current
		},
		{
				.main_index = FSB_HORN_STATUS_INDEX,
				.sub_index = FSB_HORN_STATUS_SUBINDEX,
				.type = FSB_HORN_STATUS_TYPE,
				.permissions = FSB_HORN_STATUS_PERMISSIONS,
				.data_ptr = &this->horn.state
		},
		{
				.main_index = FSB_HORN_CURRENT_INDEX,
				.sub_index = FSB_HORN_CURRENT_SUBINDEX,
				.type = FSB_HORN_CURRENT_TYPE,
				.permissions = FSB_HORN_CURRENT_PERMISSIONS,
				.data_ptr = &this->horn.current
		},
		{
				.main_index = FSB_RADIO_STATUS_INDEX,
				.sub_index = FSB_RADIO_STATUS_SUBINDEX,
				.type = FSB_RADIO_STATUS_TYPE,
				.permissions = FSB_RADIO_STATUS_PERMISSIONS,
				.data_ptr = &this->radio.state
		},
		{
				.main_index = FSB_RADIO_CURRENT_INDEX,
				.sub_index = FSB_RADIO_CURRENT_SUBINDEX,
				.type = FSB_RADIO_CURRENT_TYPE,
				.permissions = FSB_RADIO_CURRENT_PERMISSIONS,
				.data_ptr = &this->radio.current
		},
		{
				.main_index = FSB_AUX_STATUS_INDEX,
				.sub_index = FSB_AUX_STATUS_SUBINDEX,
				.type = FSB_AUX_STATUS_TYPE,
				.permissions = FSB_AUX_STATUS_PERMISSIONS,
				.data_ptr = &this->aux.state
		},
		{
				.main_index = FSB_AUX_CURRENT_INDEX,
				.sub_index = FSB_AUX_CURRENT_SUBINDEX,
				.type = FSB_AUX_CURRENT_TYPE,
				.permissions = FSB_AUX_CURRENT_PERMISSIONS,
				.data_ptr = &this->aux.current
		},
		{
				.main_index = FSB_HEATERVDD_STATUS_INDEX,
				.sub_index = FSB_HEATERVDD_STATUS_SUBINDEX,
				.type = FSB_HEATERVDD_STATUS_TYPE,
				.permissions = FSB_HEATERVDD_STATUS_PERMISSIONS,
				.data_ptr = &this->heatervdd.state
		},
		{
				.main_index = FSB_HEATERVDD_CURRENT_INDEX,
				.sub_index = FSB_HEATERVDD_CURRENT_SUBINDEX,
				.type = FSB_HEATERVDD_CURRENT_TYPE,
				.permissions = FSB_HEATERVDD_CURRENT_PERMISSIONS,
				.data_ptr = &this->heatervdd.current
		},
		{
				.main_index = FSB_HEATERBAT_STATUS_INDEX,
				.sub_index = FSB_HEATERBAT_STATUS_SUBINDEX,
				.type = FSB_HEATERBAT_STATUS_TYPE,
				.permissions = FSB_HEATERBAT_STATUS_PERMISSIONS,
				.data_ptr = &this->heaterbat.state
		},
		{
				.main_index = FSB_HEATERBAT_CURRENT_INDEX,
				.sub_index = FSB_HEATERBAT_CURRENT_SUBINDEX,
				.type = FSB_HEATERBAT_CURRENT_TYPE,
				.permissions = FSB_HEATERBAT_CURRENT_PERMISSIONS,
				.data_ptr = &this->heaterbat.current
		},
		{
				.main_index = FSB_HEATER_SPEED_INDEX,
				.sub_index = FSB_HEATER_SPEED_SUBINDEX,
				.type = FSB_HEATER_SPEED_TYPE,
				.permissions = FSB_HEATER_SPEED_PERMISSIONS,
				.data_ptr = &this->heaterspeed
		},
		{
				.main_index = FSB_IGNKEY_INDEX,
				.sub_index = FSB_IGNKEY_SUBINDEX,
				.type = FSB_IGNKEY_TYPE,
				.permissions = FSB_IGNKEY_PERMISSIONS,
				.data_ptr = &this->ignkey
		},
		{
				.main_index = FSB_EMCY_INDEX,
				.sub_index = FSB_EMCY_SUBINDEX,
				.type = FSB_EMCY_TYPE,
				.permissions = FSB_EMCY_PERMISSIONS,
				.data_ptr = &this->emcy
		},
		{
				.main_index = FSB_BAT_INDEX,
				.sub_index = FSB_BAT_SUBINDEX,
				.type = FSB_BAT_TYPE,
				.permissions = FSB_BAT_PERMISSIONS,
				.data_ptr = &this->vbat
		},
		{
				.main_index = FSB_EBERFAN_INDEX,
				.sub_index = FSB_EBERFAN_SUBINDEX,
				.type = FSB_EBERFAN_TYPE,
				.permissions = FSB_EBERFAN_PERMISSIONS,
				.data_ptr = &this->eberfan
		},
};

int obj_dict_len() {
	return sizeof(obj_dict) / sizeof(canopen_object_st);
}




const uv_command_st terminal_commands[] = {
		{
				.id = CMD_STAT,
				.str = "stat",
				.instructions = "Displays the system status information.\n"
						"Usage: stat",
				.callback = &stat_callb
		},
		{
				.id = CMD_HEATER,
				.str = "heat",
				.instructions = "Sets the heater speed\n"
						"Usage: heat <0..100>",
				.callback = &heater_callb
		},
};




unsigned int commands_size(void) {
	return sizeof(terminal_commands) / sizeof(uv_command_st);
}




static void stat_output(output_st *output, const char *output_name) {
	printf("%s state: %u, current: %u mA, adc: 0x%x / 0x%x\n",
			output_name, output_get_state(output), output_get_current(output),
			uv_adc_read(output->adc_chn), ADC_MAX_VALUE);
}


void stat_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	printf("SYSTEM STATUS:\n");
	printf("Total current: %u mA\n", (unsigned int) this->total_current);
	stat_output(&this->horn, "Horn");
	stat_output(&this->aux, "Aux");
	stat_output(&this->radio, "Radio");
	stat_output(&this->heatervdd, "HeaterVDD");
	stat_output(&this->heaterbat, "HeaterBAT");
	printf("Ignition key state: ");
	if (this->ignkey == FSB_IGNKEY_STATE_OFF) {
		printf("OFF");
	}
	else if (this->ignkey == FSB_IGNKEY_STATE_ON) {
		printf("ON");
	}
	else if (this->ignkey == FSB_IGNKEY_STATE_PREHEAT) {
		printf("PREHEAT");
	}
	else if (this->ignkey == FSB_IGNKEY_STATE_START) {
		printf("START");
	}
	else {
		printf("FAULT");
	}
	printf("\nemcy: %u\nvbat: %u (0x%x / 0x%x)\neber fan: %u\nheater speed: %u\n",
			this->emcy, this->vbat, uv_adc_read(VBAT_SENSE), ADC_MAX_VALUE, this->eberfan, this->heaterspeed);
}


void heater_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	if (args && (argv[0].type == ARG_INTEGER)) {
		if (argv[0].number > 100) {
			argv[0].number = 100;
		}
		this->heaterspeed = argv[0].number;
		output_set_state(&this->heaterbat, (argv[0].number) ?
				FSB_OUTPUT_STATE_ON : FSB_OUTPUT_STATE_OFF);
		output_set_state(&this->heatervdd, (argv[0].number) ?
				FSB_OUTPUT_STATE_ON : FSB_OUTPUT_STATE_OFF);
	}
	printf("heater speed: %u\n", this->heaterspeed);
}






/*
 * uw_messages.c
 *
 *  Created on: Feb 19, 2015
 *      Author: usenius
 */


#include "main.h"
#include "messages.h"
#include "can_fsb.h"
#include "can_esb.h"
#include "pin_mappings.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <uv_timer.h>
#include <uv_utilities.h>
#include <uv_output.h>
#include <uv_rtos.h>

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
				.main_index = FSB_HEATER1_STATUS_INDEX,
				.sub_index = FSB_HEATER1_STATUS_SUBINDEX,
				.type = FSB_HEATER1_STATUS_TYPE,
				.permissions = FSB_HEATER1_STATUS_PERMISSIONS,
				.data_ptr = &this->heater1.state
		},
		{
				.main_index = FSB_HEATER1_CURRENT_INDEX,
				.sub_index = FSB_HEATER1_CURRENT_SUBINDEX,
				.type = FSB_HEATER1_CURRENT_TYPE,
				.permissions = FSB_HEATER1_CURRENT_PERMISSIONS,
				.data_ptr = &this->heater1.current
		},
		{
				.main_index = FSB_HEATER2_STATUS_INDEX,
				.sub_index = FSB_HEATER2_STATUS_SUBINDEX,
				.type = FSB_HEATER2_STATUS_TYPE,
				.permissions = FSB_HEATER2_STATUS_PERMISSIONS,
				.data_ptr = &this->heater2.state
		},
		{
				.main_index = FSB_HEATER2_CURRENT_INDEX,
				.sub_index = FSB_HEATER2_CURRENT_SUBINDEX,
				.type = FSB_HEATER2_CURRENT_TYPE,
				.permissions = FSB_HEATER2_CURRENT_PERMISSIONS,
				.data_ptr = &this->heater2.current
		},
		{
				.main_index = FSB_HEATER_SPEED_INDEX,
				.sub_index = FSB_HEATER_SPEED_SUBINDEX,
				.type = FSB_HEATER_SPEED_TYPE,
				.permissions = FSB_HEATER_SPEED_PERMISSIONS,
				.data_ptr = &this->heaterspeed
		},
		{
				.main_index = FSB_HEATER_REQ_INDEX,
				.sub_index = FSB_HEATER_REQ_SUBINDEX,
				.type = FSB_HEATER_REQ_TYPE,
				.permissions = FSB_HEATER_REQ_PERMISSIONS,
				.data_ptr = &this->heater_req
		},
		{
				.main_index = FSB_UI_STATUS_INDEX,
				.sub_index = FSB_UI_STATUS_SUBINDEX,
				.type = FSB_UI_STATUS_TYPE,
				.permissions = FSB_UI_STATUS_PERMISSIONS,
				.data_ptr = &this->ui.state
		},
		{
				.main_index = FSB_UI_CURRENT_INDEX,
				.sub_index = FSB_UI_CURRENT_SUBINDEX,
				.type = FSB_UI_CURRENT_TYPE,
				.permissions = FSB_UI_CURRENT_PERMISSIONS,
				.data_ptr = &this->ui.current
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
		{
				.main_index = FSB_DOORSW1_INDEX,
				.sub_index = FSB_DOORSW1_SUBINDEX,
				.type = FSB_DOORSW1_TYPE,
				.permissions = FSB_DOORSW1_PERMISSIONS,
				.data_ptr = &this->doorsw1
		},
		{
				.main_index = FSB_DOORSW2_INDEX,
				.sub_index = FSB_DOORSW2_SUBINDEX,
				.type = FSB_DOORSW2_TYPE,
				.permissions = FSB_DOORSW2_PERMISSIONS,
				.data_ptr = &this->doorsw2
		},
		{
				.main_index = FSB_SEATSW_INDEX,
				.sub_index = FSB_SEATSW_SUBINDEX,
				.type = FSB_SEATSW_TYPE,
				.permissions = FSB_SEATSW_PERMISSIONS,
				.data_ptr = &this->seatsw
		},
		{
				.main_index = FSB_FUEL_LEVEL_INDEX,
				.sub_index = FSB_FUEL_LEVEL_SUBINDEX,
				.type = FSB_FUEL_LEVEL_TYPE,
				.permissions = FSB_FUEL_LEVEL_PERMISSIONS,
				.data_ptr = &this->fuel_level_value
		}
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
		{
				.id = CMD_HORN,
				.str = "horn",
				.instructions = "Turn horn on\n"
						"Usage: horn <1/0>",
				.callback = &horn_callb
		},
		{
				.id = CMD_SAFETY,
				.str = "safety",
				.instructions = "Disables or enables safety related inputs.\n"
						"Usage: safety <0/1>",
				.callback = &safety_callb
		}
};




unsigned int commands_size(void) {
	return sizeof(terminal_commands) / sizeof(uv_command_st);
}




static void stat_output(uv_output_st *output, const char *output_name) {
	printf("%s state: %u, current: %u mA, adc: 0x%x / 0x%x\n",
			output_name, uv_output_get_state(output), uv_output_get_current(output),
			uv_adc_read(output->adc_chn), ADC_MAX_VALUE);
}


void stat_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	printf("SYSTEM STATUS:\n");
	printf("Total current: %u mA\n", (unsigned int) this->total_current);
	stat_output(&this->horn, "Horn");
	stat_output(&this->aux, "Aux");
	stat_output(&this->radio, "Radio");
	stat_output(&this->heater1, "Heater1");
	stat_output(&this->heater2, "Heater2");
	stat_output(&this->ui, "UI");
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
	printf("\nemcy: %u\nvbat: %u\neber fan: %u\nheater speed: %u\n",
			this->emcy, this->vbat, this->eberfan, this->heaterspeed);
	printf("doorsw1: %u\ndoorsw2: %u\nseatsw: %u\n",
			this->doorsw1, this->doorsw2, this->seatsw);
	printf("fuel level: %u\n", this->fuel_level_value);
	printf("Safety functions disabled: %u\n", this->safety_disable);

}


void heater_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	if (args && (argv[0].type == ARG_INTEGER)) {
		if (argv[0].number > FSB_HEATER_MAX_SPEED) {
			printf("Max allowed speed: %u\n", FSB_HEATER_MAX_SPEED);
			argv[0].number = FSB_HEATER_MAX_SPEED;
		}
		this->heaterspeed = argv[0].number;
	}
	printf("heater speed: %u\n", this->heaterspeed);
}


void horn_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	if (args && (argv[0].type == ARG_INTEGER)) {
		uv_output_set_state(&this->horn, (argv[0].number) ?
				OUTPUT_STATE_ON : OUTPUT_STATE_OFF);
	}
}

void safety_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv) {
	if (args && (argv[0].type == ARG_INTEGER)) {
		this->safety_disable = (argv[0].number) ? false : true;
	}
	printf("Safety functions disabled: %u\n", this->safety_disable);
}





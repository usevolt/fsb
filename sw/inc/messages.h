/*
 * uw_messages.h
 *
 *  Created on: Jan 27, 2015
 *      Author: usenius
 */

#ifndef GSM_MESSAGES_H_
#define GSM_MESSAGES_H_

#include <uv_reset.h>
#include <stdint.h>
#include <uv_terminal.h>
#include <uv_canopen.h>




int obj_dict_len();

void stat_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv);
void heater_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv);
void horn_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv);
void safety_callb(void* me, unsigned int cmd, unsigned int args, argument_st *argv);



/// @brief: Lists all gsm commands
typedef enum {
	CMD_STAT = 0,
	CMD_HEATER,
	CMD_HORN,
	CMD_SAFETY,
	CMD_COUNT
} gsm_commands_e;


// define of commands variable declared in gsm_messages.c
extern const uv_command_st terminal_commands[];
unsigned int commands_size(void);


#endif /* GSM_MESSAGES_H_ */

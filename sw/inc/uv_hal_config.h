/*
 * uw_hal_config.h
 *
 *  Created on: Mar 22, 2016
 *      Author: usevolt
 */

#ifndef UV_HAL_CONFIG_H_
#define UV_HAL_CONFIG_H_


#include "uv_if_config.h"
#include "can_fsb.h"

/**** USER CONFIGURATIONS ****/



#define CONFIG_INTERFACE_REVISION					1


#define CONFIG_TARGET_LPC11C14						0
#define CONFIG_TARGET_LPC1785						0
#define CONFIG_TARGET_LPC1549						1




#define CONFIG_NON_VOLATILE_MEMORY					1
#define CONFIG_MAIN_H								"main.h"
#define CONFIG_APP_ST								struct _dev_st dev
#define CONFIG_NON_VOLATILE_START					dev.data_start
#define CONFIG_NON_VOLATILE_END						dev.data_end



#define CONFIG_RTOS									1
#define CONFIG_RTOS_HEAP_SIZE						10000
#define CONFIG_UV_BOOTLOADER						1


#define CONFIG_PWM									1
#define CONFIG_PWM0									1
#define CONFIG_PWM0_FREQ							10000
#define CONFIG_PWM0_0								1
#define CONFIG_PWM0_0_IO							P0_5

#define CONFIG_PWM1									0
#define CONFIG_PWM1_FREQ							10000







#define CONFIG_TERMINAL_BUFFER_SIZE					200
#define CONFIG_TERMINAL_ARG_COUNT					4
#define CONFIG_TERMINAL_INSTRUCTIONS				1
#define CONFIG_TERMINAL_UART						0
#define CONFIG_TERMINAL_CAN							1





#define CONFIG_ADC0									1
#define CONFIG_ADC1									1
#define CONFIG_ADC_MODE								ADC_MODE_SYNC
#define CONFIG_ADC_CONVERSION_FREQ					10000

#define CONFIG_ADC_CHANNEL0_0						1
#define CONFIG_ADC_CHANNEL0_1						0
#define CONFIG_ADC_CHANNEL0_2						0
#define CONFIG_ADC_CHANNEL0_3						0
#define CONFIG_ADC_CHANNEL0_4						1
#define CONFIG_ADC_CHANNEL0_5						1
#define CONFIG_ADC_CHANNEL0_6						1
#define CONFIG_ADC_CHANNEL0_7						0
#define CONFIG_ADC_CHANNEL0_8						1
#define CONFIG_ADC_CHANNEL0_9						1
#define CONFIG_ADC_CHANNEL0_10						0
#define CONFIG_ADC_CHANNEL0_11						1
#define CONFIG_ADC_CHANNEL1_0						0
#define CONFIG_ADC_CHANNEL1_1						0
#define CONFIG_ADC_CHANNEL1_2						0
#define CONFIG_ADC_CHANNEL1_3						0
#define CONFIG_ADC_CHANNEL1_4						0
#define CONFIG_ADC_CHANNEL1_5						0
#define CONFIG_ADC_CHANNEL1_6						0
#define CONFIG_ADC_CHANNEL1_7						0
#define CONFIG_ADC_CHANNEL1_8						0
#define CONFIG_ADC_CHANNEL1_9						0
#define CONFIG_ADC_CHANNEL1_10						0
#define CONFIG_ADC_CHANNEL1_11						0









#define CONFIG_CAN									1
#define CONFIG_CAN0									1
#define CONFIG_CAN1									0

#define CONFIG_CAN0_BAUDRATE						250000
#define CONFIG_CAN0_TX_BUFFER_SIZE					10
#define CONFIG_CAN0_RX_BUFFER_SIZE					10
#define CONFIG_CAN0_TX_PIN							P0_25
#define CONFIG_CAN0_RX_PIN							P1_10

#define CONFIG_CAN_LOG								0
#define CONFIG_CAN_ERROR_LOG						1



#define CONFIG_CANOPEN								1
#define CONFIG_CANOPEN_LOG							0
#define CONFIG_CANOPEN_RXPDO_COUNT					0
#define CONFIG_CANOPEN_TXPDO_COUNT					1
#define CONFIG_CANOPEN_PDO_MAPPING_COUNT			8
#define CONFIG_CANOPEN_SDO_SYNC						1
#define CONFIG_CANOPEN_SDO_SEGMENTED				0
#define CONFIG_CANOPEN_SDO_TIMEOUT_MS				10
#define CONFIG_CANOPEN_OBJ_DICT_APP_PARAMS			obj_dict
#define CONFIG_CANOPEN_OBJ_DICT_APP_PARAMS_COUNT	obj_dict_len
#define CONFIG_CANOPEN_PRODUCER_HEARTBEAT_TIME_MS	1000
#define CONFIG_CANOPEN_CONSUMER_HEARTBEAT_COUNT		0
#define CONFIG_CANOPEN_CHANNEL						CAN0
#define CONFIG_CANOPEN_DEFAULT_NODE_ID				FSB_NODE_ID
#define CONFIG_CANOPEN_EMCY_RX_BUFFER_SIZE			3

#define CONFIG_CANOPEN_RXPDO1_ID					(CANOPEN_TXPDO1_ID + 1)
#define CONFIG_CANOPEN_RXPDO1_TRANSMISSION_TYPE		CANOPEN_PDO_TRANSMISSION_ASYNC
#define CONFIG_CANOPEN_RXPDO1_MAPPING1_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING1_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING1_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING2_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING2_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING2_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING3_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING3_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING3_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING4_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING4_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING4_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING5_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING5_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING5_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING6_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING6_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING6_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING7_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING7_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING7_LEN			0
#define CONFIG_CANOPEN_RXPDO1_MAPPING8_MAIN_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING8_SUB_INDEX	0
#define CONFIG_CANOPEN_RXPDO1_MAPPING8_LEN			0


#define CONFIG_CANOPEN_TXPDO1_ID					(CANOPEN_TXPDO1_ID + FSB_NODE_ID)
#define CONFIG_CANOPEN_TXPDO1_TRANSMISSION_TYPE		CANOPEN_PDO_TRANSMISSION_ASYNC
#define CONFIG_CANOPEN_TXPDO1_EVENT_TIMER			200
#define CONFIG_CANOPEN_TXPDO1_MAPPING1_MAIN_INDEX	FSB_TOTAL_CURRENT_INDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING1_SUB_INDEX	FSB_TOTAL_CURRENT_SUBINDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING1_LEN			CANOPEN_TYPE_LEN(FSB_TOTAL_CURRENT_TYPE)
#define CONFIG_CANOPEN_TXPDO1_MAPPING2_MAIN_INDEX	FSB_IGNKEY_INDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING2_SUB_INDEX	FSB_IGNKEY_SUBINDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING2_LEN			CANOPEN_TYPE_LEN(FSB_IGNKEY_TYPE)
#define CONFIG_CANOPEN_TXPDO1_MAPPING3_MAIN_INDEX	FSB_EMCY_INDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING3_SUB_INDEX	FSB_EMCY_SUBINDEX
#define CONFIG_CANOPEN_TXPDO1_MAPPING3_LEN			CANOPEN_TYPE_LEN(FSB_EMCY_TYPE)
#define CONFIG_CANOPEN_TXPDO1_MAPPING4_MAIN_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING4_SUB_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING4_LEN			CANOPEN_TYPE_LEN(0)
#define CONFIG_CANOPEN_TXPDO1_MAPPING5_MAIN_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING5_SUB_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING5_LEN			CANOPEN_TYPE_LEN(0)
#define CONFIG_CANOPEN_TXPDO1_MAPPING6_MAIN_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING6_SUB_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING6_LEN			CANOPEN_TYPE_LEN(0)
#define CONFIG_CANOPEN_TXPDO1_MAPPING7_MAIN_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING7_SUB_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING7_LEN			CANOPEN_TYPE_LEN(0)
#define CONFIG_CANOPEN_TXPDO1_MAPPING8_MAIN_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING8_SUB_INDEX	0
#define CONFIG_CANOPEN_TXPDO1_MAPPING8_LEN			CANOPEN_TYPE_LEN(0)




#define CONFIG_OUTPUT								1



/**** END OF USER CONFIGURATIONS ****/




#endif /* UV_HAL_CONFIG_H_ */

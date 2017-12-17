EESchema Schematic File Version 2
LIBS:fsb-rescue
LIBS:kemet
LIBS:power
LIBS:usevolt
LIBS:wurth_elektronik_LED
LIBS:yageo
LIBS:fsb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 8
Title "Usewood Ceiling Supply Board"
Date "2017-06-28"
Rev "1"
Comp "Usevolt Oy"
Comment1 "Olli Usenius"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2050 1200 1200 600 
U 595401A8
F0 "Power Supply" 60
F1 "pwr_supply_sheet.sch" 60
F2 "VIN" I L 2050 1300 60 
F3 "+5V" O R 3250 1400 60 
F4 "+3V3" O R 3250 1500 60 
F5 "VDD" O R 3250 1300 60 
F6 "GND" I L 2050 1700 60 
F7 "VBAT" I L 2050 1400 60 
F8 "EBER_FAN" I L 2050 1500 60 
F9 "VBAT_SENSE" O R 3250 1700 60 
$EndSheet
$Comp
L VDD #PWR101
U 1 1 59541057
P 3450 1150
F 0 "#PWR101" H 3450 1000 50  0001 C CNN
F 1 "VDD" H 3467 1323 50  0000 C CNN
F 2 "" H 3450 1150 50  0000 C CNN
F 3 "" H 3450 1150 50  0000 C CNN
	1    3450 1150
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR102
U 1 1 595410AC
P 3650 1150
F 0 "#PWR102" H 3650 1000 50  0001 C CNN
F 1 "+5V" H 3665 1323 50  0000 C CNN
F 2 "" H 3650 1150 50  0000 C CNN
F 3 "" H 3650 1150 50  0000 C CNN
	1    3650 1150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR103
U 1 1 595410EA
P 3850 1150
F 0 "#PWR103" H 3850 1000 50  0001 C CNN
F 1 "+3V3" H 3865 1323 50  0000 C CNN
F 2 "" H 3850 1150 50  0000 C CNN
F 3 "" H 3850 1150 50  0000 C CNN
	1    3850 1150
	1    0    0    -1  
$EndComp
Text Label 3800 3500 0    60   ~ 0
CANH
Text Label 3800 3600 0    60   ~ 0
CANL
Text Label 1500 2000 2    60   ~ 0
CANH
Text Label 1500 2150 2    60   ~ 0
CANL
$Sheet
S 4250 2800 2150 2700
U 5953E91C
F0 "LPC1549" 60
F1 "lpc1549.sch" 60
F2 "CANL" I L 4250 3600 60 
F3 "CANH" I L 4250 3500 60 
F4 "EBER_FAN" I L 4250 2900 60 
F5 "HORN" O R 6400 3600 60 
F6 "HORN_SENSE" I R 6400 3700 60 
F7 "RADIO" O R 6400 3800 60 
F8 "RADIO_SENSE" I R 6400 3900 60 
F9 "AUX_SENSE" I R 6400 4500 60 
F10 "AUX" O R 6400 4400 60 
F11 "KEY_19" I R 6400 3300 60 
F12 "KEY_50" I R 6400 3200 60 
F13 "KEY_AC" I R 6400 3400 60 
F14 "EMCY" I R 6400 2900 60 
F15 "VBAT_SENSE" I L 4250 3200 60 
F16 "HEATER" O R 6400 5000 60 
F17 "HEATER_SENSE" I R 6400 5100 60 
F18 "UI" O R 6400 5300 60 
F19 "UI_SENSE" I R 6400 5400 60 
F20 "DOORSW1" I L 4250 4900 60 
F21 "DOORSW2" I L 4250 5050 60 
F22 "SEATSW" I L 4250 4700 60 
$EndSheet
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 1 1 59884571
P 900 1550
F 0 "J101" H 869 1633 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 1550 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 1700 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 1520 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 1920 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 1720 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 1820 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 1620 60  0001 C CNN "Manufacturer"
	1    900  1550
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 2 1 598847F7
P 900 1700
F 0 "J101" H 869 1783 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 1700 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 1850 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 1670 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2070 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 1870 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 1970 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 1770 60  0001 C CNN "Manufacturer"
	2    900  1700
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 3 1 59884A46
P 900 1850
F 0 "J101" H 869 1933 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 1850 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2000 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 1820 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2220 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2020 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2120 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 1920 60  0001 C CNN "Manufacturer"
	3    900  1850
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 4 1 59884C98
P 900 2000
F 0 "J101" H 869 2083 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 2000 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2150 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 1970 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2370 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2170 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2270 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 2070 60  0001 C CNN "Manufacturer"
	4    900  2000
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 5 1 59884EED
P 900 2150
F 0 "J101" H 869 2233 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 2150 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2300 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 2120 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2520 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2320 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2420 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 2220 60  0001 C CNN "Manufacturer"
	5    900  2150
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 6 1 59885149
P 900 2300
F 0 "J101" H 869 2383 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 2300 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2450 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 2270 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2670 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2470 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2570 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 2370 60  0001 C CNN "Manufacturer"
	6    900  2300
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 7 1 598853A4
P 900 2450
F 0 "J101" H 869 2533 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 2450 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2600 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 2420 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2820 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2620 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2720 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 2520 60  0001 C CNN "Manufacturer"
	7    900  2450
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2-RESCUE-fsb J101
U 8 1 59885602
P 900 2600
F 0 "J101" H 869 2683 45  0000 C CNN
F 1 "AMPSEAL_8_POS_VERT_WHITE_SEALED_1-776276-2" H 900 2600 45  0001 L BNN
F 2 "usevolt:AMPSEAL_8_POS_776275-1" H 930 2750 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776276_B9-763219.pdf" H 1000 2570 60  0001 C CNN
F 4 "571-1-776276-2" H 1400 2970 60  0001 C CNN "1st Source Part Number"
F 5 "1-776276-2" H 1200 2770 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 1300 2870 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 1100 2670 60  0001 C CNN "Manufacturer"
	8    900  2600
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 1 1 5988AFF8
P 10100 2250
F 0 "J102" H 10068 2333 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10100 2250 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10130 2400 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10200 2220 60  0001 C CNN
F 4 "571-1-776228-2" H 10600 2620 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10400 2420 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10500 2520 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10300 2320 60  0001 C CNN "Manufacturer"
	1    10100 2250
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 2 1 5988B0BE
P 10100 2650
F 0 "J102" H 10068 2733 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10100 2650 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10130 2800 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10200 2620 60  0001 C CNN
F 4 "571-1-776228-2" H 10600 3020 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10400 2820 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10500 2920 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10300 2720 60  0001 C CNN "Manufacturer"
	2    10100 2650
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 3 1 5988B132
P 10100 3050
F 0 "J102" H 10068 3133 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10100 3050 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10130 3200 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10200 3020 60  0001 C CNN
F 4 "571-1-776228-2" H 10600 3420 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10400 3220 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10500 3320 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10300 3120 60  0001 C CNN "Manufacturer"
	3    10100 3050
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 4 1 5988B1A6
P 10200 1200
F 0 "J102" H 10168 1283 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10200 1200 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10230 1350 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10300 1170 60  0001 C CNN
F 4 "571-1-776228-2" H 10700 1570 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10500 1370 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10600 1470 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10400 1270 60  0001 C CNN "Manufacturer"
	4    10200 1200
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 5 1 5988B21E
P 10100 1450
F 0 "J102" H 10068 1533 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10100 1450 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10130 1600 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10200 1420 60  0001 C CNN
F 4 "571-1-776228-2" H 10600 1820 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10400 1620 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10500 1720 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10300 1520 60  0001 C CNN "Manufacturer"
	5    10100 1450
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 6 1 5988B296
P 3150 4900
F 0 "J102" H 3118 4983 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 3150 4900 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 3180 5050 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 3250 4870 60  0001 C CNN
F 4 "571-1-776228-2" H 3650 5270 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 3450 5070 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 3550 5170 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 3350 4970 60  0001 C CNN "Manufacturer"
	6    3150 4900
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 7 1 5988B310
P 3150 5050
F 0 "J102" H 3118 5133 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 3150 5050 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 3180 5200 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 3250 5020 60  0001 C CNN
F 4 "571-1-776228-2" H 3650 5420 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 3450 5220 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 3550 5320 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 3350 5120 60  0001 C CNN "Manufacturer"
	7    3150 5050
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 8 1 5988B38C
P 3150 4700
F 0 "J102" H 3118 4783 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 3150 4700 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 3180 4850 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 3250 4670 60  0001 C CNN
F 4 "571-1-776228-2" H 3650 5070 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 3450 4870 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 3550 4970 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 3350 4770 60  0001 C CNN "Manufacturer"
	8    3150 4700
	-1   0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 9 1 5988B40A
P 10900 3400
F 0 "J102" H 10868 3483 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 3400 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 3550 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 3370 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 3770 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 3570 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 3670 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 3470 60  0001 C CNN "Manufacturer"
	9    10900 3400
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 10 1 5988B48A
P 10400 3700
F 0 "J102" H 10368 3783 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10400 3700 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10430 3850 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10500 3670 60  0001 C CNN
F 4 "571-1-776228-2" H 10900 4070 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10700 3870 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10800 3970 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10600 3770 60  0001 C CNN "Manufacturer"
	10   10400 3700
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 11 1 5988B50C
P 10100 1950
F 0 "J102" H 10068 2033 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10100 1950 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10130 2100 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10200 1920 60  0001 C CNN
F 4 "571-1-776228-2" H 10600 2320 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10400 2120 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10500 2220 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10300 2020 60  0001 C CNN "Manufacturer"
	11   10100 1950
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 12 1 5988B590
P 10150 5900
F 0 "J102" H 10118 5983 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10150 5900 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10180 6050 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10250 5870 60  0001 C CNN
F 4 "571-1-776228-2" H 10650 6270 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10450 6070 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10550 6170 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10350 5970 60  0001 C CNN "Manufacturer"
	12   10150 5900
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 13 1 5988B616
P 10150 6050
F 0 "J102" H 10118 6133 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10150 6050 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10180 6200 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10250 6020 60  0001 C CNN
F 4 "571-1-776228-2" H 10650 6420 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10450 6220 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10550 6320 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10350 6120 60  0001 C CNN "Manufacturer"
	13   10150 6050
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 14 1 5988B69E
P 10150 6200
F 0 "J102" H 10118 6283 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10150 6200 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10180 6350 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10250 6170 60  0001 C CNN
F 4 "571-1-776228-2" H 10650 6570 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10450 6370 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10550 6470 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10350 6270 60  0001 C CNN "Manufacturer"
	14   10150 6200
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 15 1 5988B728
P 10150 6350
F 0 "J102" H 10118 6433 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10150 6350 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10180 6500 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10250 6320 60  0001 C CNN
F 4 "571-1-776228-2" H 10650 6720 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10450 6520 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10550 6620 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10350 6420 60  0001 C CNN "Manufacturer"
	15   10150 6350
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 16 1 5988B7B4
P 10900 4450
F 0 "J102" H 10868 4533 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 4450 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 4600 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 4420 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 4820 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 4620 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 4720 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 4520 60  0001 C CNN "Manufacturer"
	16   10900 4450
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 17 1 5988B846
P 10900 4600
F 0 "J102" H 10868 4683 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 4600 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 4750 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 4570 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 4970 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 4770 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 4870 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 4670 60  0001 C CNN "Manufacturer"
	17   10900 4600
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 18 1 5988B8D6
P 10200 3600
F 0 "J102" H 10168 3683 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10200 3600 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10230 3750 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10300 3570 60  0001 C CNN
F 4 "571-1-776228-2" H 10700 3970 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10500 3770 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10600 3870 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10400 3670 60  0001 C CNN "Manufacturer"
	18   10200 3600
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 19 1 5988C267
P 10900 3700
F 0 "J102" H 10868 3783 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 3700 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 3850 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 3670 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 4070 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 3870 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 3970 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 3770 60  0001 C CNN "Manufacturer"
	19   10900 3700
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 20 1 5988C2FB
P 10200 4400
F 0 "J102" H 10168 4483 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10200 4400 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10230 4550 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10300 4370 60  0001 C CNN
F 4 "571-1-776228-2" H 10700 4770 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10500 4570 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10600 4670 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10400 4470 60  0001 C CNN "Manufacturer"
	20   10200 4400
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 21 1 5988C391
P 10900 5050
F 0 "J102" H 10868 5133 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 5050 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 5200 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 5020 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 5420 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 5220 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 5320 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 5120 60  0001 C CNN "Manufacturer"
	21   10900 5050
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 22 1 5988C429
P 10900 5200
F 0 "J102" H 10868 5283 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10900 5200 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10930 5350 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 11000 5170 60  0001 C CNN
F 4 "571-1-776228-2" H 11400 5570 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 11200 5370 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 11300 5470 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 11100 5270 60  0001 C CNN "Manufacturer"
	22   10900 5200
	1    0    0    -1  
$EndComp
$Comp
L AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2-RESCUE-fsb J102
U 23 1 5988C4C3
P 10200 5000
F 0 "J102" H 10168 5083 45  0000 C CNN
F 1 "AMPSEAL_23_POS_VERT_WHITE_SEALED_1-776228-2" H 10200 5000 45  0001 L BNN
F 2 "usevolt:AMPSEAL_23_POS_776200-1" H 10230 5150 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/418/NG_CD_776228_C13-692101.pdf" H 10300 4970 60  0001 C CNN
F 4 "571-1-776228-2" H 10700 5370 60  0001 C CNN "1st Source Part Number"
F 5 "1-776228-2" H 10500 5170 60  0001 C CNN "Manufacturer Part Number"
F 6 "Mouser" H 10600 5270 60  0001 C CNN "1st Source"
F 7 "TE Connectivity" H 10400 5070 60  0001 C CNN "Manufacturer"
	23   10200 5000
	1    0    0    -1  
$EndComp
Text Label 1150 2450 0    60   ~ 0
EBER_FAN
Text Label 1150 2600 0    60   ~ 0
VBAT
Text Label 10100 3600 2    60   ~ 0
HORN_4A
Text Label 10100 3700 2    60   ~ 0
RADIO_4A
$Comp
L +BATT #PWR104
U 1 1 598A906F
P 8350 1900
F 0 "#PWR104" H 8350 1750 50  0001 C CNN
F 1 "+BATT" H 8365 2073 50  0000 C CNN
F 2 "" H 8350 1900 50  0000 C CNN
F 3 "" H 8350 1900 50  0000 C CNN
	1    8350 1900
	1    0    0    -1  
$EndComp
Text Label 9950 1950 2    60   ~ 0
RADIO_BAT
Text Label 10100 4400 2    60   ~ 0
AUX_15A
Text Label 9750 1450 2    60   ~ 0
EMCY
Text Label 9850 3050 2    60   ~ 0
KEY_AC
Text Label 9850 2250 2    60   ~ 0
KEY_50
Text Label 9850 2650 2    60   ~ 0
KEY_19
Text Label 9850 1200 2    60   ~ 0
KEY_30/B
$Comp
L VDD #PWR105
U 1 1 598AABFA
P 8500 1150
F 0 "#PWR105" H 8500 1000 50  0001 C CNN
F 1 "VDD" H 8517 1323 50  0000 C CNN
F 2 "" H 8500 1150 50  0000 C CNN
F 3 "" H 8500 1150 50  0000 C CNN
	1    8500 1150
	1    0    0    -1  
$EndComp
$Comp
L FUSE_MC36211_350MA F101
U 1 1 598BE7AA
P 8950 1200
F 0 "F101" H 8950 1404 45  0000 C CNN
F 1 "FUSE_MC36211_350MA" H 8950 1320 45  0000 C CNN
F 2 "usevolt:FUSE_MC36211" H 8980 1350 20  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1678471.pdf?_ga=1.218604761.1948984246.1460023966" H 9070 1220 60  0001 C CNN
F 4 "Farnell" H 9370 1520 60  0001 C CNN "1st Source"
F 5 "MC36211" H 9270 1420 60  0001 C CNN "Manufacturer Part Number"
F 6 "MC36211" H 9470 1620 60  0001 C CNN "1st Source Part Number"
F 7 "Multicomp" H 9170 1320 60  0001 C CNN "Manufacturer"
	1    8950 1200
	1    0    0    -1  
$EndComp
$Comp
L FUSE_MC36211_350MA F102
U 1 1 598F0936
P 8800 1950
F 0 "F102" H 8800 2154 45  0000 C CNN
F 1 "FUSE_MC36211_350MA" H 8800 2070 45  0000 C CNN
F 2 "usevolt:FUSE_MC36211" H 8830 2100 20  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1678471.pdf?_ga=1.218604761.1948984246.1460023966" H 8920 1970 60  0001 C CNN
F 4 "Farnell" H 9220 2270 60  0001 C CNN "1st Source"
F 5 "MC36211" H 9120 2170 60  0001 C CNN "Manufacturer Part Number"
F 6 "MC36211" H 9320 2370 60  0001 C CNN "1st Source Part Number"
F 7 "Multicomp" H 9020 2070 60  0001 C CNN "Manufacturer"
	1    8800 1950
	1    0    0    -1  
$EndComp
Text Label 9550 5000 0    60   ~ 0
HEATER_15+
$Comp
L 1K R101
U 1 1 59DADD8A
P 9100 1450
F 0 "R101" H 9150 1634 45  0000 C CNN
F 1 "1K" H 9150 1550 45  0000 C CNN
F 2 "yageo:0603" H 9130 1600 20  0001 C CNN
F 3 "" H 9069 1489 60  0001 C CNN
F 4 "" H 9469 1889 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 9369 1789 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 9269 1689 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 9169 1589 60  0001 C CNN "Manufacturer"
	1    9100 1450
	1    0    0    -1  
$EndComp
$Comp
L 1K R102
U 1 1 59DADF38
P 9100 2250
F 0 "R102" H 9150 2434 45  0000 C CNN
F 1 "1K" H 9150 2350 45  0000 C CNN
F 2 "yageo:0603" H 9130 2400 20  0001 C CNN
F 3 "" H 9069 2289 60  0001 C CNN
F 4 "" H 9469 2689 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 9369 2589 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 9269 2489 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 9169 2389 60  0001 C CNN "Manufacturer"
	1    9100 2250
	1    0    0    -1  
$EndComp
$Comp
L 1K R103
U 1 1 59DAE0D9
P 9100 2650
F 0 "R103" H 9150 2834 45  0000 C CNN
F 1 "1K" H 9150 2750 45  0000 C CNN
F 2 "yageo:0603" H 9130 2800 20  0001 C CNN
F 3 "" H 9069 2689 60  0001 C CNN
F 4 "" H 9469 3089 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 9369 2989 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 9269 2889 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 9169 2789 60  0001 C CNN "Manufacturer"
	1    9100 2650
	1    0    0    -1  
$EndComp
$Comp
L 1K R104
U 1 1 59DAE267
P 9100 3050
F 0 "R104" H 9150 3234 45  0000 C CNN
F 1 "1K" H 9150 3150 45  0000 C CNN
F 2 "yageo:0603" H 9130 3200 20  0001 C CNN
F 3 "" H 9069 3089 60  0001 C CNN
F 4 "" H 9469 3489 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 9369 3389 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 9269 3289 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 9169 3189 60  0001 C CNN "Manufacturer"
	1    9100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1150 3450 1300
Wire Wire Line
	3450 1300 3250 1300
Wire Wire Line
	3650 1150 3650 1400
Wire Wire Line
	3650 1400 3250 1400
Wire Wire Line
	3250 1500 3850 1500
Wire Wire Line
	3850 1500 3850 1150
Wire Wire Line
	1000 1550 1600 1550
Wire Wire Line
	1600 1300 1600 2300
Wire Wire Line
	1600 1300 2050 1300
Wire Wire Line
	1000 1700 2050 1700
Wire Wire Line
	4250 3500 3800 3500
Wire Wire Line
	3800 3600 4250 3600
Wire Wire Line
	1000 2000 1500 2000
Wire Wire Line
	1500 2150 1000 2150
Wire Wire Line
	1600 1850 1000 1850
Connection ~ 1600 1550
Wire Wire Line
	1600 2300 1000 2300
Connection ~ 1600 1850
Wire Wire Line
	1800 2600 1800 1400
Wire Wire Line
	1800 1400 2050 1400
Wire Wire Line
	1900 1500 1900 2900
Wire Wire Line
	1900 1500 2050 1500
Wire Wire Line
	1900 2900 4250 2900
Connection ~ 1900 2450
Wire Wire Line
	9450 3600 10100 3600
Wire Wire Line
	9450 3700 10300 3700
Wire Wire Line
	9450 4400 10100 4400
Wire Wire Line
	9000 1950 10000 1950
Wire Wire Line
	9150 1200 10100 1200
Wire Wire Line
	1800 2600 1000 2600
Wire Wire Line
	1900 2450 1000 2450
Wire Wire Line
	6400 3600 8500 3600
Wire Wire Line
	7650 2900 6400 2900
Wire Wire Line
	7650 1450 7650 2900
Wire Wire Line
	6400 3700 8500 3700
Wire Wire Line
	6400 4400 8500 4400
Wire Wire Line
	6400 5000 8500 5000
Wire Wire Line
	6400 3800 8500 3800
Wire Wire Line
	6400 3900 8500 3900
Wire Wire Line
	7750 2250 7750 3200
Wire Wire Line
	7750 3200 6400 3200
Wire Wire Line
	7850 3300 6400 3300
Wire Wire Line
	7850 2650 7850 3300
Wire Wire Line
	7950 3050 7950 3400
Wire Wire Line
	7950 3400 6400 3400
Wire Wire Line
	8750 1200 8500 1200
Wire Wire Line
	4250 3200 3550 3200
Wire Wire Line
	3550 3200 3550 1700
Wire Wire Line
	3550 1700 3250 1700
Wire Wire Line
	8600 1950 8350 1950
Wire Wire Line
	8350 1950 8350 1900
Wire Wire Line
	9450 5000 10100 5000
Wire Wire Line
	6400 4500 8500 4500
Wire Wire Line
	6400 5100 8500 5100
Wire Wire Line
	9300 1450 10000 1450
Wire Wire Line
	8500 1200 8500 1150
Wire Wire Line
	7650 1450 9000 1450
Wire Wire Line
	9300 3050 10000 3050
Wire Wire Line
	9300 2650 10000 2650
Wire Wire Line
	7850 2650 9000 2650
Wire Wire Line
	7950 3050 9000 3050
Wire Wire Line
	7750 2250 9000 2250
Wire Wire Line
	9300 2250 10000 2250
Wire Wire Line
	10050 6350 9600 6350
Text Label 9600 6350 0    60   ~ 0
CANL
Wire Wire Line
	10050 6200 9600 6200
Text Label 9600 6200 0    60   ~ 0
CANH
Wire Wire Line
	10050 6050 9250 6050
Wire Wire Line
	9250 6050 9250 6250
$Comp
L GND #PWR106
U 1 1 5A07BF1C
P 9250 6250
F 0 "#PWR106" H 9250 6000 50  0001 C CNN
F 1 "GND" H 9255 6077 50  0000 C CNN
F 2 "" H 9250 6250 50  0000 C CNN
F 3 "" H 9250 6250 50  0000 C CNN
	1    9250 6250
	1    0    0    -1  
$EndComp
$Sheet
S 8000 5600 900  500 
U 5A07C729
F0 "Sheet5A07C728" 60
F1 "vnd5050.sch" 60
F2 "OUT1" O R 8900 5700 60 
F3 "OUT2" O R 8900 5900 60 
F4 "IN1" I L 8000 5700 60 
F5 "IN2" I L 8000 5900 60 
F6 "SENSE1" O L 8000 5800 60 
F7 "SENSE2" O L 8000 6000 60 
$EndSheet
Wire Wire Line
	8900 5700 9250 5700
Wire Wire Line
	9250 5700 9250 5900
Wire Wire Line
	9250 5900 10050 5900
Text Label 9550 5900 0    60   ~ 0
UI_4A
Wire Wire Line
	6400 5300 6700 5300
Wire Wire Line
	6700 5300 6700 5700
Wire Wire Line
	6700 5700 8000 5700
Wire Wire Line
	8000 5800 6600 5800
Wire Wire Line
	6600 5800 6600 5400
Wire Wire Line
	6600 5400 6400 5400
Wire Wire Line
	4250 5050 3750 5050
Wire Wire Line
	3750 4900 4250 4900
$Comp
L 1K R105
U 1 1 5A09BE6F
P 3550 4900
F 0 "R105" H 3600 5084 45  0000 C CNN
F 1 "1K" H 3600 5000 45  0000 C CNN
F 2 "yageo:0603" H 3580 5050 20  0001 C CNN
F 3 "" H 3519 4939 60  0001 C CNN
F 4 "" H 3919 5339 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 3819 5239 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3719 5139 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3619 5039 60  0001 C CNN "Manufacturer"
	1    3550 4900
	1    0    0    -1  
$EndComp
$Comp
L 1K R106
U 1 1 5A09C192
P 3550 5050
F 0 "R106" H 3600 5234 45  0000 C CNN
F 1 "1K" H 3600 5150 45  0000 C CNN
F 2 "yageo:0603" H 3580 5200 20  0001 C CNN
F 3 "" H 3519 5089 60  0001 C CNN
F 4 "" H 3919 5489 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 3819 5389 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3719 5289 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3619 5189 60  0001 C CNN "Manufacturer"
	1    3550 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4900 3250 4900
Wire Wire Line
	3250 5050 3450 5050
Text Notes 1650 5050 0    60   ~ 0
Door switches,\nfor example Omron D3D-111
$Sheet
S 8500 4300 950  300 
U 5A33548E
F0 "Sheet5A33548D" 60
F1 "vn5e010ah.sch" 60
F2 "OUT1" O R 9450 4400 60 
F3 "IN1" I L 8500 4400 60 
F4 "SENSE1" O L 8500 4500 60 
$EndSheet
$Sheet
S 8500 3500 950  550 
U 5A337B26
F0 "Sheet5A337B25" 60
F1 "vnd5050.sch" 60
F2 "OUT1" O R 9450 3600 60 
F3 "OUT2" O R 9450 3700 60 
F4 "IN1" I L 8500 3600 60 
F5 "IN2" I L 8500 3800 60 
F6 "SENSE1" O L 8500 3700 60 
F7 "SENSE2" O L 8500 3900 60 
$EndSheet
Wire Wire Line
	3750 4700 4250 4700
$Comp
L 1K R107
U 1 1 5A33C203
P 3550 4700
F 0 "R107" H 3600 4884 45  0000 C CNN
F 1 "1K" H 3600 4800 45  0000 C CNN
F 2 "yageo:0603" H 3580 4850 20  0001 C CNN
F 3 "" H 3519 4739 60  0001 C CNN
F 4 "" H 3919 5139 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 3819 5039 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3719 4939 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3619 4839 60  0001 C CNN "Manufacturer"
	1    3550 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4700 3250 4700
$Sheet
S 8500 4900 950  300 
U 5A340DA3
F0 "Sheet5A340DA2" 60
F1 "heater.sch" 60
F2 "OUT1" O R 9450 5000 60 
F3 "IN1" I L 8500 5000 60 
F4 "SENSE1" O L 8500 5100 60 
$EndSheet
$EndSCHEMATC

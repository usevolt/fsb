EESchema Schematic File Version 4
LIBS:fsb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5800 4100 2    60   Output ~ 0
OUT1
Text HLabel 5800 4400 2    60   Output ~ 0
OUT2
Text HLabel 3200 3800 0    60   Input ~ 0
IN1
Text HLabel 3200 4000 0    60   Input ~ 0
IN2
Text HLabel 2650 3700 0    60   Output ~ 0
SENSE1
Text HLabel 2650 4200 0    60   Output ~ 0
SENSE2
$Comp
L fsb-rescue:VND5050AJTR-E U401
U 1 1 59D8088A
P 4600 4000
AR Path="/5A015FC0/59D8088A" Ref="U401"  Part="1" 
AR Path="/5A02A41F/59D8088A" Ref="U901"  Part="1" 
AR Path="/5A07C729/59D8088A" Ref="U901"  Part="1" 
AR Path="/5A337B26/59D8088A" Ref="U801"  Part="1" 
AR Path="/5F353556/59D8088A" Ref="U4"  Part="1" 
F 0 "U901" H 4700 4447 60  0000 C CNN
F 1 "VND5050AJTR-E" H 4700 4341 60  0000 C CNN
F 2 "usevolt:PowerSSO-12" H 4600 4400 60  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/group2/a5/e5/14/55/09/93/43/94/CD00103333/files/CD00103333.pdf/jcr:content/translations/en.CD00103333.pdf" H 4600 4400 60  0001 C CNN
F 4 "497-11474-1-ND" H 5000 4800 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 4900 4700 60  0001 C CNN "1st Source"
F 6 "STMicroelectronics" H 4700 4500 60  0001 C CNN "Manufacturer"
F 7 "VND5050AJTR-E" H 4800 4600 60  0001 C CNN "Manufacturer Part Number"
	1    4600 4000
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:VDD #PWR019
U 1 1 59D808C7
P 5250 3650
AR Path="/5A015FC0/59D808C7" Ref="#PWR019"  Part="1" 
AR Path="/5A02A41F/59D808C7" Ref="#PWR029"  Part="1" 
AR Path="/5A07C729/59D808C7" Ref="#PWR0502"  Part="1" 
AR Path="/5A337B26/59D808C7" Ref="#PWR0702"  Part="1" 
AR Path="/5F353556/59D808C7" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0502" H 5250 3500 50  0001 C CNN
F 1 "VDD" H 5267 3823 50  0000 C CNN
F 2 "" H 5250 3650 50  0000 C CNN
F 3 "" H 5250 3650 50  0000 C CNN
	1    5250 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3650 5250 3800
Wire Wire Line
	5250 3800 5100 3800
Wire Wire Line
	5250 3900 5100 3900
Connection ~ 5250 3800
Wire Wire Line
	5250 4000 5100 4000
Connection ~ 5250 3900
Wire Wire Line
	5100 4100 5250 4100
Wire Wire Line
	5100 4200 5250 4200
Wire Wire Line
	5250 4200 5250 4100
Connection ~ 5250 4100
Wire Wire Line
	5100 4400 5250 4400
Wire Wire Line
	5100 4300 5250 4300
Wire Wire Line
	5250 4300 5250 4400
Connection ~ 5250 4400
Wire Wire Line
	3200 3800 3300 3800
Wire Wire Line
	3200 4000 3300 4000
$Comp
L fsb-rescue:GND #PWR020
U 1 1 59D86DC2
P 3600 4650
AR Path="/5A015FC0/59D86DC2" Ref="#PWR020"  Part="1" 
AR Path="/5A02A41F/59D86DC2" Ref="#PWR030"  Part="1" 
AR Path="/5A07C729/59D86DC2" Ref="#PWR0501"  Part="1" 
AR Path="/5A337B26/59D86DC2" Ref="#PWR0701"  Part="1" 
AR Path="/5F353556/59D86DC2" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0501" H 3600 4400 50  0001 C CNN
F 1 "GND" H 3605 4477 50  0000 C CNN
F 2 "" H 3600 4650 50  0000 C CNN
F 3 "" H 3600 4650 50  0000 C CNN
	1    3600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3900 3600 4100
Wire Wire Line
	3600 4300 4300 4300
Wire Wire Line
	3700 3900 3600 3900
Connection ~ 3600 4300
Wire Wire Line
	3700 4100 3600 4100
Connection ~ 3600 4100
Wire Wire Line
	4000 4100 4150 4100
Wire Wire Line
	4000 3900 4150 3900
Wire Wire Line
	2650 4200 3000 4200
Wire Wire Line
	4150 4200 4150 4100
Connection ~ 4150 4100
Wire Wire Line
	4150 3900 4150 3700
Wire Wire Line
	4150 3700 2750 3700
Connection ~ 4150 3900
$Comp
L fsb-rescue:1K R403
U 1 1 5A05950C
P 3400 3900
AR Path="/5A015FC0/5A05950C" Ref="R403"  Part="1" 
AR Path="/5A02A41F/5A05950C" Ref="R903"  Part="1" 
AR Path="/5A07C729/5A05950C" Ref="R903"  Part="1" 
AR Path="/5A337B26/5A05950C" Ref="R801"  Part="1" 
AR Path="/5F353556/5A05950C" Ref="R15"  Part="1" 
F 0 "R903" H 3450 4084 45  0000 C CNN
F 1 "1K" H 3450 4000 45  0000 C CNN
F 2 "yageo:0603" H 3430 4050 20  0001 C CNN
F 3 "" H 3369 3939 60  0001 C CNN
F 4 "" H 3769 4339 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 3669 4239 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3569 4139 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3469 4039 60  0001 C CNN "Manufacturer"
	1    3400 3900
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:1K R404
U 1 1 5A059568
P 3400 4100
AR Path="/5A015FC0/5A059568" Ref="R404"  Part="1" 
AR Path="/5A02A41F/5A059568" Ref="R904"  Part="1" 
AR Path="/5A07C729/5A059568" Ref="R904"  Part="1" 
AR Path="/5A337B26/5A059568" Ref="R802"  Part="1" 
AR Path="/5F353556/5A059568" Ref="R16"  Part="1" 
F 0 "R904" H 3450 4284 45  0000 C CNN
F 1 "1K" H 3450 4200 45  0000 C CNN
F 2 "yageo:0603" H 3430 4250 20  0001 C CNN
F 3 "" H 3369 4139 60  0001 C CNN
F 4 "" H 3769 4539 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 3669 4439 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3569 4339 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3469 4239 60  0001 C CNN "Manufacturer"
	1    3400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3900 3300 3800
Connection ~ 3300 3800
Wire Wire Line
	3300 4000 3300 4100
Connection ~ 3300 4000
Connection ~ 3600 3900
Wire Wire Line
	5250 3800 5250 3900
Wire Wire Line
	5250 3900 5250 4000
Wire Wire Line
	5250 4100 5800 4100
Wire Wire Line
	5250 4400 5800 4400
Wire Wire Line
	3600 4300 3600 4550
Wire Wire Line
	3600 4100 3600 4300
Wire Wire Line
	4150 4100 4300 4100
Wire Wire Line
	4150 3900 4300 3900
Wire Wire Line
	3300 3800 4300 3800
Wire Wire Line
	3300 4000 4300 4000
$Comp
L fsb-rescue:1K R?
U 1 1 5C01EA8C
P 3800 4100
AR Path="/5A015FC0/5C01EA8C" Ref="R?"  Part="1" 
AR Path="/5A02A41F/5C01EA8C" Ref="R?"  Part="1" 
AR Path="/5A07C729/5C01EA8C" Ref="R2"  Part="1" 
AR Path="/5A337B26/5C01EA8C" Ref="R7"  Part="1" 
AR Path="/5F353556/5C01EA8C" Ref="R18"  Part="1" 
F 0 "R2" H 3850 4284 45  0000 C CNN
F 1 "1K" H 3850 4200 45  0000 C CNN
F 2 "yageo:0603" H 3830 4250 20  0001 C CNN
F 3 "" H 3769 4139 60  0001 C CNN
F 4 "" H 4169 4539 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 4069 4439 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3969 4339 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3869 4239 60  0001 C CNN "Manufacturer"
	1    3800 4100
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:1K R?
U 1 1 5C01EABC
P 3800 3900
AR Path="/5A015FC0/5C01EABC" Ref="R?"  Part="1" 
AR Path="/5A02A41F/5C01EABC" Ref="R?"  Part="1" 
AR Path="/5A07C729/5C01EABC" Ref="R1"  Part="1" 
AR Path="/5A337B26/5C01EABC" Ref="R6"  Part="1" 
AR Path="/5F353556/5C01EABC" Ref="R17"  Part="1" 
F 0 "R1" H 3850 4084 45  0000 C CNN
F 1 "1K" H 3850 4000 45  0000 C CNN
F 2 "yageo:0603" H 3830 4050 20  0001 C CNN
F 3 "" H 3769 3939 60  0001 C CNN
F 4 "" H 4169 4339 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 4069 4239 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 3969 4139 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 3869 4039 60  0001 C CNN "Manufacturer"
	1    3800 3900
	1    0    0    -1  
$EndComp
$Comp
L usevolt:ZENER_MM3Z3V6T1G D2
U 1 1 5C0230BD
P 2750 4350
AR Path="/5A07C729/5C0230BD" Ref="D2"  Part="1" 
AR Path="/5A337B26/5C0230BD" Ref="D4"  Part="1" 
AR Path="/5F353556/5C0230BD" Ref="D8"  Part="1" 
F 0 "D2" V 2675 4272 45  0000 R CNN
F 1 "ZENER_MM3Z3V6T1G" H 3025 4725 45  0001 L BNN
F 2 "usevolt:SOD-323" H 2725 4725 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/308/MM3Z2V4T1-D-269162.pdf" H 3100 4925 60  0001 C CNN
F 4 "Mouser" H 3070 4670 60  0001 C CNN "1st Source"
F 5 "MM3Z3V6T1G" H 2970 4570 60  0001 C CNN "Manufacturer Part Number"
F 6 "863-MM3Z3V6T1G" H 3170 4770 60  0001 C CNN "1st Source Part Number"
F 7 "ON Semiconductor" H 3025 4825 60  0001 C CNN "Manufacturer"
	1    2750 4350
	0    -1   -1   0   
$EndComp
$Comp
L usevolt:ZENER_MM3Z3V6T1G D3
U 1 1 5C023146
P 3000 4350
AR Path="/5A07C729/5C023146" Ref="D3"  Part="1" 
AR Path="/5A337B26/5C023146" Ref="D5"  Part="1" 
AR Path="/5F353556/5C023146" Ref="D9"  Part="1" 
F 0 "D3" V 2925 4272 45  0000 R CNN
F 1 "ZENER_MM3Z3V6T1G" H 3275 4725 45  0001 L BNN
F 2 "usevolt:SOD-323" H 2975 4725 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/308/MM3Z2V4T1-D-269162.pdf" H 3350 4925 60  0001 C CNN
F 4 "Mouser" H 3320 4670 60  0001 C CNN "1st Source"
F 5 "MM3Z3V6T1G" H 3220 4570 60  0001 C CNN "Manufacturer Part Number"
F 6 "863-MM3Z3V6T1G" H 3420 4770 60  0001 C CNN "1st Source Part Number"
F 7 "ON Semiconductor" H 3275 4825 60  0001 C CNN "Manufacturer"
	1    3000 4350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 4300 3000 4200
Connection ~ 3000 4200
Wire Wire Line
	3000 4200 4150 4200
Wire Wire Line
	2750 4300 2750 3700
Connection ~ 2750 3700
Wire Wire Line
	2750 3700 2650 3700
Wire Wire Line
	2750 4550 3000 4550
Wire Wire Line
	3000 4550 3600 4550
Connection ~ 3000 4550
Connection ~ 3600 4550
Wire Wire Line
	3600 4550 3600 4650
$EndSCHEMATC

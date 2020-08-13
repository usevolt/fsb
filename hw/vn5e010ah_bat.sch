EESchema Schematic File Version 4
LIBS:fsb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 9
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7400 3450 2    60   Output ~ 0
OUT1
Text HLabel 4650 3450 0    60   Input ~ 0
IN1
Text HLabel 5550 4050 0    60   Output ~ 0
SENSE1
Wire Wire Line
	5050 3550 5250 3550
Wire Wire Line
	4650 3450 4800 3450
Wire Wire Line
	5550 4050 5800 4050
Wire Wire Line
	5800 3350 6100 3350
Wire Wire Line
	6800 3550 6900 3550
Wire Wire Line
	6900 3550 6900 3450
Wire Wire Line
	6800 3450 6900 3450
Connection ~ 6900 3450
Wire Wire Line
	5800 3250 5800 3350
Wire Wire Line
	5800 4050 5800 3550
Connection ~ 5800 3550
$Comp
L power:GND #PWR0107
U 1 1 5C4EBF1A
P 5050 3850
F 0 "#PWR0107" H 5050 3600 50  0001 C CNN
F 1 "GND" H 5055 3677 50  0000 C CNN
F 2 "" H 5050 3850 50  0000 C CNN
F 3 "" H 5050 3850 50  0000 C CNN
	1    5050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3550 5050 3800
$Comp
L yageo:1K R?
U 1 1 5C4EBF25
P 4800 3600
AR Path="/5A01611C/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A019746/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A01A445/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A01AB59/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A13680F/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A14370A/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5A33548E/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5C4B29BE/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5C4B2C63/5C4EBF25" Ref="R?"  Part="1" 
AR Path="/5C4EBD09/5C4EBF25" Ref="R11"  Part="1" 
F 0 "R11" V 4808 3658 45  0000 L CNN
F 1 "1K" V 4892 3658 45  0000 L CNN
F 2 "yageo:0603" H 4830 3750 20  0001 C CNN
F 3 "" H 4769 3639 60  0001 C CNN
F 4 "" H 5169 4039 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5069 3939 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 4969 3839 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 4869 3739 60  0001 C CNN "Manufacturer"
	1    4800 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 3500 4800 3450
Connection ~ 4800 3450
Wire Wire Line
	4800 3800 5050 3800
Connection ~ 5050 3800
$Comp
L usevolt:VN5E010AH U3
U 1 1 5C4EBF34
P 6500 3550
F 0 "U3" H 6450 3997 60  0000 C CNN
F 1 "VN5E010AH" H 6450 3891 60  0000 C CNN
F 2 "usevolt:HPAK" H 6150 4500 60  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/52/ef/e0/cc/90/4e/2e/CD00240716.pdf/files/CD00240716.pdf/jcr:content/translations/en.CD00240716.pdf" H 6250 4600 60  0001 C CNN
F 4 "STMicroelectronics" H 6350 4700 60  0001 C CNN "Manufacturer"
F 5 "VN5E010AHTR-E" H 6450 4800 60  0001 C CNN "Manufacturer Part Number"
F 6 "Digikey" H 6550 4900 60  0001 C CNN "1st Source"
F 7 "497-10505-2-ND" H 6650 5000 60  0001 C CNN "1st Source Part Number"
	1    6500 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5C4EBF3B
P 6000 4550
F 0 "#PWR0109" H 6000 4300 50  0001 C CNN
F 1 "GND" H 6005 4377 50  0000 C CNN
F 2 "" H 6000 4550 50  0000 C CNN
F 3 "" H 6000 4550 50  0000 C CNN
	1    6000 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 3650 6000 3750
Wire Wire Line
	6000 3750 6100 3750
Wire Wire Line
	6100 3650 6000 3650
Connection ~ 6000 3750
Wire Wire Line
	6900 3450 7050 3450
Wire Wire Line
	5800 3550 6100 3550
Wire Wire Line
	4800 3450 6100 3450
Wire Wire Line
	5050 3800 5050 3850
Wire Wire Line
	6000 3750 6000 4450
$Comp
L yageo:1K R?
U 1 1 5C4EBF4E
P 5450 3550
AR Path="/5A01611C/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A019746/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A01A445/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A01AB59/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A13680F/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A14370A/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5A33548E/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5C4B29BE/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5C4B2C63/5C4EBF4E" Ref="R?"  Part="1" 
AR Path="/5C4EBD09/5C4EBF4E" Ref="R12"  Part="1" 
F 0 "R12" V 5458 3608 45  0000 L CNN
F 1 "1K" V 5542 3608 45  0000 L CNN
F 2 "yageo:0603" H 5480 3700 20  0001 C CNN
F 3 "" H 5419 3589 60  0001 C CNN
F 4 "" H 5819 3989 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5719 3889 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 5619 3789 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 5519 3689 60  0001 C CNN "Manufacturer"
	1    5450 3550
	-1   0    0    1   
$EndComp
$Comp
L yageo:10K R?
U 1 1 5C4EBF59
P 7050 3650
AR Path="/5A12FF64/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5A33548E/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5C4B29BE/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5C4B2C63/5C4EBF59" Ref="R?"  Part="1" 
AR Path="/5C4EBD09/5C4EBF59" Ref="R13"  Part="1" 
F 0 "R13" V 7058 3708 45  0000 L CNN
F 1 "10K" V 7142 3708 45  0000 L CNN
F 2 "yageo:0603" H 7080 3800 20  0001 C CNN
F 3 "" H 7019 3689 60  0001 C CNN
F 4 "" H 7419 4089 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 7319 3989 60  0001 C CNN "1st Source"
F 6 "RC0603FR-0710KL" H 7219 3889 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 7119 3789 60  0001 C CNN "Manufacturer"
	1    7050 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 3550 7050 3450
Connection ~ 7050 3450
Wire Wire Line
	7050 3450 7400 3450
$Comp
L power:GND #PWR0110
U 1 1 5C4EBF63
P 7050 3950
F 0 "#PWR0110" H 7050 3700 50  0001 C CNN
F 1 "GND" H 7055 3777 50  0000 C CNN
F 2 "" H 7050 3950 50  0000 C CNN
F 3 "" H 7050 3950 50  0000 C CNN
	1    7050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3950 7050 3850
Wire Wire Line
	5550 3550 5800 3550
$Comp
L usevolt:ZENER_MM3Z3V6T1G D?
U 1 1 5C4EBF6F
P 5800 4250
AR Path="/5A12FF64/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5A130D3E/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5A1349CF/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5A1358B0/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5A33548E/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5C4B29BE/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5C4B2C63/5C4EBF6F" Ref="D?"  Part="1" 
AR Path="/5C4EBD09/5C4EBF6F" Ref="D7"  Part="1" 
F 0 "D7" V 5725 4172 45  0000 R CNN
F 1 "ZENER_MM3Z3V6T1G" H 6075 4625 45  0001 L BNN
F 2 "usevolt:SOD-323" H 5775 4625 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/308/MM3Z2V4T1-D-269162.pdf" H 6150 4825 60  0001 C CNN
F 4 "Mouser" H 6120 4570 60  0001 C CNN "1st Source"
F 5 "MM3Z3V6T1G" H 6020 4470 60  0001 C CNN "Manufacturer Part Number"
F 6 "863-MM3Z3V6T1G" H 6220 4670 60  0001 C CNN "1st Source Part Number"
F 7 "ON Semiconductor" H 6075 4725 60  0001 C CNN "Manufacturer"
	1    5800 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5800 4200 5800 4050
Connection ~ 5800 4050
Wire Wire Line
	5800 4450 6000 4450
Connection ~ 6000 4450
Wire Wire Line
	6000 4450 6000 4550
$Comp
L fsb-rescue:+BATT #PWR0115
U 1 1 5C4EC55A
P 5800 3250
F 0 "#PWR0115" H 5800 3100 50  0001 C CNN
F 1 "+BATT" H 5815 3423 50  0000 C CNN
F 2 "" H 5800 3250 50  0000 C CNN
F 3 "" H 5800 3250 50  0000 C CNN
	1    5800 3250
	1    0    0    -1  
$EndComp
$EndSCHEMATC

EESchema Schematic File Version 2
LIBS:kemet
LIBS:multicomp
LIBS:power
LIBS:usevolt
LIBS:wurth_elektronik_LED
LIBS:fsb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 12
Title "MSB current sense sheet"
Date "2017-02-05"
Rev "1"
Comp "Usevolt Oy"
Comment1 "Olli Usenius"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ZXCT1086 U701
U 1 1 589841A1
P 5450 3600
AR Path="/58BE52C9/5955DE03/589841A1" Ref="U701"  Part="1" 
AR Path="/58BE52C9/59B27EDC/589841A1" Ref="U801"  Part="1" 
AR Path="/58C7B0A8/594D8B80/589841A1" Ref="U1001"  Part="1" 
AR Path="/58C7B0A8/594D8B83/589841A1" Ref="U1101"  Part="1" 
AR Path="/598914ED/58BE8E88/589841A1" Ref="U1101"  Part="1" 
AR Path="/598914ED/59C20B57/589841A1" Ref="U801"  Part="1" 
F 0 "U801" H 5425 3887 60  0000 C CNN
F 1 "ZXCT1086" H 5425 3781 60  0000 C CNN
F 2 "usevolt:SOT-25" H 5100 4050 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1383709.pdf?_ga=1.188141032.1948984246.1460023966" H 5850 3925 60  0001 C CNN
F 4 "1904029" H 5850 4150 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5950 4250 60  0001 C CNN "2nd Source"
F 6 "DIODES INC" H 5550 3850 60  0001 C CNN "Manufacturer"
F 7 "Farnell" H 5750 4050 60  0001 C CNN "1st Source"
F 8 "ZXCT1086E5TA" H 5650 3950 60  0001 C CNN "Manufacturer Part Number"
F 9 "ZXCT1086E5TACT-ND" H 6050 4350 60  0001 C CNN "2nd Source Part Number"
	1    5450 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR702
U 1 1 59B98AFD
P 5050 4000
AR Path="/58BE52C9/5955DE03/59B98AFD" Ref="#PWR702"  Part="1" 
AR Path="/58BE52C9/59B27EDC/59B98AFD" Ref="#PWR802"  Part="1" 
AR Path="/58C7B0A8/594D8B80/59B98AFD" Ref="#PWR1002"  Part="1" 
AR Path="/58C7B0A8/594D8B83/59B98AFD" Ref="#PWR1102"  Part="1" 
AR Path="/598914ED/58BE8E88/59B98AFD" Ref="#PWR702"  Part="1" 
AR Path="/598914ED/59C20B57/59B98AFD" Ref="#PWR802"  Part="1" 
F 0 "#PWR802" H 5050 3750 50  0001 C CNN
F 1 "GND" H 5055 3827 50  0000 C CNN
F 2 "" H 5050 4000 50  0000 C CNN
F 3 "" H 5050 4000 50  0000 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR701
U 1 1 59B98AFE
P 5050 3350
AR Path="/58BE52C9/5955DE03/59B98AFE" Ref="#PWR701"  Part="1" 
AR Path="/58BE52C9/59B27EDC/59B98AFE" Ref="#PWR801"  Part="1" 
AR Path="/58C7B0A8/594D8B80/59B98AFE" Ref="#PWR1001"  Part="1" 
AR Path="/58C7B0A8/594D8B83/59B98AFE" Ref="#PWR1101"  Part="1" 
AR Path="/598914ED/58BE8E88/59B98AFE" Ref="#PWR701"  Part="1" 
AR Path="/598914ED/59C20B57/59B98AFE" Ref="#PWR801"  Part="1" 
F 0 "#PWR801" H 5050 3200 50  0001 C CNN
F 1 "+3V3" H 5065 3523 50  0000 C CNN
F 2 "" H 5050 3350 50  0000 C CNN
F 3 "" H 5050 3350 50  0000 C CNN
	1    5050 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3300 6400 3300
Wire Wire Line
	5700 3550 6050 3550
Wire Wire Line
	6050 3550 6050 3300
Wire Wire Line
	5700 3750 6400 3750
Wire Wire Line
	5050 3750 5050 4000
Wire Wire Line
	5050 3750 5150 3750
Wire Wire Line
	5050 3350 5050 3550
Wire Wire Line
	5050 3550 5150 3550
Wire Wire Line
	4100 3650 5150 3650
Text HLabel 6400 3300 2    60   Input ~ 0
SENSE+
Text HLabel 6400 3750 2    60   Input ~ 0
SENSE-
Text HLabel 4100 3650 0    60   Output ~ 0
VOUT
Wire Wire Line
	6200 3650 6200 3750
Connection ~ 6200 3750
Wire Wire Line
	6200 3350 6200 3300
Connection ~ 6200 3300
$Comp
L LRMAT2512-R004FT4 R801
U 1 1 59B97E24
P 6200 3450
AR Path="/58BE52C9/59B27EDC/59B97E24" Ref="R801"  Part="1" 
AR Path="/58BE52C9/5955DE03/59B97E24" Ref="R701"  Part="1" 
AR Path="/58C7B0A8/594D8B80/59B97E24" Ref="R1001"  Part="1" 
AR Path="/58C7B0A8/594D8B83/59B97E24" Ref="R1101"  Part="1" 
AR Path="/598914ED/58BE8E88/59B97E24" Ref="R1101"  Part="1" 
AR Path="/598914ED/59C20B57/59B97E24" Ref="R801"  Part="1" 
F 0 "R801" V 6208 3508 45  0000 L CNN
F 1 "LRMAT2512-R004FT4" V 6292 3508 45  0000 L CNN
F 2 "usevolt:2512" H 6230 3600 20  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2158958.pdf?_ga=2.43265772.874534928.1505194133-1862443086.1504075057" H 6169 3489 60  0001 C CNN
F 4 "2079418" H 6569 3889 60  0001 C CNN "1st Source Part Number"
F 5 "Farnell" H 6469 3789 60  0001 C CNN "1st Source"
F 6 "LRMAT2512-R002FT4" H 6369 3689 60  0001 C CNN "Manufacturer Part Number"
F 7 "WELWYN" H 6269 3589 60  0001 C CNN "Manufacturer"
	1    6200 3450
	0    1    1    0   
$EndComp
$EndSCHEMATC

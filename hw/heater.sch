EESchema Schematic File Version 4
LIBS:fsb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 8
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 7250 3700 2    60   Output ~ 0
OUT+
Text HLabel 4350 3700 0    60   Input ~ 0
IN1
Text HLabel 5250 3550 0    60   Output ~ 0
SENSE1
Wire Wire Line
	4350 3700 4500 3700
$Comp
L fsb-rescue:VDD #PWR0803
U 1 1 5A34158F
P 5650 3500
F 0 "#PWR0803" H 5650 3350 50  0001 C CNN
F 1 "VDD" H 5667 3673 50  0000 C CNN
F 2 "" H 5650 3500 50  0000 C CNN
F 3 "" H 5650 3500 50  0000 C CNN
	1    5650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3600 5950 3600
Wire Wire Line
	6650 3800 6750 3800
Wire Wire Line
	6750 3800 6750 3700
Wire Wire Line
	6650 3700 6750 3700
Connection ~ 6750 3700
Wire Wire Line
	5650 3500 5650 3600
$Comp
L fsb-rescue:VN5E010AH U802
U 1 1 5A3415C2
P 6350 3800
F 0 "U802" H 6300 4247 60  0000 C CNN
F 1 "VN5E010AH" H 6300 4141 60  0000 C CNN
F 2 "usevolt:HPAK" H 6000 4750 60  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/52/ef/e0/cc/90/4e/2e/CD00240716.pdf/files/CD00240716.pdf/jcr:content/translations/en.CD00240716.pdf" H 6100 4850 60  0001 C CNN
F 4 "497-10505-2-ND" H 6500 5250 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 6400 5150 60  0001 C CNN "1st Source"
F 6 "STMicroelectronics" H 6200 4950 60  0001 C CNN "Manufacturer"
F 7 "VN5E010AHTR-E" H 6300 5050 60  0001 C CNN "Manufacturer Part Number"
	1    6350 3800
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:GND #PWR0805
U 1 1 5A3415C9
P 5850 4200
F 0 "#PWR0805" H 5850 3950 50  0001 C CNN
F 1 "GND" H 5855 4027 50  0000 C CNN
F 2 "" H 5850 4200 50  0000 C CNN
F 3 "" H 5850 4200 50  0000 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4000 5950 4000
$Comp
L fsb-rescue:VN5E010AH U803
U 1 1 5A341601
P 6350 5000
F 0 "U803" H 6300 5447 60  0000 C CNN
F 1 "VN5E010AH" H 6300 5341 60  0000 C CNN
F 2 "usevolt:HPAK" H 6000 5950 60  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/52/ef/e0/cc/90/4e/2e/CD00240716.pdf/files/CD00240716.pdf/jcr:content/translations/en.CD00240716.pdf" H 6100 6050 60  0001 C CNN
F 4 "497-10505-2-ND" H 6500 6450 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 6400 6350 60  0001 C CNN "1st Source"
F 6 "STMicroelectronics" H 6200 6150 60  0001 C CNN "Manufacturer"
F 7 "VN5E010AHTR-E" H 6300 6250 60  0001 C CNN "Manufacturer Part Number"
	1    6350 5000
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:GND #PWR0806
U 1 1 5A34165B
P 5850 5500
F 0 "#PWR0806" H 5850 5250 50  0001 C CNN
F 1 "GND" H 5855 5327 50  0000 C CNN
F 2 "" H 5850 5500 50  0000 C CNN
F 3 "" H 5850 5500 50  0000 C CNN
	1    5850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4900 4650 4900
Wire Wire Line
	5650 4800 5950 4800
Wire Wire Line
	5650 4700 5650 4800
$Comp
L fsb-rescue:GND #PWR0802
U 1 1 5A341754
P 4900 3950
F 0 "#PWR0802" H 4900 3700 50  0001 C CNN
F 1 "GND" H 4905 3777 50  0000 C CNN
F 2 "" H 4900 3950 50  0000 C CNN
F 3 "" H 4900 3950 50  0000 C CNN
	1    4900 3950
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:1K R?
U 1 1 5A34175F
P 4650 5050
AR Path="/5A01611C/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A019746/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A01A445/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A01AB59/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A13680F/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A14370A/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A33548E/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A33648A/5A34175F" Ref="R?"  Part="1" 
AR Path="/5A340DA3/5A34175F" Ref="R806"  Part="1" 
F 0 "R806" V 4658 5108 45  0000 L CNN
F 1 "1K" V 4742 5108 45  0000 L CNN
F 2 "yageo:0603" H 4680 5200 20  0001 C CNN
F 3 "" H 4619 5089 60  0001 C CNN
F 4 "" H 5019 5489 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 4919 5389 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 4819 5289 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 4719 5189 60  0001 C CNN "Manufacturer"
	1    4650 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 4950 4650 4900
Connection ~ 4650 4900
Wire Wire Line
	4650 5250 4900 5250
Wire Wire Line
	5950 5200 5850 5200
Wire Wire Line
	5850 5100 5850 5200
Wire Wire Line
	5850 5100 5950 5100
Connection ~ 5850 5200
Wire Wire Line
	6650 5000 6750 5000
Wire Wire Line
	6750 5000 6750 4900
Wire Wire Line
	6650 4900 6750 4900
Connection ~ 6750 4900
Connection ~ 7050 3700
Wire Wire Line
	4500 3700 4500 4900
Connection ~ 4500 3700
$Comp
L fsb-rescue:+BATT #PWR0804
U 1 1 5A342027
P 5650 4700
F 0 "#PWR0804" H 5650 4550 50  0001 C CNN
F 1 "+BATT" H 5665 4873 50  0000 C CNN
F 2 "" H 5650 4700 50  0000 C CNN
F 3 "" H 5650 4700 50  0000 C CNN
	1    5650 4700
	1    0    0    -1  
$EndComp
$Comp
L fsb-rescue:SCHOTTKY_DIODE_V40PW10C D801
U 1 1 5A394B01
P 7700 4450
F 0 "D801" H 7700 4797 60  0000 C CNN
F 1 "SCHOTTKY_DIODE_V40PW10C" H 7700 4691 60  0000 C CNN
F 2 "usevolt:SlimDPAK" H 7500 4100 60  0001 C CNN
F 3 "http://www.farnell.com/datasheets/2245239.pdf?_ga=2.16591231.874534928.1505194133-1862443086.1504075057" H 7500 4100 60  0001 C CNN
F 4 "2535169" H 8050 5050 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 8150 5150 60  0001 C CNN "2nd Source"
F 6 "Farnell" H 7950 4950 60  0001 C CNN "1st Source"
F 7 "V40PW10CHM3/I" H 7850 4850 60  0001 C CNN "Manufacturer Part Number"
F 8 "V40PW10CHM3/IGICT-ND" H 8250 5250 60  0001 C CNN "2nd Source Part Number"
F 9 "VISHAY" H 7750 4750 60  0001 C CNN "Manufacturer"
	1    7700 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6750 3700 7050 3700
Wire Wire Line
	5850 4000 5850 4200
Wire Wire Line
	4650 4900 5950 4900
Wire Wire Line
	6750 4900 7050 4900
Wire Wire Line
	7050 3700 7250 3700
Text HLabel 5550 2250 0    50   Input ~ 0
IN_PWM
$Comp
L usevolt:VNB35NV04TR-E Q801
U 1 1 5ABB9BC8
P 7850 2250
F 0 "Q801" H 7825 2525 50  0000 C CNN
F 1 "VNB35NV04TR-E" H 7825 2434 50  0000 C CNN
F 2 "usevolt:D2" H 7600 2250 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/95/6b/79/42/8e/45/4a/e6/DM00062289.pdf/files/DM00062289.pdf/jcr:content/translations/en.DM00062289.pdf" H 7600 2250 50  0001 C CNN
F 4 "STMicroelectronics" H 7950 2500 50  0001 C CNN "Manufacturer"
F 5 "VNB35NV04TR-E" H 8050 2600 50  0001 C CNN "Manufacturer Part Number"
F 6 "Digikey" H 8150 2700 50  0001 C CNN "1st Source"
F 7 "497-11686-1-ND" H 8250 2800 50  0001 C CNN "1st Source Part Number"
F 8 "Mouser" H 8350 2900 50  0001 C CNN "2nd Source"
F 9 "511-VNB35NV04TR-E" H 8450 3000 50  0001 C CNN "2nd Source Part Number"
	1    7850 2250
	1    0    0    -1  
$EndComp
Text HLabel 8700 2200 2    50   Input ~ 0
OUT-
Wire Wire Line
	8700 2200 8550 2200
$Comp
L fsb-rescue:GND #PWR0107
U 1 1 5ABBA8C9
P 8300 2650
F 0 "#PWR0107" H 8300 2400 50  0001 C CNN
F 1 "GND" H 8305 2477 50  0000 C CNN
F 2 "" H 8300 2650 50  0000 C CNN
F 3 "" H 8300 2650 50  0000 C CNN
	1    8300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2650 8300 2300
Wire Wire Line
	8300 2300 8050 2300
Wire Wire Line
	7050 4400 7050 3700
Wire Wire Line
	7050 4900 7050 4400
Connection ~ 7050 4400
Wire Wire Line
	7300 4400 7050 4400
Wire Wire Line
	8550 2200 8550 4350
Wire Wire Line
	8550 4350 8100 4350
Connection ~ 8550 2200
Wire Wire Line
	8550 2200 8050 2200
Wire Wire Line
	8100 4450 8550 4450
Wire Wire Line
	8550 4450 8550 4350
Connection ~ 8550 4350
$Comp
L usevolt:MOSFET-N_2N7002W U805
U 1 1 5B408B19
P 6500 2500
F 0 "U805" H 6500 2787 60  0000 C CNN
F 1 "MOSFET-N_2N7002W" H 6500 2681 60  0000 C CNN
F 2 "usevolt:SOT323" H 6800 3400 60  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N7002W-D.PDF" H 6650 3500 60  0001 C CNN
F 4 "2533171" H 7075 3325 60  0001 C CNN "2nd Source Part Number"
F 5 "2N7002WT1G" H 6675 2925 60  0001 C CNN "Manufacturer Part Number"
F 6 "2N7002WT1GOSCT-ND" H 6875 3125 60  0001 C CNN "1st Source Part Number"
F 7 "Digikey" H 6775 3025 60  0001 C CNN "1st Source"
F 8 "Farnell" H 6975 3225 60  0001 C CNN "2nd Source"
F 9 "ON Semiconductor" H 6575 2825 60  0001 C CNN "Manufacturer"
	1    6500 2500
	1    0    0    -1  
$EndComp
$Comp
L usevolt:MOSFET_P_ZXMP10A13F U804
U 1 1 5B408DAE
P 6500 2000
F 0 "U804" H 6500 2265 50  0000 C CNN
F 1 "MOSFET_P_ZXMP10A13F" H 6500 2174 50  0000 C CNN
F 2 "usevolt:SOT-23_3-PIN" H 6500 2200 50  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1915646.pdf?_ga=2.76885333.1768503822.1530426090-1862443086.1504075057" H 6500 2200 50  0001 C CNN
F 4 "DIODES INC." H 6600 2250 50  0001 C CNN "Manufacturer"
F 5 "ZXMP10A13FTA" H 6700 2350 50  0001 C CNN "Manufacturer Part Number"
F 6 "Farnell" H 6800 2450 50  0001 C CNN "1st Source"
F 7 "1843777" H 6900 2550 50  0001 C CNN "1st Source Part Number"
	1    6500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2000 6000 2000
Wire Wire Line
	6000 2000 6000 2250
Wire Wire Line
	6000 2500 6350 2500
Wire Wire Line
	5550 2250 6000 2250
Connection ~ 6000 2250
Wire Wire Line
	6000 2250 6000 2500
$Comp
L fsb-rescue:GND #PWR0109
U 1 1 5B40D98A
P 7000 2750
F 0 "#PWR0109" H 7000 2500 50  0001 C CNN
F 1 "GND" H 7005 2577 50  0000 C CNN
F 2 "" H 7000 2750 50  0000 C CNN
F 3 "" H 7000 2750 50  0000 C CNN
	1    7000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2750 7000 2550
Wire Wire Line
	7000 2550 6650 2550
Wire Wire Line
	7000 1550 7000 1450
Wire Wire Line
	7000 1850 7000 1950
Wire Wire Line
	7000 1950 6700 1950
Wire Wire Line
	6700 2050 7000 2050
Wire Wire Line
	7000 2050 7000 2250
Wire Wire Line
	7000 2250 7600 2250
Wire Wire Line
	7000 2250 7000 2450
Wire Wire Line
	7000 2450 6650 2450
Connection ~ 7000 2250
$Comp
L fsb-rescue:+3V3 #PWR0110
U 1 1 5B415F3E
P 7000 1450
F 0 "#PWR0110" H 7000 1300 50  0001 C CNN
F 1 "+3V3" H 7015 1623 50  0000 C CNN
F 2 "" H 7000 1450 50  0000 C CNN
F 3 "" H 7000 1450 50  0000 C CNN
	1    7000 1450
	1    0    0    -1  
$EndComp
$Comp
L yageo:10 R809
U 1 1 5B410B23
P 7000 1650
F 0 "R809" V 7008 1708 45  0000 L CNN
F 1 "10" V 7092 1708 45  0000 L CNN
F 2 "yageo:0603" H 7030 1800 20  0001 C CNN
F 3 "" H 6969 1689 60  0001 C CNN
F 4 "" H 7369 2089 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 7269 1989 60  0001 C CNN "1st Source"
F 6 "RC0603FR-0710RL" H 7169 1889 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 7069 1789 60  0001 C CNN "Manufacturer"
	1    7000 1650
	0    1    1    0   
$EndComp
$Comp
L fsb-rescue:1K R?
U 1 1 5C0195BB
P 5150 3800
AR Path="/5A01611C/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A019746/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A01A445/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A01AB59/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A13680F/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A14370A/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A33548E/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A33648A/5C0195BB" Ref="R?"  Part="1" 
AR Path="/5A340DA3/5C0195BB" Ref="R9"  Part="1" 
F 0 "R9" V 5158 3858 45  0000 L CNN
F 1 "1K" V 5242 3858 45  0000 L CNN
F 2 "yageo:0603" H 5180 3950 20  0001 C CNN
F 3 "" H 5119 3839 60  0001 C CNN
F 4 "" H 5519 4239 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5419 4139 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 5319 4039 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 5219 3939 60  0001 C CNN "Manufacturer"
	1    5150 3800
	-1   0    0    1   
$EndComp
$Comp
L fsb-rescue:10K R10
U 1 1 5C0197AC
P 7050 5100
F 0 "R10" V 7058 5158 45  0000 L CNN
F 1 "10K" V 7142 5158 45  0000 L CNN
F 2 "yageo:0603" H 7080 5250 20  0001 C CNN
F 3 "" H 7019 5139 60  0001 C CNN
F 4 "Digikey" H 7319 5439 60  0001 C CNN "1st Source"
F 5 "RC0603FR-0710KL" H 7219 5339 60  0001 C CNN "Manufacturer Part Number"
F 6 "YAGEO" H 7119 5239 60  0001 C CNN "Manufacturer"
	1    7050 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 5000 7050 4900
Connection ~ 7050 4900
$Comp
L fsb-rescue:GND #PWR0115
U 1 1 5C01AD9D
P 7050 5400
F 0 "#PWR0115" H 7050 5150 50  0001 C CNN
F 1 "GND" H 7055 5227 50  0000 C CNN
F 2 "" H 7050 5400 50  0000 C CNN
F 3 "" H 7050 5400 50  0000 C CNN
	1    7050 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 5400 7050 5300
$Comp
L usevolt:ZENER_MM3Z3V6T1G D6
U 1 1 5C025775
P 5500 3900
F 0 "D6" V 5425 3822 45  0000 R CNN
F 1 "ZENER_MM3Z3V6T1G" H 5775 4275 45  0001 L BNN
F 2 "usevolt:SOD-323" H 5475 4275 20  0001 C CNN
F 3 "http://www.mouser.com/ds/2/308/MM3Z2V4T1-D-269162.pdf" H 5850 4475 60  0001 C CNN
F 4 "Mouser" H 5820 4220 60  0001 C CNN "1st Source"
F 5 "MM3Z3V6T1G" H 5720 4120 60  0001 C CNN "Manufacturer Part Number"
F 6 "863-MM3Z3V6T1G" H 5920 4320 60  0001 C CNN "1st Source Part Number"
F 7 "ON Semiconductor" H 5775 4375 60  0001 C CNN "Manufacturer"
	1    5500 3900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 3700 5950 3700
Wire Wire Line
	5950 3800 5500 3800
Wire Wire Line
	5500 3800 5500 3850
Wire Wire Line
	5500 4100 5500 4200
Wire Wire Line
	5500 4200 5850 4200
Connection ~ 5850 4200
Wire Wire Line
	5250 3550 5350 3550
Wire Wire Line
	5350 3550 5350 3800
Wire Wire Line
	5350 3800 5500 3800
Connection ~ 5500 3800
Wire Wire Line
	5250 3800 5350 3800
Connection ~ 5350 3800
Wire Wire Line
	4900 3950 4900 3800
Wire Wire Line
	4900 3800 4950 3800
$Comp
L fsb-rescue:GND #PWR?
U 1 1 5C03BB27
P 4900 5350
F 0 "#PWR?" H 4900 5100 50  0001 C CNN
F 1 "GND" H 4905 5177 50  0000 C CNN
F 2 "" H 4900 5350 50  0000 C CNN
F 3 "" H 4900 5350 50  0000 C CNN
	1    4900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5250 4900 5350
Wire Wire Line
	5850 5200 5850 5500
$EndSCHEMATC

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
OUT1
Text HLabel 4350 3700 0    60   Input ~ 0
IN1
Text HLabel 5400 3950 0    60   Output ~ 0
SENSE1
Wire Wire Line
	5400 3800 5950 3800
Wire Wire Line
	4900 3800 5100 3800
Wire Wire Line
	4350 3700 5950 3700
Wire Wire Line
	5400 3950 5650 3950
$Comp
L VDD #PWR803
U 1 1 5A34158F
P 5650 3500
F 0 "#PWR803" H 5650 3350 50  0001 C CNN
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
	6650 3700 7250 3700
Connection ~ 6750 3700
Wire Wire Line
	5650 3500 5650 3600
Wire Wire Line
	5650 3950 5650 3800
Connection ~ 5650 3800
$Comp
L GND #PWR801
U 1 1 5A34159D
P 4900 4100
F 0 "#PWR801" H 4900 3850 50  0001 C CNN
F 1 "GND" H 4905 3927 50  0000 C CNN
F 2 "" H 4900 4100 50  0000 C CNN
F 3 "" H 4900 4100 50  0000 C CNN
	1    4900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3800 4900 4100
$Comp
L 1K R?
U 1 1 5A3415A8
P 4650 3850
AR Path="/5A01611C/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A019746/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A01A445/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A01AB59/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A1349CF/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A13680F/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A14370A/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A33548E/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A33648A/5A3415A8" Ref="R?"  Part="1" 
AR Path="/5A340DA3/5A3415A8" Ref="R805"  Part="1" 
F 0 "R805" V 4658 3908 45  0000 L CNN
F 1 "1K" V 4742 3908 45  0000 L CNN
F 2 "yageo:0603" H 4680 4000 20  0001 C CNN
F 3 "" H 4619 3889 60  0001 C CNN
F 4 "" H 5019 4289 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 4919 4189 60  0001 C CNN "1st Source"
F 6 "RC0603FR-071KL" H 4819 4089 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 4719 3989 60  0001 C CNN "Manufacturer"
	1    4650 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 3750 4650 3700
Connection ~ 4650 3700
Wire Wire Line
	4650 4050 4900 4050
Connection ~ 4900 4050
$Comp
L 390 R?
U 1 1 5A3415B7
P 5200 3800
AR Path="/5A1349CF/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A14370A/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A13680F/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A33548E/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A33648A/5A3415B7" Ref="R?"  Part="1" 
AR Path="/5A340DA3/5A3415B7" Ref="R807"  Part="1" 
F 0 "R807" H 5250 3984 45  0000 C CNN
F 1 "390" H 5250 3900 45  0000 C CNN
F 2 "yageo:0603" H 5230 3950 20  0001 C CNN
F 3 "" H 5169 3839 60  0001 C CNN
F 4 "" H 5569 4239 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5469 4139 60  0001 C CNN "1st Source"
F 6 "RC0603FR-07390RL" H 5369 4039 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 5269 3939 60  0001 C CNN "Manufacturer"
	1    5200 3800
	1    0    0    -1  
$EndComp
$Comp
L VN5E010AH U802
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
L GND #PWR805
U 1 1 5A3415C9
P 5850 4100
F 0 "#PWR805" H 5850 3850 50  0001 C CNN
F 1 "GND" H 5855 3927 50  0000 C CNN
F 2 "" H 5850 4100 50  0000 C CNN
F 3 "" H 5850 4100 50  0000 C CNN
	1    5850 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3900 5850 4100
Wire Wire Line
	5850 4000 5950 4000
Wire Wire Line
	5950 3900 5850 3900
Connection ~ 5850 4000
$Comp
L VN5E010AH U803
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
L GND #PWR806
U 1 1 5A34165B
P 5850 5350
F 0 "#PWR806" H 5850 5100 50  0001 C CNN
F 1 "GND" H 5855 5177 50  0000 C CNN
F 2 "" H 5850 5350 50  0000 C CNN
F 3 "" H 5850 5350 50  0000 C CNN
	1    5850 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5000 5950 5000
Wire Wire Line
	4900 5000 5100 5000
Wire Wire Line
	4500 4900 5950 4900
Wire Wire Line
	5650 4800 5950 4800
Wire Wire Line
	5650 4700 5650 4800
Connection ~ 5500 5000
$Comp
L GND #PWR802
U 1 1 5A341754
P 4900 5300
F 0 "#PWR802" H 4900 5050 50  0001 C CNN
F 1 "GND" H 4905 5127 50  0000 C CNN
F 2 "" H 4900 5300 50  0000 C CNN
F 3 "" H 4900 5300 50  0000 C CNN
	1    4900 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5000 4900 5300
$Comp
L 1K R?
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
Connection ~ 4900 5250
$Comp
L 390 R?
U 1 1 5A34176D
P 5200 5000
AR Path="/5A1349CF/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A14370A/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A120DD2/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A12FF64/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A130D3E/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A1358B0/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A13680F/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A33548E/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A33648A/5A34176D" Ref="R?"  Part="1" 
AR Path="/5A340DA3/5A34176D" Ref="R808"  Part="1" 
F 0 "R808" H 5250 5184 45  0000 C CNN
F 1 "390" H 5250 5100 45  0000 C CNN
F 2 "yageo:0603" H 5230 5150 20  0001 C CNN
F 3 "" H 5169 5039 60  0001 C CNN
F 4 "" H 5569 5439 60  0001 C CNN "1st Source Part Number"
F 5 "Digikey" H 5469 5339 60  0001 C CNN "1st Source"
F 6 "RC0603FR-07390RL" H 5369 5239 60  0001 C CNN "Manufacturer Part Number"
F 7 "YAGEO" H 5269 5139 60  0001 C CNN "Manufacturer"
	1    5200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5200 5850 5200
Wire Wire Line
	5850 5100 5850 5350
Wire Wire Line
	5850 5100 5950 5100
Connection ~ 5850 5200
Wire Wire Line
	6650 5000 6750 5000
Wire Wire Line
	6750 5000 6750 4900
Wire Wire Line
	6650 4900 7050 4900
Connection ~ 6750 4900
Wire Wire Line
	5500 5000 5500 3950
Connection ~ 5500 3950
Wire Wire Line
	7050 4900 7050 3700
Connection ~ 7050 3700
Wire Wire Line
	4500 3700 4500 4900
Connection ~ 4500 3700
$Comp
L +BATT #PWR804
U 1 1 5A342027
P 5650 4700
F 0 "#PWR804" H 5650 4550 50  0001 C CNN
F 1 "+BATT" H 5665 4873 50  0000 C CNN
F 2 "" H 5650 4700 50  0000 C CNN
F 3 "" H 5650 4700 50  0000 C CNN
	1    5650 4700
	1    0    0    -1  
$EndComp
$EndSCHEMATC

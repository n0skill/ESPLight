EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Barrel_Jack J?
U 1 1 5A917ADC
P 1250 1100
F 0 "J?" H 1250 1310 50  0000 C CNN
F 1 "Barrel_Jack" H 1250 925 50  0000 C CNN
F 2 "" H 1300 1060 50  0001 C CNN
F 3 "" H 1300 1060 50  0001 C CNN
	1    1250 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A917B3D
P 2200 1400
F 0 "#PWR?" H 2200 1150 50  0001 C CNN
F 1 "GND" H 2200 1250 50  0000 C CNN
F 2 "" H 2200 1400 50  0001 C CNN
F 3 "" H 2200 1400 50  0001 C CNN
	1    2200 1400
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR?
U 1 1 5A917B5A
P 1700 850
F 0 "#PWR?" H 1700 700 50  0001 C CNN
F 1 "+12V" H 1700 990 50  0000 C CNN
F 2 "" H 1700 850 50  0001 C CNN
F 3 "" H 1700 850 50  0001 C CNN
	1    1700 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1000 1900 1000
Wire Wire Line
	1700 1000 1700 850 
$Comp
L L7805 U?
U 1 1 5A917B83
P 2200 1000
F 0 "U?" H 2050 1125 50  0000 C CNN
F 1 "L7805" H 2200 1125 50  0000 L CNN
F 2 "" H 2225 850 50  0001 L CIN
F 3 "" H 2200 950 50  0001 C CNN
	1    2200 1000
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x08 J?
U 1 1 5A917BBC
P 4300 1300
F 0 "J?" H 4300 1700 50  0000 C CNN
F 1 "Conn_01x08" H 4300 800 50  0000 C CNN
F 2 "" H 4300 1300 50  0001 C CNN
F 3 "" H 4300 1300 50  0001 C CNN
	1    4300 1300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x08 J?
U 1 1 5A917BFC
P 4300 2300
F 0 "J?" H 4300 2700 50  0000 C CNN
F 1 "Conn_01x08" H 4300 1800 50  0000 C CNN
F 2 "" H 4300 2300 50  0001 C CNN
F 3 "" H 4300 2300 50  0001 C CNN
	1    4300 2300
	1    0    0    -1  
$EndComp
Connection ~ 1700 1000
Wire Wire Line
	2200 1300 2200 1400
Wire Wire Line
	2500 1000 4100 1000
Wire Wire Line
	1550 1200 1750 1200
Wire Wire Line
	1750 1200 1750 1350
Wire Wire Line
	1750 1350 2650 1350
Connection ~ 2200 1350
Wire Wire Line
	2650 1350 2650 1100
Wire Wire Line
	2650 1100 4100 1100
$EndSCHEMATC

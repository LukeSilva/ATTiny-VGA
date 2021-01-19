#!/bin/sh
#PORT=/dev/cu.usbserial-A8008VmU
PORT=/dev/ttyUSB0
avrdude -F -p m324p -c usbtiny -U flash:w:videocard.hex:i
# fuses
#avrdude -F -P /dev/ttyUSB0 -p t45 -c avrisp -Ulfuse:w:0xce:m -Uhfuse:w:0xdf:m -Uefuse:w:0xff:m

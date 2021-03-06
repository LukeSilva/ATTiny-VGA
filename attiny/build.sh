#!/bin/sh
# Old program to convert a .h file exported from GIMP into assembly.
# This program has been lost :(
#cd ..
#gcc fontconvert.c
#./a.out > Video/characters.inc
#cd Video
avr-gcc  -mmcu=atmega324p --save-temps -mmcu=atmega324p -Wall -gdwarf-2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -MD -MP -MT main.o -MF main.o.d  -x assembler-with-cpp -Wa,-gdwarf2 -c main.S
avr-gcc -mmcu=atmega324p -Wl,-Map=videocard.map main.o    -o videocard.elf
avr-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature  videocard.elf videocard.hex
avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 --no-change-warnings -O ihex videocard.elf videocard.eep || exit 0
avr-objdump -D videocard.elf > videocard.lss
#rm *.o
#rm *.o.d
#rm videocard.eep
#mv main.s main2.s
#rm videocard.elf
#rm videocard.lss
#rm videocard.map

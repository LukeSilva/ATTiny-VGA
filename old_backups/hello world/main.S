#include <avr/io.h>
#define __SFR_OFFSET 0 
.global main
#define zero r19
#define vsynccount_low r24
#define vsynccount_high r25
#define one r18
#define tmp r16
#define tmp2 r21
#define tmp3 r22
#include "characters.inc"
main:
 ldi r16, hi8(RAMEND)
 out _SFR_IO_ADDR(SPH), r16
 ldi r16, lo8(RAMEND)
 out _SFR_IO_ADDR(SPL), r16
 cli ; Disable Interrupts
 ldi r16, 0x70 ; tmp register
 ldi r17, 0x00 ; vsync add
 ldi r18, 0x01 ; one
 ldi r19, 0x00 ;zero
 ldi YH, hi8(RAMSTART)
 ldi YL, lo8(RAMSTART)
 st Y+, r16
 ldi r16, 0x40
 st Y+, r16
 ldi r16, 0xB0
 st Y+, r16
 ldi r16, 0xB0
 st Y+, r16
 ldi r16, 0xE0
 st Y+, r16
 ldi r16, 0x61
 st Y+, r16
 ldi r16, 0xE0
 st Y+, r16
 ldi r16, 0x11
 st Y+, r16
 ldi r16, 0xB0
 st Y+, r16
 ldi r16, 0x30
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi r16, 0x00
 st Y+, r16
 ldi YH, hi8(RAMSTART)
 ldi YL, lo8(RAMSTART)
 ldi ZH, hi8 (charactermap)
 ldi ZL, lo8(charactermap)
 mov r1, ZL
 mov r2, ZH
 ldi r24, 0x00 ; vsync counter low
 ldi r25, 0x00 ; vsync counter high
 ldi r20, 0x00 ; vsync add tmp
 ldi r21, 0x00 ;tmp 2
 ldi r22, 0x00 ;tmp 3
setup:
 ldi r16, 0x06
 out DDRB, r16
 ldi r16, 0x07
 out DDRA, r16
 clr r16

loop: ; 0 
 out PORTB, r17 ; 528, 0
 ldi r16, 0x01 ; 1
 nop ;2
activecharacter:
 #include "showcharacters.inc"
active: ;
 cbi PORTA, 0x00 ;2
 dec r16 ;3
 cpi r16, 0x00 ;4
 cbi PORTA, 0x00 ;6
 brne active ;8
nop ; 402 clocks
endactive:
nop ; 403
adiw r24, 1 ;404
cpi r25, 0x2 ; 405 might be in sync zone
brne jmp_1 ; 406
cpi r24, 0x5a ; 407
brne other ;
ldi r20, 0x04 ;410
rjmp jmp_2
other: ;409
cpi r24, 0x5E ;410
brne other_2 ;411
clr r20 ;412
rjmp jmp_3
other_2: ;413
cpi r24, 0x74 ;414
brne jmp_4 ;415
clr r24 ;416
clr r25 ;417
 ;ran out of time, so implement inline
 ldi r16, 0x02 ;419 clocks
 add r16, r17 ;420
 out PORTB, r16 ;421 clocks
 nop ; 422 clocks (I prefer multiples of 2)
 ldi r16, 0xE ;424
 dec r16 ;1
 cpi r16, 0x00 ;2
 brne sync_loop ;4
jmp_1:
nop ; 408
nop ; 409
nop ; 410
nop ; 411
jmp_2:
nop ; 412
nop ; 413
jmp_3:
nop ; 414
nop ; 415
jmp_4:
nop ; 416
nop ; 417
ldi r16, 0x02 ;419 clocks
add r16, r17 ;420
out PORTB, r16 ;421 clocks
nop ; 422 clocks (I prefer multiples of 2)
ldi r16, 0xE ;424
sync_loop:
 dec r16 ;1
 cpi r16, 0x00 ;2
 brne sync_loop ;4
 nop ; 480
nop ;481
ldi r16, 0x00 ;483
add r16, r17 ;484
out PORTB, r16 ;485
nop ; 486
ldi r16, 0x09 ;488
nop ;489
nop ;490
nop ;491
nop ;492
nop ;493
nop ;494
nop ;495
nop ;496
nop ;497
nop ;498
nop ;499
nop ;500
nop ;501
nop ;502
nop ;503
nop ;504
;load Y pointer with start of vram
ldi YL, lo8(RAMSTART) ;505
ldi YH, hi8(RAMSTART) ;506
;load Z pointer with the offset from the vline
ldi ZL, lo8(charactermap) ;507
ldi ZH, hi8(charactermap) ;508
mov r16, vsynccount_low  ;509
nop ;510
andi r16, 0x1C ;511
clc ;512
lsr r16 ;513
add ZL, r16 ;514
adc ZH, zero ;515
mov r2, ZH ;516
mov r1, ZL ;517
;check if the screen should be blank
ldi r16, 0x32 ; 518
mov r17, r20 ;519
cpi r25, 0x02 ;520
breq check_noactive ;521
nop ;522
nop ;523
nop ;524
nop ;525
rjmp loop ;527
check_noactive: ;522
cpi r26, 0x59 ;523
brsh noactiveloop ;524
nop ;525
rjmp loop ;527

noactiveloop: ;526
 nop ;527
 out PORTB, r17 ; 528, 0
noactive:
 cbi PORTA, 0x00 ;2
 dec r16 ;3
 cpi r16, 0x00 ;4
 cbi PORTA, 0x00 ;6
 brne noactive ;8 
rjmp endactive; 402 clocks

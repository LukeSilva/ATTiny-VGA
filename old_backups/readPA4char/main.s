# 1 "main.S"
# 1 "/home/coolas/Video//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.S"
# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 1 3
# 99 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 3
# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/sfr_defs.h" 1 3
# 100 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3
# 350 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 3
# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/iotn84.h" 1 3
# 38 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/iotn84.h" 3
# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/iotnx4.h" 1 3
# 39 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/iotn84.h" 2 3
# 351 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3
# 432 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 3
# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/portpins.h" 1 3
# 433 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3

# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/common.h" 1 3
# 435 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3

# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/version.h" 1 3
# 437 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3


# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/fuse.h" 1 3
# 440 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3


# 1 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/lock.h" 1 3
# 443 "/usr/lib/gcc/avr/4.5.3/../../../avr/include/avr/io.h" 2 3
# 2 "main.S" 2

.global main







main:
 ldi r16, hi8(0x25F)
 out ((((0x3E) + 0)) - 0), r16
 ldi r16, lo8(0x25F)
 out ((((0x3D) + 0)) - 0), r16
 cli ; Disable Interrupts
 ldi r16, 0x10 ; r16 register
 ldi r17, 0x00 ; vsync add
 ldi r18, 0x01 ; r18
 ldi r19, 0x00 ;r19
 ldi r29, hi8((0x60))
 ldi r28, lo8((0x60))
 ldi r27, hi8((0x60))
 ldi r26, lo8((0x60))
ram_setup:
 st Y+, r16
 cpi r28, lo8(0x25F)
 brne ram_setup
 cpi r29, hi8(0x25F)
 brne ram_setup
 ldi r28, lo8((0x60))
 ldi r29, hi8((0x60))
 ldi r16, 0x70
 st Y+, r16
 ldi r16, 0x40
 st Y+, r16
 ldi r16, 0xB0
 st Y+, r16
 ldi r16, 0xB0
 st Y+, r16
 ldi r16, 0xE0
 st Y+, r16
 ldi r16, 0xA1
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
 ldi r16, 0xA1
 st Y+, r16
 ldi r16, 0xA1
 st Y+, r16
 ldi r16, 0xA1
 st Y+, r16
 ldi r16, 0xA1
 st Y+, r16
 ldi r16, 0xA1
 st Y+, r16
 ldi r29, hi8((0x60))
 ldi r28, lo8((0x60))
 ldi r31, hi8 (charactermap)
 ldi r30, lo8(charactermap)
 mov r1, r30
 mov r2, r31
 ldi r24, 0x00 ; vsync counter low
 ldi r25, 0x00 ; vsync counter high
 ldi r20, 0x00 ; vsync add r16
 ldi r21, 0x00 ;r16 2
 ldi r22, 0x00 ;r16 3
 ldi r23, 0x07 ;((0x1A) + 0)
setup:
 ldi r16, 0x06
 out ((0x17) + 0), r16
 ldi r16, 0x07
 out ((0x1A) + 0), r16
 clr r16

loop: ; 0
 out ((0x18) + 0), r17 ; 528, 0
 ldi r16, 0x01 ; 1
 nop ;2
activecharacter:
# 1 "showcharacters.inc" 1
;setup character 1
 ld r21, Y+ ;2
 mov r22, r21 ;3
 andi r22, 0x0F ;4
 andi r21, 0xF0 ;5
 nop ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 1
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix 2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
; 24 cycles
;setup character 2
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 3
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 3
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 4
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 4
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 5
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 5
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 6
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 6
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 7
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 7
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 8
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 8
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 9
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 9
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 10
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 10
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 11
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 11
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 12
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 12
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 13
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 13
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 14
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 14
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 15
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 15
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 16
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
;show character 16
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out ((0x1B) + 0), r0 ;8
;pix2
 lpm r0, z+ ;3
 out ((0x1B) + 0), r0 ;4
 swap r0 ;5
 mov r30, r1 ;6
 mov r31, r2 ;7
 out ((0x1B) + 0), r0 ;8
;24 cycles
;setup character 17
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out ((0x1B) + 0), r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add r30, r21 ;7
 adc r31, r22 ;8
# 90 "main.S" 2
active: ;
 cbi ((0x1B) + 0), 0x00 ;2
 dec r16 ;3
 cpi r16, 0x00 ;4
 cbi ((0x1B) + 0), 0x00 ;6
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
 out ((0x18) + 0), r16 ;421 clocks
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
out ((0x18) + 0), r16 ;421 clocks
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
out ((0x18) + 0), r16 ;485
nop ; 486
ldi r16, 0x09 ;488
mov r16, r24 ;489
andi r16, 0xE0 ;490
cpi r16, 0x00 ;491
breq vcount_low_0 ;492
nop ;493
nop ;494
nop ;495
nop ;496
nop ;497
loop_497:
mov r16, r24 ;498
andi r16, 0x1C ;499
brne skip_udate ;500
loop_500:
mov r3, r28 ;501
mov r4, r29 ;502
nop ;503
loop_503:
mov r28, r3 ;504
mov r29, r4 ;505
;load Y pointer with start of vram
nop ;506
nop ;507
;load Z pointer with the offset from the vline
ldi r30, lo8(charactermap) ;508
ldi r31, hi8(charactermap) ;509
mov r16, r24 ;510
andi r16, 0x1C ;511
clc ;512
lsr r16 ;513
add r30, r16 ;514
adc r31, r19 ;515
mov r2, r31 ;516
mov r1, r30 ;517
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
skip_udate: ;501
 rjmp loop_503 ;503
check_noactive: ;522
cpi r24, 0x59 ;523
brsh noactiveloop ;524
nop ;525
rjmp loop ;527
vcount_low_0: ;493
 mov r16, r25 ;494
 cpi r16, 0x00 ;495
 brne loop_497;496
 ;vsync is 0, set Y start of ram
 ldi r28, 0x60 ;497
 ldi r29, 0x00 ;498
 rjmp loop_500 ;500

noactiveloop: ;525
 nop ;526
 out ((0x1A) + 0), r19 ;527
 out ((0x18) + 0), r17 ; 528, 0
 ldi r16, 0xF8;1
 out ((0x1B) + 0), r16 ;2
 in r16, ((0x19) + 0) ;3
 ldi r21, 0xB0 ;4
 andi r16, 0x08 ;5
 brne _al1 ;6
 ldi r21,0x70 ;7
_al1:
 st X, r21 ;8
 nop ;10
 nop ;11
 nop ;12
 nop ;13
 nop ;14
 out ((0x1A) + 0),r23 ;15
 ldi r16, 0x30 ;16
noactive:
 cbi ((0x1B) + 0), 0x00 ;2
 dec r16 ;3
 cpi r16, 0x00 ;4
 cbi ((0x1B) + 0), 0x00 ;6
 brne noactive ;8
 nop ;8
rjmp endactive; 402 clocks

# 1 "characters.inc" 1
charactermap:
; character a
.byte 0x70,0x07
.byte 0x07,0x70
.byte 0x77,0x77
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character b
.byte 0x77,0x07
.byte 0x07,0x70
.byte 0x77,0x07
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character c
.byte 0x70,0x77
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x70,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character d
.byte 0x77,0x07
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character e
.byte 0x77,0x77
.byte 0x07,0x00
.byte 0x77,0x07
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x77,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character f
.byte 0x77,0x77
.byte 0x07,0x00
.byte 0x77,0x07
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character g
.byte 0x70,0x77
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x77
.byte 0x07,0x70
.byte 0x70,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character h
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x77
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character i
.byte 0x77,0x07
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x77,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character j
.byte 0x77,0x77
.byte 0x00,0x07
.byte 0x00,0x07
.byte 0x00,0x07
.byte 0x00,0x07
.byte 0x77,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character k
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x77,0x00
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character l
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x77,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character m
.byte 0x07,0x70
.byte 0x77,0x77
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character n
.byte 0x07,0x70
.byte 0x77,0x70
.byte 0x07,0x77
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character o
.byte 0x70,0x07
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x70,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character p
.byte 0x77,0x07
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x07
.byte 0x07,0x00
.byte 0x07,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character q
.byte 0x70,0x77
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x77
.byte 0x70,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character r
.byte 0x77,0x07
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x07
.byte 0x07,0x07
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character s
.byte 0x70,0x77
.byte 0x07,0x00
.byte 0x70,0x07
.byte 0x00,0x70
.byte 0x00,0x70
.byte 0x77,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character t
.byte 0x77,0x07
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character u
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x70,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character v
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character w
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x07,0x70
.byte 0x77,0x77
.byte 0x07,0x70
.byte 0x00,0x00
.byte 0x00,0x00
;character x
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x70,0x00
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x00,0x00
.byte 0x00,0x00
;character y
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x07,0x07
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x70,0x00
.byte 0x00,0x00
.byte 0x00,0x00
;character z
.byte 0x77,0x77
.byte 0x00,0x70
.byte 0x00,0x07
.byte 0x70,0x00
.byte 0x07,0x00
.byte 0x77,0x77
.byte 0x00,0x00
.byte 0x00,0x00
;character (space)
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.byte 0x00,0x00
.balign 2
# 244 "main.S" 2

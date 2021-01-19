#define CHAR_EXTEND 0x08
;setup character 1
 ld r21, Y+ ;2
 mov r22, r21 ;3
 andi r22, 0x0F ;4
 andi r21, 0xF0 ;5
 add ZL, r21 ;6
 adc ZH, r22 ;7
 swap r21 ;8
;show character 1
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 2
 cpi r22, CHAR_EXTEND ;1
 mov r22, r21 ;2
 brsh _c2 ;3
 out PORTA, r19 ;4
_c2:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 3
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c3
 out PORTA, r19 ;4
_c3:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 3
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 4
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c4
 out PORTA, r19 ;4
_c4:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 4
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 5
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c5
 out PORTA, r19 ;4
_c5:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 5
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 6
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c6
 out PORTA, r19 ;4
_c6:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 6
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 7
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c7
 out PORTA, r19 ;4
_c7:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 7
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 8
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c8
 out PORTA, r19 ;4
_c8:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 8
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 9
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c9
 out PORTA, r19 ;4
_c9:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 9
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 10
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c10
 out PORTA, r19 ;4
_c10:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 10
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 11
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _a11
 out PORTA, r19 ;4
_a11:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 11
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 12
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c12
 out PORTA, r19 ;4
_c12:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 12
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 13
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c13
 out PORTA, r19 ;4
_c13:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 13
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 14
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c14
 out PORTA, r19 ;4
_c14:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 14
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 15
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c15
 out PORTA, r19 ;4
_c15:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 15
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 16
 cpi r22, CHAR_EXTEND ;2
 mov r22, r21 ;3
 brsh _c16
 out PORTA, r19 ;4
_c16:
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 16
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 ld r21, Y+ ;7
 out PORTA, r0 ;8
;pix 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
; 24 cycles
;setup character 17
 cpi r22, CHAR_EXTEND ;1
 mov r22, r21 ;2
 nop;3
 out PORTA, r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8

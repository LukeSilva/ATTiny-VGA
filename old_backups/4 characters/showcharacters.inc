;setup character 1
 ld r21, Y+ ;2
 mov r22, r21 ;3
 andi r22, 0x0F ;4
 andi r21, 0xF0 ;5
 nop ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 1
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
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
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out PORTA, r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out PORTA, r0 ;8
;pix2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
;24 cycles
;setup character 3
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out PORTA, r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 3
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out PORTA, r0 ;8
;pix2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
;24 cycles
;setup character 4
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out PORTA, r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;show character 4
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 nop ;6
 nop ;7
 out PORTA, r0 ;8
;pix2
 lpm r0, z+ ;3
 out PORTA, r0 ;4
 swap r0 ;5
 mov ZL, r1 ;6
 mov ZH, r2 ;7
 out PORTA, r0 ;8
;24 cycles
;setup character 5
 ld r21, Y+ ;2
 mov r22, r21 ;3
 out PORTA, r19 ;4
 andi r22, 0x0F ;5
 andi r21, 0xF0 ;6
 add ZL, r21 ;7
 adc ZH, r22 ;8
;8

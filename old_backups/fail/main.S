#include <avr/io.h>
#define __SFR_OFFSET 0 
.global main
main:
 ldi r16, hi8(RAMEND)
 out _SFR_IO_ADDR(SPH), r16
 ldi r16, lo8(RAMEND)
 out _SFR_IO_ADDR(SPL), r16
 cli ; Disable Interrupts
 ldi r16, 0x04 ; lines until next pixel.
 ldi r17, 0x00 ; lines of characters
 ldi r18, 0x06 ; tmp
 out DDRB, r18 ; 0110 PB1 as hsync PB2 as vsync
 ldi r18, 0x00 ;tmp
 ldi r19, 0x00 ;line of rows, 150 * 4 = 600
active_loop:
	#include "drawline.S"
	; 400 cycles, end of active period

 	; front porch - 20 clocks
		nop ; 401
		nop ; 402
		nop ; 403
		nop ; 404
		nop ; 405
		nop ; 406
		nop ; 407
		nop ; 408
		nop ; 409
		nop ; 410
		nop ; 411
		nop ; 412
		nop ; 413
		nop ; 414
		nop ; 415
		nop ; 416
		nop ; 417
		nop ; 418
		nop ; 419
		ldi r18, 0x02 ; 420
	; sync pulse - 64 clocks
		out PORTB, r18 ; 1
		nop ;2
		nop ;3
		nop ;4
		nop ;5
		nop ;6
		nop ;7
		nop ;8
		nop ;9
		nop ;10
		nop ;11
		nop ;12
		nop ;13
		nop ;14
		nop ;15
		nop ;16
		nop ;17
		nop ;18
		nop ;19
		nop ;20
		nop ;21
		nop ;22
		nop ;23
		nop ;24
		nop ;25
		nop ;26
		nop ;27
		nop ;28
		nop ;29
		nop ;30
		nop ;31
		nop ;32
		nop ;33
		nop ;34
		nop ;35
		nop ;36
		nop ;37
		nop ;38
		nop ;39
		nop ;40
		nop ;41
		nop ;42
		nop ;43
		nop ;44
		nop ;45
		nop ;46
		nop ;47
		nop ;48
		nop ;49
		nop ;50
		nop ;51
		nop ;52
		nop ;53
		nop ;54
		nop ;55
		nop ;56
		nop ;57
		nop ;58
		nop ;59
		nop ;60
		nop ;61
		nop ;62
		nop ;63
		ldi r18, 0x00;64
	;44 clocks back porch
		out PORTB, r18; 1
		nop ;2
		nop ;3
		nop ;4
		nop ;5
		nop ;6
		nop ;7
		nop ;8
		nop ;9
		nop ;10
		nop ;11
		nop ;12
		nop ;13
		nop ;14
		nop ;15
		nop ;16
		nop ;17
		nop ;18
		nop ;19
		nop ;20
		nop ;31
		nop ;32
		dec r16 ;33
		cpi r16, 0x00 ; 34
		breq nxtline
		nop ;36
		nop ;37
		nop ;38
		nop ;39
		nop ;40
		nop ;41
		nop ;42
		rjmp active_loop ;44
		nxtline: ;36
		inc r19 ; increment rows ;37
		cpi r19, 0x96 ;38
		breq vsync_jmp ;39
		ldi r16, 0x04 ;40
		nop ;41
		nop ;42
		rjmp active_loop ;44
		vsync_jmp: ;40
		nop ;41
		nop ;42
		ldi r18,0x00 ;43
		;now vsync

	vsync_loop:
		out PORTB, r18 ;44
		;active region
		#include "clearline.S" 
			;400
		;20 clocks front porch		
		nop ;1
		nop ;2
		nop ;3
		nop ;4
		nop ;5
		nop ;6
		nop ;7
		nop ;8
		nop ;9
		nop ;10
		nop ;11
		nop ;12
		nop ;13
		nop ;14
		nop ;15
		nop ;16
		nop ;17
		nop ;18
		nop ;19
		add r18, 0x02 ;20
		;64 clocks sync pulse
		out PORTB, r18 ;1 
		nop ;2
		nop ;3
		nop ;4
		nop ;5
		nop ;6
		nop ;7
		nop ;8
		nop ;9
		nop ;10
		nop ;11
		nop ;12
		nop ;13
		nop ;14
		nop ;15
		nop ;16
		nop ;17
		nop ;18
		nop ;19
		nop ;20
		nop ;21
		nop ;22
		nop ;23
		nop ;24
		nop ;25
		nop ;26
		nop ;27
		nop ;28
		nop ;29
		nop ;30
		nop ;31
		nop ;32
		nop ;33
		nop ;34
		nop ;35
		nop ;36
		nop ;37
		nop ;38
		nop ;39
		nop ;40
		nop ;41
		nop ;42
		nop ;43
		nop ;44
		nop ;45
		nop ;46
		nop ;47
		nop ;48
		nop ;49
		nop ;50
		nop ;51
		nop ;52
		nop ;53
		nop ;54
		nop ;55
		nop ;56
		nop ;57
		nop ;58
		nop ;59
		nop ;60
		nop ;61
		nop ;62
		nop ;63
		sub r18, 0x02 ;64
		;44 clocks back porch
		out PORTB, r18
		inc r19 ;2
		cpi r19, 151 ;3
		breq vsync_up ;4
		cpi r19, 155 ;5
		breq vsync_down ;6
		cpi r19, 178 ;7
		breq vsync_reset ;8
		nop ;9
		nop ;10
	vsync_10:
		nop ;11
	vsync_11:
		nop ;12
		nop ;13
		nop ;14
		nop ;15
		nop ;16
		nop ;17
		nop ;18
		nop ;19
		nop ;20
		nop ;21
		nop ;22
		nop ;23
		nop ;24
		nop ;25
		nop ;26
		nop ;27
		nop ;28
		nop ;29
		nop ;30
		nop ;31
		nop ;32
		nop ;33
		nop ;34
		nop ;35
		nop ;36
		nop ;37
		nop ;38
		nop ;39
		nop ;40
		nop ;41
		rjmp vsync_loop ;43
vsync_up: ;5
 add r18,0x04 ;6
 nop ;7
 nop ;8
 rjmp vsync_10
vsync_down: ;7
 sub r18, 0x04 ;8
 rjmp vsync_10
vsync_reset: ;9
	nop ;10
	nop ;11
	nop ;12
	nop ;13
	nop ;14
	nop ;15
	nop ;16
	nop ;17
	nop ;18
	nop ;19
	nop ;20
	nop ;21
	nop ;22
	nop ;23
	nop ;24
	nop ;25
	nop ;26
	nop ;27
	nop ;28
	nop ;29
	nop ;30
	nop ;31
	nop ;32
	nop ;33
	nop ;34
	nop ;35
	nop ;36
	nop ;37
	nop ;38
	nop ;39
	nop ;40
	ldi r16, 0x04 ;41
	ldi r19, 0x00 ;42
	rjmp active_loop

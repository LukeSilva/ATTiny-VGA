; r6 = communications byte, copied into r22
; r5 = communications count


ldi r16, 0xF0;0
out PORTA, r16;1
ldi r16, 0x10 ;2
out DDRA, r16;3
in r16, PINA;4
andi r16, 0x40;5
brne reset_5;6
in r16,PINA;7
andi r16, 0x80;8
brne got_data;9
nop;10
nop;11
nop;12
no_data_12:
nop;13
ldi r16 ,0x9;14
rjmp com_end;16

got_data:;10
in r16, PINA;11 
andi r16, 0x20;12
add r22, r16;13
add r22, r22;14
adc r22, r19;15
inc r5;16
mov r16, r5;17
cpi r16, 0x08 ;18
breq print;19
mov r6, r22;20
nop;21
nop;22
nop;23
nop;24
nop;25
ldi r16, 0xE0 ;pulse off t flip flop ;26
out PORTA, r16;27
ldi r16, 0xF0;28
out PORTA, r16;29
ldi r16, 0x05;30
rjmp com_end;32

print:;20
ldi r16 ,0x00;21
mov r5, r16;22
swap r22;23
cpi r22, 0xFF ;24 if 255
clr r6;25
cpi r22, 0xFA;26 if > 250
brsh _other;27
swap r22;28
st X+, r22;30
_p30:
nop;31
nop;32
_p32:
nop;33
nop;34
_p34:
nop;35
nop;36
_p36:
nop;37
_p37:
nop;38
_p38:
nop;39
_p39:
nop;40
_p40:
nop;41
_p41:
nop;42
_p42:
nop;43
_p43:
nop;44
ldi r16, 0xE8 ;pulse off t flip flop ;45
out PORTA, r16;46
ldi r16, 0xF8;47
out PORTA, r16;48
clr r22;49
ldi r16, 0x00;50
rjmp sync_end ;52
reset_5: ;7
nop ;8
nop ;9
clr r5 ;10
rjmp no_data_12 ;12
_other:;28
cpi r22, 0xFC;29
breq copy_from_below;30
cpi r22, 0xFA ;31
breq right;32
cpi r22, 0xFE ;33
breq back ;34
cpi r22, 0xFB ;35
breq nxt_line;36
cpi r22, 0xFD ;37
breq up_line ;38
ldi XL, lo8(RAMSTART);39
ldi XH, hi8(RAMSTART);40
rjmp _p42
right:;33
ld r22, X+;;35
nop;36
rjmp _p38;38
back:;35
ld r22, -X;37
rjmp _p39;39
copy_from_below:;31
adiw XL, 0x10;33
ld r22, X;35
subi XL, 0x10;36
sbci XH, 0x00;37
st X+, r22;39
rjmp _p41;41
nxt_line:;37
adiw XL, 0x10;39
andi XL, 0xF0;40
rjmp _p42; ;42
up_line:;39
subi XL, 0x10;40
sbci XH, 0x00;41
rjmp _p43;43

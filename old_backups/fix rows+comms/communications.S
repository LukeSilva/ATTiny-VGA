ldi r16, 0xF8;0
out PORTA, r16;1
ldi r16, 0x10 ;2
out DDRA, r16;3
in r16, PINA;4
andi r16, 0x08;5
brne got_data;6
nop;7
nop;8
nop;9
nop;10
nop;11
nop;12
nop;13
ldi r16 ,0x30;14
rjmp com_end;16

got_data:;7
in r16, PINA;8
ser r21;9
andi r16, 0x20;10
brne _d1;11
clr r21;12
_d1: ;12
and r21, r16;13
or r22,r21;14 contains communication
add r5, r5;15
brcs print;16
nop;17
nop;18
nop;19
nop;20
nop;21
nop;22
nop;23
nop;24
nop;25
ldi r16, 0xE8 ;pulse off t flip flop ;26
out PORTA, r16;27
ldi r16, 0xF8;28
out PORTA, r16;29
ldi r16, 0x2E;30
rjmp com_end;32
print:;17
ldi r16 ,0x01;18
mov r5, r16;19
cpi r22, 0xFF ;20 set X to 0
breq reset;21
st X+, r22;22
nop;23
nop;24
nop;25
nop;26
_p26:
nop;27
nop;28
nop;29
ldi r16, 0x2E;30
rjmp com_end ;32

reset:;22
ldi XL, lo8(RAMSTART);23
ldi XH, hi8(RAMSTART);24
rjmp _p26;26
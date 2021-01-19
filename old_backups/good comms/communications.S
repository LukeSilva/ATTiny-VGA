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
andi r16, 0x20;10
add r22, r16;11
add r22, r22;12
adc r22, r19;13
inc r5;14
mov r16, r5;15
cpi r16, 0x08 ;16
breq print;17
mov r6, r22;18
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
print:;18
ldi r16 ,0x00;19
mov r5, r16;20
cpi r22, 0xFF ;21 set X to 0
breq reset;22
st X+, r22;23
nop;24
nop;25
nop;26
nop;27
_p27:
nop;28
nop;29
nop;30
nop;31
clr r6;32
ldi r16, 0xE8 ;pulse off t flip flop ;33
out PORTA, r16;34
ldi r16, 0xF8;35
out PORTA, r16;36
clr r22;37
ldi r16, 0x2D;38
rjmp com_end ;40

reset:;23
ldi XL, lo8(RAMSTART);24
ldi XH, hi8(RAMSTART);25
rjmp _p27;27
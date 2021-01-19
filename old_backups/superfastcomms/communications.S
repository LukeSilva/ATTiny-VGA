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
cpi r22, 0xFF ;23 set X to 0
breq reset;24
st X+, r22;25
nop;27
nop;28
nop;29
_p29:
nop;30
nop;31
clr r6;32
ldi r16, 0xE8 ;pulse off t flip flop ;33
out PORTA, r16;34
ldi r16, 0xF8;35
out PORTA, r16;36
clr r22;37
ldi r16, 0x03;38
rjmp com_end ;40

reset:;25
ldi XL, lo8(RAMSTART);26
ldi XH, hi8(RAMSTART);27
rjmp _p29;29
reset_5: ;7
nop ;8
nop ;9
clr r5 ;10
rjmp no_data_12 ;12

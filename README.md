# ATTiny VGA Card

Implementing a tiled graphics card using an ATTiny 84. The project is capable of displaying a 16x18 character display, and receiving rendering commands from an Arduino through a serial interface. To get a good sync with the monitor, we need precise timings, and thus the firmware on the ATTiny is written in cycle-counted assembly code.

I used to have a program to create font files, as well as an Arduino program to run a game of Tetris using the video card, but since I didn't back them up properly, they have been lost. (Project was originally built in 2013)

## Timings

We target the VGA resolution of 800x600, which requires a clock speed of 40Mhz. Since the maximum clock speed of the ATTiny is 20Mhz, we divide all the timings by two.

At 20 Mhz

HSYNC:
400 clocks active
20 clocks front porch ; 420
64 clocks sync pulse  ; 484
44 clocks back porch  ; 528

VSYNC:
600 lines active
1 line  front porch
4 lines sync pulse
23 lines back porch


## Rendering Loop

Since we're targeting a tiled graphics display there are two main functions that need to be performed to display a tile:

1. Look up the index of the character to be displayed from the tile map
2. Load the pixel data of that character from the font, and send it to the monitor

Since we'll need to be doing index resolution during the rendering loop, there will be a portion of time where we cannot send any new pixel data. For text characters this is not a large problem - there needs to be a blank space between characters, otherwise each character would run into the next. However, if we'd like to render full / half blocks, it would be desirable to have the right-most pixels to extend over into the start of the next tile. Thus, we section the font into text tile and graphics tile sections, choosing to extend or blank the right most pixels of the character.

Annotated assembly for the display of a single character.
```
;setup character (8 clocks total)
 cpi r22, CHAR_EXTEND ;1 - Compare previous tile with the font's extend threshold
 mov r22, r21     ;2 - Copy new tile into r22
 brsh _c2         ;3 - if we should extend, jump to _c2
                  ; jump = 2 clocks (has a pipeline bubble)
                  ; no jump = 1 clock (no pipeline bubble)
 out PORTA, r19   ;4 - blank the output (1 clock)
_c2:
 andi r22, 0x0F   ;5 - get lower nibble of tile index
 andi r21, 0xF0   ;6 - get upper nibble of tile index
 add ZL, r21      ;7 - calculate lower byte of fontmap address
 adc ZH, r22      ;8 - calculate upper byte of fontmap address

;show 1st two pixels (8 clocks total)
 lpm r0, z+       ;3 - load a byte from the fontmap (4bits per pixel)
 out PORTA, r0    ;4 - output the first pixel
 swap r0          ;5 - rotate the nibbles in r0
 ld r21, Y+       ;7 - read the next tile from the tile map 
                  ; (interleaved with rendering tiles due to timing contraints)
 out PORTA, r0    ;8 - output the second pixel

;show 2nd two pixels (8 clocks tootal)
 lpm r0, z+       ;3 - load a byte from the fontmap (4bits per pixel)
 out PORTA, r0    ;4 - output the third pixel
 swap r0          ;5 - rotate the nibbles in r0
 mov ZL, r1       ;6 - reset the fontmap address for the next tile
 mov ZH, r2       ;7 - ^^ (interleaved due to timing)
 out PORTA, r0    ;8 - output the fourth pixel

; 24 cycles total per character
; 24 cycles x 16 characters = 384 clocks
; this is under the budget of 400 clocks per horizontal scan, leaving us with 16 clocks for setup / waste time
```
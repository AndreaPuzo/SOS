45 70 FA DE ; magic number
00 00 00 01 ; version number
03 02 01 00 ; endian (big)
00 00 00 06 ; number of sections

; align 1
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 05
00
00 01 02 03 05

; align 2
00 00 00 00 00 00 00 10
00 00 00 00 00 00 00 08
01
00 00 00 01 00 02 00 03
00 04 00 05 00 06 00 07

; align 4
00 00 00 00 00 00 00 20
00 00 00 00 00 00 00 04
02
00 00 00 00 00 00 00 01
00 00 00 02 00 00 00 03

; align 8
00 00 00 00 00 00 00 30
00 00 00 00 00 00 00 02
03
00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 01

; align struct-1 array
00 00 00 00 00 00 00 40
00 00 00 00 00 00 00 01
10
01
10
00 00 00 00 00 00 00 0E
'HELLO WORLD!' 0A 00

; .code
00 00 00 00 00 00 10 00
00 00 00 00 00 00 00 09
02
2B 00 00 00 ;   xor long r0, r0
2B 11 00 00 ;   xor long r1, r1
            ; .loop
8C 21 00 40 ;   lod byte r2, [r1 + 40]
48 20 00 00 ;   cmp byte r2, 0
6B 04 00 03 ;   jz .eloop
D0 00 00 01 ;   out byte 1, r2
03 10 00 01 ;   add long r1, r0, 1
65 0F FF FA ;   jmp .loop
            ; .eloop
0F 00 00 00 ;   hlt

; 1010
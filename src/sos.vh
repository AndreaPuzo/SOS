  %seg .code

to_hex:
  cmp byte r2, `0`
  jl .L00
  cmp byte r2, `9`
  jg .L00
  mov word r0, r2
  sub word r0, `0`
  ret
.L00
  cmp byte r2, `A`
  jl .L01
  cmp byte r2, `F`
  jg .L01
  mov word r0, r2
  sub word r0, `A`
  add word r0, 10
  ret
.L01
  cmp byte r2, `a`
  jl .L02
  cmp byte r2, `b`
  jg .L02
  mov word r0, r2
  sub word r0, `B`
  add word r0, 10
  ret
.L02
  mov word r0, sext -1
  ret

; r2: port (stdout: 1, stderr: 2, voolog: 4, voodsk: 5)
; r3: character
pputc:
  psh long r0
  xhg long r0, r2
  mov long r2, r3
  out byte r0, r2
  xhg long r2, r0
  pop long r0
  ret

; r2: port (stdout: 1, stderr: 2, voolog: 4, voodsk: 5)
; r3: address (ds relative) of the string to print
; r4: # of bytes pushed onto the stack
; r0: # of printed characters
pprintf:
  psh long r5
  psh long r6
  psh long r7
  xor long r5, r5 ; counter
  xor long r6, r6 ; character

.L0
  lod byte r6, [ds:r3]
  cmp byte r6, 0
  jz .L1
  cmp byte r6, `%`
  jnz .L2
  add long r3, 1
  lod byte r6, [ds:r3]
  cmp byte r6, `%`
  jz .L14
  cmp byte r6, `u` ; 8/16/32-bit
  jz .L3
  cmp byte r6, `U` ; 64-bit
  jz .L4
  cmp byte r6, `i` ; 8/16/32-bit
  jz .L5
  cmp byte r6, `I` ; 64-bit
  jz .L6
  cmp byte r6, `s` ; address of 8-bit array, 0
  jz .L7
  cmp byte r6, `c` ; 32-bit character
  jz .L8
  cmp byte r6, `n` ; address of 64-bit variable
  jz .L9
  cmp byte r6, `x` ; 64-bit lower-case hexadecimal
  jz .L10
  cmp byte r6, `X` ; 64-bit upper-case hexadecimal
  jz .L11
  cmp byte r6, `b` ; 64-bit binary
  jz .L12
  cmp byte r6, `o` ; 64-bit octal
  jz .L13
  jmp .L2

.L3
  ; TODO
  jmp .L0

.L4
  ; TODO
  jmp .L0

.L5
  ; TODO
  jmp .L0

.L6
  ; TODO
  jmp .L0

.L7
  ; TODO
  jmp .L0

.L8
  ; TODO
  jmp .L0

.L9
  ; TODO
  jmp .L0

.L10
  ; TODO
  jmp .L0

.L11
  ; TODO
  jmp .L0

.L12
  ; TODO
  jmp .L0

.L13
  ; TODO
  jmp .L0

.L2
  cmp byte r6, `\`
  jnz .L4

  add long r3, 1
  lod byte r6, [ds:r3]

  cmp byte r6, `0`
  jnz .L15
  mov byte r6, 0
  jmp .L14
.L15
  cmp byte r6, `a`
  jnz .L16
  mov byte r6, 7
  jmp .L14
.L16
  cmp byte r6, `b`
  jnz .L17
  mov byte r6, 8
  jmp .L14
.L17
  cmp byte r6, `t`
  jnz .L18
  mov byte r6, 9
  jmp .L14
.L18
  cmp byte r6, `n`
  jnz .L19
  mov byte r6, 10
  jmp .L14
.L19
  cmp byte r6, `v`
  jnz .L20
  mov byte r6, 11
  jmp .L14
.L20
  cmp byte r6, `f`
  jnz .L21
  mov byte r6, 12
  jmp .L14
.L21
  cmp byte r6, `r`
  jnz .L22
  mov byte r6, 13
  jmp .L14
.L22
  cmp byte r6, `e`
  jnz .L23
  mov byte r6, 27
  jmp .L14
.L23
  cmp byte r6, `"`
  jnz .L24
  mov byte r6, 34
  jmp .L14
.L24
  cmp byte r6, `'`
  jnz .L25
  mov byte r6, 39
  jmp .L14
.L25
  cmp byte r6, 96
  jnz .L26
  mov byte r6, 96
  jmp .L14
.L26
  cmp byte r6, `d`
  jnz .L27
  mov byte r6, 127
  jmp .L14
.L27
  cmp byte r6, `x`
  jnz .L27
  add long r3, 1
  lod byte r6, [ds:r3]
  xhg long r2, r6
  call to_hex
  xhg long r2, r6
  cmp word r0, sext -1
  jz .L14
  mov word r7, r0
  add long r3, 1
  lod byte r6, [ds:r3]
  xhg long r2, r6
  call to_hex
  xhg long r2, r6
  cmp word r0, sext -1
  jz .L28
  shl word r7, 4
  add word r7, r0
  mov word r6, r7
  jmp .L14
.L28
  mov word r6, r7

.L14
  xhg long r3, r6
  call fputc
  xhg long r3, r6
  jmp .L0

.L1
  mov long r0, r5
  pop long r7
  pop long r6
  pop long r5
  ret
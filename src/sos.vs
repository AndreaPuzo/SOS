  %inc 'sos.vh'
  %zer r10

  %seg .code

kstart:
  hlt

  %seg .data
  %org 0

%def def_irq 1
  irq_%0: word .data
          long isr_%0
%end

def_irq   0
def_irq   1
def_irq   2
def_irq   3
def_irq   4
def_irq   5
def_irq   6
def_irq   7
def_irq   8
def_irq   9
def_irq  10
def_irq  11
def_irq  12
def_irq  13
def_irq  14
def_irq  15
def_irq  16
def_irq  17
def_irq  18
def_irq  19
def_irq  20
def_irq  21
def_irq  22
def_irq  23
def_irq  24
def_irq  25
def_irq  26
def_irq  27
def_irq  28
def_irq  29
def_irq  30
def_irq  31
def_irq  32
def_irq  33
def_irq  34
def_irq  35
def_irq  36
def_irq  37
def_irq  38
def_irq  39
def_irq  40
def_irq  41
def_irq  42
def_irq  43
def_irq  44
def_irq  45
def_irq  46
def_irq  47
def_irq  48
def_irq  49
def_irq  50
def_irq  51
def_irq  52
def_irq  53
def_irq  54
def_irq  55
def_irq  56
def_irq  57
def_irq  58
def_irq  59
def_irq  60
def_irq  61
def_irq  62
def_irq  63
def_irq  64
def_irq  65
def_irq  66
def_irq  67
def_irq  68
def_irq  69
def_irq  70
def_irq  71
def_irq  72
def_irq  73
def_irq  74
def_irq  75
def_irq  76
def_irq  77
def_irq  78
def_irq  79
def_irq  80
def_irq  81
def_irq  82
def_irq  83
def_irq  84
def_irq  85
def_irq  86
def_irq  87
def_irq  88
def_irq  89
def_irq  90
def_irq  91
def_irq  92
def_irq  93
def_irq  94
def_irq  95
def_irq  96
def_irq  97
def_irq  98
def_irq  99
def_irq 100
def_irq 101
def_irq 102
def_irq 103
def_irq 104
def_irq 105
def_irq 106
def_irq 107
def_irq 108
def_irq 109
def_irq 110
def_irq 111
def_irq 112
def_irq 113
def_irq 114
def_irq 115
def_irq 116
def_irq 117
def_irq 118
def_irq 119
def_irq 120
def_irq 121
def_irq 122
def_irq 123
def_irq 124
def_irq 125
def_irq 126
def_irq 127
def_irq 128
def_irq 129
def_irq 130
def_irq 131
def_irq 132
def_irq 133
def_irq 134
def_irq 135
def_irq 136
def_irq 137
def_irq 138
def_irq 139
def_irq 140
def_irq 141
def_irq 142
def_irq 143
def_irq 144
def_irq 145
def_irq 146
def_irq 147
def_irq 148
def_irq 149
def_irq 150
def_irq 151
def_irq 152
def_irq 153
def_irq 154
def_irq 155
def_irq 156
def_irq 157
def_irq 158
def_irq 159
def_irq 160
def_irq 161
def_irq 162
def_irq 163
def_irq 164
def_irq 165
def_irq 166
def_irq 167
def_irq 168
def_irq 169
def_irq 170
def_irq 171
def_irq 172
def_irq 173
def_irq 174
def_irq 175
def_irq 176
def_irq 177
def_irq 178
def_irq 179
def_irq 180
def_irq 181
def_irq 182
def_irq 183
def_irq 184
def_irq 185
def_irq 186
def_irq 187
def_irq 188
def_irq 189
def_irq 190
def_irq 191
def_irq 192
def_irq 193
def_irq 194
def_irq 195
def_irq 196
def_irq 197
def_irq 198
def_irq 199
def_irq 200
def_irq 201
def_irq 202
def_irq 203
def_irq 204
def_irq 205
def_irq 206
def_irq 207
def_irq 208
def_irq 209
def_irq 210
def_irq 211
def_irq 212
def_irq 213
def_irq 214
def_irq 215
def_irq 216
def_irq 217
def_irq 218
def_irq 219
def_irq 220
def_irq 221
def_irq 222
def_irq 223
def_irq 224
def_irq 225
def_irq 226
def_irq 227
def_irq 228
def_irq 229
def_irq 230
def_irq 231
def_irq 232
def_irq 233
def_irq 234
def_irq 235
def_irq 236
def_irq 237
def_irq 238
def_irq 239
def_irq 240
def_irq 241
def_irq 242
def_irq 243
def_irq 244
def_irq 245
def_irq 246
def_irq 247
def_irq 248
def_irq 249
def_irq 250
def_irq 251
def_irq 252
def_irq 253
def_irq 254
def_irq 255

kxdata: byte 0 %dup 0x100
        byte 0 %dup 0x300
kxsize: equ $ - kxdata

kentry:
  mov cs, r0
  mov ds, r1
  jmp cs:kstart

%def irq 2
isr_%0:
  mov word r2, 1
  lea      r3, [ds:irq_%0_msg]
  xor long r4, r4
  call pprintf
  iret
irq_%0_msg: byte %1, 0
%end

irq  0, 'Division by zero\n'
irq  1, 'Single step\n'
irq  2, 'Non maskable\n'
irq  3, 'Breakpoint\n'
irq  4, 'General protection\n'
irq  5, 'Out of memory\n'
irq  6, 'Segment is not present\n'
irq  7, 'Segment cannot be accessed\n'
irq  8, 'Segmentation fault\n'
irq  9, 'Stack overflow\n'
irq 10, 'Stack underflow\n'
irq 11, 'Undefined interrupt\n'
irq 12, 'Undefined instruction\n'
irq 13, 'Reserved 0\n'
irq 14, 'Reserved 1\n'
irq 15, 'Reserved 2\n'

isr_16:
  sti
  int 11
  cli
  iret

isr_17:
isr_18:
isr_19:
isr_20:
isr_21:
isr_22:
isr_23:
isr_24:
isr_25:
isr_26:
isr_27:
isr_28:
isr_29:
isr_30:
isr_31:
isr_32:
isr_33:
isr_34:
isr_35:
isr_36:
isr_37:
isr_38:
isr_39:
isr_40:
isr_41:
isr_42:
isr_43:
isr_44:
isr_45:
isr_46:
isr_47:
isr_48:
isr_49:
isr_50:
isr_51:
isr_52:
isr_53:
isr_54:
isr_55:
isr_56:
isr_57:
isr_58:
isr_59:
isr_60:
isr_61:
isr_62:
isr_63:
isr_64:
isr_65:
isr_66:
isr_67:
isr_68:
isr_69:
isr_70:
isr_71:
isr_72:
isr_73:
isr_74:
isr_75:
isr_76:
isr_77:
isr_78:
isr_79:
isr_80:
isr_81:
isr_82:
isr_83:
isr_84:
isr_85:
isr_86:
isr_87:
isr_88:
isr_89:
isr_90:
isr_91:
isr_92:
isr_93:
isr_94:
isr_95:
isr_96:
isr_97:
isr_98:
isr_99:
isr_100:
isr_101:
isr_102:
isr_103:
isr_104:
isr_105:
isr_106:
isr_107:
isr_108:
isr_109:
isr_110:
isr_111:
isr_112:
isr_113:
isr_114:
isr_115:
isr_116:
isr_117:
isr_118:
isr_119:
isr_120:
isr_121:
isr_122:
isr_123:
isr_124:
isr_125:
isr_126:
isr_127:
isr_128:
isr_129:
isr_130:
isr_131:
isr_132:
isr_133:
isr_134:
isr_135:
isr_136:
isr_137:
isr_138:
isr_139:
isr_140:
isr_141:
isr_142:
isr_143:
isr_144:
isr_145:
isr_146:
isr_147:
isr_148:
isr_149:
isr_150:
isr_151:
isr_152:
isr_153:
isr_154:
isr_155:
isr_156:
isr_157:
isr_158:
isr_159:
isr_160:
isr_161:
isr_162:
isr_163:
isr_164:
isr_165:
isr_166:
isr_167:
isr_168:
isr_169:
isr_170:
isr_171:
isr_172:
isr_173:
isr_174:
isr_175:
isr_176:
isr_177:
isr_178:
isr_179:
isr_180:
isr_181:
isr_182:
isr_183:
isr_184:
isr_185:
isr_186:
isr_187:
isr_188:
isr_189:
isr_190:
isr_191:
isr_192:
isr_193:
isr_194:
isr_195:
isr_196:
isr_197:
isr_198:
isr_199:
isr_200:
isr_201:
isr_202:
isr_203:
isr_204:
isr_205:
isr_206:
isr_207:
isr_208:
isr_209:
isr_210:
isr_211:
isr_212:
isr_213:
isr_214:
isr_215:
isr_216:
isr_217:
isr_218:
isr_219:
isr_220:
isr_221:
isr_222:
isr_223:
isr_224:
isr_225:
isr_226:
isr_227:
isr_228:
isr_229:
isr_230:
isr_231:
isr_232:
isr_233:
isr_234:
isr_235:
isr_236:
isr_237:
isr_238:
isr_239:
isr_240:
isr_241:
isr_242:
isr_243:
isr_244:
isr_245:
isr_246:
isr_247:
isr_248:
isr_249:
isr_250:
isr_251:
isr_252:
isr_253:
isr_254:
isr_255:
  sti
  int 11
  cli
  iret
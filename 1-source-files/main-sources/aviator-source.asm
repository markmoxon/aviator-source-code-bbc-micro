\ ******************************************************************************
\
\ AVIATOR SOURCE
\
\ Aviator was written by Geoffrey J Crammond and is copyright Acornsoft 1984
\
\ The code on this site has been disassembled from the original game discs
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://www.bbcelite.com/about_site/terminology_used_in_this_commentary.html
\
\ ------------------------------------------------------------------------------
\
\ This source file produces the following binary file:
\
\   * AVIA.bin
\
\ ******************************************************************************

P = &0070
Q = &0071               \ DTIP in original
R = &0072
S = &0073
T = &0074
U = &0075
V = &0076
W = &0077
G = &0078
H = &0079
I = &007A
J = &007B
K = &007C
L = &007D
M = &007E
N = &007F

PP = &0080
QQ = &0081
RR = &0082
SS = &0083
TT = &0084
UU = &0085
VV = &0086
WW = &0087
GG = &0088           \ PP in original
HH = &0089
II = &008A
JJ = &008B
KK = &008C
LL = &008D
MM = &008E
NN = &008F

L0100 = &0100
L0160 = &0160
L0161 = &0161
L0162 = &0162
L0163 = &0163
L0164 = &0164
L0165 = &0165
L0170 = &0170
L0171 = &0171
L0172 = &0172
L0173 = &0173
L0174 = &0174
L0175 = &0175

L0400 = &0400               \ Whole page zeroed in Reset
L04D8 = &04D8
L04D9 = &04D9
L04EC = $04EC

L0500 = &0500
L05C8 = $05C8               \ Zeroed in Reset

L0600 = $0600

L0700 = &0700
L075F = $075F
L07E4 = $07E4
L07FC = $07FC

L0900 = &0900               \ Set to 80 in Reset, Reset2
L091F = &091F
L095F = &095F
L09FC = &09FC

L0A00 = &0A00
L0A1F = &0A1F
L0A5F = &0A5F
L0AFC = &0AFC
L0AFD = &0AFD

L0B00 = &0B00
L0B1F = &0B1F
L0BFC = &0BFC
L0BFD = &0BFD
L0BFF = &0BFF

L0C00 = &0C00
L0C01 = &0C01           \ Related to indicator X = 5
L0C02 = &0C02
L0C03 = &0C03
L0C05 = &0C05
L0C06 = &0C06
L0C08 = &0C08
L0C09 = &0C09

L0C0C = &0C0C           \ Joystick y position, see indicator X = 8 or 10

L0C0D = &0C0D           \ Related to indicator X = 9

L0C0E = &0C0E           \ Joystick x position, see indicator X = 8 or 10

L0C0F = &0C0F           \ Related to indicator X = 11
L0C10 = &0C10
L0C11 = &0C11           \ Related to indicator X = 5
L0C12 = &0C12
L0C13 = &0C13
L0C15 = &0C15           \ Related to indicator X = 1
L0C16 = &0C16
L0C18 = &0C18
L0C19 = &0C19
L0C1F = &0C1F           \ Related to indicator X = 11
L0C20 = &0C20
L0C26 = &0C26
L0C2A = &0C2A
L0C2D = &0C2D
L0C30 = &0C30
L0C32 = &0C32
L0C40 = &0C40
L0C43 = &0C43
L0C45 = &0C45
L0C46 = &0C46
L0C47 = &0C47
L0C4A = &0C4A
L0C50 = &0C50
L0C53 = &0C53
L0C55 = &0C55
L0C56 = &0C56
L0C57 = &0C57
L0C5A = &0C5A
L0C60 = &0C60
L0C63 = &0C63
L0C64 = &0C64
L0C65 = &0C65
L0C66 = &0C66
L0C67 = &0C67
L0C6A = &0C6A
L0C6D = &0C6D
L0C6E = &0C6E
L0C6F = &0C6F
L0C70 = &0C70
L0C73 = &0C73
L0C74 = &0C74
L0C75 = &0C75
L0C76 = &0C76
L0C77 = &0C77
L0C7A = &0C7A
L0C80 = &0C80
L0C82 = &0C82
L0C83 = &0C83
L0C84 = &0C84
L0C86 = &0C86
L0C89 = &0C89
L0C8A = &0C8A           \ Related to indicator X = 4
L0C8C = &0C8C
L0C90 = &0C90
L0C92 = &0C92
L0C93 = &0C93
L0C94 = &0C94
L0C96 = &0C96
L0C99 = &0C99
L0C9A = &0C9A           \ Related to indicator X = 4
L0C9C = &0C9C           \ Related to indicator X = 6

\ Populated with values from KeyTable1Low or KeyTable2Low when key is pressed
KeyLoggerLow = &0CA0    \ L or < (elevator dive/pitch)      =   1 or  1
                        \ A or + (rudder yaw left/right)    =   1 or  1
                        \ S or D (aileron bank left/right)  =   1 or  1
                        \ W or E (throttle down/up)         = -15 or 15
                        \ U or B (undercarriage, brakes)    =   4 or  7
                        \ F or SHIFT (flaps, fire)          =   5 or  8

L0CA8 = &0CA8

\ Populated with values from KeyTable1High or KeyTable2High when key is pressed
KeyLoggerHigh = &0CB0   \ L or < (elevator dive/pitch)      = -1 or 1
                        \ A or + (rudder yaw left/right)    = -1 or 1
                        \ S or D (aileron bank left/right)  = -1 or 1
                        \ W or E (throttle down/up)         = -1 or 0
                        \ U or B (undercarriage, brakes)    =  0 or 0
                        \ F or SHIFT (flaps, fire)          =  0 or 0

L0CB8 = &0CB8
L0CBA = &0CBA
L0CBB = &0CBB
L0CBE = &0CBE           \ Show gun sights?
L0CBF = &0CBF
L0CC0 = &0CC0
L0CC1 = &0CC1
L0CC2 = &0CC2
L0CC3 = &0CC3
L0CC4 = &0CC4
L0CC5 = &0CC5           \ Set to 1 in Reset ("on ground" flag?)
L0CC6 = &0CC6
L0CC7 = &0CC7
L0CC8 = &0CC8
L0CC9 = &0CC9
L0CCA = &0CCA
L0CCB = &0CCB
L0CCC = &0CCC           \ OB in original

Joystick = &0CCD        \ Joystick configuration
                        \
                        \   * 0 = keyboard
                        \   * 128 = joystick
                        \
                        \ Set to 0 (keyboard) in Reset

L0CCE = &0CCE
L0CCF = &0CCF
L0CD0 = &0CD0           \ Set to 255 in Reset
L0CD1 = &0CD1           \ Set to 47 in Reset
L0CD7 = &0CD7
L0CD8 = &0CD8
L0CD9 = &0CD9
L0CDA = &0CDA
L0CE0 = &0CE0
L0CE1 = &0CE1
L0CE2 = &0CE2
L0CE3 = &0CE3
L0CE4 = &0CE4
L0CE5 = &0CE5
L0CE6 = &0CE6           \ Set to 1 in Reset, Reset2

Theme = &0CE7           \ Theme status
                        \
                        \   * Positive (bit 7 = 0) = the Theme is enabled
                        \   * Negative (bit 7 = 1) = the Theme is not enabled
                        \
                        \ Set to 255 (Theme not enabled) in Reset

L0CE8 = &0CE8           \ Set to 1 in Reset
L0CE9 = &0CE9
L0CEA = &0CEA
L0CEC = &0CEC
L0CED = &0CED           \ Set to 229 in Reset
L0CEE = &0CEE           \ Set to 10 in Reset, related to indicator X = 2
L0CEF = &0CEF           \ Set to 92 in Reset

L0CF0 = &0CF0           \ Set to 5 if undercarriage is up, 10 if it is down in
                        \ UIndicator

L0CF1 = &0CF1           \ ? FRFLAG in original

Undercarriage = &0CF2   \ Undercarriage status
                        \
                        \   * 0 = undercarriage is up
                        \   * Non-zero = undercarriage is down
                        \
                        \ Set to 1 (undercarriage is down) in Reset
             
Flaps = &0CF3           \ Flaps status
                        \
                        \   * 0 = flaps are off
                        \   * Non-zero = flaps are on
                        \
                        \ Set to 0 (flaps are off) in Reset

Brakes = &0CF5          \ Brakes status
                        \
                        \   * 0 = brakes are off
                        \   * Non-zero = brakes are on
                        \
                        \ Set to 1 (brakes are on) in Reset

L0CF7 = &0CF7
L0CF8 = &0CF8           \ Set to 10 in Reset
L0CF9 = &0CF9
L0CFA = &0CFA           \ Set to 7 in Reset
L0CFB = &0CFB           \ Related to indicator X = 0
L0CFC = &0CFC
L0CFD = &0CFD           \ Set to 198 in Reset
L0CFE = &0CFE           \ Related to indicator X = 2
L0CFF = &0CFF           \ Set to 72 in Reset

\ Screen address variables
\ Row1_Block2_3 = Row 1, block 2, byte 3
\ All count from zero

\ Canopy screen addresses (rows 0 to 19)

Row1_Block0_0 = &5940   \ First block on second row
Row1_Block1_0 = &5948   \ Second block on second row
Row1_Block38_0 = &5A68  \ Last block but one on second row
Row1_Block39_0 = &5A70  \ Last block on second row

Row6_Block20_0 = &6020  \ Top of gun sight?
Row7_Block20_0 = &6160  \ Middle of gun sight?
Row8_Block11_0 = &6258  \ Left end of horizontal bar in gun sight?

\ Dashboard screen addresses (rows 20 to 31)

Row21_Block20_7 = &72E7 \ Top block of joystick position display y-axis
Row22_Block20_7 = &7427 \ Second block of joystick position display y-axis
Row23_Block20_7 = &7567 \ Third block of joystick position display y-axis
Row24_Block20_7 = &76A7 \ Fourth block of joystick position display y-axis
                        \ Right-middle block of joystick position display x-axis
Row25_Block20_7 = &77E7 \ Fifth block of joystick position display y-axis
Row26_Block20_7 = &7927 \ Sixth block of joystick position display y-axis
Row27_Block20_7 = &7A67 \ Bottom block of joystick position display y-axis

Row24_Block18_7 = &7697 \ Left block of joystick position display x-axis
Row24_Block19_7 = &769F \ Left-middle block of joystick position display x-axis
Row24_Block21_7 = &76AF \ Right block of joystick position display x-axis

Row23_Block12_4 = &7524 \ Left block of artificial horizon
Row23_Block13_2 = &752A \ Middle block of artificial horizon
Row23_Block14_4 = &7534 \ Right block of artificial horizon

Row25_Block31_1 = &77A9 \ Left block of radar horizontal middle line
Row25_Block34_7 = &7857 \ Left-middle block of radar horizontal middle line
Row25_Block35_6 = &785E \ Right-middle block of radar horizontal middle line
Row25_Block35_7 = &785F \ Right-middle block of radar horizontal middle line
Row26_Block35_0 = &7998 \ Block containing bottom bit of centre cross in radar
Row26_Block35_1 = &7999 \ Block containing bottom bit of centre cross in radar

Row28_Block26_5 = &7BD5 \ Centre block of slip and turn indicator

Row29_Block20_4 = &7CE4 \ Joystick indicator block (above middle of rudder)

Row30_Block0_2 = &7D82  \ Theme indicator
Row30_Block32_2 = &7E82 \ Undercarriage indicator
Row30_Block35_2 = &7E9A \ Flaps indicator
Row30_Block37_2 = &7EAA \ Brakes indicator

VIA = &FE00             \ Memory-mapped space for accessing internal hardware,
                        \ such as the video ULA, 6845 CRTC and 6522 VIAs (also
                        \ known as SHEILA)

OSBYTE = &FFF4          \ The address for the OSBYTE routine
OSWORD = &FFF1          \ The address for the OSWORD routine
OSWRCH = &FFEE          \ The address for the OSWRCH routine
OSCLI = &FFF7           \ The address for the OSCLI routine

CODE% = &1100

\ ******************************************************************************
\
\       Name: L1100
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

ORG CODE%

.L1100

 DEX
 SEC
 ROR A
 CPX #&98
 ROR A
 EOR #&40
 LDX R
 LDY RR
 BEQ L1115

 PHP
 LDX #0
 PLP
 BMI L1115

 DEX

.L1115

 CPX #4
 ROR A
 CPX #&9C
 ROR A
 EOR #&40
 STA TT
 LDA #0
 LDX G
 LDY H
 BEQ L112F

 PHP
 LDX #0
 PLP
 CLC
 BMI L1130

 DEX

.L112F

 SEC

.L1130

 ROR A
 CPX #&98
 ROR A
 EOR #&40
 LDX W
 LDY QQ
 BEQ L1143

 PHP
 LDX #0
 PLP
 BMI L1143

 DEX

.L1143

 CPX #4
 ROR A
 CPX #&9C
 ROR A
 EOR #&40
 STA UU
 LDX L
 LDY M
 LDA L4900,Y
 BPL L1162

 LDA V
 EOR #&C0
 STA V
 LDA TT
 BEQ L1198

 BNE L117A

.L1162

 LDA L4900,X
 BPL L1170

 JSR L1778

 LDA TT
 BEQ L1198

 BNE L117A

.L1170

 LDA TT
 BNE L1186

 LDA UU
 BNE L1198

 BEQ L11CD

.L117A

 JSR L1598

 JMP L1198

.L1180

 JSR L1554

 JMP L1198

.L1186

 LDA UU
 BNE L1180

 LDA V
 EOR #&C0
 STA V
 LDA W
 STA R
 LDA G
 STA S

.L1198

 LDA #4
 BIT V
 BMI L11A0

 LDA #&9B

.L11A0

 STA W
 LDA #0
 BVS L11A8

 LDA #&97

.L11A8

 STA G
 JMP L11B5

.L11AD

 LSR I
 ROR T
 LSR J
 ROR U

.L11B5

 LDA I
 ORA J
 BNE L11AD

 LDA #&FF
 CMP T
 BNE L11C5

 LSR T
 LSR U

.L11C5

 CMP U
 BNE L11CD

 LSR T
 LSR U

.L11CD

 INC T
 INC U
 LDA L0CC3
 BMI L11E5

 LDX L0CD1
 CPX #&5F
 BNE L11DE

 RTS

.L11DE

 INX
 STX L0CD1
 JMP L11F1

.L11E5

 LDX L0CD0
 CPX #&2F
 BNE L11ED

 RTS

.L11ED

 INX
 STX L0CD0

.L11F1

 LDA R
 STA L3C00,X
 LDA W
 STA L3C60,X
 LDA S
 STA L3CC0,X
 LDA G
 STA L3D20,X
 LDA T
 STA L3D80,X
 LDA U
 STA L0100,X
 LDA V
 STA L48A0,X

\ ******************************************************************************
\
\       Name: L1214
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1214

 LDA R
 LSR A
 LSR A
 TAX
 LDA S
 LSR A
 LSR A
 LSR A
 TAY
 CLC
 LDA L4F00,X
 ADC L4800,Y
 STA P
 LDA L4F28,X
 ADC L4820,Y
 STA P+1
 LDA U
 CMP T
 BCC L1239

 JMP L138C

.L1239

 BIT V
 BMI L1252

 LDA #5
 STA L131A+1
 LDA #9
 STA L131F+1

.L1247

 LDA #&60
 STA L1363+1
 LDA #&27
 STA I
 BNE L1265

.L1252

 LDA #&24
 STA L131A+1
 LDA #&28
 STA L131F+1

.L125C

 LDA #&6A
 STA L1363+1
 LDA #0
 STA I

.L1265

 BIT V
 BVS L1287

 LDA #&98
 STA L136A
 LDA #&88
 STA L136B
 LDA #&C8
 STA L1373+1
 LDA #&FE
 STA L1379+1
 LDA #&9E
 SEC
 SBC G
 STA J
 JMP L12A2

.L1287

 LDA #&C8
 STA L136A
 LDA #&98
 STA L136B
 LDA #&38
 STA L1373+1
 LDA #1
 STA L1379+1
 LDA #&A0
 SEC
 SBC G
 STA J

.L12A2

 LDA #&9F
 SEC
 SBC S
 TAY
 LDA #&FF
 SEC
 SBC T
 STA RR
 CLC
 ADC #1
 STA SS
 LDA V
 AND #3
 BEQ L12C4

 LDA U
 CMP #2
 BCC L12C4

 LDA #&FF
 STA SS

.L12C4

 LDA R
 AND #3
 TAX
 LDA R
 LSR A
 LSR A
 STA QQ
 LDA SS
 BIT V
 BMI L12E5

 CPX #1
 BCC L12F8

 BNE L12DE

 CLC
 BCC L1301

.L12DE

 CPX #3
 BCC L130B

 CLC
 BCC L1315

.L12E5

 CPX #1
 BCC L1315

 BNE L12EE

 CLC
 BCC L130B

.L12EE

 CPX #3
 BCC L1301

 CLC
 BCC L12F8

.L12F5

 CLC
 LDA SS

.L12F8

 LDX #0
 ADC U
 BCC L1303

 JSR L135F

.L1301

 LDX #3

.L1303

 INX
 ADC U
 BCC L130D

 JSR L135F

.L130B

 LDX #6

.L130D

 INX
 ADC U
 BCC L1317

 JSR L135F

.L1315

 LDX #8

.L1317

 INX
 ADC U

.L131A

 BCC L1321

 JSR L135F

.L131F

 BNE L132A

.L1321

 STA SS

.L1323

 LDA L2E60,X

.L1326

 ORA (P),Y
 STA (P),Y              \ Update the Y-th byte of P(1 0) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

.L132A

 LDA P
 CLC
 ADC #8
 STA P
 BCC L1335

 INC P+1

.L1335

 INC QQ
 LDA QQ
 CMP I
 BNE L12F5

 JMP L1482

 STA SS

.L1342

 LDA L2E6A,X

.L1345

 ORA (P),Y
 STA (P),Y              \ Update the Y-th byte of P(1 0) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

 LDA P
 SEC
 SBC #8
 STA P
 BCS L1354

 DEC P+1

.L1354

 DEC QQ
 LDA QQ
 CMP I
 BNE L12F5

 JMP L1482

\ ******************************************************************************
\
\       Name: L135F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L135F

 ADC RR
 STA SS

.L1363

 LDA L2E60,X

.L1366

 ORA (P),Y
 STA (P),Y              \ Update the Y-th byte of P(1 0) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

.L136A

 INY

.L136B

 TYA
 AND #7
 BNE L137D

 LDA P
 CLC

.L1373

 ADC #&38
 STA P
 LDA P+1

.L1379

 ADC #1
 STA P+1

.L137D

 LDA SS
 CPY J
 CLC
 BEQ L1385

 RTS

.L1385

 TSX
 INX
 INX
 TXS
 JMP L1482

.L138C

 BIT V
 BVS L13AA

 LDA #&98
 STA L1425
 LDA #&88
 STA L1426
 LDA #&C8
 STA L142E+1
 LDA #&FE
 STA L1434+1
 LDA #7
 STA J
 BNE L13C2

.L13AA

 LDA #&C8
 STA L1425
 LDA #&98
 STA L1426
 LDA #&38
 STA L142E+1
 LDA #1
 STA L1434+1
 LDA #&A0
 STA J

.L13C2

 BIT V
 BMI L13D5

 LDA #&1D
 STA L1421+1
 LDA W
 CLC
 ADC #1
 STA I
 JMP L13E1

.L13D5

 LDA #&3F
 STA L1421+1
 LDA W
 SEC
 SBC #1
 STA I

.L13E1

 LDA #&9F
 SEC
 SBC S
 TAY
 LDA #&FF
 SEC
 SBC U
 STA RR
 CLC
 ADC #1
 STA SS
 LDA V
 AND #3
 BEQ L1403

 LDA T
 CMP #2
 BCC L1403

 LDA #&FF
 STA SS

.L1403

 LDA R
 AND #3
 TAX

.L1408

 LDA #8
 CPX #0
 BEQ L1412

.L140E

 LSR A
 DEX
 BNE L140E

.L1412

 STA H
 CLC
 LDX R

.L1417

 LDA H

.L1419

 ORA (P),Y
 STA (P),Y              \ Update the Y-th byte of P(1 0) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

 LDA SS
 ADC T

.L1421

 BCS L1440

 STA SS

.L1425

 TYA

.L1426

 DEY
 AND #7
 BNE L1417

 LDA P
 CLC

.L142E

 ADC #&C8
 STA P
 LDA P+1

.L1434

 ADC #&FE
 STA P+1
 CPY J
 CLC
 BNE L1417

 JMP L1482

.L1440

 ADC RR
 STA SS
 INX
 LDA H
 LSR A

.L1448

 CMP #0
 BNE L1459

 LDA P
 CLC
 ADC #8
 STA P

.L1453

 LDA #8
 BCC L1459

 INC P+1

.L1459

 STA H
 CPX I
 CLC
 BNE L1425

 BEQ L1482

 ADC RR
 STA SS
 DEX
 LDA H
 ASL A

.L146A

 CMP #&10
 BNE L147B

 LDA P
 SEC
 SBC #8
 STA P

.L1475

 LDA #1
 BCS L147B

 DEC P+1

.L147B

 STA H
 CPX I
 CLC
 BNE L1425

.L1482

 LDA V
 LSR A
 BCS L1488

 RTS

.L1488

 ASL A
 EOR #&C0
 STA V
 LDA L0CE0
 STA R
 LDA L0CE1
 STA S
 LDA #4
 BIT V
 BMI L149F

 LDA #&9B

.L149F

 STA W
 LDA #0
 BVS L14A7

 LDA #&97

.L14A7

 STA G
 JMP L1214

\ ******************************************************************************
\
\       Name: L14AC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L14AC

 LDA L0CC2
 BNE L14E2

 LDA #&31
 STA L1326
 STA L1345
 STA L1366
 STA L1419
 LDA L0CC3
 BMI L14C8

 LDA #&88
 BNE L14CA

.L14C8

 LDA #&92

.L14CA

 STA L1247+1
 STA L1323+1
 STA L125C+1
 STA L1342+1
 LDA L0CC3
 STA L1417+1
 LDA #&A9
 STA L1417
 RTS

.L14E2

 LDA #&11
 STA L1326
 STA L1345
 STA L1366
 STA L1419
 LDA L0CC2
 BMI L1520

 LDA #&74
 STA L1247+1
 STA L1323+1
 LDA #&7E
 STA L125C+1
 STA L1342+1
 LDA #&80
 STA L1408+1
 LDA #8
 STA L1448+1
 LDA #&80
 STA L1453+1
 LDA #0
 STA L146A+1
 LDA #&10
 STA L1475+1
 BNE L1549

.L1520

 LDA #&60
 STA L1247+1
 STA L1323+1
 LDA #&6A
 STA L125C+1
 STA L1342+1
 LDA #8
 STA L1408+1
 LDA #0
 STA L1448+1
 LDA #8
 STA L1453+1
 LDA #&10
 STA L146A+1
 LDA #1
 STA L1475+1

.L1549

 LDA #&A5
 STA L1417
 LDA #&79
 STA L1417+1
 RTS

\ ******************************************************************************
\
\       Name: L1554
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1554

 LDA TT
 AND UU
 BNE L1593

 LDA SS
 BPL L1560

 EOR #&FF

.L1560

 STA L0CC1
 LDA RR
 BPL L1569

 EOR #&FF

.L1569

 CMP L0CC1
 BCC L1571

 STA L0CC1

.L1571

 LDA QQ
 BPL L1577

 EOR #&FF

.L1577

 CMP L0CC1
 BCS L1598

 LDA H
 BPL L1582

 EOR #&FF

.L1582

 CMP L0CC1
 BCS L1598

 JSR L1778

 LDA V
 EOR #&C0
 STA V
 JMP L1598

.L1593

 TSX
 INX
 INX
 TXS
 RTS

\ ******************************************************************************
\
\       Name: L1598
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1598

 LDA S
 CLC
 ADC #4
 STA S
 BCC L15A3

 INC SS

.L15A3

 LDA TT
 BIT V
 BPL L15AF

 AND #&40
 BNE L1593

 BEQ L15B5

.L15AF

 AND #&80
 BNE L1593

 BEQ L15B5

.L15B5

 LDA TT
 BVC L15BF

 AND #&10
 BNE L1593

 BEQ L15C3

.L15BF

 AND #&20
 BNE L1593

.L15C3

 LDA V
 ASL A
 EOR V
 BMI L15EB

 LDA #0
 STA WW
 LDA R
 CLC
 ADC S
 STA TT
 LDA RR
 ADC SS
 STA UU
 LDA TT
 SEC
 SBC #&9F
 STA TT
 LDA UU
 SBC #0
 STA UU
 JMP L15FC

.L15EB

 LDA #&80
 STA WW
 LDA S
 SEC
 SBC R
 STA TT
 LDA SS
 SBC RR
 STA UU

.L15FC

 BPL L160B

 LDA #0
 SEC
 SBC TT
 STA TT
 LDA #0
 SBC UU
 STA UU

.L160B

 LDA T
 CLC
 ADC U
 STA P
 LDA I
 ADC J
 STA P+1
 LDA P
 CLC
 ADC #2
 STA P
 BCC L1623

 INC P+1

.L1623

 LDA #0
 STA K
 LDA I
 CMP J
 BCC L1649

 BNE L1635

 LDA T
 CMP U
 BCC L1649

.L1635

 LDA V
 STA HH
 LDA T
 CLC
 ADC #1
 STA N
 LDA I
 ADC #0
 STA PP
 JMP L1669

.L1649

 LDA V
 ASL A
 STA HH
 LDA U
 CLC
 ADC #1
 STA N
 LDA J
 ADC #0
 STA PP
 LDA WW
 ORA #&40
 STA WW
 LDA S
 STA R
 LDA SS
 STA RR

.L1669

 LDA #&80
 STA W
 LDA #0
 STA VV
 STA K
 STA H
 STA QQ
 STA G
 BEQ L1683

.L167B

 ASL P
 ROL P+1
 ASL N
 ROL PP

.L1683

 LDA P+1
 CMP UU
 BCC L167B

 BNE L1691

 LDA P
 CMP TT
 BCC L167B

.L1691

 LSR P+1
 ROR P
 ROR K
 LSR PP
 ROR N
 ROR VV

.L169D

 LDA P+1
 CMP UU
 BCC L16BF

 BNE L1691

 LDA P
 CMP TT
 BCC L16BF

 BNE L1691

 LDA K
 CMP H
 BCC L16BF

 BEQ L16BF

 LDA P+1
 ORA P
 ORA K
 BNE L1691

 BEQ L16F1

.L16BF

 LDA W
 CLC
 ADC VV
 STA W
 LDA G
 ADC N
 STA G
 LDA QQ
 ADC PP
 STA QQ
 LDA H
 SEC
 SBC K
 STA H
 LDA TT
 SBC P
 STA TT
 LDA UU
 SBC P+1
 STA UU
 BNE L169D

 LDA TT
 BNE L169D

 LDA H
 CMP #2
 BCS L169D

.L16F1

 LDA G
 ROL W
 ADC #0
 STA G
 BCC L16FD

 INC QQ

.L16FD

 LDA HH
 BMI L1715

 LDA R
 CLC
 ADC G
 STA R
 STA S
 LDA RR
 ADC QQ
 STA RR
 STA SS
 JMP L1726

.L1715

 LDA R
 SEC
 SBC G
 STA R
 STA S
 LDA RR
 SBC QQ
 STA RR
 STA SS

.L1726

 BIT WW
 BMI L1749

 BVS L173C

 LDA #&9F
 SEC
 SBC R
 STA S
 LDA #0
 SBC RR
 STA SS
 JMP L1749

.L173C

 LDA #&9F
 SEC
 SBC S
 STA R
 LDA #0
 SBC SS
 STA RR

.L1749

 LDA RR
 BNE L1775

 LDA R
 CMP #&9C
 BCS L1775

 CMP #4
 BCC L1775

 LDA S
 SEC
 SBC #4
 STA S
 BCC L1775

 CMP #&98
 BCS L1775

 LDA #1
 ORA V
 STA V
 LDA R
 STA L0CE0
 LDA S
 STA L0CE1
 RTS

.L1775

 JMP L1593

\ ******************************************************************************
\
\       Name: L1778
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1778

 LDA W
 STA R
 LDA QQ
 STA RR
 LDA G
 STA S
 LDA H
 STA SS
 LDA UU
 STA TT
 RTS

\ ******************************************************************************
\
\       Name: L178D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L178D

 LDA #0
 STA L0CC2
 JSR L14AC

.L1795

 LDA L0CC3
 BPL L17A8

 LDX L0CD1
 CPX #&2F
 BNE L17A2

 RTS

.L17A2

 DEC L0CD1
 JMP L17B3

.L17A8

 LDX L0CD0
 CPX #&FF
 BNE L17B0

 RTS

.L17B0

 DEC L0CD0

.L17B3

 LDA L3C00,X
 STA R
 STA L0CE0
 LDA L3C60,X
 STA W
 LDA L3CC0,X
 STA S
 STA L0CE1
 LDA L3D20,X
 STA G
 LDA L3D80,X
 STA T
 LDA L0100,X
 STA U
 LDA L48A0,X
 STA V
 JSR L1214

 JMP L1795

 EQUB &17

\ ******************************************************************************
\
\       Name: L17E3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L17E3

 LDA J
 BPL L17FA

 LDA #0
 SEC
 SBC I
 STA I
 LDA #0
 SBC J
 STA J
 LDA K
 EOR #&80
 STA K

.L17FA

 LDA R
 AND #1
 BEQ L1806

 LDA K
 EOR #&80
 STA K

.L1806

 JSR L1D3A

 STA G
 BCC L180F

 INC H

.L180F

 LDA K
 BPL L1820

 SEC
 LDA #0
 SBC G
 STA G
 LDA #0
 SBC H
 STA H

.L1820

 RTS

\ ******************************************************************************
\
\       Name: L1821
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1821

 LDA L4300,X
 ORA L4500,Y
 STA T
 AND #&F0
 ORA L3700,X
 STA U
 AND #&0F
 ORA L3800,Y
 TAY
 AND #&F0
 ORA L4300,X
 TAX
 LDA L3A00,X
 STA V
 LDX T
 LDA L3A00,X
 CLC
 ADC L3A00,Y
 ROR A
 ROR A
 ROR A
 ROR A
 STA T
 ROR A
 AND #&F0
 CLC
 ADC V
 STA V
 LDA T
 AND #&1F
 LDX U
 ADC L3A00,X
 RTS

\ ******************************************************************************
\
\       Name: L1862
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1862

 LDA L0CFA,Y
 STA G
 STA K
 LDA L0CEA,Y
 ASL A
 ROL G
 ASL A
 ROL G
 STA W
 LDX G
 JSR L1902

 STA P+1
 STY P
 LDA G
 EOR #&FF
 TAX
 LDA W
 EOR #&FF
 STA W
 JSR L1902

 STA S
 STY R
 LDY L0CC4
 BIT K
 BVS L18CD

 BMI L18B3

 LDA P+1
 STA L0173,Y
 LDA P
 AND #&FE
 STA L0163,Y
 LDA S
 STA L0170,Y
 LDA R
 AND #&FE
 STA L0160,Y
 JMP L1901

.L18B3

 LDA P+1
 STA L0173,Y
 LDA P
 ORA #1
 STA L0163,Y
 LDA S
 STA L0170,Y
 LDA R
 ORA #1
 STA L0160,Y
 BNE L1901

.L18CD

 BMI L18E9

 LDA S
 STA L0173,Y
 LDA R
 AND #&FE
 STA L0163,Y
 LDA P+1
 STA L0170,Y
 LDA P
 ORA #1
 STA L0160,Y
 BNE L1901

.L18E9

 LDA S
 STA L0173,Y
 LDA R
 ORA #1
 STA L0163,Y
 LDA P+1
 STA L0170,Y
 LDA P
 AND #&FE
 STA L0160,Y

.L1901

 RTS

\ ******************************************************************************
\
\       Name: L1902
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1902

 STX H
 SEC
 LDA L4001,X
 SBC L4000,X
 STA I
 LDA L4102,X
 SBC L4101,X
 LSR A
 ROR I
 LDX I
 LDY W
 JSR L1821

 LDX H
 ASL V
 ROL A
 PHP
 CLC
 ADC L4000,X
 TAY
 LDA #0
 ADC L4101,X
 PLP
 ADC #0
 RTS

\ ******************************************************************************
\
\       Name: L1931
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1931

 LDX S
 LDY V
 LDA L3800,Y
 ORA L3700,X
 TAY
 AND #&F0
 ORA L4300,X
 STA U
 LDX R
 AND #&F0
 ORA L3700,X
 TAX
 LDA L3A00,X
 TAX
 STX T
 LDA L3A00,Y
 TAY
 LDA L3700,X
 ORA L3800,Y
 CLC
 LDX U
 ADC L3A00,X
 STA W
 LDA L3700,Y
 ADC #0
 STA G
 BIT K
 BPL L198E

 LDX R
 LDA V
 AND #&0F
 ORA L3800,X
 TAY
 LDX T
 LDA L3800,X
 CLC
 ADC L3A00,Y
 BCC L1989

 INC W
 BNE L1989

 INC G

.L1989

 ASL A
 ROL W
 ROL G

.L198E

 LDA V
 BPL L199F

 LDA #0
 SEC
 SBC W
 STA W
 LDA #0
 SBC G
 STA G

.L199F

 RTS

\ ******************************************************************************
\
\       Name: L19A0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L19A0

 LDX GG
 LDY L3400,X
 STY PP
 LDY L34D8,X
 STY QQ
 LDY L35B0,X
 STY RR
 LDA L3700,Y
 STA UU
 CMP #9
 ROR K
 LDX #5
 LDA #0

.L19BE

 STA L0CE0,X
 DEX
 BPL L19BE

 LDA L0CCB
 CLC
 ADC #8
 STA P
 LDA #2
 STA VV

.L19D0

 LDX #2

.L19D2

 LDY P
 LDA PP,X
 STA I
 AND #&0F
 STA V
 BEQ L1A0C

 LDA L4260,Y
 STA S
 LDA L4220,Y
 STA R
 AND #1
 BEQ L19F2

 LDA V
 EOR #&80
 STA V

.L19F2

 STX P+1
 JSR L1931

 LDX P+1
 LDY VV
 LDA W
 CLC
 ADC L0CE0,Y
 STA L0CE0,Y
 LDA G
 ADC L0CE3,Y
 STA L0CE3,Y

.L1A0C

 LDA P
 CMP L0CCB
 BEQ L1A1D

 DEC P
 DEX
 BPL L19D2

 DEC VV
 JMP L19D0

.L1A1D

 LDX #2

.L1A1F

 LDY UU
 BEQ L1A4C

 CPY #8
 BCS L1A47

 LDA L0CE0,X
 STA P
 LDA #0
 STA R
 LDA L0CE3,X
 BPL L1A37

 DEC R

.L1A37

 ASL P
 ROL A
 ROL R
 DEY
 BNE L1A37

 STA L0CE0,X
 LDA R
 STA L0CE3,X

.L1A47

 DEX
 BPL L1A1F

 BMI L1A62

.L1A4C

 LDA #0
 STA R
 LDA L0CE3,X
 BPL L1A57

 DEC R

.L1A57

 STA L0CE0,X
 LDA R
 STA L0CE3,X
 JMP L1A47

.L1A62

 LDX GG
 LDY L0CCF

\ ******************************************************************************
\
\       Name: L1A67
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1A67

 LDA L0CE0
 CLC
 ADC L0900,Y
 STA L0900,X
 LDA L0CE3
 ADC L4A00,Y
 STA L4A00,X
 PHP
 CLC
 LDA L0CE1
 ADC L0A00,Y
 STA L0A00,X
 LDA L0CE4
 ADC L0B00,Y
 STA L0B00,X
 PHP
 CLC
 LDA L0CE2
 ADC L0700,Y
 STA L0700,X
 LDA L0CE5
 ADC L4900,Y
 STA L4900,X
 JMP L4B8C

 NOP

\ ******************************************************************************
\
\       Name: L1AA6
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1AA6

 LDA G
 AND #1
 STA K
 EOR I
 AND #1
 BNE L1AD0

 LDA G
 CLC
 ADC I
 AND #&FE
 ORA K
 STA R
 LDA H
 ADC J
 STA S
 BCC L1ACF

 LDA #&FF
 STA S
 LDA #&FE
 ORA K
 STA R

.L1ACF

 RTS

.L1AD0

 LDA G
 SEC
 SBC I
 STA R
 LDA H
 SBC J
 STA S
 BCC L1AE8

 LDA R
 AND #&FE
 ORA K
 STA R
 RTS

.L1AE8

 LDA #0
 SEC
 SBC R
 AND #&FE
 ORA K
 EOR #1
 STA R
 LDA #0
 SBC S
 STA S
 RTS

\ ******************************************************************************
\
\       Name: L1AFC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1AFC

 LDX L0CC4
 LDA L0160,X
 EOR #1
 STA I
 LDA L0170,X
 STA J
 LDX #5
 LDY #1
 JSR L1CF0

 LDX #1
 LDY #3
 JSR L1D13

 LDX #3
 LDY #2
 JSR L1D13

 LDX #4
 LDY #0
 JSR L1D13

 LDX #0
 LDY #6
 JSR L1CF0

 LDX #1
 LDY #8
 JSR L1D13

 LDX #2
 LDY #4
 JSR L1D13

 LDX #3
 LDY #5
 JSR L1D03

 LDX L0CC4
 LDY L0CCB
 LDA L0162,X
 STA L4232,Y
 STA L4236,Y
 STA L423B,Y
 LDA L0172,X
 STA L4272,Y
 STA L4276,Y
 STA L427B,Y
 LDA L0165,X
 STA L4235,Y
 STA L423E,Y
 EOR #1
 STA L4233,Y
 LDA L0175,X
 STA L4273,Y
 STA L4275,Y
 STA L427E,Y
 LDA L0160,X
 STA L4243,Y
 LDA L0170,X
 STA L4283,Y
 LDA L0163,X
 STA L4242,Y
 LDA L0173,X
 STA L4282,Y
 LDY #5

.L1B95

 CPY #3
 BEQ L1BA5

 LDA L4220,Y
 STA L423B,Y
 LDA L4260,Y
 STA L427B,Y

.L1BA5

 DEY
 BNE L1B95

 LDA G
 STA I
 LDA H
 STA J
 LDX L0CC4
 LDA L0164,X
 STA R
 LDA L0174,X
 STA S
 JSR L1D77

 LDY L0CCB
 LDA L4223,Y
 STA I
 LDA L4263,Y
 STA J
 JSR L1AA6

 LDA R
 STA L4223,Y
 LDA S
 STA L4263,Y
 LDA L4225,Y
 STA I
 LDA L4265,Y
 STA J
 LDX L0CC4
 LDA L0161,X
 STA R
 LDA L0171,X
 STA S
 JSR L1D77

 LDY L0CCB
 LDA L4220,Y
 EOR #1
 STA I
 LDA L4260,Y
 STA J
 JSR L1AA6

 LDA R
 STA L4225,Y
 LDA S
 STA L4265,Y
 LDX L0CC4
 LDA L0161,X
 STA R
 LDA L0171,X
 STA S
 LDX #2
 LDY #0
 JSR L1D13

 LDX L0CC4
 LDA L0164,X
 EOR #1
 STA R
 LDA L0174,X
 STA S
 JSR L1D77

 LDY L0CCB
 LDA L4222,Y
 STA I
 STA L0CE0
 LDA L4262,Y
 STA J
 STA L0CE3
 LDA G
 STA L4222,Y
 LDA H
 STA L4262,Y
 LDA R
 EOR #1
 STA R
 JSR L1D77

 LDY L0CCB
 LDA L4220,Y
 STA I
 LDA L4260,Y
 STA J
 JSR L1AA6

 LDA R
 STA L4220,Y
 LDA S
 STA L4260,Y
 LDA L0CE0
 STA R
 LDA L0CE3
 STA S
 LDX L0CC4
 LDA L0161,X
 STA I
 LDA L0171,X
 STA J
 JSR L1D77

 LDY L0CCB
 LDA L4222,Y
 STA I
 LDA L4262,Y
 STA J
 JSR L1AA6

 LDA R
 STA L4222,Y
 LDA S
 STA L4262,Y
 LDX L0CC4
 LDA L0163,X
 STA L4227,Y
 LDA L0173,X
 STA L4267,X
 LDA #2
 STA T
 LDY L0CCB
 LDX L0CCB

.L1CC3

 LDA L4220,Y
 STA L4229,X
 LDA L4260,Y
 STA L4269,X
 LDA L4221,Y
 STA L422C,X
 LDA L4261,Y
 STA L426C,X
 LDA L4222,Y
 STA L422F,X
 LDA L4262,Y
 STA L426F,X
 INY
 INY
 INY
 INX
 DEC T
 BPL L1CC3

 RTS

\ ******************************************************************************
\
\       Name: L1CF0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1CF0

 TXA
 CLC
 ADC L0CC4
 TAX
 LDA L0160,X
 STA R

.L1CFB

 LDA L0170,X
 STA S
 JMP L1D23

\ ******************************************************************************
\
\       Name: L1D03
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1D03

 TXA
 CLC
 ADC L0CC4
 TAX
 LDA L0160,X
 EOR #1
 STA R
 JMP L1CFB

\ ******************************************************************************
\
\       Name: L1D13
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1D13

 TXA
 CLC
 ADC L0CC4
 TAX
 LDA L0160,X
 STA I
 LDA L0170,X
 STA J

.L1D23

 TYA
 CLC
 ADC L0CCB
 STA N
 JSR L1D77

 LDY N
 LDA G
 STA L4220,Y
 LDA H
 STA L4260,Y
 RTS

\ ******************************************************************************
\
\       Name: L1D3A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1D3A

 LDX J
 LDY R
 JSR L1821

 STA G
 LDA V
 CLC

.L1D46

 ADC #&80
 STA W
 BCC L1D4E

 INC G

.L1D4E

 LDX S
 LDY J
 JSR L1821

 STA H
 LDA V
 CLC
 ADC G
 STA G
 BCC L1D62

 INC H

.L1D62

 LDX S
 LDY I
 JSR L1821

 STA T
 LDA V
 CLC
 ADC W
 STA W
 LDA T
 ADC G
 RTS

\ ******************************************************************************
\
\       Name: L1D77
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1D77

 LDA R
 EOR I
 AND #1
 STA K
 JSR L1D3A

 AND #&FE
 ORA K
 STA G
 BCC L1D8C

 INC H

.L1D8C

 RTS

\ ******************************************************************************
\
\       Name: L1D8D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1D8D

 LDX GG
 LDA L0900,X
 STA PP
 LDA L4A00,X
 STA SS
 LDA L0A00,X
 STA QQ
 LDA L0B00,X
 STA TT
 LDA L0700,X
 STA RR
 LDA L4900,X
 STA UU
 LDX #5
 LDA #0

.L1DB1

 STA L0CE0,X
 DEX
 BPL L1DB1

 LDA L0CCB
 CLC
 ADC #8
 STA P
 LDA #2
 STA VV

.L1DC3

 LDX #2

.L1DC5

 LDY P
 LDA L4260,Y
 STA S
 BNE L1DD5

 LDA L4220,Y
 CMP #5
 BCC L1E07

.L1DD5

 LDA L4220,Y
 STA R
 LDA PP,X
 STA I
 LDA SS,X
 STA J
 LDA #0
 STA K
 STX P+1
 JSR L17E3

 LDX P+1
 LDY VV
 LDA G
 CLC
 ADC L0CE0,Y
 STA L0CE0,Y
 LDA H
 ADC L0CE3,Y
 STA L0CE3,Y
 BVC L1E07

 LDA #&40
 STA L0CCE

.L1E07

 LDY P
 CPY L0CCB
 BEQ L1E18

 DEC P
 DEX
 BPL L1DC5

 DEC VV
 JMP L1DC3

.L1E18

 LDX GG

\ ******************************************************************************
\
\       Name: L1E1A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1E1A

 LDA L0CE0
 STA L0900,X
 LDA L0CE3
 STA L4A00,X
 LDA L0CE1
 STA L0A00,X
 LDA L0CE4
 STA L0B00,X
 LDA L0CE2
 STA L0700,X
 LDA L0CE5
 STA L4900,X
 RTS

 BRK
 EQUB &49

 RTS

\ ******************************************************************************
\
\       Name: UpdateDashboard
\       Type: Subroutine
\   Category: 
\    Summary: ??? Update indicator number X
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   Indicator number:
\
\                         * 1 = thrust or rudder
\
\                         * 8 or 10 = joystick position display
\
\                         * 9 = rudder or thrust
\
\                       (11 in Reset, value in L4FFA is passed sometimes)
\
\ ******************************************************************************

.UpdateDashboard

 STX WW                 \ Set WW to the value in X

 CPX #0                 \ If X = 0, jump down to L1E51
 BEQ L1E51

 CPX #2                 \ If X < 2 (i.e. X = 1), jump down to L1E66
 BCC L1E66

 BEQ L1E7B              \ If X = 2, jump down to L1E7B

 JMP L1EE5              \ X > 2, so jump down to L1EE5

.L1E51

                        \ If we get here then X = 0

 LDA L0CFB              \ Set A = L0CFB to show on the dial

 STA T                  

 LSR A                  \ A = (A / 4 + A) / 2
 LSR A                  \   = 0.625 * A
 CLC
 ADC T
 ROR A

 LSR A                  \ A = 0.625 * A
 LSR A                  \   = 0.625 * 0.625 * A
 CLC                    \   = 0.390625 * A
 ADC T
 ROR A

 LSR A                  \ A = A / 2
                        \   = 0.1953125 * A
                        \
                        \ i.e. range 0 to 255 to range 0 to 50

 JMP L209D              \ Jump to L209D to update the dial

.L1E66

                        \ If we get here then X = 1

 LDA L0C15              \ If (L0C15 L0C05) is negative, set A = 0 and jump to
 BPL L1E70              \ L209D to update the dial
 LDA #0
 JMP L209D

.L1E70

 LDA L0C05              \ Set A = (L0C15 L0C05) / 128
 ASL A
 LDA L0C15
 ROL A

 JMP L209D              \ Jump to L209D to update the dial

.L1E7B

                        \ If we get here then X = 2

 LDA L0CEE
 STA R
 LDA L0CFE
 LSR A
 ROR R
 LSR A
 ROR R
 STA S
 LDA #0
 STA T
 LDA R
 LSR A
 LSR A
 CLC
 ADC R
 ROR A
 LSR A
 CLC
 ADC R
 ROR A
 CLC
 ADC R
 ROR A
 LSR A

 STA L4FFF

 LDA S
 LSR A
 ROR T
 LSR A
 ROR T
 CLC
 ADC S
 ROR A
 ROR T
 LSR A
 ROR T
 CLC
 ADC S
 ROR A
 ROR T
 CLC
 ADC S
 ROR A
 ROR T
 LSR A
 ROR T
 STA U

 LDA T
 CLC
 ADC L4FFF
 BCC L1ED0

 INC U

.L1ED0

 LSR U
 ROR A
 LSR U
 ROR A
 LSR U
 ROR A
 LSR U
 ROR A
 JMP L209D

.L1EDF

                        \ If we get here then X = 3

 LDA L4FFF
 JMP L209D

.L1EE5

                        \ If we get here then X > 2

 CPX #4                 \ If X < 4 (i.e. X = 3), jump up to L1EDF
 BCC L1EDF

 BEQ L1EEE              \ If X = 4, jump down to L1EEE

 JMP L1F39              \ X > 4, so jump down to L1F39

.L1EEE

                        \ If we get here then X = 4

 LDA L0C8A
 STA T
 LDA L0C9A
 BPL L1F04

 LDA #0
 SEC
 SBC T
 STA T
 LDA #0
 SBC L0C9A

.L1F04

 LSR A
 ROR T
 LSR A
 ROR T
 LSR A
 ROR T
 CMP #0
 BEQ L1F15

 LDA #&FF
 STA T

.L1F15

 LDA T
 LSR A
 CLC
 ADC T
 ROR A
 LSR A
 LSR A
 LSR A
 CLC
 ADC T
 ROR A
 LSR A
 CMP #&28
 BCC L1F2A

 LDA #&28

.L1F2A

 BIT L0C9A
 BPL L1F36

 STA T
 LDA #0
 SEC
 SBC T

.L1F36

 JMP L209D

.L1F39

                        \ If we get here then X > 4

 CPX #6                 \ If X < 6 (i.e. X = 5), jump down to L1F42
 BCC L1F42

 BEQ L1F80              \ If X = 6, jump down to L1F80

 JMP L1FE4              \ X > 6, so jump down to L1FE4

.L1F42

                        \ If we get here then X = 5

 LDA L0C01
 STA T
 LDA L0C11
 BPL L1F58

 LDA #0
 SEC
 SBC T
 STA T
 LDA #0
 SBC L0C11

.L1F58

 BNE L1F60

 LDA T
 CMP #&8C
 BCC L1F64

.L1F60

 LDA #&8C
 STA T

.L1F64

 LSR A
 CLC
 ADC T
 ROR A
 LSR A
 LSR A
 CLC
 ADC T
 ROR A
 LSR A
 LSR A
 BIT L0C11
 BMI L1F7D

 STA T
 LDA #0
 SEC
 SBC T

.L1F7D

 JMP L209D

.L1F80

                        \ If we get here then X = 6

 LDA L0C9C
 JMP L209D

.L1F86

                        \ If we get here then X = 7

 LDY #0
 STY K
 STY R
 JSR L227A

 CLC
 STA S
 LDY #3
 JSR L227A

 STA H
 LDY #0
 LDA #1
 STA K
 JSR L227A

 SEC
 SBC S
 BPL L1FB2

 STA T
 LDA #&80
 STA R
 LDA #0
 SEC
 SBC T

.L1FB2

 CLC
 ADC #1
 STA W
 LDY #3
 JSR L227A

 SEC
 SBC H
 BPL L1FCE

 STA T
 LDA #&40
 ORA R
 STA R
 LDA #0
 SEC
 SBC T

.L1FCE

 CLC
 ADC #1
 STA G
 LDA S
 CLC
 ADC #&35
 STA S
 LDA H
 CLC
 ADC #&E3
 STA H
 JMP L20B8

.L1FE4

                        \ If we get here then X > 6

 CPX #7                 \ If X = 7, jump up to L1F86
 BEQ L1F86

 CPX #9                 \ If X < 9 (i.e. X = 8), jump down to L200E
 BCC L200E

 BEQ L1FF5              \ If X = 9, jump down to L1FF5

 CPX #11                \ If X < 11 (i.e. X = 10), jump down to L200E
 BCC L200E

 BEQ L2058              \ If X = 11, jump down to L2058

 RTS

.L1FF5

                        \ If we get here then X = 9

 LDX #1
 LDA #&80
 STA S
 LDA #&50
 STA W
 LDA L0C0D
 SEC
 JSR L22F7

 STA H
 LDY #&A3
 LDA #&0B
 BNE L207F              \ Do line drawing

.L200E

                        \ If we get here then X = 8 or 10

 LDA #128               \ Redraw the existing cross on the joystick position
 JSR DrawJoystickCross  \ display to remove it

 LDA #%00100010         \ Redraw the joystick position display's x-axis
 STA Row24_Block18_7
 STA Row24_Block21_7
 LDA #%01000100
 STA Row24_Block19_7

 LDA #%10011001         \ Redraw the joystick position display's y-axis
 STA Row24_Block20_7
 LDA #%10001000
 STA Row21_Block20_7
 STA Row22_Block20_7
 STA Row23_Block20_7
 STA Row25_Block20_7
 STA Row26_Block20_7
 STA Row27_Block20_7

 LDA L0C0E
 SEC
 JSR L22F7
 
 STA JoyXC              \ Set JoyXC = A

 LDA L0C0C
 CLC
 JSR L22F7

 EOR #&FF               \ Set JoyYC = -A
 CLC
 ADC #1
 STA JoyYC

 LDA #0                 \ Draw a new cross on the joystick position display
 JSR DrawJoystickCross

 RTS                    \ Return from the subroutine

.L2058

                        \ If we get here then X = 11

 LDA #128               \ Set S = 128
 STA S

 LDA #125               \ Set W = 125
 STA W

 LDA L0C1F              \ Set (R A) = (L0C1F L0C0F)
 STA R
 LDA L0C0F

 LDX #3                 \ Set X = 3 to act as a shift counter in the following
                        \ loop

.L206A

 LSR R                  \ Set (R A) = (R A) / 2
 ROR A

 DEX                    \ Decrement the shift counter

 BPL L206A              \ Loop back until we have shifted right by 4 places, so
                        \ we now have:
                        \
                        \   (R A) = (R A) / 8

 STA R                  \ Set H = (A / 2 + A) / 4
 LSR A
 ADC R
 LSR A
 LSR A
 STA H

 LDX #3                 \ Set X = 3

 LDY #243               \ Set Y = 243 to use as the value of JoyC below

 LDA #7                 \ Set A = 7 to use as the value of U below

.L207F

                        \ If we get here then X is either 9 (called from
                        \ L1FF5 with X = 1) or 3 (we fell through from above
                        \ with X = 3)
                        
                        \ Draws a vertical line, length A
                        \ For thrust and rudder?

 STA U                  \ Set U = A, so the line is A pixels tall

 LDA #1                 \ Set T = 1, so the line is 1 pixel wide
 STA T

 STY JoyC               \ Set JoyC = Y

 LDA JoyYC,X            \ Set G = the X-th byte of JoyYC (for the erase)
 STA G

 LDA H                  \ Set the X-th byte of JoyYC = H (for the draw)
 STA JoyYC,X

 JSR EraseOrthoLine     \ Erase line

 LDA #0                 \ Set N = 0
 STA N

 JSR DrawOrthoLine      \ Draw line

 RTS                    \ Return from the subroutine

.L209D

                        \ Called for X = 0 to 6

 CLC
 ADC L4FBA,X
 CMP L4FC2,X
 BCS L20AB

 LDA L4FC2,X
 BCC L20B3

.L20AB

 CMP L4FCA,X
 BCC L20B3

 LDA L4FCA,X

.L20B3

 STA H
 JSR L216E

.L20B8

                        \ Called for X = 7

 LDA L4FAA,X
 STA I
 LDA L4FB2,X
 STA J
 LDA L4FD2,X
 STA T
 LDA L4FDA,X
 STA U
 LDA L4FE2,X
 STA V
 LDA #&80
 STA N
 JSR DrawLine

 LDX WW
 CPX #7
 BNE L2102

 LDA #&FF
 LDY #2

.L20E2

 STA Row23_Block13_2,Y
 LDA #&44
 DEY
 BPL L20E2

 LDA #&33
 STA Row23_Block12_4
 LDA #&88
 STA Row23_Block14_4
 LDA S
 STA I
 STA L4FAA,X
 LDA H
 STA L4FB2,X
 BNE L210A

.L2102

 LDA L4FAA,X
 STA I
 LDA L4FB2,X

.L210A

 STA J
 LDA W
 STA T
 STA L4FD2,X
 LDA G
 STA U
 STA L4FDA,X
 LDA R
 STA V
 STA L4FE2,X
 LDA #0
 STA N
 JSR DrawLine

 RTS

\ ******************************************************************************
\
\       Name: DrawJoystickCross
\       Type: Subroutine
\   Category: 
\    Summary: Draw a cross on the dashboard
\
\ ------------------------------------------------------------------------------
\
\ This routine draws a cross, relative to a centre point of (80, 216), and with
\ a 3-pixel horizontal bar and a 5-pixel vertical bar.
\
\ Arguments:
\
\   A                   Drawing mode:
\
\                         * 0 = Draw (using OR logic)
\
\                         * 128 = Erase (using EOR logic)
\
\   JoyXC               The current joystick x-coordinate
\
\   JoyYC               The current joystick y-coordinate
\
\ ******************************************************************************

.DrawJoystickCross

 STA N                  \ Store the drawing mode in N

                        \ First we draw the 3-pixel horizontal line right from
                        \ (79 + x, 216 + y)

 LDA JoyYC              \ Set H = JoyYC
 STA H

 LDA JoyXC              \ Set JoyC = JoyXC + 79
 CLC                    \
 ADC #79                \ to get the x-coordinate of the left end of the
 STA JoyC               \ horizontal line at 79 + x

 LDA #216               \ Set W = 216, the y-coordinate of the centre point, so
 STA W                  \ we draw the line from a y-coordinate of 216 + y

 LDA #0                 \ Set S = 0, to denote that JoyC is the x-coordinate, so
 STA S                  \ we draw the line from point (JoyC, H + W)

 LDA #3                 \ Set T = 3, so we draw a horizontal 3-pixel line
 STA T

 LDA #1                 \ Set U = 1, so the line is 1 pixel high
 STA U

 JSR DrawOrthoLine

                        \ Now we draw the 5-pixel vertical line down from
                        \ (80 + x, 214 + y)

 LDA JoyXC              \ Set H = JoyXC
 STA H

 LDA JoyYC              \ Set JoyC = JoyYC + 214
 CLC                    \
 ADC #214               \ to get the y-coordinate of the top end of the vertical
 STA JoyC               \ line at 214 + y

 LDA #80                \ Set W = 80, the x-coordinate of the centre point, so
 STA W                  \ we draw the line from an x-coordinate of 80 + x

 LDA #128               \ Set S = 128, to denote that JoyC is the y-coordinate,
 STA S                  \ so we draw the line from point (H + W, JoyC)

 LDA #1                 \ Set T = 1, so the line is 1 pixel wide
 STA T

 LDA #5                 \ Set U = 5, so we draw a vertical 5-pixel line
 STA U

 JSR DrawOrthoLine

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L216E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L216E

 LDY #0
 STY R
 LDY L4F92,X
 INY
 STY K
 SEC

.L2179

 SBC K
 BCS L2182

 ADC K
 JMP L21A4

.L2182

 SBC L4F92,X
 BCS L218D

 LDY #&40
 STY R
 BNE L21A2

.L218D

 SBC K
 BCS L2199

 ADC K
 LDY #&C0
 STY R
 BNE L21A4

.L2199

 SBC L4F92,X
 BCS L2179

 LDY #&80
 STY R

.L21A2

 EOR #&FF

.L21A4

 STA S
 LDA L4F92,X
 SEC
 SBC S
 CMP L4FA2,X
 BCC L21B4

 LDA L4FA2,X

.L21B4

 CLC
 ADC #1
 STA G
 LDA S
 CLC
 ADC #1
 LSR A
 CMP L4F9A,X
 BCC L21C7

 LDA L4F9A,X

.L21C7

 CLC
 ADC #1
 STA W
 RTS

\ ******************************************************************************
\
\       Name: DrawLine (Part 1 of 3)
\       Type: Subroutine
\   Category: 
\    Summary: Does this draw a line?
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   I                   Start point x-coordinate
\
\   J                   Start point y-coordinate
\
\   N                   Drawing mode:
\
\                         * 0 = Draw (using OR logic)
\
\                         * 128 = Erase (using EOR logic)
\
\   T                   ??? Delta y-coordinate for line
\                       Horizontal width/length of line
\
\   U                   ??? Delta x-coordinate for line
\                       Vertical width/length of line
\
\   V                   Bits 6 and 7 affect sign of x,y delta increments,
\                       direction of drawing?
\
\ ******************************************************************************

.DrawLine

 LDY #3                 \ Set Y = 3 to use as a byte counter in the following
                        \ loop, so it writes four bytes

 LDA #%00010001         \ Set A = %00010001, the pixel pattern for pixel 0 in
                        \ white

.DrawLine_L1

 STA RR,Y               \ Set the Y-th byte of RR to A

 ASL A                  \ Set A = A * 2

 DEY                    \ Decrement the byte counter

 BPL DrawLine_L1        \ Loop back until we have updated RR to RR+3 as
                        \ follows:
                        \
                        \   RR   = %10001000 = pixel 3 in white
                        \   RR+1 = %01000100 = pixel 2 in white
                        \   RR+2 = %00100010 = pixel 1 in white
                        \   RR+3 = %00010001 = pixel 0 in white

 LDA #0                 \ Set QQ = 0
 STA QQ

 STA PP                 \ Set PP = 0

 LDA T                  \ If T < U, jump down to DrawLine1 to skip the
 CMP U                  \ following two instructions
 BCC DrawLine1

                        \ If we get here then T >= U, steep vertical slope

 STA VV                 \ Set VV = T, so we step along the y-axis

 BCS DrawLine10         \ Jump down to DrawLine10 (this BCS is effectively a JMP
                        \ as we just passed through a BCC)

.DrawLine1

                        \ If we get here then T < U, shallow horizontal slope

 LDA U                  \ Set VV = U, so we step along the x-axis
 STA VV

 STA PP                 \ Set PP = U

 BCC DrawLine10         \ Jump down to DrawLine10 (this BCC is effectively a JMP
                        \ as we got here by following a BCC)

\ ******************************************************************************
\
\       Name: DrawLine (Part 2 of 3)
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.DrawLine2

 LDA QQ
 CLC
 ADC U
 CMP T
 BCC DrawLine4

 SBC T
 BIT V
 BVC DrawLine3

 DEC J
 BVS DrawLine4

.DrawLine3

 INC J

.DrawLine4

 STA QQ

 BIT V
 BPL DrawLine5

 DEC I
 JMP DrawLine10

.DrawLine5

 INC I
 JMP DrawLine10

.DrawLine6

 LDA PP
 BEQ DrawLine2

 LDA QQ                 \ If QQ + T < U, jump to DrawLine8 with A = QQ + T
 CLC
 ADC T
 CMP U
 BCC DrawLine8

 SBC U                  \ Set A = QQ + T - U

 BIT V                  \ If bit 7 of V is clear, jump to DrawLine7
 BPL DrawLine7

 DEC I                  \ By now, QQ + T >= U, V bit 7 is set, so decrement I

 JMP DrawLine8

.DrawLine7

 INC I                  \ By now, QQ + T >= U, V bit 7 is clear, so increment I

.DrawLine8

 STA QQ                 \ Update QQ to the value in A (i.e. QQ + T or
                        \ QQ + T - U

 BIT V                  \ If bit 6 of V is clear, jump to DrawLine9
 BVC DrawLine9

 DEC J                  \ V bit 6 is set, so decrement J

 BVS DrawLine10

.DrawLine9

 INC J                  \ V bit 6 is clear, so increment J

\ ******************************************************************************
\
\       Name: DrawLine (Part 3 of 3)
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ******************************************************************************

.DrawLine10

 LDA I                  \ Set X = I / 4
 LSR A                  \
 LSR A                  \ so X is the number of the character block containing
 TAX                    \ pixel (I, J)

 LDA J                  \ Set Y = J / 8
 LSR A                  \
 LSR A                  \ so Y is the number of the character row containing
 LSR A                  \ pixel (I, J)
 TAY

 LDA L4800,Y            \ Set P = Y-th byte of L4800 + X-th byte of L4F00
 CLC
 ADC L4F00,X
 STA P

 LDA L4820,Y            \ Set P+1 = Y-th byte of L4820 + X-th byte of L4F28
 ADC L4F28,X
 STA P+1

 LDA #159               \ Set Y = 159 - J
 SEC
 SBC J
 TAY

 LDA I                  \ Set X = bits 0 and 1 of I
 AND #%00000011
 TAX

 BIT N                  \ If N is negative, jump to DrawLine11 to skip the
 BMI DrawLine11         \ following three instructions

 LDA RR,X               \ Fetch the X-th byte of RR

 ORA (P),Y              \ OR it with the Y-th byte of P(1 0)

 JMP DrawLine12         \ Jump to DrawLine12 to skip the following three
                        \ instructions

.DrawLine11

 LDA RR,X               \ Fetch the X-th byte of RR and invert all its bits
 EOR #%11111111

 AND (P),Y              \ AND it with the Y-th byte of P(1 0)

.DrawLine12

 STA (P),Y              \ Update the Y-th byte of P(1 0) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

 DEC VV                 \ Decrement VV to step along the x-axis (for shallow
                        \ horizontal slopes) or the y-axis (for steep vertical
                        \ slopes)

 BNE DrawLine6          \ If VV is non-zero, jump up to DrawLine6

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L227A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L227A

 LDA L427B,Y
 LSR A
 LSR A
 CPY #0
 BNE L2284

 LSR A

.L2284

 STA T
 LDA L423B,Y
 EOR K
 AND #1
 BEQ L2296

 LDA #0
 SEC
 SBC T
 STA T

.L2296

 LDA L427D,Y
 LSR A
 LSR A
 CPY #0
 BNE L22A0

 LSR A

.L22A0

 STA U
 LDA L423D,Y
 CPY #0
 BNE L22AB

 EOR #1

.L22AB

 AND #1
 BEQ L22B6

 LDA #0
 SEC
 SBC U
 STA U

.L22B6

 CLC
 LDA T
 ADC U
 BMI L22C3

 LSR A
 LSR A
 LSR A
 ADC #0
 RTS

.L22C3

 SEC
 ROR A
 SEC
 ROR A
 SEC
 ROR A
 ADC #0
 RTS

\ ******************************************************************************
\
\       Name: DrawOrthoLine
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Draw an orthogonal line (i.e. vertical or horizontal)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   S                   Defines the starting coordinate for the line:
\
\                         * 0 = (JoyC, H + W)
\
\                         * 128 = (H + W, JoyC)
\
\   H + W               Coordinate of the start of the line (it doesn't matter
\                       how this value is split between H and W as only the sum
\                       is used)
\
\   JoyC                Coordinate of the start of the line
\
\   T                   Horizontal width/length of line
\
\   U                   Vertical width/length of line
\
\ Other entry points:
\
\   EraseOrthoLine      Use the value of G instead of H (so the coordinate is
\                       G + W) and use EOR Logic to draw the line (which will
\                       erase it if it is already on-screen)
\
\ ******************************************************************************

.DrawOrthoLine

 LDA H                  \ Set A = H

 JMP DrawOrthoLine1     \ Jump to DrawOrthoLine1 to draw the orthogonal line and
                        \ skip the code for the EraseOrthoLine entry point

.EraseOrthoLine

 LDA #128               \ Set N = 128 so the line is drawn with EOR logic, which
 STA N                  \ erases the line if it is already on-screen

 LDA G                  \ Set A = G

.DrawOrthoLine1

 CLC                    \ Set A = A + W
 ADC W

 BIT S                  \ If bit 7 of S is set, jump down to DrawOrthoLine2
 BMI DrawOrthoLine2

 STA J                  \ Set J = A

 LDA JoyC               \ Set I = JoyC
 STA I

                        \ We now have (I, J) = (JoyC, A + W)

 JMP DrawOrthoLine3     \ Jump down to DrawOrthoLine3

.DrawOrthoLine2

 STA I                  \ Set I = A

 LDA JoyC               \ Set J = JoyC
 STA J

                        \ We now have (I, J) = (A + W, JoyC)

.DrawOrthoLine3

 LDA #0                 \ Set V = 0 so the line is drawn in a positive direction
 STA V                  \ for both axes

 JSR DrawLine           \ Call DrawLine to draw a line from (I, J)

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L22F7
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L22F7

 PHP
 BPL L22FF

 EOR #&FF
 CLC
 ADC #1

.L22FF

 LSR A
 PLP
 PHP
 BCC L230C

 LSR A
 CMP #1
 BNE L230B

 LDA #2

.L230B

 LSR A

.L230C

 LSR A
 ADC #0
 PLP
 BPL L2317

 EOR #&FF
 CLC
 ADC #1

.L2317

 RTS

\ ******************************************************************************
\
\       Name: L2318
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2318

 LDX L4FFA
 INX
 CPX #7
 BCC L2322

 LDX #0

.L2322

 STX L4FFA
 JSR UpdateDashboard

\ ******************************************************************************
\
\       Name: L2328
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2328

 LDX L4FFB
 INX
 CPX #&0B
 BCC L2332

 LDX #7

.L2332

 STX L4FFB
 JSR UpdateDashboard

 LDA #&77
 STA Row28_Block26_5
 RTS

\ ******************************************************************************
\
\       Name: L233E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L233E

 LDX #2

.L2340

 CLC
 LDA KeyLoggerLow,X
 BEQ L2372

 ADC L0C2D,X
 STA L0C2D,X

 LDA KeyLoggerHigh,X
 STA P
 ADC L0C0C,X

 LDY L4F5C,X
 BEQ L235C

 DEC L4F5C,X

.L235C

 BNE L2367

 CLC
 ADC #3
 BIT P
 BPL L2367

 ADC #&FA

.L2367

 TAY
 BPL L2379

 CMP #&8C
 BCS L237F

 LDA #&8C
 BNE L237F

.L2372

 LDA #6
 STA L4F5C,X
 BNE L2382

.L2379

 CMP #&77
 BCC L237F

 LDA #&76

.L237F

 STA L0C0C,X

.L2382

 DEX
 BPL L2340

 JSR L46D8

 CLC
 LDA KeyLoggerLow+3     \ Throttle key
 BEQ L23B2

 ADC L0C0F
 TAX
 LDA KeyLoggerHigh+3
 ADC L0C1F
 TAY
 BMI L23A3

 CPY #5
 BCC L23A7

 LDY #5
 BNE L23A5

.L23A3

 LDY #0

.L23A5

 LDX #0

.L23A7

 STX L0C0F
 STY L0C1F

 LDX #11
 JSR UpdateDashboard

.L23B2

 LDX #4
 JSR L23F9

 BEQ L23C4

 BMI L23C1

 JSR UIndicator

 JMP L23C4

.L23C1

 JSR BIndicator

.L23C4

 LDX #5
 JSR L23F9

 BEQ L23D6

 BMI L23D3

 JSR FIndicator

 JMP L23D6

.L23D3

 JSR L247F

.L23D6

 LDY #2

.L23D8

 STY L0CC4
 JSR L1862

 LDY L0CC4
 DEY
 BPL L23D8

 LDA #0
 STA L0CCB
 STA L0CC4
 JSR L1AFC

 JSR L5000

 JSR L2318

 JSR L2328

 RTS

\ ******************************************************************************
\
\       Name: L23F9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L23F9

 LDA KeyLoggerLow,X
 BNE L2407

 STA L0CCE,X
 STA L0CD1,X

.L2404

 LDA #0
 RTS

.L2407

 TAY
 LDA L0CCE,Y
 BNE L2404

 LDA L0CEE,Y
 EOR #1
 STA L0CEE,Y
 LDA #1
 STA L0CCE,Y
 CPY #7
 BCC L2421

 LDA #&80
 RTS

.L2421

 LDA #1
 RTS

\ ******************************************************************************
\
\       Name: UIndicator
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the undercarriage indicator ("U") and related variables
\
\ ******************************************************************************

.UIndicator

 LDA L4F85              \ Set A = L4F85

 LDY Undercarriage      \ If Undercarriage is non-zero then the undercarriage is
 BNE UIndicator1        \ down, so jump to UIndicator1

                        \ If we get here then the undercarriage is up

 SEC                    \ Set A = A - 10
 SBC #10

 LDX #5                 \ Set X = 5 to store in L0CF0 below

 LDY #%01010101         \ Set Y to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the undercarriage
                        \ indicator when turned off

 BNE UIndicator2        \ Jump to UIndicator2 to update the indicator (this
                        \ BNE is effectively a JMP as Y is never zero)

.UIndicator1

                        \ If we get here then the undercarriage is down

 LDY L0CC5              \ If L0CC5 <> 0, jump to UIndicator3 to set the
 BNE UIndicator3        \ undercarriage to up and return from the subroutine

 CLC                    \ Set A = A + 10
 ADC #10

 LDX #10                \ Set X = 10 to store in L0CF0 below

 LDY #%01110111         \ Set Y to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the undercarriage
                        \ indicator when turned on

.UIndicator2

 STA L4F85              \ Store A in L4F85 (which is L4F85 incremented by 10 or
                        \ reduced by 10 for undercarriage down/up) ???

 STX L0CF0              \ Store X in L0CF0 (5 if undercarriage is up, 10 if it
                        \ is down) ???

 TYA                    \ Set A to the pixel pattern in Y

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the undercarriage indicator

.UIndicatorL1

 STA Row30_Block32_2,X  \ Update pixel row X of the undercarriage indicator to
                        \ the pixel pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL UIndicatorL1       \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

.UIndicator3

 LDA #0                 \ Set Undercarriage = 0 to set the undercarriage to up
 STA Undercarriage

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: FIndicator
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the flaps indicator ("F") and and related variables
\
\ ******************************************************************************

.FIndicator

 LDA L4F85              \ Set A = L4F85
 
 LDY Flaps              \ If Flaps is non-zero then the flaps are on, so jump
 BNE FIndicator1        \ to FIndicator1

                        \ If we get here then the flaps are off

 SEC                    \ Set A = A - 200
 SBC #200

 LDX #0                 \ Set X = 5 to store in L4F87 below

 LDY #%01000100         \ Set Y to a four-pixel block with pixel 2 in white, to
                        \ act as the centre of the flaps indicator when turned
                        \ off

 BNE FIndicator2        \ Jump to FIndicator2 to update the indicator (this
                        \ BNE is effectively a JMP as Y is never zero)

.FIndicator1

                        \ If we get here then the flaps are on

 CLC                    \ Set A = A + 200
 ADC #200

 LDX #152               \ Set X = 152 to store in L4F87 below

 LDY #%11001100         \ Set Y to a four-pixel block with pixels 2 and 3 in
                        \ white, to act as the centre of the flaps indicator
                        \ when turned on

.FIndicator2

 STA L4F85              \ Store A in L4F85 (which is L4F85 incremented by 200 or
                        \ reduced by 200 for flaps on/off) ???

 STX L4F87              \ Store X in L4F87 (5 if flaps are off, 152 if they are
                        \ on) ???

 TYA                    \ Set A to the pixel pattern in Y

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the flaps indicator

.FIndicator_L1

 STA Row30_Block35_2,X  \ Update pixel row X of the flaps indicator to the pixel
                        \ pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL FIndicator_L1      \ Loop back to update the next row of the indicator

.FIndicator_RTS

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L247F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L247F

 LDA L0CF1
 ORA L368F
 BNE FIndicator_RTS

 LDX #&E4
 JSR L4B4A

 LDA L0C15
 CLC
 ADC #&C8
 STA L07E4
 LDA #&FF
 LDX #&5F
 JSR L4B4C

 LDA #&14
 STA L075F
 LDA #&F6
 STA L095F
 LDA #&FC
 STA L0A5F
 LDA #&E4
 STA GG
 LDA #9
 STA L0CCB
 STA L0CF1
 JSR L1D8D

 LDX #&E5

.L24BC

 JSR L1E1A

 INX
 CPX #&E8
 BNE L24BC

 LDA #&5F
 STA GG
 JSR L1D8D

 LDX #&ED
 LDY #&60
 JSR L4B00

 LDY #&0C
 LDX #&60

.L24D6

 JSR L25B5

 JSR L257B

 INY
 CPY #&10
 BNE L24D6

 LDY #&0C
 LDX #&5F
 JSR L257B

 STX L0CCF
 LDA #&60
 STA GG
 JSR L19A0

 LDA #&61
 STA GG
 JSR L19A0

 LDX #&62
 LDY #&60
 JSR L1A67

 LDY #&0F
 LDX #&62

.L2504

 JSR L257B

 DEX
 DEY
 CPY #&0C
 BNE L2504

 RTS

\ ******************************************************************************
\
\       Name: BIndicator
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the brakes indicator ("B")
\
\ ******************************************************************************

.BIndicator

 LDA #%01110111         \ Set A to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the brakes indicator
                        \ when turned on

 LDX Brakes             \ If Brakes is non-zero then the brakes are on, so
 BNE BIndicator1        \ jump to BIndicator1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the brakes indicator
                        \ when turned off

.BIndicator1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the brakes indicator

.BIndicator2

 STA Row30_Block37_2,X  \ Update pixel row X of the brakes indicator to the
                        \ pixel pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL BIndicator2        \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: TIndicator
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the Theme indicator ("T")
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.TIndicator

 LDA #%01110111         \ Set A to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the Theme indicator
                        \ when turned on

 LDX Theme              \ If Theme is positive then the Theme is enabled, so
 BPL TIndicator1        \ jump to TIndicator1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the Theme indicator
                        \ when turned off

.TIndicator1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the Theme indicator

.TIndicator_L1

 STA Row30_Block0_2,X   \ Update pixel row X of the Theme indicator to the pixel
                        \ pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL TIndicator_L1      \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScanKeyboard
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The internal key number of the key to scan for
\
\ Returns:
\
\   Z flag              If set (BEQ) then the key is being pressed, if clear
\                       (BNE) then it is not being pressed
\
\ ******************************************************************************

.ScanKeyboard

 LDA #129               \ Call OSBYTE with A = 129, X = key number and Y = &FF
 LDY #&FF               \ to scan the keyboard for the key in X, returning the
 JSR OSBYTE             \ following in both X and Y:
                        \
                        \   * 0 = the key is not being pressed
                        \
                        \   * &FF = the key is being pressed

 CPX #&FF               \ Set the Z flag depending on whether the key is being
                        \ pressed

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScanKeyTable
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Scan the keyboard for keys in the two key tables and update the
\             key logger
\
\ ------------------------------------------------------------------------------
\
\ This routine updates the key logger, which is stored in KeyLoggerHigh and
\ KeyLoggerLow. If a key is pressed, then the corresponding 16-bit value in the
\ key logger is set to the corresponding value from the KeyTable tables, which
\ are stored in KeyTable1Low/KeyTable1High and KeyTable2Low/KeyTable2High.
\
\ ******************************************************************************

.ScanKeyTable

 LDA #5                 \ Set V = 5 to act as an offset as we work our way
 STA V                  \ through the six keys in KeyTable1

.ScanKeyTable_L1

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX KeyTable1,Y        \ Scan the keyboard to see if the Y-th key in KeyTable1
 JSR ScanKeyboard       \ is being pressed

 BNE ScanKeyTable2      \ If the key is not being pressed, jump down to
                        \ ScanKeyTable2 to check the Y-th key in KeyTable1

 LDX V                  \ Set X = the offset of the key we are processing
 
 LDY KeyTable1Low,X     \ Fetch the key logger value for this key press into
 LDA KeyTable1High,X    \ (A Y)
 
 JMP ScanKeyTable4      \ Jump down to ScanKeyTable4 to store (A Y) in the key
                        \ logger

.ScanKeyTable2

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX KeyTable2,Y        \ Scan the keyboard to see if the Y-th key in KeyTable2
 JSR ScanKeyboard       \ is being pressed

 BNE ScanKeyTable3      \ If the key is not being pressed, jump down to
                        \ ScanKeyTable3 to store 0 in the key logger

 LDX V                  \ Set X = the offset of the key we are processing

 LDY KeyTable2Low,X     \ Fetch the key logger value for this key press into
 LDA KeyTable2High,X    \ (A Y)

 JMP ScanKeyTable4      \ Jump down to ScanKeyTable4 to store (A Y) in the key
                        \ logger

.ScanKeyTable3

 LDA #0                 \ Set A = 0

 LDX V                  \ Set X = the offset of the key we are processing

 TAY                    \ Set Y = 0, so the key logger value in (A Y) is 0

.ScanKeyTable4

 STA KeyLoggerHigh,X    \ Store the high byte of the key logger value in (A Y)
                        \ in the X-th byte of KeyLoggerHigh

 TYA                    \ Store the low byte of the key logger value in (A Y)
 STA KeyLoggerLow,X     \ in the X-th byte of KeyLoggerLow

 DEC V                  \ Decrement the offset to point to the next key to
                        \ process

 BPL ScanKeyTable_L1    \ Loop back until we have processed all six key pairs

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L257B
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L257B                  \ MOBJ or UOBJ in original

 LDA L4400,Y
 CLC
 ADC L0900,X
 STA L4400,Y
 LDA L4478,Y
 ADC L4A00,X
 STA L4478,Y
 LDA L4428,Y
 CLC
 ADC L0A00,X
 STA L4428,Y
 LDA L44A0,Y
 ADC L0B00,X
 STA L44A0,Y
 LDA L4450,Y
 CLC
 ADC L0700,X
 STA L4450,Y
 LDA L44C8,Y
 ADC L4900,X
 STA L44C8,Y
 RTS

\ ******************************************************************************
\
\       Name: L25B5
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L25B5

 LDA #0
 STA L4400,Y
 STA L4478,Y
 STA L4428,Y
 STA L44A0,Y
 STA L4450,Y
 STA L44C8,Y
 RTS

\ ******************************************************************************
\
\       Name: L25CA
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L25CA

 LDA #&80
 JSR OSBYTE

 TYA
 CMP #&F7
 BCC L25D6

 LDA #&F6

.L25D6

 CMP #&0C
 BCS L25DC

 LDA #&0C

.L25DC

 SEC
 SBC #&80
 EOR #&FF
 CLC
 ADC #1
 RTS

\ ******************************************************************************
\
\       Name: Reset
\       Type: Subroutine
\   Category: Start and end
\    Summary: Reset most variables to prepare for a new flight
\
\ ******************************************************************************

.Reset

 LDX #0                 \ Set A = 0 to use as our zero value

 TXA                    \ Set X = 0 to use as a counter for zeroing 256 bytes in
                        \ the ResetL1 loop

 STA L4202              \ Set L4202 = 0

 STA L4F87              \ Set L4F87 = 0

 STA L368F              \ Set L368F = 0

 STA L44F0              \ Set L44F0 = 0

 STA L369C              \ Set L369C = 0

 STA L369D              \ Set L369D = 0

.ResetL1

                        \ This loop zeroes &0400 to &04FF

 STA L0400,X            \ Zero the X-th byte of page &4

 DEX                    \ Decrement the byte counter

 BNE ResetL1            \ Loop back until we have zeroed &0400 to &04FF

 LDX #255               \ Set X = 255 to use as a counter for zeroing 255 bytes
                        \ in the ResetL2 loop

 STA L05C8              \ Set L05C8 = 0

 STA L4206              \ Set L4206 = 0

.ResetL2

                        \ This loop zeroes &0C00 to &0CFE, which resets all of
                        \ the variables in the &0C00 workspace

 STA L0BFF,X            \ Zero the X-1-th byte of page &C

 DEX                    \ Decrement the byte counter

 BNE ResetL2            \ Loop back until we have zeroed &0C00 to &0CFE

 LDX #7                 \ Set X = 7 to use as a counter for zeroing 8 bytes in
                        \ the ResetL3 loop

.ResetL3

                        \ This loop zeroes 8 bytes at L4210

 STA L4210,X            \ Zero the X-th byte of L4210

 DEX                    \ Decrement the byte counter

 BPL ResetL3            \ Loop back until we have zeroed L4210 to L4210+7

 LDA #72                \ Set L0CFF = 72
 STA L0CFF

 LDA #92                \ Set L0CEF = 92
 STA L0CEF

 LDA #198               \ Set L0CFD = 198
 STA L0CFD

 LDA #229               \ Set L0CED = 229
 STA L0CED

 LDA #10                \ Set L0CEE = 10
 STA L0CEE

 STA L0CF8              \ Set L0CF8 = 10

 LDA #242               \ Set L4F85 = 242
 STA L4F85

 LDA #1                 \ Set Undercarriage = 1 (undercarriage is down)
 STA Undercarriage

 STA Brakes             \ Set Brakes = 1 (brakes on)

 STA L0CE8              \ Set L0CE8 = 1

 JSR UIndicator         \ Update the undercarriage indicator

 LDA #1                 \ Set L0CC5 = 1
 STA L0CC5

 LDA #47                \ Set L0CD1 = 47
 STA L0CD1

 LDA #255               \ Set Theme = 255
 STA Theme

 STA L0CD0              \ Set L0CD0 = 255

 LDX #7                 \ Set X = 7 to use as a counter for zeroing 8 bytes in
                        \ the ResetL4 loop

 STX L0CFA              \ Set L0CFA = 7

.ResetL4

                        \ This loop zeroes 8 bytes at L4208

 STA L4208,X            \ Zero the X-th byte of L4208

 DEX                    \ Decrement the byte counter

 BPL ResetL4            \ Loop back until we have zeroed L4208 to L4208+7

 LDX #2                 \ Set X = 2 to use as a counter for zeroing 3 bytes in
                        \ the ResetL5 loop

.ResetL5

                        \ This loop zeroes L4203, L4203 and L4204

 STA L4203,X            \ Zero the X-th byte of L4203

 DEX                    \ Decrement the byte counter

 BPL ResetL5            \ Loop back until we have zeroed L4203 to L4203+2

 JSR TIndicator         \ Update the Theme indicator

 LDX #11                \ ???
 JSR UpdateDashboard

 LDA #65                \ Set L3692 = 65 to use as a counter for calling L33A1
 STA L3692              \ 66 times in the ResetL6 loop

.ResetL6

 DEC L3692              \ Decrement the counter in L3692

 JSR L33A1              \ ???

 LDA L3692              \ Loop back until L3692 = 0
 BNE ResetL6

                        \ Fall through into Reset2 to ???

\ ******************************************************************************
\
\       Name: Reset2
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Reset2

 LDA #80                \ Set L0900 = 90
 STA L0900

 LDA #1                 \ Set L0CE6 = 1
 STA L0CE6

 STA L4A00              \ Set L4A00 = 1

 JSR L2D32              \ ???

 LDY #33                \ ???
 JSR L25B5

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: MainLoop
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.MainLoop

 LDA #0                 \ Set L369F = 0 ???
 STA L369F

 STA L369E              \ Set L369E = 0 ???

 LDA #14                \ Call SetEnvelope with A = 14 to set up the second
 JSR SetEnvelope        \ sound envelope

.MainLoopL1

 JSR ClearCanopy        \ Clear the canopy view, leaving the canopy edges alone

 JSR Reset              \ Reset most variables to prepare for a new flight

 JSR ScanKeyTable       \ Scan for key presses and update the key logger

 JSR L233E

 JSR L2BDC

 JSR FIndicator         \ Update the flaps indicator

 JSR BIndicator         \ Update the brakes indicator

 LDA #%01000000         \ Set the 6522 User VIA auxiliary control register
 STA VIA+&6B            \ (SHEILA &6B) to %01000000 to disable the shift
                        \ register

 LDA #234               \ Set 6522 User VIA T1C-L timer 1 high-order counter
 STA VIA+&65            \ (SHEILA &65) to 234 to start the T1 counter
                        \ counting down at a rate of 1 MHz

.L26C4

 LDA NN
 STA L0CC6

 JSR L2F1C

 JSR ScanKeyTable       \ Scan for key presses and update the key logger

 LDA L0CF1
 BNE L2701

 JSR L233E

 LDA L0CF1
 BEQ L2704

 LDA #2
 STA L0CD9
 LDY #&21

.L26E3

 LDA L04D8,Y
 STA L41FA,Y
 DEY
 CPY #&1E
 BCS L26E3

 LDY II
 LDA #&3C
 STA L0500,Y
 INY
 LDA #&3D
 STA L0500,Y
 INY
 STY II
 JMP L2704

.L2701

 JSR L233E

.L2704

 LDX #&13
 LDA #0
 STA L0CCA
 STA L05C8

.L270E

 STA L04D8,X
 STA L04EC,X
 DEX
 BPL L270E

 LDA L0CF1
 BEQ L272C

 JSR L2EE6

 LDA L0CD9
 BEQ L272C

 DEC L0CD9
 LDA #6
 JSR L4D87

.L272C

 LDA Theme
 BMI L2734

 JSR L2DAC

.L2734

 JSR L2873

 JSR L4CB0

 LDY #2
 JSR L4244

 LDY #&22
 JSR L4244

 INC L4206
 LDA L4206
 CLC
 ADC #4
 AND #7
 BNE L2767

 LDY #1
 JSR L2CD3

 LDX L4205
 BMI L2767

 LDY #&21
 LDA L4210,X
 CMP #&1B
 BCC L2767

 JSR L2CD3

.L2767

 LDA Theme
 BNE L279D

 LDA L0CF1
 BEQ L279A

 LDA #&21
 STA L0CCC

.L2776

 LDY L0CCC
 LDA L41FA,Y
 BPL L2786

 JSR L3053

 LDA L368F
 BNE L2792

.L2786

 DEC L0CCC
 LDA L0CCC
 CMP #&1E
 BCS L2776

 BCC L279A

.L2792

 STA L368C
 LDA #0
 STA L0CF1

.L279A

 JSR L2F4E

.L279D

 LDA L0CC5
 BEQ L27AF

 LDX #&86               \ Scan the keyboard to see if the right arrow is being
 JSR ScanKeyboard       \ pressed

 BNE L27AF

 JSR L4D92

 JMP MainLoopL1

.L27AF

 LDA L0CE8
 BEQ L27E2

 BMI L27D3

 LDA L0CF1
 BEQ L27C8

 LDA Theme
 BPL L27C8

 LDA #8
 STA Theme
 JSR TIndicator

.L27C8

 LDA L0CE9
 BNE L27D0

 JSR L3387

.L27D0

 JSR L33C7

.L27D3

 LDA L0CF9
 BEQ L27E2

 LDX #0
 STX L0CF9
 LDA #&15
 JSR L4BCB

.L27E2

 JSR L33A1

 LDX #&DC               \ Scan the keyboard to see if "T" is being pressed
 JSR ScanKeyboard

 BNE L2802

 LDA L0CC9
 BNE L2804

 LDA L0CF7
 BNE L2807

 LDA L0CE9
 EOR #1
 JSR L36A0

 LDA #1
 BNE L2804

.L2802

 LDA #0

.L2804

 STA L0CC9

.L2807

 LDA L05C8
 CMP #&23
 BCS L2817

 JSR L293A

 JSR L293A

 JSR L293A

.L2817

 LDX #&70
 LDY #0
 LDA #1
 JSR OSWORD

 JSR L3F10

 BCC L2807

 JSR L28B6

 JSR L2C37

 JSR L4D6E

 LDA L0CD8
 BEQ L2839

 CMP #&DC
 BNE L2840

 BEQ L2849

.L2839

 LDX #&C8               \ Scan the keyboard to see if "P" is being pressed
 JSR ScanKeyboard

 BNE L2851

.L2840

 DEC L0CD8
 JSR L4C12

 JMP L2851

.L2849

 JSR L4883

 LDA #0
 STA L0CD8

.L2851

 LDX L0CC6
 CPX NN
 BNE L285B

 JMP L26C4

.L285B

 INX
 LDY L0600,X
 STX L0CC6
 LDX L3F30,Y
 LDA #0
 STA L0400,X
 LDX L3E00,Y
 STA L0400,X
 JMP L2851

\ ******************************************************************************
\
\       Name: L2873
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2873

 LDX II
 BEQ L28B5

 LDA #&FF
 STA LL
 LDA #0
 STA KK

.L287F

 LDX KK
 LDA L0500,X
 STA JJ
 LDA #1
 STA HH
 JSR L2973

 LDA JJ
 BEQ L2896

 LDX L0CCE
 BNE L28A0

.L2896

 INC LL
 LDX LL
 STA L0500,X
 JMP L28A7

.L28A0

 INC NN
 LDX NN
 STA L0600,X

.L28A7

 INC KK
 LDA KK
 CMP II
 BCC L287F

 LDA LL
 ADC #0
 STA II

.L28B5

 RTS

\ ******************************************************************************
\
\       Name: L28B6
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L28B6

 LDA II
 BEQ L2929

 LDA #&FF
 STA LL
 LDA #0
 STA KK

.L28C2

 LDX KK
 LDY L0500,X
 STY JJ
 LDX L3F30,Y
 STX GG
 STX L
 LDX L3E00,Y
 STX M
 JSR L0D01

 LDA M
 STA GG
 JSR L0D01

 LDX L
 LDA L0400,X
 STA L0CC7
 LDX M
 LDA L0400,X
 STA N
 AND L0CC7
 AND #&30
 BEQ L2904

 LSR A
 LSR A
 STA T
 LDA N
 EOR L0CC7
 EOR #&FF
 AND T
 BNE L2910

.L2904

 INC LL
 LDX LL
 LDA JJ
 STA L0500,X
 JMP L291B

.L2910

 LDA JJ
 BEQ L2904

 INC NN
 LDX NN
 STA L0600,X

.L291B

 INC KK
 LDA KK
 CMP II
 BCC L28C2

 LDA LL
 ADC #0
 STA II

.L2929

 LDX L05C8
 BEQ L2939

 LDA #0

.L2930

 LDY L05C8,X
 STA L0400,Y
 DEX
 BNE L2930

.L2939

 RTS

\ ******************************************************************************
\
\       Name: L293A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L293A

 LDA MM
 CMP NN
 BEQ L2972

 CLC
 ADC #1
 STA MM
 TAX
 LDA L0600,X
 STA JJ
 CMP #&3C
 BEQ L293A

 CMP #&3D
 BEQ L293A

\ ******************************************************************************
\
\       Name: L2953
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2953

 LDA #0
 STA HH
 JSR L2973

 LDA JJ
 LDX L0CCE
 BEQ L2969

 INC NN
 LDX NN
 STA L0600,X
 RTS

.L2969

 INC II
 INC LL
 LDX LL
 STA L0500,X

.L2972

 RTS

\ ******************************************************************************
\
\       Name: L2973
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2973

 LDA #0
 STA L0CCE
 STA L0CBF
 LDX JJ
 LDY L3E00,X
 STY M
 LDY L3F30,X
 STY L
 CPX #&0C
 BCS L2999

 CPX #0
 BNE L2993

 JSR L2C95

 RTS

.L2993

 JSR L31BD

 JMP L2A6F

.L2999

 LDA #2
 STA L0CC8

.L299E

 LDA L0400,Y
 BPL L29A6

 JMP L2A4F

.L29A6

 TYA
 PHA
 STA L0CC0

.L29AB

 LDA L4600,Y
 CMP #&28
 BCC L29E3

 SEC
 SBC #&28
 STA L0CCF
 TAY
 LDA L0400,Y
 BMI L2A14

 TYA
 PHA
 LDX L05C8
 CPX #&31
 BCS L2A01

 INC L05C8
 LDX L05C8
 STA L05C8,X
 BNE L29AB

.L29D2

 PLA
 STA GG
 LDA L04D8,Y
 BMI L29E0

 LDA #&80
 STA L0CCE
 RTS

.L29E0

 JMP L2A4D

.L29E3

 TAY
 STY L0CCC
 CMP #&10
 BCS L29EF

 CMP #&0C
 BCS L29D2

.L29EF

 LDA L04D8,Y
 AND #&40
 BNE L29F9

 JSR L2A8C

.L29F9

 LDY L0CCC
 LDA L04D8,Y
 BMI L2A0D

.L2A01

 LDA #&80
 STA L0CCE

.L2A06

 PLA
 CMP L0CC0
 BNE L2A06

 RTS

.L2A0D

 TYA
 CLC
 ADC #&D8
 STA L0CCF

.L2A14

 PLA
 CMP L0CC0
 BEQ L2A3B

 STA GG
 LDA #0
 STA L0CC4
 STA L0CCB
 JSR L19A0

 LDA L0CCE
 BNE L2A06

 LDY GG
 STY L0CCF
 LDA #&80
 ORA L0400,Y
 STA L0400,Y
 BNE L2A14

.L2A3B

 STA GG
 LDA #0
 STA L0CC4
 STA L0CCB
 JSR L19A0

 LDA L0CCE
 BNE L2A8B

.L2A4D

 LDY GG

.L2A4F

 LDA HH
 BNE L2A5D

 LDX JJ
 JSR L4B5F

 STA L0CCE
 BNE L2A8B

.L2A5D

 LDA #&80
 ORA L0400,Y
 STA L0400,Y
 DEC L0CC8
 BEQ L2A6F

 LDY M
 JMP L299E

.L2A6F

 LDY M
 LDA L4900,Y
 BPL L2A8B

 LDY L
 LDA L4900,Y
 BPL L2A8B

 LDA L0CCE
 ORA #&80
 STA L0CCE
 LDY L0CBF
 JSR L4C96

.L2A8B

 RTS

\ ******************************************************************************
\
\       Name: L2A8C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2A8C

 LDY L0CCC
 STY L0CBF
 TYA
 CLC
 ADC #&D8
 STA N
 LDA #1
 STA K
 CPY #&0C
 BCC L2AB5

 CPY #&10
 BCS L2AB5

 LDA #0
 STA K
 LDA L44A0,Y
 BPL L2AD8

 TYA
 AND #1
 BNE L2AD8

 JMP L2B93

.L2AB5

 LDA N
 STA GG
 CPY #6
 BCC L2AD8

 CPY #&0A
 BCS L2AD8

 LDA #8
 STA L0CE6

.L2AC6

 LDX L3EC2,Y
 LDA L3ED0,X
 STA L4478,Y
 LDA L3EF0,X
 STA L44C8,Y
 JMP L2B20

.L2AD8

 CPY #&22
 BCS L2B20

 CPY #&1E
 BCC L2B20

 BNE L2B09

 LDA Theme
 BNE L2B1D

 LDA #8
 STA L0CE6

.L2AEC

 LDX L4202
 LDA L4210,X
 BNE L2B1A

 LDA L4208,X
 BPL L2AF9

.L2AF9

 TAX
 LDA L4478,X
 STA L4478,Y
 LDA L44C8,X
 STA L44C8,Y
 JMP L2B20

.L2B09

 LDX L41E4,Y
 BMI L2B1A

 LDA L4210,X
 CMP #&1B
 BCS L2B20

 LDA L4208,X
 BPL L2AF9

.L2B1A

 JMP L2BA0

.L2B1D

 JMP L2BB7

.L2B20

 LDX GG
 SEC
 LDA L4400,Y
 SBC L0CED
 STA L0900,X
 LDA L4478,Y
 SBC L0CFD
 STA L4A00,X
 STA T
 LDA #0
 SBC L0C6D
 JSR L2BC0

 BNE L2B93

 SEC
 LDA L4428,Y
 SBC L0CEE
 STA L0A00,X
 LDA L44A0,Y
 SBC L0CFE
 STA L0B00,X
 STA T
 LDA #0
 SBC L0C6E
 JSR L2BC0

 BNE L2B93

 SEC
 LDA L4450,Y
 SBC L0CEF
 STA L0700,X
 LDA L44C8,Y
 SBC L0CFF
 STA L4900,X
 STA T
 LDA #0
 SBC L0C6F
 JSR L2BC0

 BNE L2B93

 LDA #0
 STA L0CCB
 JSR L1D8D

 LDY L0CCC
 LDA L0CCE
 BNE L2BB7

 LDA #&C0
 BNE L2BB9

.L2B93

 JSR L4C96

 BCC L2BA0

 DEC L0CE6
 BEQ L2BB7

 JMP L2AC6

.L2BA0

 CPY #&1E
 BNE L2BB7

 LDA L4202
 CLC
 ADC #1
 AND #7
 STA L4202
 DEC L0CE6
 BEQ L2BB7

 JMP L2AEC

.L2BB7

 LDA #&40

.L2BB9

 ORA L04D8,Y
 STA L04D8,Y
 RTS

\ ******************************************************************************
\
\       Name: L2BC0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2BC0

 BPL L2BCD

 CMP #&FF
 BNE L2BD9

 LDA T
 EOR #&FF
 JMP L2BD1

.L2BCD

 BNE L2BD9

 LDA T

.L2BD1

 CMP L3BD8,Y
 BCS L2BD9

 LDA #0
 RTS

.L2BD9

 LDA K
 RTS

\ ******************************************************************************
\
\       Name: L2BDC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2BDC

 LDA #&80
 STA L0CC2
 LDA #&0F
 STA L0CC3
 JSR L14AC

 LDA #0
 STA JJ
 STA II
 LDA #&FF
 STA NN
 STA LL
 STA MM

.L2BF7

 JSR L2953

 INC JJ
 LDA JJ
 CMP L4207
 BCC L2BF7

 LDX #3
 JSR L2C1C

\ ******************************************************************************
\
\       Name: L2C08
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2C08

 LDX #&0F
 LDY #&80
 LDA L0CC3
 BMI L2C15

 LDX #&F0
 LDY #&40

.L2C15

 STX L0CC3
 STY L0CC2
 RTS

\ ******************************************************************************
\
\       Name: L2C1C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2C1C

 LDY #7
 BNE L2C22

\ ******************************************************************************
\
\       Name: L2C20
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2C20

 LDY #0

.L2C22

 LDA #&13
 JSR OSWRCH

 TXA
 JSR OSWRCH

 TYA
 LDX #3

.L2C2E

 JSR OSWRCH

 LDA #0
 DEX
 BPL L2C2E

 RTS

\ ******************************************************************************
\
\       Name: L2C37
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2C37

 JSR L14AC

 LDA II
 BNE L2C40

 BEQ L2C91

.L2C40

 LDA #0
 STA KK

.L2C44

 TAX
 LDA L0500,X
 STA JJ
 BNE L2C51

 JSR L3347

 LDA JJ

.L2C51

 TAX
 LDY L3E00,X
 STY M
 LDA #0
 STA L0400,Y
 LDY L3F30,X
 STY L
 STA L0400,Y
 JSR L107F

 INC KK
 LDA KK
 CMP II
 BCC L2C44

 JSR L4E10

 LDA L0CC3
 BMI L2C84

 LDX #2
 JSR L2C20

 LDX #1
 JSR L2C1C

 JMP L2C8E

.L2C84

 LDX #1
 JSR L2C20

 LDX #2
 JSR L2C1C

.L2C8E

 JSR L178D

.L2C91

 JSR L2C08

 RTS

\ ******************************************************************************
\
\       Name: L2C95
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2C95

 LDX M
 JSR L4B4A

 LDX L
 JSR L4B4A

 LDA #&F0
 STA L4A00,X
 STX GG

.L2CA6

 BIT L0CFA
 BMI L2CB1

 BVS L2CB3

.L2CAD

 LDA #&28
 BNE L2CB5

.L2CB1

 BVS L2CAD

.L2CB3

 LDA #&D8

.L2CB5

 STA L4900,X
 LDA #&80
 ORA L0400,X
 STA L0400,X
 LDA #&1B
 STA L0CCB
 JSR L1D8D

 CPX M
 BEQ L2CD2

 LDX M
 STX GG
 BNE L2CA6

.L2CD2

 RTS

\ ******************************************************************************
\
\       Name: L2CD3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2CD3

 LDX #0
 STX L0CE6
 CPY #&21
 BNE L2CE1

 LDA #1
 STA L0CE6

.L2CE1

 LDA L4478,Y
 SEC
 SBC L0CFD,X
 STA L0CA8,X
 LDA #0
 SBC L0C6D,X
 STA L0CB8,X
 TYA
 CLC
 ADC #&28
 TAY
 INX
 CPX #3
 BNE L2CE1

 LDX #&A8
 LDY #0
 STY GG
 JSR L4B00

 LDA #0
 STA L0CCB
 JSR L1D8D

 LDA L4A00
 STA R
 LDA L4900
 STA S
 LDX #3

.L2D1A

 LSR R
 ROR L0900
 LSR S
 ROR L0700
 DEX
 BPL L2D1A

 LSR R
 LDA L0900
 ROR A
 ADC #0
 STA L0900

\ ******************************************************************************
\
\       Name: L2D32
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2D32

 LDX L0CE6
 LDA L3688,X
 STA I
 LDA L368A,X
 STA J
 LDA #&80
 STA N
 LDA L2E9C
 JSR L2E2F

 JSR DrawLine

 LDX L0CE6
 BNE L2D66

 LDA #&88
 STA Row25_Block35_6
 STA Row26_Block35_0
 STA Row26_Block35_1
 LDA #&11
 STA Row25_Block34_7
 LDA #&CC
 STA Row25_Block35_7

.L2D66

 LDA L0900
 BIT L4A00
 BPL L2D73

 EOR #&FF
 CLC
 ADC #1

.L2D73

 CMP #&0D
 BCS L2DAB

 LDA L0700
 BIT L4900
 BPL L2D84

 EOR #&FF
 CLC
 ADC #1

.L2D84

 CMP #&1A
 BCS L2DAB

 LDA L0900
 CLC
 ADC #&8C
 STA I
 STA L3688,X
 LDA L0700
 CLC
 ADC #&D0
 STA J
 STA L368A,X
 LDA #0
 STA N
 LDA L0CFB
 JSR L2E2F

 JSR DrawLine

.L2DAB

 RTS

\ ******************************************************************************
\
\       Name: L2DAC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2DAC

 LDY L4205
 BMI L2DCC

 LDA L4210,Y
 CMP #&1B
 BNE L2DFA

 LDA L44C1
 CMP #&0C
 BCS L2DCD

 LDA L4449
 ADC #&0A
 STA L4449
 BCC L2DCC

 INC L44C1

.L2DCC

 RTS

.L2DCD

 LDX #0
 STX T

.L2DD1

 LDA L4499,X
 BEQ L2DE9

 LDA L4421,X
 SEC
 SBC L0CF8
 STA L4421,X
 BCS L2DE5

 DEC L4499,X

.L2DE5

 LDA #1
 STA T

.L2DE9

 CPX #&50
 BEQ L2DF1

 LDX #&50
 BNE L2DD1

.L2DF1

 LDA T
 BNE L2DCC

 LDA #&1C
 STA L4210,Y

.L2DFA

 CMP #&1C
 BNE L2DCC

 LDA L368F
 BNE L2DCC

 LDA L4449
 SEC
 SBC #&0A
 STA L4449
 BCS L2E11

 DEC L44C1

.L2E11

 LDA L44C1
 BNE L2DCC

 LDA L4449
 CMP #&0A
 BCS L2DCC

 JSR L4EE8

 LDA #&5A
 JSR L2ED3

 JSR L4D92

 TSX
 INX
 INX
 TXS
 JMP MainLoopL1

\ ******************************************************************************
\
\       Name: L2E2F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2E2F

 CPX #0
 BEQ L2E37

 LDY #1
 BNE L2E59

.L2E37

 STA L2E9C
 CLC
 ADC #&10
 ASL A
 STA P
 PHP
 ROR A
 SEC
 SBC #&40
 PLP
 ROR A
 EOR #&C0
 STA V
 LDX #2
 LDY #4
 BIT P
 BVS L2E5B

 BPL L2E59

 LDY #1
 BNE L2E5B

.L2E59

 LDX #1

.L2E5B

 STX T
 STY U
 RTS

\ ******************************************************************************
\
\       Name: L2E60
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2E60

 EQUB &08, &0C, &0E, &0F, &04, &06, &07, &02
 EQUB &03, &01

.L2E6A

 EQUB &01, &03, &07, &0F, &02, &06, &0E, &04
 EQUB &0C, &08, &80, &C0, &E0, &F0, &40, &60
 EQUB &70, &20, &30, &10, &10, &30, &70, &F0
 EQUB &20, &60, &E0, &40, &C0, &80, &0F, &0F
 EQUB &0F, &0F, &0F, &0F, &0F, &0F, &0F, &0F
 EQUB &F0, &F0, &F0, &F0, &F0, &F0, &F0, &F0
 EQUB &F0, &F0

.L2E9C

 EQUB &20

.L2E9D

 EQUB &20, &20, &20

\ ******************************************************************************
\
\       Name: ClearCanopy
\       Type: Subroutine
\   Category: Graphics
\    Summary: Clear the canopy to black, leaving the canopy edges alone
\
\ ******************************************************************************

.ClearCanopy

 LDX #0                 \ Set X = 0 so we clear the canopy to black

                        \ Fall through into FillCanopy to fill the canopy with
                        \ black, leaving the top and side edges alone

\ ******************************************************************************
\
\       Name: FillCanopy
\       Type: Subroutine
\   Category: Graphics
\    Summary: Fill the canopy with a specified colour, leaving the canopy edges
\             alone
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The colour to fill the canopy with
\
\ ******************************************************************************

.FillCanopy

 TXA                    \ Copy the colour into X

 LDX #19                \ Set R = 19, so we clear 19 character rows (the whole
 STX R                  \ canopy view except for the top row containing the
                        \ canopy edge)

 LDY #HI(Row1_Block1_0) \ Set (Y X) to the screen address for row 1, block 1
 LDX #LO(Row1_Block1_0)

                        \ Fall through into FillCanopyRows to fill the canopy
                        \ view, from the top row to the bottom, avoiding the top
                        \ and side edges

\ ******************************************************************************
\
\       Name: FillCanopyRows
\       Type: Subroutine
\   Category: Graphics
\    Summary: Fill multiple screen rows with a particular colour, avoiding the
\             canopy edges
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The colour to fill the canopy with
\
\   (Y X)               The screen address to start filling from
\
\   R                   The number of character rows to fill
\
\ ******************************************************************************

.FillCanopyRows

 STY P+1                \ Set P(1 0) = (Y X)
 STX P

 STA S                  \ Store the value we want to store into S

.FillCanopyRows1

 LDY #0                 \ Set a byte counter in Y

 LDA S                  \ Fetch the value of A that we stored in S above

.FillCanopyRowsL1

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BNE FillCanopyRowsL1   \ Loop back until we have set 256 bytes, starting at
                        \ P(1 0), to the value in A

 LDY #47                \ Set a byte counter in Y for 47 bytes

 INC P+1                \ Set P(1 0) = P(1 0) + 256
                        \
                        \ so it points to the next byte to fill after the 256
                        \ bytes we just did

.FillCanopyRowsL2

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BPL FillCanopyRowsL2   \ Loop back until we have set 47 bytes, starting at
                        \ P(1 0), to the value in A

 LDA P                  \ Set P(1 0) = P(1 0) + 64
 CLC                    \
 ADC #64                \ starting with the low bytes
 STA P

 BCC FillCanopyRows2    \ If the above addition didn't overflow, skip the next
                        \ instruction

 INC P+1                \ The above addition overflowed, so increment the high
                        \ byte of P(1 0) to point to the next page in memory

                        \ So now P(1 0) is 320 greater than at the start, so it
                        \ points to the next character row in screen memory

.FillCanopyRows2

 DEC R                  \ Decrement the row counter in R

 BNE FillCanopyRows1    \ Loop back until we have updated R rows

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L2ED3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2ED3                  \ DLP. in original

 STA T

.L2ED5

 STA U

.L2ED7

 STA V

.L2ED9

 DEC V
 BNE L2ED9

 DEC U
 BNE L2ED7

 DEC T
 BNE L2ED5

 RTS

\ ******************************************************************************
\
\       Name: L2EE6
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2EE6                  \ UBUL in original

 LDY #&0F
 STY L0CCC
 LDA #&62
 STA GG

.L2EEF

 TYA
 CLC
 ADC #&D8
 TAX
 JSR L257B

 LDA #0
 STA L0CCE
 JSR L2A8C

 BPL L2F0A

 LDY GG
 LDX #&3C
 JSR L4B5F

 BEQ L2F0F

.L2F0A

 LDA #0
 STA L0CF1

.L2F0F

 DEC GG
 DEC L0CCC
 LDY L0CCC
 CPY #&0C
 BCS L2EEF

 RTS

\ ******************************************************************************
\
\       Name: L2F1C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2F1C                  \ SUTR in original

 LDX Theme
 BMI L2F4D

 BEQ L2F4D

 LDA L0CC5
 BNE L2F4D

 STA L420F,X

 LDA VIA+&64            \ Read the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

 AND #&0F
 CMP #&0E
 BCS L2F4D

 ORA #&10
 DEC Theme
 LDX #8

.L2F3B

 DEX
 CPX Theme
 BNE L2F45

 STA L4208,X
 RTS

.L2F45

 CMP L4208,X
 BNE L2F3B

 INC Theme

.L2F4D

 RTS

\ ******************************************************************************
\
\       Name: L2F4E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2F4E

 LDA L4206
 AND #&7F
 BNE L2F6A

 LDX #7

.L2F57

 LDA L4210,X
 BEQ L2F67

 CMP #&16
 BEQ L2F67

 CMP #&1B
 BCS L2F67

 INC L4210,X

.L2F67

 DEX
 BPL L2F57

.L2F6A

 LDY #&1F

.L2F6C

 LDX L41E4,Y
 BMI L2F82

 LDA L4210,X
 CMP #&18
 BEQ L2F7D

 LDA L4208,X
 BPL L2FB4

.L2F7D

 LDA #&FE
 STA L41E4,Y

.L2F82

 LDX #7

.L2F84

 LDA L4208,X
 BMI L2FB1

 LDA L4210,X
 BNE L2FB1

 CPY #&1F
 BEQ L2F98

 CPX L4203
 JMP L2F9B

.L2F98

 CPX L4204

.L2F9B

 BEQ L2FB1

 TXA
 STA L41E4,Y
 STX U
 LDA #&80
 JSR L302C

 LDX U
 LDA #1
 STA L4210,X
 BNE L2FB4

.L2FB1

 DEX
 BPL L2F84

.L2FB4

 INY
 CPY #&21
 BNE L2F6C

 LDX L41E4,Y
 BMI L2FC6

 LDA L4208,X
 BPL L2FE3

 STA L41E4,Y

.L2FC6

 LDY #&1F

.L2FC8

 LDX L41E4,Y
 BMI L2FDE

 LDA L4210,X
 CMP #&16
 BNE L2FDE

 STX L4205
 LDA #&17
 STA L4210,X
 BNE L2FE3

.L2FDE

 INY
 CPY #&21
 BNE L2FC8

.L2FE3

 LDA L4206
 AND #&7F
 BNE L302B

 LDY #&1F

.L2FEC

 LDX L41E4,Y
 BMI L3003

 LDA L4210,X
 CMP #5
 BCC L3003

 CMP #&14
 BCS L3003

 AND #3
 BNE L3003

 JSR L302C

.L3003

 INY
 CPY #&21
 BNE L2FEC

 LDX #7

.L300A

 LDA L4208,X
 BPL L302B

 DEX
 BPL L300A

 LDA #8
 STA Theme
 LDX #0
 LDA #&50
 JSR L4BCB

 LDA L0CF8
 CLC
 ADC #4
 CMP #&13
 BCS L302B

 STA L0CF8

.L302B

 RTS

\ ******************************************************************************
\
\       Name: L302C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L302C

 STA K
 STY T
 LDX #3
 LDA #&BA
 CPY #&1F
 BEQ L303A

 LDA #&BF

.L303A

 TAY

.L303B

 LDA L35B0,Y
 CLC
 ADC #&10
 BIT K
 BPL L3049

 AND #&0F
 ORA #&20

.L3049

 STA L35B0,Y
 DEY
 DEX
 BPL L303B

 LDY T
 RTS

\ ******************************************************************************
\
\       Name: L3053
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3053

 LDA #&7D
 STA QQ
 LDA #&40
 STA P+1
 LDA #&A0
 STA RR
 STA PP
 CPY #&1F
 BCS L306B

 LDA #4
 LDX #3
 BNE L3088

.L306B

 LDA #0
 CPY #&20
 BCS L3075

 LDX #&B7
 BNE L3079

.L3075

 BNE L3093

 LDX #&BC

.L3079

 LDA L35B0,X
 EOR #&70
 LSR A
 LSR A
 LSR A
 LSR A
 TAX
 DEX
 DEX
 TXA
 BEQ L3093

.L3088

 LSR QQ
 LSR RR
 LSR PP
 LSR P+1
 DEX
 BNE L3088

.L3093

 STA L368D
 LDA #0
 STA L368F
 LDY L0CCC
 JSR L3129

 LDX #&E4
 STX VV

.L30A5

 LDX VV
 LDA #&1F
 STA WW
 LDY #0

.L30AD

 STY P+1
 JSR L3181

 LDY P+1
 STA L0CB8,Y
 LDA V
 STA L0CA8,Y
 LDA R
 STA L0CE0,Y
 INY
 CPY #3
 BNE L30AD

 LDX #&A8
 LDY #0
 JSR L4B00

 LDY VV
 JSR L3152

 LDY VV
 LDX #&D8

.L30D6

 TYA
 CLC
 ADC #&28
 TAY
 TXA
 CLC
 ADC #&28
 TAX
 LDA L4400,Y
 STA L4400,X
 CPX #&C8
 BNE L30D6

.L30EA

 LDY #2
 LDX #&50

.L30EE

 LDA L0CE0,Y
 CLC
 ADC L0CB8,Y
 STA L0CB8,Y
 BCC L3102

 INC L4400,X
 BNE L3102

 INC L4478,X

.L3102

 TXA
 SEC
 SBC #&28
 TAX
 DEY
 BPL L30EE

 LDX #0
 LDY #0
 JSR L257B

 LDY #&D8
 JSR L3152

 DEC WW
 BPL L30EA

 LDA VV
 CLC
 ADC #2
 STA VV
 CMP #&E8
 BEQ L3128

 JMP L30A5

.L3128

 RTS

\ ******************************************************************************
\
\       Name: L3129
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3129                  \ STIP in original

 LDX #2

.L312B

 LDA L4400,Y
 CLC
 ADC P+1
 STA W,X
 LDA L4478,Y
 ADC #5
 STA I,X

.L313A

 TYA
 CLC
 ADC #&28
 TAY
 DEX
 BPL L3143

 RTS

.L3143

 BEQ L312B

 LDA L4400,Y
 STA W,X
 LDA L4478,Y
 STA I,X
 JMP L313A

\ ******************************************************************************
\
\       Name: L3152
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3152                  \ HITS in original

 LDX #2

.L3154

 TYA
 CLC
 ADC #&28
 TAY
 LDA L4400,Y
 SEC
 SBC W,X
 STA T
 LDA L4478,Y
 SBC I,X
 BNE L3180

 LDA T
 CMP PP,X
 BCS L3180

 DEX
 BPL L3154

 LDA L0CCC
 STA L368E
 TSX
 INX
 INX
 TXS
 LDA #&1B
 STA L368F

.L3180

 RTS

\ ******************************************************************************
\
\       Name: L3181
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3181                  \ ADIF in original

 LDA #0
 STA P
 STA R
 TXA
 CLC
 ADC #&28
 TAX
 LDA L4401,X
 SEC
 SBC L4400,X
 STA V
 LDA L4479,X
 SBC L4478,X
 BPL L319F

 DEC P

.L319F

 LDY #4

.L31A1

 LSR P
 ROR A
 ROR V
 ROR R
 DEY
 BPL L31A1

 RTS

\ ******************************************************************************
\
\       Name: L31AC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L31AC

 LDA L0CFC
 BPL L31B3

 EOR #&C0

.L31B3

 AND #&C0
 BEQ L31B9

 LDA #&0E

.L31B9

 STA Row25_Block31_1
 RTS

\ ******************************************************************************
\
\       Name: L31BD
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L31BD

 LDA L04D9
 BEQ L31D4

 BMI L31C7

 JMP L3246

.L31C7

 LDA JJ
 CMP #5
 BCC L31D3

 LDA L0CCA
 STA L0CCE

.L31D3

 RTS

.L31D4

 LDA #0
 STA L0CCB
 LDA #1
 STA L0CCC
 JSR L2A8C

 BPL L3246

 LDA #0
 LDX #5

.L31E7

 STA L0CE0,X
 DEX
 BPL L31E7

 LDY #&D9
 STY L0CCF
 LDX #1
 JSR L1A67

 LDA #2
 STA GG
 JSR L19A0

 LDX #5

.L3200

 LDA L0CE0,X
 STA L0CB8,X
 DEX
 BPL L3200

 LDA #4
 STA GG
 JSR L19A0

 LDY #2
 LDX #3
 JSR L1A67

 LDA L0CCE
 BEQ L3222

 LDA #&40
 STA L04D9
 RTS

.L3222

 LDX #4
 JSR L333B

 LDY #1
 LDX #&0A

.L322B

 JSR L4B5F

 STA L0CCE
 BNE L323B

 CPY #3
 BEQ L3250

 LDY #3
 BNE L322B

.L323B

 LDA #&80
 STA L0CCA
 LDA JJ
 CMP #5
 BCC L324A

.L3246

 LDA #&80
 BNE L324C

.L324A

 LDA #0

.L324C

 STA L0CCE
 RTS

.L3250

 LDX #2

.L3252

 CLC
 LDA L0CE3,X
 BPL L3259

 SEC

.L3259

 ROR A
 STA L0CE3,X
 LDA L0CE0,X
 ROR A
 STA L0CE0,X
 DEX
 BPL L3252

 LDY #2
 LDX #&15
 JSR L1A67

 LDY #1
 LDX #5
 JSR L1A67

 LDX #5

.L3277

 LDA L0CE0,X
 STA L0CDA,X
 DEX
 BPL L3277

 LDX #5
 LDA #0

.L3284

 STA T,X
 DEX
 BPL L3284

 LDX #2

.L328B

 LDA #0
 STA R
 LDA L0CBB,X
 BPL L3296

 DEC R

.L3296

 LSR R
 ROR A
 STA L0CE3,X
 LDA L0CB8,X
 ROR A
 ROR T,X
 LDY #2

.L32A4

 LSR R
 ROR L0CE3,X
 ROR A
 ROR T,X
 DEY
 BPL L32A4

 STA L0CE0,X
 DEX
 BPL L328B

 LDX #&A8
 LDY #5
 JSR L4B25

.L32BC

 LDX #2

.L32BE

 CLC
 LDA W,X
 ADC T,X
 STA W,X
 LDA L0CA8,X
 ADC L0CE0,X
 STA L0CA8,X
 LDA L0CB8,X
 ADC L0CE3,X
 STA L0CB8,X
 DEX
 BPL L32BE

 LDX #&A8
 INY
 JSR L4B00

 CPY #&13
 BNE L32BC

 LDX #&13
 JSR L333B

 LDX #5

.L32EB

 LDA L0CDA,X
 STA L0CE0,X
 DEX
 BPL L32EB

 LDA L4906
 STA P
 LDY #6

.L32FB

 LDA L4900,Y
 EOR P
 BMI L3309

 INY
 CPY #&14
 BCC L32FB

 BCS L333A

.L3309

 LDA P
 BPL L3316

 DEY
 LDA #1
 STA P+1
 LDX #4
 BNE L331C

.L3316

 LDA #2
 STA P+1
 LDX #3

.L331C

 JSR L1A67

 LDX #2

.L3321

 LDA #0
 SEC
 SBC L0CE0,X
 STA L0CE0,X
 LDA #0
 SBC L0CE3,X
 STA L0CE3,X
 DEX
 BPL L3321

 LDX P+1
 JSR L1A67

.L333A

 RTS

\ ******************************************************************************
\
\       Name: L333B
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L333B

 LDA #&80
 ORA L0400,X
 STA L0400,X
 DEX
 BNE L333B

 RTS

\ ******************************************************************************
\
\       Name: L3347
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3347

 LDX #&1E
 LDY #&20
 LDA L4A00,X
 STA T
 LDA L0900,X
 ASL A
 ROL T
 SEC
 SBC L091F
 STA L0900,Y
 LDA T
 SBC L4A1F
 STA L4A00,Y
 LDA L0B00,X
 STA T
 LDA L0A00,X
 ASL A
 ROL T
 SEC
 SBC L0A1F
 STA L0A00,Y
 LDA T
 SBC L0B1F
 STA L0B00,Y
 STX L
 STY M
 JSR L107B

 RTS

\ ******************************************************************************
\
\       Name: L3387
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3387

 LDA L4206
 AND #3
 BEQ L338F

 RTS

.L338F

 TAX
 LDA L3692
 CMP #&41
 BCS L339D

 INC L3692
 JMP L33AE

.L339D

 STX L0CE8
 RTS

\ ******************************************************************************
\
\       Name: L33A1
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L33A1

 LDA L4206
 AND #&0F
 BEQ L33A9

 RTS

.L33A9

 LDX #&80
 LDA L3692

.L33AE

 STX N
 CLC
 ADC #&B8
 STA J
 LDA #2
 STA I
 LDA #1
 STA T
 STA U
 LDA #0
 STA V
 JSR DrawLine

 RTS

\ ******************************************************************************
\
\       Name: L33C7
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L33C7

 LDX #&DB               \ Scan the keyboard to see if "7" is being pressed
 JSR ScanKeyboard

 BEQ L33D9

 LDX #&EA               \ Scan the keyboard to see if "8" is being pressed
 JSR ScanKeyboard

 BNE L33ED

 LDA #&FF
 BNE L33DB

.L33D9

 LDA #1

.L33DB

 CLC
 ADC L4EB2
 BMI L33E3

 BNE L33ED

.L33E3

 CMP #&F1
 BCC L33ED

 STA L4EB2
 INC L4EE4

.L33ED

 RTS

\ ******************************************************************************
\
\       Name: L33EE
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L33EE

 CMP #&0E
 BCC L33FF

 LDA Flaps
 BEQ L33FF

 LDA #0
 STA Flaps
 JSR FIndicator

.L33FF

 RTS

\ ******************************************************************************
\
\       Name: L3400
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3400

 EQUB &0D, &00, &00, &00, &08, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &0A, &00, &00, &00, &00, &04, &00, &00
 EQUB &04, &00, &00, &00, &04, &00, &0C, &05
 EQUB &08, &00, &00, &00, &00, &00, &00, &00
 EQUB &0C, &00, &00, &0C, &0B, &00, &00, &00
 EQUB &00, &02, &01, &03, &06, &0A, &03, &09
 EQUB &06, &0D, &00, &01, &05, &01, &00, &09
 EQUB &00, &08, &00, &0E, &00, &0D, &05, &0C
 EQUB &0F, &00, &07, &06, &0C, &00, &00, &08
 EQUB &00, &0F, &00, &04, &03, &0A, &00, &00
 EQUB &00, &0A, &00, &00, &00, &00, &00, &0B
 EQUB &0B, &0D, &0E, &04, &04, &0D, &0C, &0D
 EQUB &04, &0E, &00, &03, &0F, &0A, &0B, &02
 EQUB &0E, &00, &0B, &0A, &0A, &05, &0E, &00
 EQUB &00, &0B, &0E, &05, &04, &09, &0A, &00
 EQUB &01, &05, &0D, &00, &00, &0D, &0F, &02
 EQUB &00, &09, &0D, &0F, &0B, &00, &0B, &0D
 EQUB &02, &03, &0A, &08, &00, &00, &04, &0C
 EQUB &00, &06, &0E, &0B, &00, &05, &0A, &0E
 EQUB &00, &05, &0B, &05, &00, &05, &0D, &02
 EQUB &00, &02, &00, &0C, &0E, &05, &05, &00
 EQUB &03, &0E, &03, &05, &00, &03, &0E, &03
 EQUB &09, &04, &05, &09, &07, &04, &04, &00
 EQUB &02, &00, &00, &00, &0B, &0C, &0B, &00
 EQUB &00, &00, &00, &04, &01, &00, &00, &04

.L34D8

 EQUB &3D, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &01, &01, &01, &01, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &0A, &0A, &00, &00, &0A, &0A
 EQUB &00, &00, &00, &00, &00, &0A, &0A, &0A
 EQUB &0A, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &0C, &0C, &07, &08, &0A, &00, &00
 EQUB &02, &00, &0A, &0C, &05, &07, &0A, &00
 EQUB &00, &00, &00, &02, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &04, &00, &00, &00, &00, &04
 EQUB &00, &00, &00, &00, &04, &00, &03, &00
 EQUB &03, &02, &02, &00, &00, &00, &00, &08
 EQUB &08, &08, &08, &01, &00, &00, &00, &02

.L35B0

 EQUB &0D, &00, &9C, &00, &50, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &48, &48
 EQUB &60, &80, &80, &80, &80, &80, &00, &00
 EQUB &80, &5A, &4C, &00, &82, &82, &40, &5A
 EQUB &40, &38, &30, &30, &38, &00, &30, &30
 EQUB &50, &38, &38, &50, &60, &40, &40, &40
 EQUB &40, &8E, &8B, &99, &8C, &81, &79, &6F
 EQUB &8D, &43, &9E, &80, &9C, &80, &00, &50
 EQUB &59, &96, &81, &97, &81, &92, &4D, &80
 EQUB &1F, &20, &17, &2B, &25, &00, &81, &40
 EQUB &80, &1F, &20, &14, &2C, &28, &00, &00
 EQUB &81, &10, &81, &80, &00, &4B, &4A, &87
 EQUB &94, &3D, &90, &3A, &80, &83, &80, &9A
 EQUB &8C, &91, &8C, &85, &80, &85, &84, &8E
 EQUB &40, &89, &97, &93, &93, &99, &82, &00
 EQUB &87, &8E, &8A, &80, &8E, &94, &92, &00
 EQUB &8F, &9A, &84, &00, &8B, &89, &70, &80
 EQUB &8D, &99, &8B, &85, &80, &8B, &8D, &82
 EQUB &80, &88, &87, &82, &00, &86, &88, &80
 EQUB &86, &99, &8C, &70, &83, &9C, &99, &80
 EQUB &8C, &9B, &87, &80, &89, &98, &8D, &80
 EQUB &88, &80, &0C, &00, &2E, &85, &85, &23
 EQUB &20, &2E, &23, &85, &23, &20, &2E, &23
 EQUB &79, &55, &54, &68, &55

.L3675

 EQUB &40, &52, &44, &54, &80

.L367A

 EQUB &80, &4C, &50, &40, &50, &40, &40, &40
 EQUB &40, &74, &84, &82, &85, &75

.L3688

 EQUB &8A, &8A

.L368A

 EQUB &D0, &D0

.L368C

 EQUB &48

.L368D

 EQUB &49

.L368E                  \ EPTR in orginal

 EQUB &3D

.L368F                  \ EPLO in orginal

 EQUB &26               \ Zeroed in Reset

.L3690

 EQUB &34

.L3691

 EQUB &34

.L3692

 EQUB &41, &B2, &B7, &BC, &C1, &0F, &B4, &BA
 EQUB &BF, &C8

.L369C

 EQUB &49               \ Zeroed in Reset (16-bit with L369D?)

.L369D

 EQUB &3D               \ Zeroed in Reset

.L369E

 EQUB &26               \ Zeroed at start of MainLoop (16-bit with L369E?)

.L369F

 EQUB &34               \ Zeroed at start of MainLoop

\ ******************************************************************************
\
\       Name: L36A0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L36A0

 CMP L0CE9
 BEQ L36BF
 STA L0CE9
 TAX
 JSR L4DB5
 LDA L4F85
 LDX L0CE9
 BNE L36B9
 CLC
 ADC #&14
 BNE L36BC

.L36B9

 SEC
 SBC #&14

.L36BC

 STA L4F85

.L36BF

 RTS

\ ******************************************************************************
\
\       Name: L36C0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L36C0

 EQUB &A8, &00, &56, &A8, &60, &56, &88, &00
 EQUB &56, &30, &00, &30, &D0, &00, &70, &10
 EQUB &00, &70, &E0, &00, &C0

.L36D5

 EQUB &4C, &00, &86, &4C, &00, &86, &4C, &00
 EQUB &86, &04, &00, &03, &04, &00, &04, &06
 EQUB &00, &04, &04, &00, &03

.L36EA

 EQUB &A8, &10, &18, &A8, &16, &18, &B8, &2C
 EQUB &18, &A8, &44, &28, &28, &84, &48, &60
 EQUB &24, &38, &78, &20, &60, &20

.L3700

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &01, &01, &01, &01, &01, &01, &01, &01
 EQUB &01, &01, &01, &01, &01, &01, &01, &01
 EQUB &02, &02, &02, &02, &02, &02, &02, &02
 EQUB &02, &02, &02, &02, &02, &02, &02, &02
 EQUB &03, &03, &03, &03, &03, &03, &03, &03
 EQUB &03, &03, &03, &03, &03, &03, &03, &03
 EQUB &04, &04, &04, &04, &04, &04, &04, &04
 EQUB &04, &04, &04, &04, &04, &04, &04, &04
 EQUB &05, &05, &05, &05, &05, &05, &05, &05
 EQUB &05, &05, &05, &05, &05, &05, &05, &05
 EQUB &06, &06, &06, &06, &06, &06, &06, &06
 EQUB &06, &06, &06, &06, &06, &06, &06, &06
 EQUB &07, &07, &07, &07, &07, &07, &07, &07
 EQUB &07, &07, &07, &07, &07, &07, &07, &07
 EQUB &08, &08, &08, &08, &08, &08, &08, &08
 EQUB &08, &08, &08, &08, &08, &08, &08, &08
 EQUB &09, &09, &09, &09, &09, &09, &09, &09
 EQUB &09, &09, &09, &09, &09, &09, &09, &09
 EQUB &0A, &0A, &0A, &0A, &0A, &0A, &0A, &0A
 EQUB &0A, &0A, &0A, &0A, &0A, &0A, &0A, &0A
 EQUB &0B, &0B, &0B, &0B, &0B, &0B, &0B, &0B
 EQUB &0B, &0B, &0B, &0B, &0B, &0B, &0B, &0B
 EQUB &0C, &0C, &0C, &0C, &0C, &0C, &0C, &0C
 EQUB &0C, &0C, &0C, &0C, &0C, &0C, &0C, &0C
 EQUB &0D, &0D, &0D, &0D, &0D, &0D, &0D, &0D
 EQUB &0D, &0D, &0D, &0D, &0D, &0D, &0D, &0D
 EQUB &0E, &0E, &0E, &0E, &0E, &0E, &0E, &0E
 EQUB &0E, &0E, &0E, &0E, &0E, &0E, &0E, &0E
 EQUB &0F, &0F, &0F, &0F, &0F, &0F, &0F, &0F
 EQUB &0F, &0F, &0F, &0F, &0F, &0F, &0F, &0F

.L3800

 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0
 EQUB &00, &10, &20, &30, &40, &50, &60, &70
 EQUB &80, &90, &A0, &B0, &C0, &D0, &E0, &F0

.L3900

 EQUB &FF, &FE, &FD, &FC, &FB, &FA, &F9, &F8
 EQUB &F7, &F6, &F5, &F4, &F3, &F2, &F1, &F0
 EQUB &EF, &EF, &EE, &ED, &EC, &EB, &EA, &E9
 EQUB &E9, &E8, &E7, &E6, &E5, &E4, &E4, &E3
 EQUB &E2, &E1, &E1, &E0, &DF, &DE, &DD, &DD
 EQUB &DC, &DB, &DA, &DA, &D9, &D8, &D8, &D7
 EQUB &D6, &D5, &D5, &D4, &D3, &D3, &D2, &D1
 EQUB &D1, &D0, &CF, &CF, &CE, &CD, &CD, &CC
 EQUB &CB, &CB, &CA, &C9, &C9, &C8, &C8, &C7
 EQUB &C6, &C6, &C5, &C5, &C4, &C3, &C3, &C2
 EQUB &C2, &C1, &C0, &C0, &BF, &BF, &BE, &BE
 EQUB &BD, &BC, &BC, &BB, &BB, &BA, &BA, &B9
 EQUB &B9, &B8, &B8, &B7, &B7, &B6, &B6, &B5
 EQUB &B5, &B4, &B4, &B3, &B3, &B2, &B2, &B1
 EQUB &B1, &B0, &B0, &AF, &AF, &AE, &AE, &AD
 EQUB &AD, &AC, &AC, &AB, &AB, &AB, &AA, &AA
 EQUB &A9, &A9, &A8, &A8, &A7, &A7, &A7, &A6
 EQUB &A6, &A5, &A5, &A4, &A4, &A4, &A3, &A3
 EQUB &A2, &A2, &A2, &A1, &A1, &A0, &A0, &A0
 EQUB &9F, &9F, &9E, &9E, &9E, &9D, &9D, &9C
 EQUB &9C, &9C, &9B, &9B, &9B, &9A, &9A, &99
 EQUB &99, &99, &98, &98, &98, &97, &97, &97
 EQUB &96, &96, &96, &95, &95, &94, &94, &94
 EQUB &93, &93, &93, &92, &92, &92, &91, &91
 EQUB &91, &90, &90, &90, &90, &8F, &8F, &8F
 EQUB &8E, &8E, &8E, &8D, &8D, &8D, &8C, &8C
 EQUB &8C, &8B, &8B, &8B, &8B, &8A, &8A, &8A
 EQUB &89, &89, &89, &88, &88, &88, &88, &87
 EQUB &87, &87, &86, &86, &86, &86, &85, &85
 EQUB &85, &85, &84, &84, &84, &83, &83, &83
 EQUB &83, &82, &82, &82, &82, &81, &81, &81
 EQUB &81, &80, &80, &80, &80, &7F, &7F, &7F

.L3A00

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &02, &04, &06, &08, &0A, &0C, &0E
 EQUB &10, &12, &14, &16, &18, &1A, &1C, &1E
 EQUB &00, &03, &06, &09, &0C, &0F, &12, &15
 EQUB &18, &1B, &1E, &21, &24, &27, &2A, &2D
 EQUB &00, &04, &08, &0C, &10, &14, &18, &1C
 EQUB &20, &24, &28, &2C, &30, &34, &38, &3C
 EQUB &00, &05, &0A, &0F, &14, &19, &1E, &23
 EQUB &28, &2D, &32, &37, &3C, &41, &46, &4B
 EQUB &00, &06, &0C, &12, &18, &1E, &24, &2A
 EQUB &30, &36, &3C, &42, &48, &4E, &54, &5A
 EQUB &00, &07, &0E, &15, &1C, &23, &2A, &31
 EQUB &38, &3F, &46, &4D, &54, &5B, &62, &69
 EQUB &00, &08, &10, &18, &20, &28, &30, &38
 EQUB &40, &48, &50, &58, &60, &68, &70, &78
 EQUB &00, &09, &12, &1B, &24, &2D, &36, &3F
 EQUB &48, &51, &5A, &63, &6C, &75, &7E, &87
 EQUB &00, &0A, &14, &1E, &28, &32, &3C, &46
 EQUB &50, &5A, &64, &6E, &78, &82, &8C, &96
 EQUB &00, &0B, &16, &21, &2C, &37, &42, &4D
 EQUB &58, &63, &6E, &79, &84, &8F, &9A, &A5
 EQUB &00, &0C, &18, &24, &30, &3C, &48, &54
 EQUB &60, &6C, &78, &84, &90, &9C, &A8, &B4
 EQUB &00, &0D, &1A, &27, &34, &41, &4E, &5B
 EQUB &68, &75, &82, &8F, &9C, &A9, &B6, &C3
 EQUB &00, &0E, &1C, &2A, &38, &46, &54, &62
 EQUB &70, &7E, &8C, &9A, &A8, &B6, &C4, &D2
 EQUB &00, &0F, &1E, &2D, &3C, &4B, &5A, &69
 EQUB &78, &87, &96, &A5, &B4, &C3, &D2, &E1

.L3B00

 EQUB &10, &7D, &7D, &7D, &7D, &10, &10, &10
 EQUB &10, &10, &28, &10, &50, &50, &32, &32
 EQUB &32, &28, &28, &28, &50, &50, &28, &28
 EQUB &50, &50, &50, &50, &50, &50, &50, &50
 EQUB &50, &50, &50, &50, &50, &50, &50, &3C
 EQUB &46, &3C, &46, &3C, &46, &3C, &46, &3F
 EQUB &3F, &3F, &3F, &3C, &46, &3C, &46, &3C
 EQUB &3F, &3F, &3F, &3F, &1E, &1E, &46, &3C
 EQUB &46, &3C, &46, &3C, &46, &3C, &46, &3C
 EQUB &46, &3C, &46, &3C, &78, &46, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &78, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &19
 EQUB &19, &19, &64, &64, &64, &64, &64, &64
 EQUB &64, &64, &64, &64, &64, &64, &78, &64
 EQUB &64, &64, &64, &64, &64, &64, &64, &64
 EQUB &64, &78, &78, &78, &78, &78, &78, &78
 EQUB &78, &3C, &3C, &3C, &3C, &3C, &3C, &3C
 EQUB &3C, &3C, &3C, &3C, &3C, &3C, &3C, &3C
 EQUB &3C, &3C, &78, &78, &78, &78, &78, &78
 EQUB &78, &3F, &0D, &03, &B1, &10, &2E, &64
 EQUB &6C, &70, &32, &20, &53, &54, &41, &26
 EQUB &37, &36, &0D, &03, &B2, &19, &2E, &64

.L3BD8

 EQUB &6C, &7D, &7D, &7D, &7D, &7D, &28, &28
 EQUB &6E, &6E, &3A, &42, &1E, &1E, &1E, &1E
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &19, &5A
 EQUB &5A, &5A, &7D

\ This is workspace noise, containing original assembly code

 EQUB &3A, &42, &4E, &45, &20

.L3C00

 EQUB &64, &6C, &70, &32, &0D, &03, &B4, &19
 EQUB &20, &20, &20, &20, &20, &20, &44, &45
 EQUB &43, &26, &37, &34, &3A, &42, &4E, &45
 EQUB &20, &64, &6C, &70, &31, &0D, &03, &B5
 EQUB &0D, &20, &20, &20, &20, &20, &20, &72
 EQUB &74, &73, &0D, &03, &B6, &05, &20, &0D
 EQUB &03, &BF, &25, &2E, &55, &42, &55, &4C
 EQUB &20, &4C, &44, &59, &23, &31, &35, &3A
 EQUB &53, &54, &59, &20, &4F, &42, &3A, &4C
 EQUB &44, &41, &23, &39, &38, &3A, &53, &54
 EQUB &41, &20, &50, &50, &0D, &03, &C0, &1D
 EQUB &2E, &75, &62, &75, &32, &20, &54, &59

.L3C60

 EQUB &41, &3A, &43, &4C, &43, &3A, &41, &44
 EQUB &43, &23, &26, &44, &38, &3A, &54, &41
 EQUB &58, &0D, &03, &CA, &12, &20, &20, &20
 EQUB &20, &20, &20, &4A, &53, &52, &20, &4D
 EQUB &4F, &42, &4A, &0D, &03, &D4, &12, &20
 EQUB &20, &20, &20, &20, &20, &4A, &53, &52
 EQUB &20, &55, &4F, &42, &4A, &0D, &03, &DE
 EQUB &25, &20, &20, &20, &20, &20, &20, &4C
 EQUB &44, &59, &20, &4F, &42, &3A, &4C, &44
 EQUB &41, &20, &4F, &53, &54, &41, &54, &2C
 EQUB &59, &3A, &42, &4D, &49, &20, &75, &62
 EQUB &75, &31, &0D, &03, &E8, &1B, &20, &20

.L3CC0

 EQUB &20, &20, &20, &20, &4C, &44, &41, &23
 EQUB &30, &3A, &53, &54, &41, &20, &46, &52
 EQUB &46, &4C, &41, &47, &20, &0D, &03, &F2
 EQUB &17, &2E, &75, &62, &75, &31, &20, &44
 EQUB &45, &43, &20, &50, &50, &3A, &44, &45
 EQUB &43, &20, &4F, &42, &0D, &03, &FC, &20
 EQUB &20, &20, &20, &20, &20, &20, &4C, &44
 EQUB &59, &20, &4F, &42, &3A, &43, &50, &59
 EQUB &23, &31, &32, &3A, &42, &43, &53, &20
 EQUB &75, &62, &75, &32, &0D, &04, &06, &0D
 EQUB &20, &20, &20, &20, &20, &20, &72, &74
 EQUB &73, &0D, &04, &10, &05, &20, &0D, &04

.L3D20

 EQUB &1A, &24, &2E, &53, &55, &54, &52, &20
 EQUB &4A, &4D, &50, &20, &54, &45, &53, &54
 EQUB &3A, &42, &4D, &49, &20, &73, &75, &74
 EQUB &31, &3A, &42, &45, &51, &20, &73, &75
 EQUB &74, &31, &0D, &04, &24, &1B, &20, &20
 EQUB &20, &20, &20, &20, &4C, &44, &41, &26
 EQUB &30, &43, &43, &35, &3A, &42, &4E, &45
 EQUB &20, &73, &75, &74, &31, &0D, &04, &2E
 EQUB &27, &20, &20, &20, &20, &20, &20, &4C
 EQUB &44, &41, &26, &46, &45, &36, &34, &3A
 EQUB &80, &23, &31, &35, &3A, &43, &4D, &50
 EQUB &23, &31, &34, &3A, &42, &43, &53, &20

.L3D80

 EQUB &73, &75, &74, &31, &0D, &04, &38, &0F
 EQUB &20, &20, &20, &20, &20, &20, &84, &41
 EQUB &23, &31, &36, &0D, &04, &42, &19, &2E
 EQUB &73, &75, &74, &33, &20, &44, &45, &43
 EQUB &20, &54, &48, &45, &4D, &45, &3A, &4C
 EQUB &44, &58, &23, &37, &0D, &04, &4C, &1C
 EQUB &2E, &73, &75, &74, &35, &20, &43, &50
 EQUB &58, &20, &54, &48, &45, &4D, &45, &3A
 EQUB &42, &45, &51, &20, &73, &75, &74, &34
 EQUB &0D, &04, &56, &1F, &2E, &73, &75, &74
 EQUB &32, &20, &43, &4D, &50, &20, &46, &4C
 EQUB &44, &50, &54, &52, &2C, &58, &3A, &42

.L3DE0

 EQUB &1F, &01, &03, &48, &49, &47, &48, &20
 EQUB &53, &43, &4F, &52, &45, &3A, &20, &20
 EQUB &30, &1F, &03, &0A, &3A, &4A, &4D, &50
 EQUB &20, &73, &75, &74, &35, &0D, &04, &6A

\ End of workspace noise

.L3E00

 EQUB &1E, &02, &03, &04, &01, &07, &09, &0B
 EQUB &0D, &0F, &11, &13, &3B, &72, &2A, &2B
 EQUB &2C, &2E, &2F, &30, &35, &36, &37, &38
 EQUB &3A, &39, &33, &3C, &3D, &3E, &3F, &40
 EQUB &41, &42, &74, &71, &71, &70, &6F, &43
 EQUB &77, &78, &44, &45, &46, &47, &75, &51
 EQUB &55, &55, &55, &76, &48, &49, &4A, &4B
 EQUB &5A, &5E, &5E, &5E, &60, &62, &4C, &4D
 EQUB &4E, &4F, &65, &64, &66, &67, &69, &68
 EQUB &6B, &6A, &6D, &6D, &D7, &6E, &7A, &79
 EQUB &7B, &7B, &91, &91, &93, &93, &94, &9E
 EQUB &9F, &A0, &A0, &A1, &A2, &A1, &A3, &A8
 EQUB &A6, &A7, &A8, &AC, &AB, &7C, &AB, &AF
 EQUB &AE, &AD, &AE, &97, &97, &95, &96, &8A
 EQUB &8A, &89, &8B, &85, &87, &86, &86, &81
 EQUB &82, &83, &83, &D1, &7E, &7E, &7F, &8D
 EQUB &7C, &8F, &8E, &9A, &9B, &9C, &99, &B3
 EQUB &B4, &B4, &B8, &B9, &B9, &BA, &B8, &B9
 EQUB &BD, &BE, &BE, &BF, &BD, &BE, &D7, &C2
 EQUB &C3, &C3, &C4, &C2, &C3, &C8, &C6, &C6
 EQUB &C8, &58, &57, &C9, &28, &19, &1C, &17
 EQUB &18, &58, &63, &63, &CA, &1C, &1A, &1B
 EQUB &1C, &1D, &28, &22, &25, &26, &D1, &D2
 EQUB &D0, &D0, &CC, &CE, &CF, &D3, &D3, &D3
 EQUB &D7, &D7

.L3EC2

 EQUB &74, &72, &75, &32

.L3EC6

 EQUB &3A, &43, &00, &08, &10, &18, &00, &08
 EQUB &10, &18

.L3ED0

 EQUB &C8, &2A, &CF, &82, &1D, &75, &1A, &CF
 EQUB &9C, &43, &E5, &8A, &EA, &22, &6A, &C5
 EQUB &15, &C4, &C4, &CE, &CE, &CE, &15, &11
 EQUB &38, &D5, &D5, &DA, &DA, &0D, &38, &0D

.L3EF0

 EQUB &52, &D2, &9A, &C9, &3E, &33, &8A, &EC
 EQUB &C6, &E2, &BA, &70, &6E, &44, &20, &1B
 EQUB &2F, &05, &05, &F5, &F5, &F5, &2F, &D6
 EQUB &1C, &2E, &2E, &D3, &D3, &D9, &1C, &D9

\ ******************************************************************************
\
\       Name: L3F10
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3F10

 LDX P
 TXA
 SEC
 SBC L2E9D
 BPL L3F1E
 EOR #&FF
 CLC
 ADC #1

.L3F1E

 CMP #9
 BCC L3F25
 STX L2E9D

.L3F25

 RTS

\ ******************************************************************************
\
\       Name: L3F26
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3F26

 EQUB &3D, &41
 EQUB &42, &43, &77, &78, &44, &45, &46, &50

.L3F30

 EQUB &1F, &01, &02, &03, &04, &06, &08, &0A
 EQUB &0C, &0E, &10, &12, &72, &73, &29, &2A
 EQUB &2B, &2D, &2E, &2F, &31, &32, &33, &34
 EQUB &3B, &3A, &39, &34, &3C, &31, &32, &3E
 EQUB &3F, &40, &73, &74, &70, &6F, &3D, &41
 EQUB &42, &43, &77, &78, &44, &45, &46, &50
 EQUB &52, &53, &54, &47, &75, &76, &48, &49
 EQUB &59, &5B, &5C, &5D, &5F, &61, &4A, &4B
 EQUB &4C, &4D, &4E, &4F, &65, &64, &66, &67
 EQUB &69, &68, &6B, &6A, &D5, &6D, &79, &B1
 EQUB &7A, &B1, &90, &92, &92, &94, &90, &9D
 EQUB &9E, &9F, &9D, &A4, &A3, &A2, &A4, &A5
 EQUB &A5, &A6, &A7, &A9, &A9, &8E, &AC, &B0
 EQUB &AF, &B0, &AD, &96, &98, &98, &95, &8B
 EQUB &89, &88, &88, &84, &84, &87, &85, &80
 EQUB &81, &82, &80, &CB, &7D, &7F, &7D, &8C
 EQUB &8D, &8C, &8F, &99, &9A, &9B, &9C, &B2
 EQUB &B2, &B3, &B7, &B7, &B8, &B7, &BA, &BA
 EQUB &BC, &BC, &BD, &BC, &BF, &BF, &6C, &C1
 EQUB &C1, &C2, &C1, &C4, &C4, &C1, &C2, &C5
 EQUB &C7, &56, &63, &27, &CA, &16, &15, &1A
 EQUB &1B, &C9, &58, &CA, &C9, &19, &19, &1A
 EQUB &1B, &16, &21, &CD, &28, &CD, &CF, &D1
 EQUB &D2, &CF, &D2, &D0, &CD, &23, &D4, &24
 EQUB &D6, &6C, &03, &0A, &20, &20, &20, &20
 EQUB &00, &00

.L3FFA

 EQUB &05, &10, &15, &25, &00

.L3FFF

 EQUB &40

.L4000

 EQUB &00

.L4001

 EQUB &92, &24, &B6, &48, &DA, &6C, &FE, &8F
 EQUB &21, &B2, &44, &D5, &66, &F6, &87, &17
 EQUB &A7, &37, &C7, &56, &E5, &73, &02, &90
 EQUB &1D, &AA, &37, &C4, &50, &DB, &66, &F1
 EQUB &7B, &05, &8E, &17, &9F, &26, &AD, &33
 EQUB &B9, &3E, &C3, &47, &CA, &4D, &CE, &50
 EQUB &D0, &50, &CF, &4D, &CA, &47, &C3, &3E
 EQUB &B8, &31, &AA, &22, &98, &0E, &83, &F7
 EQUB &6A, &DC, &4D, &BD, &2D, &9B, &08, &74
 EQUB &DF, &49, &B1, &19, &80, &E5, &4A, &AD
 EQUB &0F, &70, &D0, &2E, &8B, &E7, &42, &9C
 EQUB &F4, &4B, &A1, &F5, &48, &9A, &EA, &39
 EQUB &87, &D3, &1E, &68, &B0, &F6, &3C, &7F
 EQUB &C2, &02, &42, &7F, &BC, &F6, &2F, &67
 EQUB &9D, &D2, &05, &36, &66, &94, &C0, &EB
 EQUB &14, &3B, &61, &85, &A8, &C8, &E7, &04
 EQUB &20, &3A, &52, &68, &7C, &8F, &A0, &AE
 EQUB &BC, &C7, &D0, &D8, &DE, &E2, &E3, &E4
 EQUB &E2, &DE, &D8, &D1, &C7, &BB, &AE, &9F
 EQUB &8D, &7A, &64, &4D, &33, &18, &FA, &DB
 EQUB &B9, &95, &70, &48, &1E, &F2, &C4, &94
 EQUB &61, &2D, &F6, &BE, &83, &46, &06, &C5
 EQUB &82, &3C, &F4, &AA, &5E, &0F, &BE, &6B
 EQUB &16, &BF, &65, &09, &AB, &4B, &E8, &83
 EQUB &1C, &B2, &46, &D8, &68, &F5, &80, &09
 EQUB &8F, &13, &94, &14, &91, &0B, &84, &FA
 EQUB &6D, &DE, &4D, &BA, &24, &8B, &F1, &53
 EQUB &B4, &12, &6E, &C7, &1E, &73, &C5, &14
 EQUB &61, &AC, &F5, &3B, &7E, &BF, &FE, &3A
 EQUB &74, &AB, &E0, &13, &43, &70, &9B, &C4
 EQUB &EA, &0E, &2F, &4E, &6A, &84, &9C, &B1
 EQUB &C3, &D3, &E1, &EC, &F4, &FB, &FE, &FF

.L4101

 EQUB &00

.L4102

 EQUB &01, &03, &04, &06, &07, &09, &0A, &0C
 EQUB &0E, &0F, &11, &12, &14, &15, &17, &19
 EQUB &1A, &1C, &1D, &1F, &20, &22, &24, &25
 EQUB &27, &28, &2A, &2B, &2D, &2E, &30, &31
 EQUB &33, &35, &36, &38, &39, &3B, &3C, &3E
 EQUB &3F, &41, &42, &44, &45, &47, &48, &4A
 EQUB &4B, &4D, &4E, &50, &51, &53, &54, &56
 EQUB &57, &59, &5A, &5C, &5D, &5F, &60, &61
 EQUB &63, &64, &66, &67, &69, &6A, &6C, &6D
 EQUB &6E, &70, &71, &73, &74, &75, &77, &78
 EQUB &7A, &7B, &7C, &7E, &7F, &80, &82, &83
 EQUB &84, &86, &87, &88, &8A, &8B, &8C, &8E
 EQUB &8F, &90, &92, &93, &94, &95, &97, &98
 EQUB &99, &9B, &9C, &9D, &9E, &9F, &A1, &A2
 EQUB &A3, &A4, &A6, &A7, &A8, &A9, &AA, &AB
 EQUB &AD, &AE, &AF, &B0, &B1, &B2, &B3, &B5
 EQUB &B6, &B7, &B8, &B9, &BA, &BB, &BC, &BD
 EQUB &BE, &BF, &C0, &C1, &C2, &C3, &C4, &C5
 EQUB &C6, &C7, &C8, &C9, &CA, &CB, &CC, &CD
 EQUB &CE, &CF, &D0, &D1, &D2, &D3, &D3, &D4
 EQUB &D5, &D6, &D7, &D8, &D9, &D9, &DA, &DB
 EQUB &DC, &DD, &DD, &DE, &DF, &E0, &E1, &E1
 EQUB &E2, &E3, &E3, &E4, &E5, &E6, &E6, &E7
 EQUB &E8, &E8, &E9, &EA, &EA, &EB, &EB, &EC
 EQUB &ED, &ED, &EE, &EE, &EF, &EF, &F0, &F1
 EQUB &F1, &F2, &F2, &F3, &F3, &F4, &F4, &F4
 EQUB &F5, &F5, &F6, &F6, &F7, &F7, &F7, &F8
 EQUB &F8, &F9, &F9, &F9, &FA, &FA, &FA, &FB
 EQUB &FB, &FB

.L41E4

 EQUB &FB, &FC, &FC, &FC, &FC, &FD, &FD, &FD
 EQUB &FD, &FE, &FE, &FE, &FE, &FE, &FE, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF

.L41FA

 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF

.L4202

 EQUB &6C               \ Zeroed in Reset

.L4203

 EQUB &6B               \ Zeroed in Reset

.L4204

 EQUB &6A               \ Zeroed in Reset

.L4205

 EQUB &69               \ Zeroed in Reset

.L4206

 EQUB &67

.L4207

 EQUB &C1

.L4208                  \ ? FLDPTR in original

 EQUB &65, &64, &62, &61, &60, &5F, &5E \ Zeroed in Reset

.L420F

 EQUB &5C \ Zeroed in Reset

.L4210

 EQUB &5B, &5A, &59, &58, &7D, &7C, &7B, &7A \ Zeroed in Reset

 EQUB &78, &77, &76, &75, &74, &72, &71, &70

.L4220

 EQUB &31

.L4221

 EQUB &39

.L4222

 EQUB &0D

.L4223

 EQUB &06, &18

.L4225

 EQUB &10, &20

.L4227

 EQUB &20, &20

.L4229

 EQUB &20, &20, &20

.L422C

 EQUB &4C, &44, &59

.L422F

 EQUB &23, &33, &31

.L4232

 EQUB &0D

.L4233

 EQUB &06, &00

.L4235

 EQUB &1D

.L4236

 EQUB &2E, &00, &00, &00, &FE

.L423B

 EQUB &20, &4C

.L423D

 EQUB &44

.L423E

 EQUB &58, &20, &50, &00

.L4242

 EQUB &52

.L4243

 EQUB &4E

\ ******************************************************************************
\
\       Name: L4244
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4244

 LDA L0CFD
 SEC
 SBC L4478,Y
 BPL L424F
 EOR #&FF

.L424F

 CMP #5
 BCC L4254

.L4253

 RTS

.L4254

 LDA L0CFF
 SEC
 SBC L44C8,Y
 JMP L4284

\ ******************************************************************************
\
\       Name: L425E
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L425E

 EQUB &4D, &50

.L4260

 EQUB &B2

.L4261

 EQUB &32

.L4262

 EQUB &AF

.L4263

 EQUB &0B, &F2

.L4265

 EQUB &51, &B6

.L4267

 EQUB &40, &A7

.L4269

 EQUB &B2, &0B, &B6

.L426C

 EQUB &32, &F2, &40

.L426F

 EQUB &AF, &51, &A7

.L4272

 EQUB &FA

.L4273

 EQUB &34, &00

.L4275

 EQUB &34

.L4276

 EQUB &FA, &00, &00, &00, &FF

.L427B

 EQUB &FA, &32

.L427D

 EQUB &0D

.L427E

 EQUB &34, &F2, &3F, &00

.L4282

 EQUB &40

.L4283

 EQUB &F7

\ ******************************************************************************
\
\       Name: L4284
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4284

 BPL L4288
 EOR #&FF

.L4288

 CMP #&05
 BCS L4253
 CPY #&02
 BEQ L42B7
 LDA #&0C
 JSR L4B9B
 BCS L42D5
 LDA #&0F
 JSR L4B9B
 BCS L42D5
 LDA #&09
 JSR L4B9B
 BCS L42D5
 LDA #&12
 JSR L4B9B
 BCC L42DF
 LDA #&20
 LDX Row25_Block31_1
 BNE L42EB

.L42B3

 LDA #&10
 BNE L42EB

.L42B7

 LDA #&06
 JSR L4B9B
 BCC L42DF
 LDA #&03
 JSR L4B9B
 BCS L42DF
 LDA #&00
 JSR L4B9B
 BCC L42D5
 LDX Row25_Block31_1
 BNE L42B3
 LDA #&05
 BNE L42EB

.L42D5

 TSX
 TXA
 SEC
 SBC #&04
 TAX
 TXS
 JMP L4C6A

.L42DF

 LDA L0CD7
 BEQ L42EE
 LDX #&00
 JSR L4BCB
 LDA #&00

.L42EB

 STA L0CD7

.L42EE

 RTS

\ ******************************************************************************
\
\       Name: L42EF
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L42EF

 EQUB &20

.L42F0

 EQUB &00, &FE, &FF, &01, &04, &00, &FB, &02
 EQUB &33, &3A, &FF, &FE, &FE, &23, &31, &38

.L4300

 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F
 EQUB &00, &01, &02, &03, &04, &05, &06, &07
 EQUB &08, &09, &0A, &0B, &0C, &0D, &0E, &0F

.L4400                  \ XALO in original

 EQUB &23

.L4401

 EQUB &66, &18, &DD, &33, &EF, &00, &00, &00
 EQUB &00, &4F, &58, &00, &00, &00, &00, &EE
 EQUB &AA, &88, &55, &77, &33, &77, &33, &66
 EQUB &88, &DE, &66, &66, &55, &00, &00, &00

.L4421

 EQUB &00, &40, &23, &33, &31, &3A, &42

.L4428

 EQUB &43, &00, &00, &00, &00, &00

.L442E

 EQUB &00, &00, &00, &00, &27, &20, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00

.L4449

 EQUB &00, &00, &23, &34, &3A, &4A, &4D

.L4450

 EQUB &50

.L4451

 EQUB &5C, &66, &33, &00, &11, &00, &00, &00
 EQUB &00, &2E, &73, &00, &00, &00, &00, &A6
 EQUB &52, &55, &99, &55, &BC, &56, &99, &F8
 EQUB &77, &11, &CD, &55, &44, &00, &00, &00
 EQUB &00, &40, &20, &20, &20, &20, &20

.L4478

 EQUB &20                  \ XAHI in original

.L4479

 EQUB &C6, &4B, &45, &53, &8E, &00, &00, &00
 EQUB &00, &4D, &50, &00, &00, &00, &00, &8E
 EQUB &EA, &08, &25, &57, &13, &87, &E3, &86
 EQUB &D8, &ED, &46, &86, &B5, &00, &00, &00

.L4499

 EQUB &00, &04, &41, &20, &53, &49, &5A

.L44A0

 EQUB &45, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &0D, &07, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00

.L44C1

 EQUB &00, &00, &38, &0D, &07, &76, &1A

.L44C8

 EQUB &2E

.L44C9

 EQUB &44, &86, &63, &C0, &C1, &00, &00, &00
 EQUB &00, &5A, &52, &00, &00, &00, &00, &EA
 EQUB &D5, &65, &E9, &E5, &AB, &95, &99, &4D
 EQUB &07, &41, &2C, &05, &74, &00, &00, &00
 EQUB &00, &03, &41, &3A, &4C, &53, &52

.L44F0

 EQUB &FB               \ Zeroed in Reset

.L44F1

 EQUB &FD, &FF, &F9, &FB, &F8, &FB, &FA, &53
 EQUB &52, &FF, &FE, &01, &41, &58, &0D

.L4500

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &10, &10, &10, &10, &10, &10, &10, &10
 EQUB &10, &10, &10, &10, &10, &10, &10, &10
 EQUB &20, &20, &20, &20, &20, &20, &20, &20
 EQUB &20, &20, &20, &20, &20, &20, &20, &20
 EQUB &30, &30, &30, &30, &30, &30, &30, &30
 EQUB &30, &30, &30, &30, &30, &30, &30, &30
 EQUB &40, &40, &40, &40, &40, &40, &40, &40
 EQUB &40, &40, &40, &40, &40, &40, &40, &40
 EQUB &50, &50, &50, &50, &50, &50, &50, &50
 EQUB &50, &50, &50, &50, &50, &50, &50, &50
 EQUB &60, &60, &60, &60, &60, &60, &60, &60
 EQUB &60, &60, &60, &60, &60, &60, &60, &60
 EQUB &70, &70, &70, &70, &70, &70, &70, &70
 EQUB &70, &70, &70, &70, &70, &70, &70, &70
 EQUB &80, &80, &80, &80, &80, &80, &80, &80
 EQUB &80, &80, &80, &80, &80, &80, &80, &80
 EQUB &90, &90, &90, &90, &90, &90, &90, &90
 EQUB &90, &90, &90, &90, &90, &90, &90, &90
 EQUB &A0, &A0, &A0, &A0, &A0, &A0, &A0, &A0
 EQUB &A0, &A0, &A0, &A0, &A0, &A0, &A0, &A0
 EQUB &B0, &B0, &B0, &B0, &B0, &B0, &B0, &B0
 EQUB &B0, &B0, &B0, &B0, &B0, &B0, &B0, &B0
 EQUB &C0, &C0, &C0, &C0, &C0, &C0, &C0, &C0
 EQUB &C0, &C0, &C0, &C0, &C0, &C0, &C0, &C0
 EQUB &D0, &D0, &D0, &D0, &D0, &D0, &D0, &D0
 EQUB &D0, &D0, &D0, &D0, &D0, &D0, &D0, &D0
 EQUB &E0, &E0, &E0, &E0, &E0, &E0, &E0, &E0
 EQUB &E0, &E0, &E0, &E0, &E0, &E0, &E0, &E0
 EQUB &F0, &F0, &F0, &F0, &F0, &F0, &F0, &F0
 EQUB &F0, &F0, &F0, &F0, &F0, &F0, &F0, &F0

.L4600

 EQUB &31, &01, &01, &01, &01, &01, &01, &01
 EQUB &01, &01, &01, &01, &01, &01, &01, &01
 EQUB &01, &01, &01, &01, &01, &22, &22, &40
 EQUB &22, &3E, &3F, &40, &22, &3E, &00, &00
 EQUB &3E, &22, &45, &08, &08, &50, &4D, &22
 EQUB &4F, &02, &59, &5A, &58, &02, &5B, &5C
 EQUB &5C, &5B, &5C, &02, &5B, &59, &5A, &5B
 EQUB &5C, &63, &63, &03, &63, &63, &02, &02
 EQUB &02, &68, &02, &6A, &6A, &6C, &04, &04
 EQUB &71, &04, &73, &04, &75, &9E, &77, &75
 EQUB &07, &78, &07, &07, &07, &78, &4F, &7E
 EQUB &7E, &06, &81, &06, &06, &06, &81, &0C
 EQUB &0D, &0E, &0F, &7F, &05, &05, &8F, &05
 EQUB &05, &90, &05, &92, &09, &92, &95, &03
 EQUB &99, &03, &03, &03, &03, &04, &04, &6A
 EQUB &9F, &13, &13, &13, &16, &14, &14, &14
 EQUB &10, &10, &10, &10, &11, &11, &11, &11
 EQUB &17, &17, &17, &17, &16, &16, &16, &16
 EQUB &15, &15, &15, &15, &15, &1D, &1D, &1D
 EQUB &1D, &18, &18, &18, &18, &C8, &C7, &12
 EQUB &12, &1B, &1B, &1B, &1B, &1C, &1C, &1C
 EQUB &1C, &19, &19, &19, &19, &1A, &1A, &1A
 EQUB &1A, &13, &DD, &DD, &DD, &1E, &1F, &DE
 EQUB &DE, &DE, &DE, &20, &E3, &E3, &E3, &E3
 EQUB &21, &EF, &ED, &EF, &EF, &E8, &ED, &E8
 EQUB &EF, &4F, &50, &F5, &F3, &50, &F5, &F5
 EQUB &F6, &F3, &F4, &08, &08, &09, &94, &09

\ ******************************************************************************
\
\       Name: L46D8
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L46D8

 LDA Row29_Block20_4
 BEQ L46FE

 LDX #1
 JSR L25CA
 STA L0C0E

 LDX #2
 JSR $25CA
 STA $0C0C
 LDX #&00
 LDA #&80
 JSR OSBYTE

 TXA
 AND #1
 BEQ L46FE
 LDA #&08
 STA KeyLoggerLow+5     \ Flaps or fire key

.L46FE

 RTS

\ ******************************************************************************
\
\       Name: L46FF
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L46FF

 EQUB &36

.L4700

 EQUB &00, &00, &01, &09, &12, &1A, &22, &32
 EQUB &43, &53, &63, &7B, &8B, &A3, &BB, &DB
 EQUB &F4, &14, &34, &54, &74, &9C, &C4, &EC
 EQUB &14, &3C, &6C, &94, &C4, &F4, &2C, &5C
 EQUB &95, &CD, &05, &3D, &75, &B5, &ED, &2D
 EQUB &6D, &AD, &ED, &35, &7D, &BD, &05, &4D
 EQUB &9D, &E5, &2D, &7D, &CD, &1D, &6D, &BD
 EQUB &15, &65, &BD, &15, &6D, &C5, &1D, &75
 EQUB &D6, &2E, &8E, &EE, &4E, &AE, &0E, &6E
 EQUB &D6, &36, &9E, &06, &6E, &D6, &3E, &A6
 EQUB &16, &7E, &EE, &56, &C6, &36, &A6, &16
 EQUB &86, &FE, &6E, &E6, &56, &CE, &46, &BE
 EQUB &36, &AE, &26, &9E, &1E, &96, &16, &96
 EQUB &0E, &8E, &0E, &8E, &0E, &96, &16, &96
 EQUB &1E, &9E, &26, &AE, &36, &B6, &3E, &C6
 EQUB &56, &DE, &66, &EE, &7E, &06, &96, &26
 EQUB &AF, &3F, &CF, &5F, &EF, &7F, &0F, &A7
 EQUB &37, &C7, &5F, &EF, &87, &17, &AF, &47
 EQUB &DF, &77, &0F, &A7, &3F, &D7, &6F, &0F
 EQUB &A7, &47, &DF, &7F, &17, &B7, &57, &EF
 EQUB &8F, &2F, &CF, &6F, &0F, &AF, &57, &F7
 EQUB &97, &37, &DF, &7F, &27, &C7, &6F, &17
 EQUB &BF, &5F, &07, &AF, &57, &FF, &A7, &4F
 EQUB &F7, &9F, &4F, &F7, &9F, &4F, &F7, &A7
 EQUB &4F, &FF, &A7, &57, &07, &AF, &5F, &0F
 EQUB &BF, &6F, &1F, &CF, &7F, &2F, &DF, &8F
 EQUB &47, &F7, &A7, &5F, &0F, &C7, &77, &2F
 EQUB &DF, &97, &47, &FF, &B7, &6F, &1F, &D7
 EQUB &8F, &47, &FF, &B7, &6F, &27, &DF, &97
 EQUB &4F, &0F, &C7, &7F, &3F, &F7, &AF, &6F
 EQUB &27, &E7, &9F, &5F, &17, &D7, &97, &4F
 EQUB &0F, &CF, &8F, &47, &07, &C7, &87, &47

.L4800                  \ Screen y-coordinate lookup table for a diagonal, low byte

 EQUB &28, &F0, &B8, &80, &48, &10, &D8, &A0
 EQUB &68, &30, &F8, &C0, &88, &50, &18, &E0
 EQUB &A8, &70, &38, &00

 EQUB &C8, &90, &58, &20
 EQUB &E8, &B0, &78, &40, &08, &D0, &98, &60

.L4820                  \ Screen y-coordinate lookup table for a diagonal, low byte

 EQUB &6F, &6D, &6C, &6B, &6A, &69, &67, &66
 EQUB &65, &64, &62, &61, &60, &5F, &5E, &5C
 EQUB &5B, &5A, &59, &58

 EQUB &7D, &7C, &7B, &7A
 EQUB &78, &77, &76, &75, &74, &72, &71, &70

\  0 = &6F28 = Row18_Block21
\  1 = &6DF0 = Row17_Block22
\  2 = &6CB8 = Row16_Block23
\  3 = &6B80 = Row15_Block24
\      ...
\ 17 = &5A70 = Row1_Block38
\ 18 = &5938 = Row0_Block39
\ 19 = &5800 = Row0_Block0

\ 20 = &7DC8 = Row30_Block9
\ 21 = &7C90 = Row29_Block10
\      ...
\ 30 = &7198 = Row20_Block19
\ 31 = &7060 = Row19_Block20

\ ******************************************************************************
\
\       Name: L4840
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4840

 LDX #7
 LDA #&77
 STA P
 LDA #&88
 STA P+1
 LDA #&EE
 STA R
 LDA #&11
 STA S

.L4852

 LDY #1

.L4854

 LDA Row1_Block1_0,X
 AND P
 ORA P+1
 STA Row1_Block1_0,X
 LDA Row1_Block39_0,X
 AND R
 ORA S
 STA Row1_Block39_0,X
 DEX
 DEY
 BPL L4854

 LDA R
 ASL A
 AND R
 STA R
 LDA P
 LSR A
 AND P
 STA P
 ASL S
 LSR P+1
 CPX #&FF
 BNE L4852

 RTS

\ ******************************************************************************
\
\       Name: L4883
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4883

 LDY #&5B
 LDX #&C8
 LDA #8
 STA R
 LDA #0
 JSR FillCanopyRows

 RTS

\ ******************************************************************************
\
\       Name: L4891
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

 EQUB &20, &20, &20, &4C, &44, &41, &26, &38
 EQUB &36, &3A, &43, &4C, &43, &3A, &41

\ ******************************************************************************
\
\       Name: L48A0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L48A0                  \ Unused?

 LDX #7

\ ******************************************************************************
\
\       Name: L48A2
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L48A2                  \ Unused?

 LDA #&77
 STA P
 LDA #&88
 STA P+1
 LDA #&EE
 STA R
 LDA #&11
 STA S

.L48B2

 LDY #1

.L48B4

 LDA Row1_Block0_0,X
 AND P
 ORA P+1
 STA Row1_Block0_0,X
 LDA Row1_Block38_0,X
 AND R
 ORA S
 STA Row1_Block38_0,X
 DEX
 DEY
 BPL L48B4

 LSR R
 LSR S
 LSR P
 LSR P+1
 CPX #&FF
 BNE L48B2

 RTS

\ ******************************************************************************
\
\       Name: L48D9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L48D9                  \ Unused?

 LDY #&5B
 LDX #&C0
 LDA #8
 STA R
 LDA #0
 JSR FillCanopyRows

 RTS

\ ******************************************************************************
\
\       Name: L48E7
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

\ This is workspace noise, containing original assembly code

.L48E7

 EQUB &10, &0F, &2E, &53, &54, &49, &50, &20
 EQUB &4C, &44, &58, &23, &32, &0D, &09, &1A
 EQUB &2A, &2E, &73, &74, &69, &31, &20, &4C
 EQUB &44

.L4900

 EQUB &41, &20, &58, &41, &4C, &4F

.L4906

 EQUB &2C, &59, &3A, &43, &4C, &43, &3A, &41
 EQUB &44, &43, &20, &44, &54, &49, &50, &3A
 EQUB &53, &54, &41, &26, &37, &37, &2C, &58
 EQUB &0D, &09, &24, &23, &20, &20, &20, &20
 EQUB &20, &20, &4C, &44, &41, &20, &58, &41
 EQUB &48, &49, &2C, &59, &3A, &41, &44, &43
 EQUB &23, &35, &3A, &53, &54, &41, &26, &37
 EQUB &41, &2C, &58, &0D, &09, &2E, &1C, &2E
 EQUB &73, &74, &69, &34, &20, &54, &59, &41
 EQUB &3A, &43, &4C, &43, &3A, &41, &44, &43
 EQUB &23, &34, &30, &3A, &54, &41, &59, &0D
 EQUB &09, &38, &1A, &2E, &73, &74, &69, &32
 EQUB &20, &44, &45, &58, &3A, &42, &50, &4C
 EQUB &20, &73, &74, &69, &33, &3A, &72, &74
 EQUB &73, &0D, &09, &42, &12, &2E, &73, &74
 EQUB &69, &33, &20, &42, &45, &51, &20, &73
 EQUB &74, &69, &31, &0D, &09, &4C, &1D, &20
 EQUB &20, &20, &20, &20, &20, &4C, &44, &41
 EQUB &20, &58, &41, &4C, &4F, &2C, &59, &3A
 EQUB &53, &54, &41, &26, &37, &37, &2C, &58
 EQUB &0D, &09, &56, &26, &20, &20, &20, &20
 EQUB &20, &20, &4C, &44, &41, &20, &58, &41
 EQUB &48, &49, &2C, &59, &3A, &53, &54, &41
 EQUB &26, &37, &41, &2C, &58, &3A, &4A, &4D
 EQUB &50, &20, &73, &74, &69, &34, &0D, &09
 EQUB &60, &05, &20, &0D, &09, &6A, &0F, &2E
 EQUB &48, &49, &54, &53, &20, &4C, &44, &58
 EQUB &23, &32, &0D, &09, &74, &1C, &2E, &68
 EQUB &69, &74, &32, &20, &54, &59, &41, &3A
 EQUB &43, &4C, &43, &3A, &41, &44, &43, &23
 EQUB &34, &30, &3A, &54, &41, &59

.L49FC

 EQUB &0D, &09, &7E, &28

.L4A00

 EQUB &20               \ Set to 1 in Reset, Reset2

 EQUB &20, &20, &20, &20, &20, &4C, &44
 EQUB &41, &20, &58, &41, &4C, &4F, &2C, &59
 EQUB &3A, &53, &45, &43, &3A, &53, &42, &43
 EQUB &26, &37, &37, &2C, &58, &3A, &53

.L4A1F

 EQUB &54, &41, &26, &37, &34, &0D, &09, &88
 EQUB &26, &20, &20, &20, &20, &20, &20, &4C
 EQUB &44, &41, &20, &58, &41, &48, &49, &2C
 EQUB &59, &3A, &53, &42, &43, &26, &37, &41
 EQUB &2C, &58, &3A, &42, &4E, &45, &20, &68
 EQUB &69, &74, &31, &0D, &09, &92, &22, &20
 EQUB &20, &20, &20, &20, &20, &4C, &44, &41
 EQUB &26, &37, &34, &3A, &43, &4D, &50, &26
 EQUB &38, &30, &2C, &58, &3A, &42, &43, &53
 EQUB &20, &68, &69, &74, &31, &0D, &09, &9C
 EQUB &26, &20, &20, &20, &20, &20, &20, &44
 EQUB &45, &58, &3A, &42, &50, &4C, &20, &68
 EQUB &69, &74, &32, &3A, &4C, &44, &41, &20
 EQUB &4F, &42, &3A, &53, &54, &41, &20, &45
 EQUB &50, &54, &52, &0D, &09, &A6, &19, &20
 EQUB &20, &20, &20, &20, &20, &54, &53, &58
 EQUB &3A, &49, &4E, &58, &3A, &49, &4E, &58
 EQUB &3A, &54, &58, &53, &0D, &09, &A7, &1D
 EQUB &20, &20, &20, &20, &20, &20, &4C, &44
 EQUB &41, &23, &32, &37, &3A, &53, &54, &41
 EQUB &20, &45, &50, &4C, &4F, &3A, &72, &74
 EQUB &73, &0D, &09, &B0, &0D, &2E, &68, &69
 EQUB &74, &31, &20, &72, &74, &73, &0D, &09
 EQUB &BA, &05, &20, &0D, &09, &C4, &1D, &2E
 EQUB &41, &44, &49, &46, &20, &4C, &44, &41
 EQUB &23, &30, &3A, &53, &54, &41, &26, &37
 EQUB &30, &3A, &53, &54, &41, &26, &37, &32
 EQUB &0D, &09, &CE, &1C, &20

.L4AFC

 EQUB &20, &20, &20, &20

\ End of workspace noise

\ ******************************************************************************
\
\       Name: L4B00
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B00

 LDA L0C00,X
 STA L0900,Y
 LDA L0C01,X
 STA L0A00,Y
 LDA L0C02,X
 STA L0700,Y
 LDA L0C10,X
 STA L4A00,Y
 LDA L0C11,X
 STA L0B00,Y
 LDA L0C12,X
 STA L4900,Y
 RTS

\ ******************************************************************************
\
\       Name: L4B25
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B25

 LDA L0900,Y
 STA L0C00,X
 LDA L0A00,Y
 STA L0C01,X
 LDA L0700,Y
 STA L0C02,X
 LDA L4A00,Y
 STA L0C10,X
 LDA L0B00,Y
 STA L0C11,X
 LDA L4900,Y
 STA L0C12,X
 RTS

\ ******************************************************************************
\
\       Name: L4B4A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B4A

 LDA #0

\ ******************************************************************************
\
\       Name: L4B4C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B4C

 STA L0900,X
 STA L4A00,X
 STA L0A00,X
 STA L0B00,X
 STA L0700,X
 STA L4900,X
 RTS

\ ******************************************************************************
\
\       Name: L4B5F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B5F

 LDA L4A00,Y
 BPL L4B66

 EOR #&FF

.L4B66

 CMP L3B00,X
 BCS L4B83

 LDA L0B00,Y
 BPL L4B72

 EOR #&FF

.L4B72

 CMP L3B00,X
 BCS L4B83

 LDA L4900,Y
 BPL L4B7E

 EOR #&FF

.L4B7E

 CMP L3B00,X
 BCC L4B86

.L4B83

 LDA #1
 RTS

.L4B86

 LDA #0
 ORA L0CCE
 RTS

\ ******************************************************************************
\
\       Name: L4B8C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B8C

 PHP
 LDX #2

.L4B8F

 PLP
 BVC L4B97

 LDA #&40
 STA L0CCE

.L4B97

 DEX
 BPL L4B8F

 RTS

\ ******************************************************************************
\
\       Name: L4B9B
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4B9B

 STA P+1
 LDY #2

.L4B9F

 TYA
 CLC
 ADC P+1
 TAX
 SEC
 LDA L0CED,Y
 SBC L36C0,X
 STA P
 LDA L0CFD,Y
 SBC L36D5,X
 BMI L4BC9

 LSR A
 ROR P
 LSR A
 BNE L4BC9

 ROR P
 LDA P
 CMP L36EA,X
 BCS L4BC9

 DEY
 BPL L4B9F

 SEC
 RTS

.L4BC9

 CLC
 RTS

\ ******************************************************************************
\
\       Name: L4BCB
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4BCB

 JSR L4BD4

 LDA #3
 JSR L4D87

 RTS

\ ******************************************************************************
\
\       Name: L4BD4
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4BD4

 SED
 CLC
 ADC L369C
 STA L369C
 TXA
 ADC L369D
 STA L369D
 BCS L4BF1

 CPX #&99
 BNE L4BF1

 LDA #0
 STA L369C
 STA L369D

.L4BF1

 CLD
 RTS

\ ******************************************************************************
\
\       Name: L4BF3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4BF3

 LDA L369D
 CMP L369F
 BCC L4C11

 BNE L4C05

 LDA L369C
 CMP L369E
 BCC L4C11

.L4C05

 LDA L369C
 STA L369E
 LDA L369D
 STA L369F

.L4C11

 RTS

\ ******************************************************************************
\
\       Name: L4C12
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4C12

 LDX #0
 LDY #&10
 JSR L4C5C

 LDA L369F
 JSR L4C45

 LDA L369E
 JSR L4C45

 LDX #&10
 LDY #&14
 JSR L4C5C

 LDX #8
 LDY #&10
 JSR L4C5C

 LDA L369D
 JSR L4C45

 LDA L369C
 JSR L4C45

 LDA #&30
 JSR OSWRCH

 RTS

\ ******************************************************************************
\
\       Name: L4C45
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4C45

 STA T
 LSR A
 LSR A
 LSR A
 LSR A
 CLC
 ADC #&30
 JSR OSWRCH

 LDA T
 AND #&0F
 CLC
 ADC #&30
 JSR OSWRCH

 RTS

\ ******************************************************************************
\
\       Name: L4C5C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4C5C

 STY T

.L4C5E

 LDA L3DE0,X
 JSR OSWRCH

 INX
 CPX T
 BNE L4C5E

 RTS

\ ******************************************************************************
\
\       Name: L4C6A
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4C6A

 LDA #0
 JSR L4DB5

 LDA #5
 JSR L4D87

 LDX #&FF
 JSR FillCanopy

 LDA #&0A
 JSR L2ED3

 JSR ClearCanopy

 JSR L4840

 LDA #&5A
 JSR L2ED3

 JSR L4D92

 TSX
 TXA
 CLC
 ADC #6
 TAX
 TXS
 JMP MainLoopL1

\ ******************************************************************************
\
\       Name: L4C96
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4C96

 CPY #6
 BCC L4CAE

 CPY #&0A
 BCS L4CAE

 LDA L3EC2,Y
 CLC
 ADC #1
 AND #7
 ORA L3EC6,Y
 STA L3EC2,Y
 SEC
 RTS

.L4CAE

 CLC
 RTS

\ ******************************************************************************
\
\       Name: L4CB0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4CB0

 LDA L368F
 BEQ L4D19

 LDA #2
 JSR L4D87

 LDX L368E
 LDY L367A,X
 LDA L3675,X
 STA U
 LDX #2
 CPX L368D
 BCS L4CCF

 LDX L368D

.L4CCF

 LDA #&FF

.L4CD1

 LSR A
 DEX
 BPL L4CD1

 STA P

.L4CD7

 LDX #&A8
 JSR L4B25

 STY T
 LDY #2

.L4CE0

 LDA #0
 STA R
 JSR L4D77

 TAX
 LDA L44F1,X
 LSR A
 AND P
 BCC L4CF4

 DEC R
 EOR #&FF

.L4CF4

 ADC L0CA8,Y
 STA L0CA8,Y
 LDA R
 ADC L0CB8,Y
 STA L0CB8,Y
 DEY
 BPL L4CE0

 LDY T
 LDX #&A8
 JSR L4B00

 DEY
 CPY U
 BCS L4CD7

 DEC L368F
 BNE L4D19

 JSR L4D35

.L4D19

 LDA L368F
 CMP #&1A
 BNE L4D34

 LDA L0CBA
 LDX L368E
 CPX #&21
 BNE L4D31

 SEC
 SBC #8
 BPL L4D31

 LDA #0

.L4D31

 STA L368C

.L4D34

 RTS

\ ******************************************************************************
\
\       Name: L4D35
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4D35

 LDA #&FF
 LDY L368E
 CPY #&1E
 BNE L4D44

 LDX L4202
 JMP L4D4A

.L4D44

 LDX L41E4,Y
 STA L41E4,Y

.L4D4A

 STA L4208,X
 CPY #&21
 BNE L4D58

 JSR Reset2

 LDA #3
 BNE L4D68

.L4D58

 LDX L368D
 CPY #&1F
 BCS L4D65

 LDA L3FFF
 JMP L4D68

.L4D65

 LDA L3FFA,X

.L4D68

 LDX #0
 JSR L4BD4

 RTS

\ ******************************************************************************
\
\       Name: L4D6E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4D6E

 LDX L44F0

 LDA VIA+&64            \ Read the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

 STA L44F1,X

\ ******************************************************************************
\
\       Name: L4D77
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4D77

 LDA L44F0
 CLC
 ADC #1
 CMP #&0B
 BCC L4D83

 LDA #0

.L4D83

 STA L44F0
 RTS

\ ******************************************************************************
\
\       Name: L4D87
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4D87

 ASL A
 ASL A
 ASL A
 CLC
 ADC #&A8
 TAX
 LDA #7
 BNE SetEnvelope1

\ ******************************************************************************
\
\       Name: L4D92
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4D92

 LDA #0
 JSR L4DB5

 JSR L4BF3

 JSR L4C12

.L4D9D

 LDX #&B6               \ Scan the keyboard to see if RETURN is being pressed
 JSR ScanKeyboard

 BNE L4D9D

 RTS

\ ******************************************************************************
\
\       Name: SetEnvelope
\       Type: Subroutine
\   Category: Sound
\    Summary: Set up the sound envelope defined in Envelopes
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The offset of the sound envelope data in Envelopes:
\
\                         * A = 0 for the first envelope definition
\
\                         * A = 14 for the first envelope definition
\
\ ******************************************************************************

.SetEnvelope

 CLC                    \ Set (Y X) = Envelopes + A
 ADC #LO(Envelopes)     \
 TAX                    \ starting with the low byte

 LDA #8                 \ Set A = 8 for the OSWORD command below

.SetEnvelope1

 LDY #HI(Envelopes)     \ Set (Y X) = Envelopes + A
                        \
                        \ and now the high byte

 BCC SetEnvelope2       \ If the above addition didn't overflow, skip the next
                        \ instruction

 INY                    \ The above addition overflowed, so increment the high
                        \ byte of (Y X) to point to the next page in memory

.SetEnvelope2

 JSR OSWORD             \ Call OSWORD with A = 8 to set up the sound envelope at
                        \ location (Y X)

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L4DB5
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

 NOP

.L4DB5

 BNE L4DC2

 LDA #0
 JSR L4D87

\ ******************************************************************************
\
\       Name: L4DBC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4DBC

 LDA #&FF
 STA L4EE4
 RTS

\ ******************************************************************************
\
\       Name: L4DC2
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4DC2

 LDA L0CE9
 BEQ L4E0F

 LDA L0C1F
 STA K
 LDA L0C0F
 LDY #3

.L4DD1

 LSR K
 ROR A
 DEY
 BPL L4DD1

 CLC
 ADC L0C15
 STA K
 LDA #&32
 SEC
 SBC K
 BEQ L4DE6

 BPL L4DE8

.L4DE6

 LDA #1

.L4DE8

 STA Envelopes+2
 STA Envelopes+4
 EOR #&FF
 STA Envelopes+3
 LDA K
 CLC
 ADC #&50
 CMP L4EE4
 BEQ L4E0F

 STA L4EE4

 LDA #0                 \ Call SetEnvelope with A = 0 to set up the first
 JSR SetEnvelope        \ sound envelope

 LDA #7
 JSR L4D87

 LDA #1
 JSR L4D87

.L4E0F

 RTS

\ ******************************************************************************
\
\       Name: L4E10
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4E10

 JSR L4840

 LDX #&DA               \ Scan the keyboard to see if "I" is being pressed
 JSR ScanKeyboard

 BNE L4E38

 BIT L0CBE
 BVS L4E40

 LDA #&C0
 EOR L0CBE
 BMI L4E3D

 PHA
 LDY #&5F
 LDX #&88
 LDA #3
 STA R
 LDA #0
 JSR FillCanopyRows

 PLA
 JMP L4E3D

.L4E38

 LDA #&80
 AND L0CBE

.L4E3D

 STA L0CBE

.L4E40

 BPL L4E6D

 LDY #7

.L4E44

 LDA #&88
 ORA Row6_Block20_0,Y
 STA Row6_Block20_0,Y
 LDA #&88
 ORA Row7_Block20_0,Y
 STA Row7_Block20_0,Y
 DEY
 BPL L4E44

 LDA #&77
 ORA Row8_Block11_0
 STA Row8_Block11_0
 SEC
 LDY #&88

.L4E62

 LDA #&FF
 STA Row8_Block11_0,Y
 TYA
 SBC #8
 TAY
 BNE L4E62

.L4E6D

 LDX #&9F               \ Scan the keyboard to see if TAB is being pressed
 JSR ScanKeyboard

 BNE L4E85              \ If TAB is not being pressed, jump to L4E85

 LDA Joystick           \ If Joystick is non-zero, jump to L4E8A to return from the
 BNE L4E8A              \ subroutine

 LDA Row29_Block20_4    \ Toggle the joystick indicator pixel above the middle
 EOR #%10001000         \ of the rudder indicator
 STA Row29_Block20_4

 LDA #128               \ Set A = 128 to use as the value for Joystick below

 BNE L4E87              \ Jump to L4E87 to skip the following instruction (this
                        \ BNE is effectively a JMP as A is never zero)

.L4E85

 LDA #0                 \ Set A = 0 to use as the value for Joystick below

.L4E87

 STA Joystick           \ Set Joystick = A

.L4E8A

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L4E8B
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

 EQUB &8D

\ ******************************************************************************
\
\       Name: Envelopes
\       Type: Variable
\   Category: 
\    Summary: Data for two sound Envelopes
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Envelopes

 EQUB 1, 1, 50, -50, 50, 1, 2, 1, 0, 0, 0, 0, 0, 0

 EQUB 2, 1, -5, 0, 0, 10, 0, 0, 120, -1, -24, -10, 120, 116

\ ******************************************************************************
\
\       Name: L4EA8
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4EA8

 EQUB &10, &00, &00, &00, &00, &00, &00, &00
 EQUB &10, &00

.L4EB2

 EQUB &FB, &FF, &03, &00, &FF, &00, &13, &00
 EQUB &02, &00, &DC, &00, &02, &00, &13, &00
 EQUB &F1, &FF, &78, &00, &07, &00, &13, &00
 EQUB &F4, &FF, &00, &00, &01, &00, &10, &00
 EQUB &F3, &FF, &04, &00, &0C, &00, &13, &00
 EQUB &02, &00, &3C, &00, &02, &00, &11, &00
 EQUB &01, &00

.L4EE4

 EQUB &FF, &00, &FF, &00

\ ******************************************************************************
\
\       Name: L4EE8
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4EE8

 LDX #&0B

.L4EEA

 LDA L4EF4,X
 JSR OSWRCH
 DEX
 BPL L4EEA
 RTS

\ ******************************************************************************
\
\       Name: L4EF4
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4EF4

 EQUB &21, &45, &54, &41
 EQUB &4C, &20, &4F, &4F, &54, &07, &06, &1F

\ ******************************************************************************
\
\       Name: L4F00
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F00                  \ Screen x-coordinate lookup table, low byte
                        \ Multiples of 8 in 16-bit number

 EQUB &00, &08, &10, &18, &20, &28, &30, &38
 EQUB &40, &48, &50, &58, &60, &68, &70, &78
 EQUB &80, &88, &90, &98, &A0, &A8, &B0, &B8
 EQUB &C0, &C8, &D0, &D8, &E0, &E8, &F0, &F8
 EQUB &00, &08, &10, &18, &20, &28, &30, &38

.L4F28                  \ Screen x-coordinate lookup table, low byte
                        \ Multiples of 8 in 16-bit number

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &01, &01, &01, &01, &01, &01, &01, &01

\ ******************************************************************************
\
\       Name: KeyTable1
\       Type: Variable
\   Category: Keyboard
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Keys in this table are scanned for first. If pressed, the corresponding value
\ in the key logger is set to the 16-bit value, with the high byte coming from
\ KeyTable1High and the low byte from KeyTable1Low.
\
\ If the key in KeyTable1 is not being pressed, we then check the corresponding
\ key in KeyTable2. This contains the other key in this key pair, which is
\ normally the opposite key, e.g. up vs down, left vs right and so on.
\
\ ******************************************************************************

.KeyTable1

 EQUB &A9               \ L         Elevator (stick forwards, dive)
 EQUB &BE               \ A         Left rudder
 EQUB &AE               \ S         Aileron (joystick left, bank left)
 EQUB &DE               \ W         Decrease throttle
 EQUB &CA               \ U         Undercarriage up/down
 EQUB &BC               \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: KeyTable2
\       Type: Variable
\   Category: Keyboard
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Keys in this table are scanned only if the corresponding key in KeyTable1 is
\ not being pressed. If pressed, the corresponding value in the key logger is
\ set to the 16-bit value, with the high byte coming from KeyTable2High and the
\ low byte from KeyTable2Low.
\
\ ******************************************************************************

.KeyTable2

 EQUB &99               \ <         Elevator (stick backwards, ascend)
 EQUB &A8               \ +         Right rudder
 EQUB &CD               \ D         Aileron (joystick right, bank right)
 EQUB &DD               \ E         Increase throttle
 EQUB &9B               \ B         Brakes on/off
 EQUB &FF               \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: L4F5C
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F5C

 EQUB &00, &00, &00, &00

\ ******************************************************************************
\
\       Name: KeyTable2Low
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (low byte) for key presses in KeyTable2
\
\ ------------------------------------------------------------------------------
\
\ When a key in KeyTable2 is pressed (and assuming the corresponding key in
\ KeyTable1 is not being pressed), the low byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.KeyTable2Low

 EQUB &01               \ <         Elevator (stick backwards, ascend)
 EQUB &01               \ +         Right rudder
 EQUB &01               \ D         Aileron (joystick right, bank right)
 EQUB &0F               \ E         Increase throttle
 EQUB &07               \ B         Brakes on/off
 EQUB &08               \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: KeyTable2High
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (high byte) for key presses in KeyTable2
\
\ ------------------------------------------------------------------------------
\
\ When a key in KeyTable2 is pressed (and assuming the corresponding key in
\ KeyTable1 is not being pressed), the high byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.KeyTable2High

 EQUB &01               \ <         Elevator (stick backwards, ascend)
 EQUB &01               \ +         Right rudder
 EQUB &01               \ D         Aileron (joystick right, bank right)
 EQUB &00               \ E         Increase throttle
 EQUB &00               \ B         Brakes on/off
 EQUB &00               \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: KeyTable1Low
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (low byte) for key presses in KeyTable1
\
\ ------------------------------------------------------------------------------
\
\ When a key in KeyTable1 is pressed (and assuming the corresponding key in
\ KeyTable1 is not being pressed), the low byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.KeyTable1Low

 EQUB &01               \ L         Elevator (stick forwards, dive)
 EQUB &01               \ A         Left rudder
 EQUB &01               \ S         Aileron (joystick left, bank left)
 EQUB &F1               \ W         Decrease throttle
 EQUB &04               \ U         Undercarriage up/down
 EQUB &05               \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: KeyTable1High
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (high byte) for key presses in KeyTable1
\
\ ------------------------------------------------------------------------------
\
\ When a key in KeyTable1 is pressed (and assuming the corresponding key in
\ KeyTable1 is not being pressed), the high byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.KeyTable1High

 EQUB &FF               \ L         Elevator (stick forwards, dive)
 EQUB &FF               \ A         Left rudder
 EQUB &FF               \ S         Aileron (joystick left, bank left)
 EQUB &FF               \ W         Decrease throttle
 EQUB &00               \ U         Undercarriage up/down
 EQUB &00               \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: L4F78
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F78

 EQUB &10, &00, &F3, &FF, &06, &00, &03, &00
 
.L4F80

 EQUB &D4, &C9, &CC, &B0

.L4F84

 EQUB &9C               \ Always either &9C or &27 (156 or 39)

.L4F85

\ Goes up by 10 if undercarriage is down
\ Goes down by 10 if undercarriage is up
\ Goes up by 200 if flaps are on
\ Goes down by 200 if flaps are off
\ Is this air speed? Acceleration? Drag factor?

 EQUB &16               \ Set to 198 in Reset
 EQUB &28

.L4F87

 EQUB 152               \ Zeroed in Reset
                        \ Set to 5 if flaps are off, 152 if they are on

 EQUB &00, &00, &FF, &8D, &BE, &00, &05
 EQUB &7D, &FF, &50

.L4F92

 EQUB &12, &16, &10, &1A, &16, &1A, &1A, &41

.L4F9A

 EQUB &07, &09, &05, &0A, &08, &09, &09, &0D

.L4FA2

 EQUB &0C, &0A, &0A, &0E, &0C, &0E, &0E, &20

.L4FAA

 EQUB &36, &15, &16, &16, &6A, &6A, &6A, &54

.L4FB2

 EQUB &B8, &E9, &BC, &BC, &E8, &BA, &BA, &58

.L4FBA

 EQUB &00, &30, &00, &00, &43, &35, &6A, &4C

.L4FC2

 EQUB &00, &39, &00, &00, &1E, &21, &5B, &F4

.L4FCA

 EQUB &FF, &7A, &FF, &FF, &68, &48, &78, &4C

.L4FD2

 EQUB &02, &02, &02, &02, &02, &02, &02, &02

.L4FDA

 EQUB &02, &02, &02, &02, &02, &02, &02, &02

.L4FE2

 EQUB &02, &02, &00, &00, &00, &00, &00, &00

.JoyYC

 EQUB &00, &00

.JoyXC

 EQUB &00, &00

 EQUB &4D, &0D, &0C, &08, &15, &20
 EQUB &20, &20, &20, &20, &20, &4C

.L4FFA

 EQUB &44

.L4FFB

 EQUB &59

.JoyC

 EQUB &23, &31, &3A

.L4FFF

 EQUB &4C           \ Related to indicator X = 3, involved in 2

\ ******************************************************************************
\
\       Name: L5000
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5000

 LDX #&FD
 JSR L4B4A

 LDA #&FE
 LDX L0CC5
 STX L
 BEQ L502B

 LDX Undercarriage
 BEQ L502B

 LDX L0C94
 BPL L502B

 STX P+1
 LDA L0C84
 SEC
 ROR P+1
 ROR A
 EOR #&FF
 STA L0AFD
 LDA #&FE
 CLC
 SBC P+1

.L502B

 STA L0BFD
 LDA #&FD
 STA GG
 LDA #&1B
 STA L0CCB
 JSR L1D8D

 LDX #&89
 LDY #&FF
 STY GG
 JSR L4B00

 LDA #0
 STA L0CCB
 JSR L1D8D

 LDX #3
 LDY #&FF
 JSR L4B25

 JSR L5295

 JSR L5500

 JSR L5408

 LDA L368F
 BEQ L5081

 LDX #&6A

.L5062

 JSR L4D77

 TAY
 LDA L44F1,Y
 STA P
 LDA L368C
 CMP #&10
 BCS L5081

 EOR #&0F
 ASL A
 LSR P
 LDY #1
 JSR L57BB

 INX
 CPX #&6D
 BNE L5062

.L5081

 JSR L555D

 LDA L09FC
 EOR #&80
 ASL A
 LDA #0
 SBC L4AFC
 STA L0C9C
 LDA L
 BNE L5099

 JMP L5151

.L5099

 LDX #0
 LDY #0
 LDA L0C15
 BMI L50B1

 BNE L50AB

 LDA L0C05
 CMP #&14
 BCC L50B1

.L50AB

 LDY L0C0D
 BPL L50B1

 DEX

.L50B1

 STY L0C01
 TXA
 LDX #1

.L50B7

 ASL L0C01
 ROL A
 DEX
 BPL L50B7

 STA L0C11
 LDX #&82
 JSR L57F6

 STA L0C32
 LDY Undercarriage
 BNE L50E7

 LDA L0CFA
 AND L0C90
 BPL L50DE

 LDX #&80
 JSR L57F6

 STA L0C30

.L50DE

 JSR L564D

 BCC L50F5

 LDA #&32
 BNE L50F7

.L50E7

 LDX Brakes
 BNE L50DE

 JSR L564D

 BCC L5127

 LDA #7
 BNE L50F7

.L50F5

 LDA #&0B

.L50F7

 LDX L0C15
 BMI L5113

 BNE L5115

 LDX L0C05
 BEQ L5123

 CPX #&0B
 BCS L5115

 LDA #0
 STA L07FC
 LDA #&FF
 STA L49FC
 BNE L5123

.L5113

 LDA #&F8

.L5115

 STA P
 SEC
 LDA L49FC
 SBC P
 STA L49FC
 JMP L5127

.L5123

 LDA #&40
 BNE L5129

.L5127

 LDA #0

.L5129

 STA L0CE8
 LDA L0C03
 LSR A
 STA P
 LDX #0
 STX L0C9C
 TXA
 ROR A
 STA V
 LDA L0C13
 AND #&80
 ORA P
 STA P+1
 TXA
 SEC
 SBC V
 STA L09FC
 TXA
 SBC P+1
 STA L4AFC

.L5151

 LDA #9
 STA L0CCB
 LDA #&FC
 STA GG
 JSR L1D8D

 LDA L0BFC
 SEC
 SBC #&10
 STA L0BFC
 LDX #&83
 LDY #&FC
 JSR L4B25

 JSR L51F9

 JSR L51D7

 LDX #0
 LDY #&FE
 STY GG
 JSR L4B00

 LDA #&12
 STA L0CCB
 JSR L1D8D

 LDX #&86
 LDY #&FE
 JSR L4B25

 JSR L522D

 LDA #7
 JSR L4DB5

 JSR L5670

 JSR L31AC

 LDA L3692
 BEQ L51D1

 LDA L0CE9
 BEQ L51D6

 LDA L0C1F
 STA R
 LDA L0C0F
 LDX #3

.L51AD

 LSR R
 ROR A
 DEX
 BPL L51AD

 CLC
 ADC L3690
 STA L3690
 BCC L51D6

 LDA #4
 CLC
 ADC L3691
 STA L3691
 BCC L51D6

 LDA L3692
 BEQ L51D1

 DEC L3692
 BNE L51D6

.L51D1

 LDA #0
 JSR L36A0

.L51D6

 RTS

\ ******************************************************************************
\
\       Name: L51D7
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L51D7

 LDX #2

.L51D9

 LDA L0C30,X
 CLC
 ADC L0C19,X
 STA L0C19,X
 LDA L0C80,X
 ADC L0C00,X
 STA L0C00,X
 LDA L0C90,X
 ADC L0C10,X
 STA L0C10,X
 DEX
 BPL L51D9

 RTS

\ ******************************************************************************
\
\       Name: L51F9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L51F9

 LDX #2

.L51FB

 LDA #0
 STA R
 LDA L0C83,X
 STA V
 LDA L0C93,X
 BPL L520B

 DEC R

.L520B

 ASL V
 ROL A
 ROL R
 PHA
 LDA L0C8C,X
 CLC
 ADC V
 STA L0C8C,X
 PLA
 ADC L0C89,X
 STA L0C89,X
 LDA L0C99,X
 ADC R
 STA L0C99,X
 DEX
 BPL L51FB

 RTS

\ ******************************************************************************
\
\       Name: L522D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L522D

 LDX #2

.L522F

 LDA #0
 STA R
 LDA L0C09,X
 CLC
 ADC L0C89,X
 STA L0C09,X
 LDA L0C99,X
 BPL L5244

 DEC R

.L5244

 ADC L0CED,X
 STA L0CED,X
 LDA L0CFD,X
 ADC R
 STA L0CFD,X
 LDA L0C6D,X
 ADC R
 STA L0C6D,X
 LDA L0CEA,X
 CLC
 ADC L0C86,X
 STA L0CEA,X
 LDA L0CFA,X
 ADC L0C96,X
 STA L0CFA,X
 DEX
 BPL L522F

 ASL A
 EOR L0CFA
 BPL L5294

 LDX #1

.L5278

 LDA L0CFB,X
 EOR #&80
 STA L0CFB,X
 DEX
 BPL L5278

 LDA #0
 SEC
 SBC L0CEA
 STA L0CEA
 LDA #&80
 SBC L0CFA
 STA L0CFA

.L5294

 RTS

\ ******************************************************************************
\
\       Name: L5295
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5295

 LDA #0
 STA RR
 STA SS
 LDX #2

.L529D

 LDA L0C03,X
 STA P
 ASL A
 STA L0C43,X
 LDA L0C13,X
 PHA
 ROL A
 STA L0C53,X
 PLA
 BPL L52BD

 LDA #0
 SEC
 SBC P
 STA P
 LDA #0
 SBC L0C13,X

.L52BD

 STA P+1
 CPX #1
 BNE L52D3

 LDA P
 STA I
 LDA P+1
 ASL I
 ROL A
 ASL I
 ROL A
 STA J
 LDA P+1

.L52D3

 CMP SS
 BCC L52E7

 BNE L52E1

 LDA P
 CMP RR
 BCC L52E7

 LDA P+1

.L52E1

 STA SS
 LDA P
 STA RR

.L52E7

 DEX
 BPL L529D

 ASL RR
 ROL SS
 LDY SS
 LDX RR
 JSR L57E4

 STY SS
 STX RR
 LDA L4F84
 CMP #&27
 BNE L5307

 LDA L0C15
 CMP #&0B
 BCC L533A

.L5307

 LDA J
 CMP L0C15
 BCC L5347

 BNE L5317

 LDA I
 CMP L0C05
 BCC L5347

.L5317

 LDA L0CFE
 BNE L5323

 LDA L0CEE
 CMP #&14
 BCC L533A

.L5323

 LDA L4F84
 CMP #&27
 BEQ L533A

 LDA L0C11
 ASL A
 LDY #4
 LDX #2
 LDA L0C10
 EOR #&3F
 JSR L57BB

.L533A

 LDA L
 BNE L5347

 LDA #4
 JSR L4D87

 LDA #&27
 BNE L5349

.L5347

 LDA #&9C

.L5349

 STA L4F84
 JSR L54B9

 LDA RR
 AND #&FE
 STA R
 LDA SS
 STA S
 LDX #5
 LDA #0
 STA L1D46+1

.L5360

 CPX #3
 BCS L536D

 LDY L0C06,X
 LDA L0C16,X
 JMP L5373

.L536D

 LDY L0C40,X
 LDA L0C50,X

.L5373

 STA J
 STY I
 LDA #0
 STA K
 STX VV
 JSR L17E3

 LDA K
 BPL L5395

 SEC
 LDA #0
 SBC W
 STA W
 LDA G
 SBC #0
 STA G
 BCS L5395

 DEC H

.L5395

 LDX VV
 LDY #0
 LDA G
 CPX #3
 BCC L53A5

 CPX #5
 BEQ L53A5

 INY
 INY

.L53A5

 ASL W
 ROL A
 ROL H
 DEY
 BPL L53A5

 STA L0C40,X
 LDA H
 STA L0C50,X
 DEX
 BPL L5360

 LDA #&80
 STA L1D46+1
 LDA L0C43
 STA L0C46
 LDA L0C53
 STA L0C56
 LDA L0C55
 BMI L5407

 STA W
 STA L0C57
 LDA #0
 STA G
 LDA L0C45
 STA L0C47
 LDX #2
 LDA Flaps
 PHP
 BEQ L53E7

 LDX #1

.L53E7

 ASL A
 ROL W
 ROL G
 DEX
 BPL L53E7

 PLP
 BEQ L53F6

 SEC
 JSR L54AC

.L53F6

 CLC
 LDA W
 ADC L0C40
 STA L0C40
 LDA G
 ADC L0C50
 STA L0C50

.L5407

 RTS

\ ******************************************************************************
\
\       Name: L5408
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5408

 LDX #&0C

.L540A

 CPX #9
 BNE L5410

 LDX #7

.L5410

 LDA L4F80,X
 STA R
 LDY L0C40,X
 LDA L0C50,X
 JSR L546E

 LDX VV
 CPX #4
 BNE L5434

 TAY
 BPL L5429

 EOR #&FF

.L5429

 CMP #8
 BCC L5434

 LDA #3
 JSR L4D87

 LDX #4

.L5434

 LDY L42F0,X
 BEQ L545B

 BPL L5452

 LDA #0
 STA R
 LDA G
 BPL L5445

 DEC R

.L5445

 LSR R
 ROR G
 ROR W
 ROR V
 INY
 BNE L5445

 BEQ L545B

.L5452

 ASL V
 ROL W
 ROL G
 DEY
 BNE L5452

.L545B

 LDA G
 STA L0C70,X
 LDA W
 STA L0C60,X
 LDA V
 STA L0C20,X
 DEX
 BPL L540A

 RTS

\ ******************************************************************************
\
\       Name: L546E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L546E

 STY P
 STA P+1

\ ******************************************************************************
\
\       Name: L5472
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5472

 STX VV

\ ******************************************************************************
\
\       Name: L5474
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5474

 LDX P+1
 BPL L5484

 LDA #0
 SEC
 SBC P
 STA P
 LDA #0
 SBC P+1
 TAX

.L5484

 LDY R
 JSR L1821

 STA G
 LDA V
 STA W
 LDY R
 LDX P
 JSR L1821

 CLC
 ADC W
 STA W
 LDA #0
 ADC G
 STA G
 LDX P+1
 BPL L54B8

 LDA #0
 SEC
 SBC V
 STA V

\ ******************************************************************************
\
\       Name: L54AC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L54AC

 LDA #0
 SBC W
 STA W
 LDA #0
 SBC G
 STA G

.L54B8

 RTS

\ ******************************************************************************
\
\       Name: L54B9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L54B9

 LDX #1

.L54BB

 LDA #&7D
 STA R
 LDA L0C00,X
 STA P
 LDA L0C10,X
 STA P+1
 ASL P
 ROL P+1
 JSR L5472

 LDA VV
 TAX
 EOR #1
 TAY
 SEC
 LDA L0C43,Y
 SBC W
 STA L0C06,X
 LDA L0C53,Y
 SBC G
 STA L0C16,X
 DEX
 BPL L54BB

 SEC
 LDA #0
 SBC L0C02
 STA L0C08
 LDA #0
 SBC L0C12
 ASL L0C08
 ROL A
 STA L0C18
 RTS

\ ******************************************************************************
\
\       Name: L5500
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5500

 LDX #2

.L5502

 LDA L0C0C,X
 BEQ L552F

 LDY KeyLoggerLow,X
 BNE L551B

 TAY
 BMI L5515

 CPY #4
 BCS L552C

 BCC L552A

.L5515

 CPY #&FD
 BCS L552A

 BCC L552C

.L551B

 CPX #1
 BCC L552F

 BNE L5525

 LDY L
 BEQ L552F

.L5525

 EOR KeyLoggerHigh,X
 BPL L552F

.L552A

 LDA #0

.L552C

 STA L0C0C,X

.L552F

 LDA L0C0C,X
 BPL L5539

 EOR #&FF
 CLC
 ADC #1

.L5539

 STA R
 LDY L0C45
 LDA L0C55
 JSR L546E

 LDX VV
 LDY L0C0C,X
 BPL L554F

 SEC
 JSR L54AC

.L554F

 STA L0C5A,X
 LDA W
 STA L0C4A,X
 DEX
 BEQ L552F

 BPL L5502

 RTS

\ ******************************************************************************
\
\       Name: L555D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L555D

 LDX #2

.L555F

 LDA L0C20,X
 CLC
 ADC L0C2A,X
 STA L0C30,X
 LDA L0C60,X
 ADC L0C6A,X
 STA L0C80,X
 LDA L0C70,X
 ADC L0C7A,X
 STA L0C90,X
 DEX
 BPL L555F

 LDA #0
 STA S
 LDA L0AFD
 CLC
 ADC L0C30
 STA L0C30
 LDA L0BFD
 BPL L5593

 DEC S

.L5593

 ADC L0C80
 STA L0C80
 LDA L0C90
 ADC S
 STA L0C90
 SEC
 LDA L0C32
 SBC L0C26
 STA L0C32
 LDA L0C82
 SBC L0C66
 STA L0C82
 LDA L0C92
 SBC L0C76
 STA L0C92
 SEC
 LDA #0
 SBC L0C63
 STA L09FC
 LDA #0
 SBC L0C73
 STA L4AFC
 SEC
 LDA L0C67
 SBC L0C64
 STA L0AFC
 LDA L0C77
 SBC L0C74
 STA L0BFC
 LDA L0C15
 BMI L55F3

 PHA
 JSR L33EE

 PLA
 CMP #&30
 BCC L55F5

 LDA #&EA
 BNE L5649

.L55F3

 LDA #0

.L55F5

 LDX L0CE9
 BEQ L5636

 STA H
 STA G
 LDA L0C05
 LDX #3

.L5603

 LSR G
 ROR A
 DEX
 BPL L5603

 STA W
 LDY L0C1F
 STY R
 LDA L0C0F
 LDX L
 BEQ L562B

 CPY #4
 BCC L561E

 ASL A
 ROL R

.L561E

 LDY H
 CPY #4
 BCS L562B

 CPY #1
 BCC L562B

 ASL A
 ROL R

.L562B

 SEC
 SBC W
 TAX
 LDA R
 SBC G
 TAY
 BPL L563A

.L5636

 LDY #0
 LDX #0

.L563A

 JSR L57E4

 TXA
 SEC
 SBC L0C65
 STA L07FC
 TYA
 SBC L0C75

.L5649

 STA L49FC
 RTS

\ ******************************************************************************
\
\       Name: L564D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L564D

 LDA L0CED
 SEC
 SBC L4401
 LDA L0CFD
 SBC L4479
 BNE L566E

 LDA L0CEF
 SEC
 SBC L4451
 LDA L0CFF
 SBC L44C9
 BMI L566E

 CMP #&18
 RTS

.L566E

 SEC
 RTS

\ ******************************************************************************
\
\       Name: L5670
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L5670

 LDA L
 BEQ L568F

 JSR L564D

 BCC L568F

 ASL L0CE8
 LDX #&EE
 CLC
 LDY #8
 JSR L57B3

 LDX #&EC
 LDY #4

 LDA VIA+&64            \ Read the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

 LSR A
 JSR L57B3

.L568F

 LDA L0CFE
 BMI L56A3

 BEQ L56A8

 CMP #2
 BCC L569D

 STA L0CF9

.L569D

 LDA #0
 STA L0CC5
 RTS

.L56A3

 LDX #&EE
 JSR L57F6

.L56A8

 LDA L0CF0
 CMP L0CEE
 BCC L569D

 LDX L
 BEQ L5701

 STA L0CEE
 LDX L0C9A
 BPL L56C1

 LDX #&8A
 JSR L57F6

.L56C1

 LDX #&EC
 JSR L57F6

 LDX #2
 JSR L57F6

 LDX Undercarriage
 BNE L56E8

 LDX L0CE8
 BMI L56D8

 ASL L0CE8

.L56D8

 LDX L0CFA
 BPL L56E7

 LDX #&EA
 JSR L57F6

.L56E2

 LDX #0
 JSR L57F6

.L56E7

 RTS

.L56E8

 LDX L0CFA
 BMI L56E7

 CPX #7
 BCC L56E7

 LDA #7
 STA L0CFA
 LDA #0
 STA L0CEA
 LDX L0C10
 BPL L56E2

 RTS

.L5701

 SEC
 SBC L0CEE
 LSR A
 CLC
 ADC L0CF0
 STA L0CEE
 LDA L0C9A
 BPL L5720

 SEC
 LDA #0
 SBC L0C8A
 STA L0C8A
 LDA #0
 SBC L0C9A

.L5720

 STA L0C9A
 LSR A
 BNE L573D

 LDA L0C8A
 ROR A
 STA R
 LDX Undercarriage
 BNE L5739

 DEX
 STX L0CF7
 CMP #&A0
 BCC L5740

.L5739

 CMP #&6E
 BCC L5745

.L573D

 JMP L4C6A

.L5740

 LDA #0
 JSR L36A0

.L5745

 JSR L564D

 BCC L575A

 LDA R
 STA L0C8A
 LDX Undercarriage
 BEQ L575A

 CMP #&50
 BCC L5762

 BCS L573D

.L575A

 LDA #&1A
 JSR L4D87

 JSR L4DBC

.L5762

 LDY L0CEC
 LDA L0CFC
 JSR L546E

 SEC
 JSR L54AC

 LDA #0
 STA T
 LDA G
 BPL L5779

 DEC T

.L5779

 LDX #1

.L577B

 LSR T
 ROR A
 ROR W
 DEX
 BPL L577B

 STA L0C12
 LDA W
 STA L0C02
 LDX #&EC
 JSR L57F6

 LDA L0CFA
 BPL L579F

 LDA Undercarriage
 BNE L579F

 LDX #&EA
 JSR L57F6

.L579F

 LDA R
 CMP #&0C
 BCS L57B2

 LDA L0CEE
 CMP L0CF0
 BNE L57B2

 LDA #1
 STA L0CC5

.L57B2

 RTS

\ ******************************************************************************
\
\       Name: L57B3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L57B3

 LDA L0C15
 BMI L57E3

 AND VIA+&64            \ AND with the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

\ ******************************************************************************
\
\       Name: L57BB
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L57BB

 PHP
 BPL L57C0

 EOR #&FF

.L57C0

 STA G
 LDA #0

.L57C4

 LSR G
 ROR A
 DEY
 BPL L57C4

 STA W
 PLP
 BCC L57D2

 JSR L54AC

.L57D2

 LDA W
 CLC
 ADC L0C00,X
 STA L0C00,X
 LDA G
 ADC L0C10,X
 STA L0C10,X

.L57E3

 RTS

\ ******************************************************************************
\
\       Name: L57E4
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L57E4

 STY P+1
 STX P
 LDA L0CFE
 EOR #&FF
 STA R
 JSR L5474

 TAY
 LDX W
 RTS

\ ******************************************************************************
\
\       Name: L57F6
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L57F6

 LDA #0
 STA L0C00,X
 STA L0C10,X
 RTS

 BRK

\ ******************************************************************************
\
\       Name: from5800
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

ORG &5800

.from5800

ORG &0D00

\ ******************************************************************************
\
\       Name: L0D00
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0D00

 RTI

\ ******************************************************************************
\
\       Name: L0D01
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0D01

 LDX GG
 LDA #0
 STA N
 LDA #&10
 STA R
 LDA L0400,X
 TAY
 AND #1
 BEQ L0D14

 RTS

.L0D14

 TYA
 ORA #1
 STA L0400,X
 LDA L4900,X
 BMI L0D37

 STA P+1
 BEQ L0D2B

 LDA L0700,X
 STA P
 JMP L0D46

.L0D2B

 LDA L0700,X
 BNE L0D32

 LDA #1

.L0D32

 STA P
 JMP L0D46

.L0D37

 LDA #0
 SEC
 SBC L0700,X
 STA P
 LDA #0
 SBC L4900,X
 STA P+1

.L0D46

 LDA L4A00,X
 BMI L0D55

 STA QQ
 LDA L0900,X
 STA PP
 JMP L0D6A

.L0D55

 LDA #0
 SEC
 SBC L0900,X
 STA PP
 LDA #0
 SBC L4A00,X
 STA QQ
 LDA N
 ORA #8
 STA N

.L0D6A

 LDA L0B00,X
 BMI L0D7C

 STA SS
 LDA L0A00,X
 ASL A
 ROL SS
 STA RR
 JMP L0D94

.L0D7C

 LDA #0
 SEC
 SBC L0A00,X
 STA RR
 LDA #0
 SBC L0B00,X
 ASL RR
 ROL A
 STA SS
 LDA N
 ORA #4
 STA N

.L0D94

 LDA QQ
 CMP P+1
 BCC L0DA8

 BNE L0DA2

 LDA PP
 CMP P
 BCC L0DA8

.L0DA2

 LDA #&20
 ORA N
 STA N

.L0DA8

 LDA SS
 CMP P+1
 BCC L0DBC

 BNE L0DB6

 LDA RR
 CMP P
 BCC L0DBC

.L0DB6

 LDA N
 ORA #&10
 STA N

.L0DBC

 LDY P
 LDX P+1
 JSR L0F48

 TAX
 LDA L3900,X
 STA TT
 LDA L4700,X
 AND #&F8
 STA S
 STY K
 LDA WW
 STA UU
 LDY PP

 LDX QQ
 JSR L0E69

 LDA P+1
 STA QQ
 LDA P
 STA PP
 LDA WW
 STA VV
 LDY RR
 LDX SS
 JSR L0E69

 JSR L0FA7

 LDX GG
 LDA L4900,X
 BMI L0E02

 LDA L4A00,X
 BPL L0E19

.L0DFF

 JMP L0E07

.L0E02

 LDA L4A00,X
 BMI L0E19

.L0E07

 LDA #&50
 SEC
 SBC QQ
 STA L0900,X
 LDA #0
 SBC SS
 STA L4A00,X
 JMP L0E28

.L0E19

 LDA #&50
 CLC
 ADC QQ
 STA L0900,X
 LDA #0
 ADC SS
 STA L4A00,X

.L0E28

 LDX GG
 LDA L4900,X
 BMI L0E37

 LDA L0B00,X
 BPL L0E4E

 JMP L0E3C

.L0E37

 LDA L0B00,X
 BMI L0E4E

.L0E3C

 LDA #&60
 SEC

.L0E3F

 SBC P+1
 STA L0A00,X
 LDA #0
 SBC RR
 STA L0B00,X
 JMP L0E5D

.L0E4E

 LDA #&60
 CLC
 ADC P+1
 STA L0A00,X
 LDA #0
 ADC RR
 STA L0B00,X

.L0E5D

 LDA L0400,X
 ORA N
 STA L0400,X
 RTS

 JSR L0F48

\ ******************************************************************************
\
\       Name: L0E69
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0E69

 JSR L0F48

 STA J
 STY I
 LDX TT
 LDY J
 LDA L4500,X
 ORA L3700,Y
 STA T
 AND #&F0
 ORA L4300,Y
 STA U
 AND #&0F
 ORA L3800,X
 STA V
 AND #&F0
 ORA L3700,Y
 TAY
 LDX S
 AND #&0F
 ORA L4500,X
 TAX
 LDA L3A00,X
 CLC
 LDX V
 ADC L3A00,X
 STA P
 LDX T
 LDA L3A00,X
 ADC #1
 STA P+1
 LDX U
 LDA L3A00,X
 ADC L3A00,Y
 TAX
 LDY #0
 BCC L0EBB

 LDY #&10

.L0EBB

 LDA L3800,X
 ADC P
 BCC L0EC3

 INY

.L0EC3

 ADC J
 BCC L0EC8

 INY

.L0EC8

 ADC S
 STA P
 TYA
 ADC L3700,X
 ADC P+1
 BCC L0EDB

 CLC
 ADC TT
 SEC
 JMP L0EDD

.L0EDB

 ADC TT

.L0EDD

 ROR A
 ROR P
 STA P+1
 LDA I
 BEQ L0F16

 AND #&F0
 LDX TT
 ORA L3700,X
 TAY
 AND #&F0
 ORA L4300,X
 TAX
 LDA L3A00,X
 TAX
 CLC
 LDA L3800,X
 ADC I

.L0EFE

 LDA L3A00,Y
 ADC L3700,X
 ROR A
 CLC
 ADC P
 STA P
 BCC L0F16

 INC P+1
 BNE L0F16

 LDA #&FF
 STA P+1
 STA P

.L0F16

 LDA K
 AND #&C0
 BEQ L0F47

 STA K
 CLC
 LDA TT
 ADC #1
 ROR A
 STA W
 LSR A
 BIT K
 BVS L0F2F

 LDA #0
 BIT K

.L0F2F

 BPL L0F34

 CLC
 ADC W

.L0F34

 TAY
 LDX P+1
 JSR L1821

 STA G
 LDA P
 SEC
 SBC G
 STA P
 BCS L0F47

 DEC P+1

.L0F47

 RTS

\ ******************************************************************************
\
\       Name: L0F48
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0F48

 BEQ L0F77

 LDA L4700,X
 AND #7
 CLC
 ADC #8
 STA WW
 CMP #&0D
 TXA
 STY T
 BCC L0F66

.L0F5B

 ASL T
 ROL A
 BCC L0F5B

 LDY T
 RTS

.L0F63

 ASL T
 ROL A

.L0F66

 BIT R
 BEQ L0F63

 TAY
 LDX T
 LDA L3700,X
 ORA L3800,Y
 LDY L3800,X
 RTS

\ ******************************************************************************
\
\       Name: L0F77
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0F77

 CPY #0
 BEQ L0F97

 LDA L4700,Y
 AND #7
 STA WW
 CMP #4
 TYA
 LDY #0
 BCC L0F8E

.L0F89

 ASL A
 BCC L0F89

 RTS

.L0F8D

 ASL A

.L0F8E

 BIT R
 BEQ L0F8D

 TAX
 LDA L3800,X
 RTS

.L0F97

 TSX
 INX
 INX
 TXS
 LDA #0
 STA P+1
 STA P
 LDX UU
 DEX
 STX WW
 RTS

\ ******************************************************************************
\
\       Name: L0FA7
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0FA7

 LDA #0
 STA RR
 STA SS
 LDA #7
 STA T
 LDA VV
 SEC
 SBC UU
 TAX
 INX
 LDA WW
 SEC
 SBC UU
 TAY
 INY
 CPY #7
 BCC L0FC6

 JMP L0FCA

.L0FC6

 CPX #7
 BCC L0FE4

.L0FCA

 LDA VV
 SEC
 SBC WW
 BEQ L0FDA

 BPL L0FDE

 LDA P+1
 BMI L0FE4

 JMP L0FE2

.L0FDA

 LDA P+1
 BMI L0FE4

.L0FDE

 LDA QQ
 BMI L0FE4

.L0FE2

 INC T

.L0FE4

 TYA
 BMI L0FF0

 JMP L0FEC

.L0FEA

 DEX
 DEY

.L0FEC

 CPY T
 BCS L0FEA

.L0FF0

 TXA
 BMI L0FFC

 JMP L0FF8

.L0FF6

 DEX
 DEY

.L0FF8

 CPX T
 BCS L0FF6

.L0FFC

 TXA
 BMI L1017

.L0FFF

 BNE L1006
 ASL PP
 JMP L1025

.L1006

 LDA QQ

.L1008

 ASL PP
 ROL A
 ROL SS
 DEX
 BNE L1008

 STA QQ
 ASL PP
 JMP L1025

.L1017

 EOR #&FF
 CLC
 ADC #1
 TAX
 LDA QQ

.L101F

 LSR A
 DEX
 BNE L101F

 STA QQ

.L1025

 BCC L103B

 INC QQ
 BNE L103B

 INC SS
 LDA SS
 CMP #&40
 BCC L103B

 LDA #&3F
 STA SS
 LDA #&FF
 STA QQ

.L103B

 TYA
 BMI L1056

 BNE L1045

 ASL P
 JMP L1064

.L1045

 LDA P+1

.L1047

 ASL P
 ROL A
 ROL RR
 DEY
 BNE L1047

 STA P+1
 ASL P
 JMP L1064

.L1056

 EOR #&FF
 CLC
 ADC #1
 TAY
 LDA P+1

.L105E

 LSR A
 DEY
 BNE L105E

 STA P+1

.L1064

 BCC L107A

 INC P+1
 BNE L107A

 INC RR
 LDA RR
 CMP #&40
 BCC L107A

 LDA #&3F
 STA RR
 LDA #&FF
 STA P+1

.L107A

 RTS

\ ******************************************************************************
\
\       Name: L107B
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L107B

 LDA #2
 BNE L1081

\ ******************************************************************************
\
\       Name: L107F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L107F

 LDA #0

.L1081

 STA V
 LDA #0
 STA TT
 STA UU
 LDX L
 LDY M
 LDA L0900,X
 STA R
 LDA L4A00,X
 STA RR
 LDA L0A00,X
 STA S
 LDA L0B00,X
 STA SS
 LDA L0900,Y
 STA W
 SEC
 SBC R
 STA T
 LDA L4A00,Y
 STA QQ
 SBC RR
 STA I
 BPL L10C9

 LDA #&80
 ORA V
 STA V
 LDA #0
 SEC
 SBC T
 STA T
 LDA #0
 SBC I
 STA I

.L10C9

 LDA L0A00,Y
 STA G
 SEC
 SBC S
 STA U
 LDA L0B00,Y
 STA H
 SBC SS
 STA J
 BPL L10F1

 LDA #&40
 ORA V
 STA V

 LDA #0
 SEC
 SBC U
 STA U
 LDA #0
 SBC J
 STA J

.L10F1

 LDA #0
 LDX S
 LDY SS
 BEQ &1101

 PHP
 LDX #0
 PLP
 CLC
 BMI &1102

COPYBLOCK L0D00, P%, from5800

\ ******************************************************************************
\
\       Name: from5C00
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

ORG &5C00

.from5C00

ORG &0B00

\ ******************************************************************************
\
\       Name: Screen
\       Type: Subroutine
\   Category: Start and end
\    Summary: Set up the screen mode and load the dashboard image
\
\ ******************************************************************************

.Screen

 LDA #22                \ Switch to screen mode 5 with the following VDU
 JSR OSWRCH             \ command:
 LDA #5                 \
 JSR OSWRCH             \   VDU 22, 5

 LDY #0                 \ We now want to write the VDU command to disable the
                        \ cursor, whose bytes are in the variable at Cursor, so
                        \ set up a counter in Y

.ScreenL1

 LDA Cursor,Y           \ Write the Y-th value from Cursor
 JSR OSWRCH

 INY                    \ Increment the loop counter

 CPY #10                \ Loop back to write the next character until we have
 BNE ScreenL1           \ written all 10, in other words:
                        \
                        \   VDU 23, 0, 10, 23, 0, 0, 0, 0, 0, 0

 LDA #31                \ Move the text cursor to column 4, row 10 with the
 JSR OSWRCH             \ following VDU command:
 LDA #4                 \
 JSR OSWRCH             \   VDU 31, 4, 10
 LDA #10
 JSR OSWRCH

 LDY #0                 \ We now want to print the "Please wait" message in
                        \ variable Wait, so set up a counter in Y

.ScreenL2

 LDA Wait,Y             \ Print the Y-th character from Wait
 JSR OSWRCH

 INY                    \ Increment the loop counter

 CPY #11                \ Loop back to print the next character until we have
 BNE ScreenL2           \ printed all 11 ("Please wait")

 LDX #LO(DASHBD)        \ Set (Y X) to point to DASHBD ("L.DASHBD 7100")
 LDY #HI(DASHBD)

 JSR OSCLI              \ Call OSCLI to run the OS command in DASHBD, which
                        \ loads the dashboard image into the screen

 LDA #129               \ Call OSBYTE with A = 129, X = &FF and Y = 0 to scan
 LDX #&FF               \ the keyboard for &FF centiseconds (2.56 seconds)
 LDY #0
 JSR OSBYTE

 JMP Setup              \ Jump down to Setup to continue the setup process

\ ******************************************************************************
\
\       Name: DASHBD
\       Type: Variable
\   Category: Start and end
\    Summary: The OS command string for loading the dashboard image in DASHBD
\
\ ******************************************************************************

.DASHBD

 EQUS "L.DASHBD 7100"   \ This is short for "*LOAD DASHBD 7100"
 EQUB 13

\ ******************************************************************************
\
\       Name: Cursor
\       Type: Variable
\   Category: Start and end
\    Summary: The VDU command for disabling the cursor
\
\ ******************************************************************************

.Cursor

 EQUB 23, 0, 10, 23     \ Set 6845 register R10 = 23
 EQUB 0, 0, 0           \
 EQUB 0, 0, 0           \ This is the "cursor start" register, so this sets the
                        \ cursor start line at 23, effectively disabling the
                        \ cursor

\ ******************************************************************************
\
\       Name: Wait
\       Type: Variable
\   Category: Start and end
\    Summary: The "Please wait" message shown when the game loads
\
\ ******************************************************************************

.Wait

 EQUS "Please wait"
 EQUB 13

\ ******************************************************************************
\
\       Name: Setup
\       Type: Subroutine
\   Category: Start and end
\    Summary: Move code around, clear the edges of the canopy view, draw the
\             canopy edges and rivets, and jump to the main code
\
\ ******************************************************************************

.Setup

 LDA #140               \ Call OSBYTE with A = 140 to select the tape filing
 JSR OSBYTE             \ system (i.e. do a *TAPE command)

 LDY #0                 \ We now copy the following block in memory:
                        \
                        \   * &0400-&07FF is copied to &0D00-&10FF
                        \
                        \ so we set up a byte counter in Y
                        \
                        \ Note that this is the same block that was copied from
                        \ &5800-&5BFF in the Entry routine, so in all we end up
                        \ moving code as follows:
                        \
                        \   * &5800-&5BFF is copied to &0400-&07FF
                        \                      then to &0D00-&10FF
                        \   * &5C00-&5DFF is copied to &0B00-&0CFF
                        \
                        \ As the rest of the main code file runs from &1100 to
                        \ &57FF, this gives us a continuous block of code from
                        \ &0B00 to &57FF, followed by screen memory at &5800 to
                        \ &7FFF

.SetupL1

 LDA &0400,Y            \ Copy the Y-th byte of &0400 to the Y-th byte of &0D00
 STA &0D00,Y

 LDA &0500,Y            \ Copy the Y-th byte of &0500 to the Y-th byte of &0E00
 STA &0E00,Y

 LDA &0600,Y            \ Copy the Y-th byte of &0600 to the Y-th byte of &0F00
 STA &0F00,Y

 LDA &0700,Y            \ Copy the Y-th byte of &0700 to the Y-th byte of &1000
 STA &1000,Y

 DEY                    \ Decrement the loop counter

 BNE SetupL1            \ Loop back until we have copied a whole page of bytes

 NOP                    \ Presumably this contained some kind of copy protection
 NOP                    \ or decryption code that has been replaced by NOPs in
 NOP                    \ this unprotected version of the game
 NOP

                        \ The following two calls to ClearRows clear the first
                        \ two character rows on-screen

 LDA #&58               \ Set P(1 0) = &5800, so the call to ClearRows starts
 STA P+1                \ clearing from the start of the first character row
 LDA #0                 \ (i.e. row 0)
 STA P

 LDA #2                 \ Set R = 2, so we clear 2 character rows
 STA R

 LDY #0                 \ Set Y = 0, so we clear 256 bytes per row, or 32 of the
                        \ 40 character blocks in each screen row (128 pixels)

 JSR ClearRows          \ Call ClearRows to clear the first 256 bytes of the
                        \ first two character rows on-screen, which blanks out
                        \ the first 32 character blocks (blocks 0 to 31) of the
                        \ top two character rows (rows 0 and 1)

 LDA #&58               \ Set P(1 0) = &58FF, so the call to ClearRows starts
 STA P+1                \ clearingfrom character block 32 in the first character
 LDA #&FF               \ row on-screen
 STA P

 LDA #2                 \ Set R = 2, so we clear 2 character rows
 STA R

 LDY #64                \ Set Y = 64, so we clear 64 bytes per row, or 8 of the
                        \ 40 character blocks in each screen row (32 pixels)

 JSR ClearRows          \ Call ClearRows to clear the last 64 bytes of the first
                        \ two character rows on-screen, which blanks out the
                        \ last 8 character blocks (blocks 32 to 39) of the top
                        \ two character rows (rows 0 and 1)

                        \ The following two calls to ClearRows clear a
                        \ 4-pixel-wide column on the left and right edges of the
                        \ screen

 LDA #&5A               \ Set P(1 0) = &5A7F, so the call to ClearRows starts
 STA P+1                \ clearing from the start of the third character row
 LDA #&7F               \ (i.e. row 2)
 STA P

 LDA #18                \ Set R = 18, so we clear 18 character rows
 STA R

 LDY #8                 \ Set Y = 8, so we clear 8 bytes per row, or 1 of the
                        \ 40 character blocks in each screen row (4 pixels)

 JSR ClearRows          \ Call ClearRows to clear the first byte of character
                        \ rows 2 to 20, which blanks out the first character
                        \ block (block 0) on all 18 rows, i.e. the first four
                        \ pixels

 LDA #&5B               \ Set P(1 0) = &5BB7, so the call to ClearRows starts
 STA P+1                \ clearing from the start of the last character block
 LDA #&B7               \ on the third character row (i.e. row 2)
 STA P

 LDA #18                \ Set R = 18, so we clear 18 character rows
 STA R

 LDY #8                 \ Set Y = 8, so we clear 8 bytes per row, or 1 of the
                        \ 40 character blocks in each screen row (4 pixels)

 JSR ClearRows          \ Call ClearRows to clear the last byte of character
                        \ rows 2 to 20, which blanks out the last character
                        \ block (block 39) on all 18 rows, i.e. the last four
                        \ pixels

                        \ We now draw the edges of the canopy view, starting
                        \ with the left edge, then the right edge, and then the
                        \ horizontal line along the top (so this does not
                        \ include the bottom edge, which has already been
                        \ displayed as part of the dashboard image, and it also
                        \ doesn't include the diagonal top corners, which are
                        \ drawn by the main game code)

 LDX #3                 \ Move the graphics cursor to (3, 96)
 LDY #96
 JSR Move

 LDX #3                 \ Draw a line to (3, 239)
 LDY #239
 JSR Draw

 LDX #156               \ Move the graphics cursor to (156, 96)
 LDY #96
 JSR Move

 LDX #156               \ Draw a line to (156, 239)
 LDY #239
 JSR Draw

 LDX #8                 \ Move the graphics cursor to (8, 248)
 LDY #248
 JSR Move

 LDX #151               \ Draw a line to (151, 248)
 LDY #248
 JSR Draw

                        \ We now draw the square rivets around the edge of the
                        \ canopy view, starting with the three rivets up each
                        \ side of the screen

 LDY #121               \ Set Y = 121 so the first rivets are drawn at height
                        \ 121, i.e. at (0, 121) and (158, 121)

.SetupL2

 LDX #0                 \ Draw a square rivet at (0, Y)
 JSR Rivet

 LDX #158               \ Draw a square rivet at (158, Y)
 JSR Rivet

 TYA                    \ Set Y = Y + 48
 CLC                    \
 ADC #48                \ so the next rivet we draw will be 48 pixels higher
 TAY

 CPY #9                 \ Loop back to draw the next rivet until Y = 9, at which
 BNE SetupL2            \ point Y has wrapped round off the top of the screen
                        \ back to the bottom and we will have drawn three rivets
                        \ up each side of the canopy view

                        \ Finally, we draw the six square rivets along the top
                        \ of the canopy view

 LDY #255               \ Set X and Y so the first rivet is at (19, 255)
 LDX #19

.SetupL3

 JSR Rivet              \ Draw a square rivet at (X, Y)

 TXA                    \ Set X = X + 24
 CLC                    \
 ADC #24                \ so the next rivet we draw will be 24 pixels to the
 TAX                    \ right

 CPX #163               \ Loop back to draw the next rivet until X = 163, at
 BNE SetupL3            \ which point we will have drawn six rivets along the
                        \ top of the canopy view

 JMP MainLoop           \ Jump to MainLoop to start the game         

\ ******************************************************************************
\
\       Name: Point
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw a point on-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The x-coordinate of the point (0-159)
\
\   Y                   The y-coordinate of the point (0-255)
\
\ ******************************************************************************

.Point

 LDA #69                \ Set A = 69 so the following VDU 25 command plots a
                        \ point at an absolute position on-screen

 BNE Plot               \ Jump to Plot to do the move (this BNE is effectively a
                        \ JMP as A is never zero

\ ******************************************************************************
\
\       Name: Move
\       Type: Subroutine
\   Category: Graphics
\    Summary: Move the graphics cursor to a point on-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The x-coordinate to move the graphics cursor to (0-159)
\
\   Y                   The y-coordinate to move the graphics cursor to (0-255)
\
\ ******************************************************************************

.Move

 LDA #4                 \ Set A = 4 so the following VDU 25 command moves the
                        \ graphics cursor an absolute position on-screen

 BNE Plot               \ Jump to Plot to do the move (this BNE is effectively a
                        \ JMP as A is never zero

\ ******************************************************************************
\
\       Name: Draw
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw a line from the graphics cursor to a point on-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The x-coordinate of the end of the line (0-159)
\
\   Y                   The y-coordinate of the end of the line (0-255)
\
\ ******************************************************************************

.Draw

 LDA #5                 \ Set A = 5 to denote "draw line absolute in the current
                        \ graphics foreground colour"

\ ******************************************************************************
\
\       Name: Plot
\       Type: Subroutine
\   Category: Graphics
\    Summary: Perform a plot command
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The type of plot command:
\
\                         * 4 = Move cursor to coordinate
\
\                         * 5 = Draw line from cursor to coordinate
\
\                         * 69 = Draw point at coordinate
\
\   X                   The x-coordinate for the plot command (0-159)
\
\   Y                   The y-coordinate for the plot command (0-255)
\
\ ******************************************************************************

.Plot

 PHA                    \ Store the value of A on the stack, so we can retrieve
                        \ it after the call to OSWRCH

 LDA #25                \ Start a VDU 25 command, which is the equivalent of a
 JSR OSWRCH             \ Plot command in BBC BASIC, and which has the following
                        \ format:
                        \
                        \   VDU 25, K, X; Y;
                        \
                        \ where K is the plotting mode (i.e. move or draw) and
                        \ X and Y are the relevant coordinates as 16-bit numbers

 PLA                    \ Retrieve the value of A that we stored on the stack

 JSR OSWRCH             \ Write the K parameter of the VDU command, i.e. the
                        \ type of plot command

 LDA #0                 \ Set P = 0
 STA P

 TXA                    \ Set A = X, so now (P A) contains the x-coordinate as a
                        \ 16-bit number

 ASL A                  \ Set (P A) = (P A) * 8
 ROL P                  \           = x-coordinate * 8
 ASL A                  \
 ROL P                  \ This gives the screen location of the x-coordinate in
 ASL A                  \ terms of VDU coordinates, where the screen is always
 ROL P                  \ 1280 pixels wide, which is 8 times the number of
                        \ pixels in 160-pixel-wide mode 5 (i.e. 8 * 160 = 1280)

 JSR OSWRCH             \ Write (P A), writing the low byte in A first

 LDA P                  \ And then the high byte in P
 JSR OSWRCH

 LDA #0                 \ Set P = 0
 STA P

 TYA                    \ Set A = Y, so now (P A) contains the y-coordinate as a
                        \ 16-bit number

 ASL A                  \ Set (P A) = (P A) * 4
 ROL P                  \           = y-coordinate * 4
 ASL A                  \
 ROL P                  \ This gives the screen location of the y-coordinate in
                        \ terms of VDU coordinates, where the screen is always
                        \ 1024 pixels high, which is 4 times the number of
                        \ pixels in 256-pixel-high mode 5 (i.e. 4 * 256 = 1024)

 JSR OSWRCH             \ Write (P A), writing the low byte in A first

 LDA P                  \ And then the high byte in P
 JSR OSWRCH

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Rivet
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw a square rivet (2 pixels across, 4 pixels high)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The x-coordinate of the top-left corner of the rivet
\
\   Y                   The y-coordinate of the top-left corner of the rivet
\
\ ******************************************************************************

.Rivet

 JSR Point              \ Draw a point at (X, Y)

 DEY                    \ Draw a point at (X, Y - 1)
 JSR Point

 DEY                    \ Draw a point at (X, Y - 2)
 JSR Point

 DEY                    \ Draw a point at (X, Y - 3)
 JSR Point

 INX                    \ Draw a point at (X + 1, Y - 3)
 JSR Point

 INY                    \ Draw a point at (X + 1, Y - 2)
 JSR Point

 INY                    \ Draw a point at (X + 1, Y - 1)
 JSR Point

 INY                    \ Draw a point at (X + 1, Y)
 JSR Point

 DEX                    \ Restore X to its original value

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ClearRows
\       Type: Subroutine
\   Category: Graphics
\    Summary: Clear the specified number of rows on-screen
\
\ ------------------------------------------------------------------------------
\
\ This routine zeroes a block of Y bytes on R screen rows, starting from screen
\ address P(1 0) on the first row.
\
\ A value of Y = 0 will zero 256 bytes.
\
\ In other words, P(1 0) represents the top-left pixel to blank, Y represents
\ the width of the area to blank (with a value of 8 per character block), and R
\ contains the number of rows to blank.
\
\ Arguments:
\
\   Y                   The width of each character row to zero (in bytes),
\                       0 indicates 256 bytes
\
\   P(1 0)              The screen address to start zeroing from
\
\   R                   The number of character rows to zero
\
\ ******************************************************************************

.ClearRows

 STY S                  \ Store the width of each character row in S

.ClearRowsL1

 LDA #0                 \ We are about to zero a block of memory, so set A = 0
                        \ so we can use it as our overwrite value

 LDY S                  \ Fetch the width of each character row, which we stored
                        \ in S above

.ClearRowsL2

 STA (P),Y              \ Zero the Y-th byte of the page at P(1 0), which sets 4
                        \ pixels to black

 DEY                    \ Decrement the byte pointer

 BNE ClearRowsL2        \ Loop back until we have zeroed P(1 0) to P(1 0) + Y

 LDA P                  \ Set P(1 0) = P(1 0) + 320
 CLC                    \
 ADC #LO(320)           \ starting with the low bytes
 STA P

 LDA P+1                \ And then the high bytes
 ADC #HI(320)
 STA P+1

 DEC R                  \ Decrement the row counter in R

 BNE ClearRowsL1        \ Loop back until we have zeroed R rows

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L0CA2
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &FF, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00

COPYBLOCK L0B00, P%, from5C00

\ ******************************************************************************
\
\       Name: Entry
\       Type: Subroutine
\   Category: Start and end
\    Summary: The main entry point for the game: move code into lower memory and
\             call it
\
\ ******************************************************************************

ORG &5E00

.Entry

 LDA #129               \ Call OSBYTE with A = 129, X = 0 and Y = &FF to detect
 LDX #0                 \ the machine type. This call is undocumented and is not
 LDY #&FF               \ the recommended way to determine the machine type
 JSR OSBYTE             \ (OSBYTE 0 is the correct way), but this call returns
                        \ the following:
                        \
                        \   * X = Y = 0   if this is a BBC Micro with MOS 0.1
                        \   * X = Y = &FF if this is a BBC Micro with MOS 1.20

 CPX #0                 \ This checks the MOS version, but presumably this
 NOP                    \ contained some kind of copy protection or decryption
 NOP                    \ code that has been replaced by NOPs in this
                        \ unprotected version of the game

 LDA #200               \ Call OSBYTE with A = 200, X = 3 and Y = 0 to disable
 LDX #3                 \ the ESCAPE key and clear memory if the BREAK key is
 LDY #0                 \ pressed
 JSR OSBYTE

 LDY #0                 \ We now copy the following blocks in memory:
                        \
                        \   * &5800-&5BFF is copied to &0400-&07FF
                        \   * &5C00-&5DFF is copied to &0B00-&0CFF
                        \
                        \ so we set up a byte counter in Y
                        \
                        \ Note that the &5800-&5BFF block gets copied again in
                        \ the Setup routine, so it ends up at &0D00-&10FF

.EntryL1

 LDA &5800,Y            \ Copy the Y-th byte of &5800 to the Y-th byte of &0400
 STA &0400,Y

 LDA &5900,Y            \ Copy the Y-th byte of &5900 to the Y-th byte of &0500
 STA &0500,Y

 LDA &5A00,Y            \ Copy the Y-th byte of &5A00 to the Y-th byte of &0600
 STA &0600,Y

 LDA &5B00,Y            \ Copy the Y-th byte of &5B00 to the Y-th byte of &0700
 STA &0700,Y

 LDA &5C00,Y            \ Copy the Y-th byte of &5C00 to the Y-th byte of &0B00
 STA &0B00,Y

 LDA &5D00,Y            \ Copy the Y-th byte of &5D00 to the Y-th byte of &0C00
 STA &0C00,Y

 DEY                    \ Decrement the loop counter

 BNE EntryL1            \ Loop back until we have copied a whole page of bytes

 NOP                    \ Presumably this contained some kind of copy protection
 NOP                    \ or decryption code that has been replaced by NOPs in
 NOP                    \ this unprotected version of the game
 NOP
 NOP
 NOP
 NOP

 JMP Screen             \ Jump to the Screen routine that just moved to &0B00
                        \ to set up the screen and continue the setup process

\ ******************************************************************************
\
\ Save AVIA.bin
\
\ ******************************************************************************

SAVE "3-assembled-output/AVIA.bin", CODE%, P%

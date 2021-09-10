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
L0074 = &0074
L0075 = &0075
L0076 = &0076
L0077 = &0077
L0078 = &0078
L0079 = &0079
L007A = &007A
L007B = &007B
L007C = &007C
L007D = &007D
L007E = &007E
L007F = &007F
L0080 = &0080
L0081 = &0081
L0082 = &0082
L0083 = &0083
L0084 = &0084
L0085 = &0085
L0086 = &0086
L0087 = &0087
L0088 = &0088           \ PP in original
L0089 = &0089
L008A = &008A
L008B = &008B
L008C = &008C
L008D = &008D
L008E = &008E
L008F = &008F

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
L0C01 = &0C01
L0C02 = &0C02
L0C03 = &0C03
L0C05 = &0C05
L0C06 = &0C06
L0C08 = &0C08
L0C09 = &0C09
L0C0C = &0C0C
L0C0D = &0C0D
L0C0E = &0C0E
L0C0F = &0C0F
L0C10 = &0C10
L0C11 = &0C11
L0C12 = &0C12
L0C13 = &0C13
L0C15 = &0C15
L0C16 = &0C16
L0C18 = &0C18
L0C19 = &0C19
L0C1F = &0C1F
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
L0C8A = &0C8A
L0C8C = &0C8C
L0C90 = &0C90
L0C92 = &0C92
L0C93 = &0C93
L0C94 = &0C94
L0C96 = &0C96
L0C99 = &0C99
L0C9A = &0C9A
L0C9C = &0C9C
L0CA0 = &0CA0
L0CA3 = &0CA3
L0CA8 = &0CA8
L0CB0 = &0CB0
L0CB3 = &0CB3
L0CB8 = &0CB8
L0CBA = &0CBA
L0CBB = &0CBB
L0CBE = &0CBE
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
L0CCD = &0CCD
L0CCE = &0CCE
L0CCF = &0CCF
L0CD0 = &0CD0           \ Set to 255 in Reset
L0CD1 = &0CD1           \ Set to 47 in Reset
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
L0CEE = &0CEE           \ Set to 10 in Reset
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
L0CFB = &0CFB
L0CFC = &0CFC
L0CFD = &0CFD           \ Set to 198 in Reset
L0CFE = &0CFE
L0CFF = &0CFF           \ Set to 72 in Reset

\ Canopy screen addresses (rows 0 to 19)

Row1_Block0 = &5940     \ Row 1, block 0
Row1_Block1 = &5948     \ Row 1, block 1
Row1_Block38 = &5A68    \ Row 1, block 38 (last but one)
Row1_Block39 = &5A70    \ Row 1, block 39 (last)
Row6_Block20 = &6020    \ Row 6, start + 160, block 20
Row7_Block20 = &6160    \ Row 7, start + 160, block 20 
Row8_Block11 = &6258    \ Row 8, start + 88, block 11

\ Dashboard screen addresses (rows 20 to 31)

L72E7 = &72E7           
L7427 = &7427
L7524 = &7524
L752A = &752A
L7534 = &7534
L7567 = &7567
L7697 = &7697
L769F = &769F
L76A7 = &76A7
L76AF = &76AF
L77A9 = &77A9
L77E7 = &77E7
L7857 = &7857
L785E = &785E
L785F = &785F
L7927 = &7927
L7998 = &7998
L7999 = &7999
L7A67 = &7A67
L7BD5 = &7BD5
L7CE4 = &7CE4

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
 LDY L0082
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
 STA L0084
 LDA #0
 LDX L0078
 LDY L0079
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
 LDX L0077
 LDY L0081
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
 STA L0085
 LDX L007D
 LDY L007E
 LDA L4900,Y
 BPL L1162

 LDA L0076
 EOR #&C0
 STA L0076
 LDA L0084
 BEQ L1198

 BNE L117A

.L1162

 LDA L4900,X
 BPL L1170

 JSR L1778

 LDA L0084
 BEQ L1198

 BNE L117A

.L1170

 LDA L0084
 BNE L1186

 LDA L0085
 BNE L1198

 BEQ L11CD

.L117A

 JSR L1598

 JMP L1198

.L1180

 JSR L1554

 JMP L1198

.L1186

 LDA L0085
 BNE L1180

 LDA L0076
 EOR #&C0
 STA L0076
 LDA L0077
 STA R
 LDA L0078
 STA S

.L1198

 LDA #4
 BIT L0076
 BMI L11A0

 LDA #&9B

.L11A0

 STA L0077
 LDA #0
 BVS L11A8

 LDA #&97

.L11A8

 STA L0078
 JMP L11B5

.L11AD

 LSR L007A
 ROR L0074
 LSR L007B
 ROR L0075

.L11B5

 LDA L007A
 ORA L007B
 BNE L11AD

 LDA #&FF
 CMP L0074
 BNE L11C5

 LSR L0074
 LSR L0075

.L11C5

 CMP L0075
 BNE L11CD

 LSR L0074
 LSR L0075

.L11CD

 INC L0074
 INC L0075
 LDA L0CC3
 BMI L11E5

 LDX L0CD1
 CPX #&5F
 BNE L11DE

 RTS

\ ******************************************************************************
\
\       Name: L11DE
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L11DE

 INX
 STX L0CD1
 JMP L11F1

.L11E5

 LDX L0CD0
 CPX #&2F
 BNE L11ED

 RTS

\ ******************************************************************************
\
\       Name: L11ED
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L11ED

 INX
 STX L0CD0

.L11F1

 LDA R
 STA L3C00,X
 LDA L0077
 STA L3C60,X
 LDA S
 STA L3CC0,X
 LDA L0078
 STA L3D20,X
 LDA L0074
 STA L3D80,X
 LDA L0075
 STA L0100,X
 LDA L0076
 STA L48A0,X

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
 LDA L0075
 CMP L0074
 BCC L1239

 JMP L138C

.L1239

 BIT L0076
 BMI L1252

 LDA #5
 STA L131A+1
 LDA #9
 STA L131F+1

.L1247

 LDA #&60
 STA L1363+1
 LDA #&27
 STA L007A
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
 STA L007A

.L1265

 BIT L0076
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
 SBC L0078
 STA L007B
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
 SBC L0078
 STA L007B

.L12A2

 LDA #&9F
 SEC
 SBC S
 TAY
 LDA #&FF
 SEC
 SBC L0074
 STA L0082
 CLC
 ADC #1
 STA L0083
 LDA L0076
 AND #3
 BEQ L12C4

 LDA L0075
 CMP #2
 BCC L12C4

 LDA #&FF
 STA L0083

.L12C4

 LDA R
 AND #3
 TAX
 LDA R
 LSR A
 LSR A
 STA L0081
 LDA L0083
 BIT L0076
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
 LDA L0083

.L12F8

 LDX #0
 ADC L0075
 BCC L1303

 JSR L135F

.L1301

 LDX #3

.L1303

 INX
 ADC L0075
 BCC L130D

 JSR L135F

.L130B

 LDX #6

.L130D

 INX
 ADC L0075
 BCC L1317

 JSR L135F

.L1315

 LDX #8

.L1317

 INX
 ADC L0075

.L131A

 BCC L1321

 JSR L135F

.L131F

 BNE L132A

.L1321

 STA L0083

.L1323

 LDA L2E60,X

.L1326

 ORA (P),Y
 STA (P),Y

.L132A

 LDA P
 CLC
 ADC #8
 STA P
 BCC L1335

 INC P+1

.L1335

 INC L0081
 LDA L0081
 CMP L007A
 BNE L12F5

 JMP L1482

 STA L0083

.L1342

 LDA L2E6A,X

.L1345

 ORA (P),Y
 STA (P),Y
 LDA P
 SEC
 SBC #8
 STA P
 BCS L1354

 DEC P+1

.L1354

 DEC L0081
 LDA L0081
 CMP L007A
 BNE L12F5

 JMP L1482

.L135F

 ADC L0082
 STA L0083

.L1363

 LDA L2E60,X

.L1366

 ORA (P),Y
 STA (P),Y

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

 LDA L0083
 CPY L007B
 CLC
 BEQ L1385

 RTS

\ ******************************************************************************
\
\       Name: L1385
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1385

 TSX
 INX
 INX
 TXS
 JMP L1482

.L138C

 BIT L0076
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
 STA L007B
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
 STA L007B

.L13C2

 BIT L0076
 BMI L13D5

 LDA #&1D
 STA L1421+1
 LDA L0077
 CLC
 ADC #1
 STA L007A
 JMP L13E1

.L13D5

 LDA #&3F
 STA L1421+1
 LDA L0077
 SEC
 SBC #1
 STA L007A

.L13E1

 LDA #&9F
 SEC
 SBC S
 TAY
 LDA #&FF
 SEC
 SBC L0075
 STA L0082
 CLC
 ADC #1
 STA L0083
 LDA L0076
 AND #3
 BEQ L1403

 LDA L0074
 CMP #2
 BCC L1403

 LDA #&FF
 STA L0083

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

 STA L0079
 CLC
 LDX R

.L1417

 LDA L0079

.L1419

 ORA (P),Y
 STA (P),Y
 LDA L0083
 ADC L0074

.L1421

 BCS L1440

 STA L0083

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
 CPY L007B
 CLC
 BNE L1417

 JMP L1482

.L1440

 ADC L0082
 STA L0083
 INX
 LDA L0079
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

 STA L0079
 CPX L007A
 CLC
 BNE L1425

 BEQ L1482

 ADC L0082
 STA L0083
 DEX
 LDA L0079
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

 STA L0079
 CPX L007A
 CLC
 BNE L1425

.L1482

 LDA L0076
 LSR A
 BCS L1488

 RTS

\ ******************************************************************************
\
\       Name: L1488
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1488

 ASL A
 EOR #&C0
 STA L0076
 LDA L0CE0
 STA R
 LDA L0CE1
 STA S
 LDA #4
 BIT L0076
 BMI L149F

 LDA #&9B

.L149F

 STA L0077
 LDA #0
 BVS L14A7

 LDA #&97

.L14A7

 STA L0078
 JMP L1214

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

\ ******************************************************************************
\
\       Name: L14E2
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 LDA L0084
 AND L0085
 BNE L1593

 LDA L0083
 BPL L1560

 EOR #&FF

.L1560

 STA L0CC1
 LDA L0082
 BPL L1569

 EOR #&FF

.L1569

 CMP L0CC1
 BCC L1571

 STA L0CC1

.L1571

 LDA L0081
 BPL L1577

 EOR #&FF

.L1577

 CMP L0CC1
 BCS L1598

 LDA L0079
 BPL L1582

 EOR #&FF

.L1582

 CMP L0CC1
 BCS L1598

 JSR L1778

 LDA L0076
 EOR #&C0
 STA L0076
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

 INC L0083

.L15A3

 LDA L0084
 BIT L0076
 BPL L15AF

 AND #&40
 BNE L1593

 BEQ L15B5

.L15AF

 AND #&80
 BNE L1593

 BEQ L15B5

.L15B5

 LDA L0084
 BVC L15BF

 AND #&10
 BNE L1593

 BEQ L15C3

.L15BF

 AND #&20
 BNE L1593

.L15C3

 LDA L0076
 ASL A
 EOR L0076
 BMI L15EB

 LDA #0
 STA L0087
 LDA R
 CLC
 ADC S
 STA L0084
 LDA L0082
 ADC L0083
 STA L0085
 LDA L0084
 SEC
 SBC #&9F
 STA L0084
 LDA L0085
 SBC #0
 STA L0085
 JMP L15FC

.L15EB

 LDA #&80
 STA L0087
 LDA S
 SEC
 SBC R
 STA L0084
 LDA L0083
 SBC L0082
 STA L0085

.L15FC

 BPL L160B

 LDA #0
 SEC
 SBC L0084
 STA L0084
 LDA #0
 SBC L0085
 STA L0085

.L160B

 LDA L0074
 CLC
 ADC L0075
 STA P
 LDA L007A
 ADC L007B
 STA P+1
 LDA P
 CLC
 ADC #2
 STA P
 BCC L1623

 INC P+1

.L1623

 LDA #0
 STA L007C
 LDA L007A
 CMP L007B
 BCC L1649

 BNE L1635

 LDA L0074
 CMP L0075
 BCC L1649

.L1635

 LDA L0076
 STA L0089
 LDA L0074
 CLC
 ADC #1
 STA L007F
 LDA L007A
 ADC #0
 STA L0080
 JMP L1669

.L1649

 LDA L0076
 ASL A
 STA L0089
 LDA L0075
 CLC
 ADC #1
 STA L007F
 LDA L007B
 ADC #0
 STA L0080
 LDA L0087
 ORA #&40
 STA L0087
 LDA S
 STA R
 LDA L0083
 STA L0082

.L1669

 LDA #&80
 STA L0077
 LDA #0
 STA L0086
 STA L007C
 STA L0079
 STA L0081
 STA L0078
 BEQ L1683

.L167B

 ASL P
 ROL P+1
 ASL L007F
 ROL L0080

.L1683

 LDA P+1
 CMP L0085
 BCC L167B

 BNE L1691

 LDA P
 CMP L0084
 BCC L167B

.L1691

 LSR P+1
 ROR P
 ROR L007C
 LSR L0080
 ROR L007F
 ROR L0086

.L169D

 LDA P+1
 CMP L0085
 BCC L16BF

 BNE L1691

 LDA P
 CMP L0084
 BCC L16BF

 BNE L1691

 LDA L007C
 CMP L0079
 BCC L16BF

 BEQ L16BF

 LDA P+1
 ORA P
 ORA L007C
 BNE L1691

 BEQ L16F1

.L16BF

 LDA L0077
 CLC
 ADC L0086
 STA L0077
 LDA L0078
 ADC L007F
 STA L0078
 LDA L0081
 ADC L0080
 STA L0081
 LDA L0079
 SEC
 SBC L007C
 STA L0079
 LDA L0084
 SBC P
 STA L0084
 LDA L0085
 SBC P+1
 STA L0085
 BNE L169D

 LDA L0084
 BNE L169D

 LDA L0079
 CMP #2
 BCS L169D

.L16F1

 LDA L0078
 ROL L0077
 ADC #0
 STA L0078
 BCC L16FD

 INC L0081

.L16FD

 LDA L0089
 BMI L1715

 LDA R
 CLC
 ADC L0078
 STA R
 STA S
 LDA L0082
 ADC L0081
 STA L0082
 STA L0083
 JMP L1726

.L1715

 LDA R
 SEC
 SBC L0078
 STA R
 STA S
 LDA L0082
 SBC L0081
 STA L0082
 STA L0083

.L1726

 BIT L0087
 BMI L1749

 BVS L173C

 LDA #&9F
 SEC
 SBC R
 STA S
 LDA #0
 SBC L0082
 STA L0083
 JMP L1749

.L173C

 LDA #&9F
 SEC
 SBC S
 STA R
 LDA #0
 SBC L0083
 STA L0082

.L1749

 LDA L0082
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
 ORA L0076
 STA L0076
 LDA R
 STA L0CE0
 LDA S
 STA L0CE1
 RTS

\ ******************************************************************************
\
\       Name: L1775
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1775

 JMP L1593

.L1778

 LDA L0077
 STA R
 LDA L0081
 STA L0082
 LDA L0078
 STA S
 LDA L0079
 STA L0083
 LDA L0085
 STA L0084
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

\ ******************************************************************************
\
\       Name: L17A2
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L17A2

 DEC L0CD1
 JMP L17B3

.L17A8

 LDX L0CD0
 CPX #&FF
 BNE L17B0

 RTS

\ ******************************************************************************
\
\       Name: L17B0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L17B0

 DEC L0CD0

.L17B3

 LDA L3C00,X
 STA R
 STA L0CE0
 LDA L3C60,X
 STA L0077
 LDA L3CC0,X
 STA S
 STA L0CE1
 LDA L3D20,X
 STA L0078
 LDA L3D80,X
 STA L0074
 LDA L0100,X
 STA L0075
 LDA L48A0,X
 STA L0076
 JSR L1214

 JMP L1795

 EQUB &17

.L17E3

 LDA L007B
 BPL L17FA

 LDA #0
 SEC
 SBC L007A
 STA L007A
 LDA #0
 SBC L007B
 STA L007B
 LDA L007C
 EOR #&80
 STA L007C

.L17FA

 LDA R
 AND #1
 BEQ L1806

 LDA L007C
 EOR #&80
 STA L007C

.L1806

 JSR L1D3A

 STA L0078
 BCC L180F

 INC L0079

.L180F

 LDA L007C
 BPL L1820

 SEC
 LDA #0
 SBC L0078
 STA L0078
 LDA #0
 SBC L0079
 STA L0079

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
 STA L0074
 AND #&F0
 ORA L3700,X
 STA L0075
 AND #&0F
 ORA L3800,Y
 TAY
 AND #&F0
 ORA L4300,X
 TAX
 LDA L3A00,X
 STA L0076
 LDX L0074
 LDA L3A00,X
 CLC
 ADC L3A00,Y
 ROR A
 ROR A
 ROR A
 ROR A
 STA L0074
 ROR A
 AND #&F0
 CLC
 ADC L0076
 STA L0076
 LDA L0074
 AND #&1F
 LDX L0075
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
 STA L0078
 STA L007C
 LDA L0CEA,Y
 ASL A
 ROL L0078
 ASL A
 ROL L0078
 STA L0077
 LDX L0078
 JSR L1902

 STA P+1
 STY P
 LDA L0078
 EOR #&FF
 TAX
 LDA L0077
 EOR #&FF
 STA L0077
 JSR L1902

 STA S
 STY R
 LDY L0CC4
 BIT L007C
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

 STX L0079
 SEC
 LDA L4001,X
 SBC L4000,X
 STA L007A
 LDA L4102,X
 SBC L4101,X
 LSR A
 ROR L007A
 LDX L007A
 LDY L0077
 JSR L1821

 LDX L0079
 ASL L0076
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
 LDY L0076
 LDA L3800,Y
 ORA L3700,X
 TAY
 AND #&F0
 ORA L4300,X
 STA L0075
 LDX R
 AND #&F0
 ORA L3700,X
 TAX
 LDA L3A00,X
 TAX
 STX L0074
 LDA L3A00,Y
 TAY
 LDA L3700,X
 ORA L3800,Y
 CLC
 LDX L0075
 ADC L3A00,X
 STA L0077
 LDA L3700,Y
 ADC #0
 STA L0078
 BIT L007C
 BPL L198E

 LDX R
 LDA L0076
 AND #&0F
 ORA L3800,X
 TAY
 LDX L0074
 LDA L3800,X
 CLC
 ADC L3A00,Y
 BCC L1989

 INC L0077
 BNE L1989

 INC L0078

.L1989

 ASL A
 ROL L0077
 ROL L0078

.L198E

 LDA L0076
 BPL L199F

 LDA #0
 SEC
 SBC L0077
 STA L0077
 LDA #0
 SBC L0078
 STA L0078

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

 LDX L0088
 LDY L3400,X
 STY L0080
 LDY L34D8,X
 STY L0081
 LDY L35B0,X
 STY L0082
 LDA L3700,Y
 STA L0085
 CMP #9
 ROR L007C
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
 STA L0086

.L19D0

 LDX #2

.L19D2

 LDY P
 LDA L0080,X
 STA L007A
 AND #&0F
 STA L0076
 BEQ L1A0C

 LDA L4260,Y
 STA S
 LDA L4220,Y
 STA R
 AND #1
 BEQ L19F2

 LDA L0076
 EOR #&80
 STA L0076

.L19F2

 STX P+1
 JSR L1931

 LDX P+1
 LDY L0086
 LDA L0077
 CLC
 ADC L0CE0,Y
 STA L0CE0,Y
 LDA L0078
 ADC L0CE3,Y
 STA L0CE3,Y

.L1A0C

 LDA P
 CMP L0CCB
 BEQ L1A1D

 DEC P
 DEX
 BPL L19D2

 DEC L0086
 JMP L19D0

.L1A1D

 LDX #2

.L1A1F

 LDY L0085
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

 LDX L0088
 LDY L0CCF

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

.L1AA6

 LDA L0078
 AND #1
 STA L007C
 EOR L007A
 AND #1
 BNE L1AD0

 LDA L0078
 CLC
 ADC L007A
 AND #&FE
 ORA L007C
 STA R
 LDA L0079
 ADC L007B
 STA S
 BCC L1ACF

 LDA #&FF
 STA S
 LDA #&FE
 ORA L007C
 STA R

.L1ACF

 RTS

\ ******************************************************************************
\
\       Name: L1AD0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1AD0

 LDA L0078
 SEC
 SBC L007A
 STA R
 LDA L0079
 SBC L007B
 STA S
 BCC L1AE8

 LDA R
 AND #&FE
 ORA L007C
 STA R
 RTS

\ ******************************************************************************
\
\       Name: L1AE8
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L1AE8

 LDA #0
 SEC
 SBC R
 AND #&FE
 ORA L007C
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
 STA L007A
 LDA L0170,X
 STA L007B
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

 LDA L0078
 STA L007A
 LDA L0079
 STA L007B
 LDX L0CC4
 LDA L0164,X
 STA R
 LDA L0174,X
 STA S
 JSR L1D77

 LDY L0CCB
 LDA L4223,Y
 STA L007A
 LDA L4263,Y
 STA L007B
 JSR L1AA6

 LDA R
 STA L4223,Y
 LDA S
 STA L4263,Y
 LDA L4225,Y
 STA L007A
 LDA L4265,Y
 STA L007B
 LDX L0CC4
 LDA L0161,X
 STA R
 LDA L0171,X
 STA S
 JSR L1D77

 LDY L0CCB
 LDA L4220,Y
 EOR #1
 STA L007A
 LDA L4260,Y
 STA L007B
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
 STA L007A
 STA L0CE0
 LDA L4262,Y
 STA L007B
 STA L0CE3
 LDA L0078
 STA L4222,Y
 LDA L0079
 STA L4262,Y
 LDA R
 EOR #1
 STA R
 JSR L1D77

 LDY L0CCB
 LDA L4220,Y
 STA L007A
 LDA L4260,Y
 STA L007B
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
 STA L007A
 LDA L0171,X
 STA L007B
 JSR L1D77

 LDY L0CCB
 LDA L4222,Y
 STA L007A
 LDA L4262,Y
 STA L007B
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
 STA L0074
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
 DEC L0074
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

.L1D03

 TXA
 CLC
 ADC L0CC4
 TAX
 LDA L0160,X
 EOR #1
 STA R
 JMP L1CFB

.L1D13

 TXA
 CLC
 ADC L0CC4
 TAX
 LDA L0160,X
 STA L007A
 LDA L0170,X
 STA L007B

.L1D23

 TYA
 CLC
 ADC L0CCB
 STA L007F
 JSR L1D77

 LDY L007F
 LDA L0078
 STA L4220,Y
 LDA L0079
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

 LDX L007B
 LDY R
 JSR L1821

 STA L0078
 LDA L0076
 CLC

.L1D46

 ADC #&80
 STA L0077
 BCC L1D4E

 INC L0078

.L1D4E

 LDX S
 LDY L007B
 JSR L1821

 STA L0079
 LDA L0076
 CLC
 ADC L0078
 STA L0078
 BCC L1D62

 INC L0079

.L1D62

 LDX S
 LDY L007A
 JSR L1821

 STA L0074
 LDA L0076
 CLC
 ADC L0077
 STA L0077
 LDA L0074
 ADC L0078
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
 EOR L007A
 AND #1
 STA L007C
 JSR L1D3A

 AND #&FE
 ORA L007C
 STA L0078
 BCC L1D8C

 INC L0079

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

 LDX L0088
 LDA L0900,X
 STA L0080
 LDA L4A00,X
 STA L0083
 LDA L0A00,X
 STA L0081
 LDA L0B00,X
 STA L0084
 LDA L0700,X
 STA L0082
 LDA L4900,X
 STA L0085
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
 STA L0086

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
 LDA L0080,X
 STA L007A
 LDA L0083,X
 STA L007B
 LDA #0
 STA L007C
 STX P+1
 JSR L17E3

 LDX P+1
 LDY L0086
 LDA L0078
 CLC
 ADC L0CE0,Y
 STA L0CE0,Y
 LDA L0079
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

 DEC L0086
 JMP L1DC3

.L1E18

 LDX L0088

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
\       Name: L1E42
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   ??? (11 in Reset, value in L4FFA is passed sometimes)
\
\ ******************************************************************************

.L1E42

 STX L0087              \ Set L0087 to the value in X

 CPX #0                 \ If X = 0, jump down to L1E51
 BEQ L1E51

 CPX #2                 \ If X < 2 (i.e. X = 1), jump down to L1E66
 BCC L1E66

 BEQ L1E7B              \ If X = 2, jump down to L1E7B

 JMP L1EE5              \ X > 2, so jump down to L1EE5

.L1E51

                        \ If we get here then X = 0

 LDA L0CFB
 STA L0074
 LSR A
 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 JMP L209D

.L1E66

                        \ If we get here then X = 1

 LDA L0C15
 BPL L1E70

 LDA #0
 JMP L209D

.L1E70

 LDA L0C05
 ASL A
 LDA L0C15
 ROL A
 JMP L209D

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
 STA L0074
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
 ROR L0074
 LSR A
 ROR L0074
 CLC
 ADC S
 ROR A
 ROR L0074
 LSR A
 ROR L0074
 CLC
 ADC S
 ROR A
 ROR L0074
 CLC
 ADC S
 ROR A
 ROR L0074
 LSR A
 ROR L0074
 STA L0075
 LDA L0074
 CLC
 ADC L4FFF
 BCC L1ED0

 INC L0075

.L1ED0

 LSR L0075
 ROR A
 LSR L0075
 ROR A
 LSR L0075
 ROR A
 LSR L0075
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
 STA L0074
 LDA L0C9A
 BPL L1F04

 LDA #0
 SEC
 SBC L0074
 STA L0074
 LDA #0
 SBC L0C9A

.L1F04

 LSR A
 ROR L0074
 LSR A
 ROR L0074
 LSR A
 ROR L0074
 CMP #0
 BEQ L1F15

 LDA #&FF
 STA L0074

.L1F15

 LDA L0074
 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 LSR A
 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 CMP #&28
 BCC L1F2A

 LDA #&28

.L1F2A

 BIT L0C9A
 BPL L1F36

 STA L0074
 LDA #0
 SEC
 SBC L0074

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
 STA L0074
 LDA L0C11
 BPL L1F58

 LDA #0
 SEC
 SBC L0074
 STA L0074
 LDA #0
 SBC L0C11

.L1F58

 BNE L1F60

 LDA L0074
 CMP #&8C
 BCC L1F64

.L1F60

 LDA #&8C
 STA L0074

.L1F64

 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 LSR A
 CLC
 ADC L0074
 ROR A
 LSR A
 LSR A
 BIT L0C11
 BMI L1F7D

 STA L0074
 LDA #0
 SEC
 SBC L0074

.L1F7D

 JMP L209D

.L1F80

                        \ If we get here then X = 6

 LDA L0C9C
 JMP L209D

.L1F86

                        \ If we get here then X = 7

 LDY #0
 STY L007C
 STY R
 JSR L227A

 CLC
 STA S
 LDY #3
 JSR L227A

 STA L0079
 LDY #0
 LDA #1
 STA L007C
 JSR L227A

 SEC
 SBC S
 BPL L1FB2

 STA L0074
 LDA #&80
 STA R
 LDA #0
 SEC
 SBC L0074

.L1FB2

 CLC
 ADC #1
 STA L0077
 LDY #3
 JSR L227A

 SEC
 SBC L0079
 BPL L1FCE

 STA L0074
 LDA #&40
 ORA R
 STA R
 LDA #0
 SEC
 SBC L0074

.L1FCE

 CLC
 ADC #1
 STA L0078
 LDA S
 CLC
 ADC #&35
 STA S
 LDA L0079
 CLC
 ADC #&E3
 STA L0079
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
 STA L0077
 LDA L0C0D
 SEC
 JSR L22F7

 STA L0079
 LDY #&A3
 LDA #&0B
 BNE L207F

.L200E

                        \ If we get here then X = 8 or 10

 LDA #&80
 JSR L2129

 LDA #&22
 STA L7697
 STA L76AF
 LDA #&44
 STA L769F
 LDA #&99
 STA L76A7
 LDA #&88
 STA L72E7
 STA L7427
 STA L7567
 STA L77E7
 STA L7927
 STA L7A67
 LDA L0C0E
 SEC
 JSR L22F7

 STA L4FEC
 LDA L0C0C
 CLC
 JSR L22F7

 EOR #&FF
 CLC
 ADC #1
 STA L4FEA
 LDA #0
 JSR L2129

 RTS

.L2058

                        \ If we get here then X = 11

 LDA #128               \ Set S = 128
 STA S

 LDA #125               \ Set L0077 = 125
 STA L0077

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

 STA R                  \ Set L0079 = (A / 2 + A) / 4
 LSR A
 ADC R
 LSR A
 LSR A
 STA L0079

 LDX #3                 \ Set X = 3

 LDY #243               \ Set Y = 243 to use as the value of L4FFC below

 LDA #7                 \ Set A = 7 to use as the value of L0075 below

.L207F

 STA L0075              \ Set L0075 = A

 LDA #1                 \ Set L0074 = 1
 STA L0074

 STY L4FFC              \ Set L4FFC = Y

 LDA L4FEA,X            \ Set L0078 = the X-th byte of L4FEA
 STA L0078

 LDA L0079              \ Set the X-th byte of L4FEA = L0079
 STA L4FEA,X

 JSR L22D1

 LDA #0                 \ Set L007F = 0
 STA L007F

 JSR L22CC

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L209D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L209D

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

 STA L0079
 JSR L216E

.L20B8

 LDA L4FAA,X
 STA L007A
 LDA L4FB2,X
 STA L007B
 LDA L4FD2,X
 STA L0074
 LDA L4FDA,X
 STA L0075
 LDA L4FE2,X
 STA L0076
 LDA #&80
 STA L007F
 JSR L21CD

 LDX L0087
 CPX #7
 BNE L2102

 LDA #&FF
 LDY #2

.L20E2

 STA L752A,Y
 LDA #&44
 DEY
 BPL L20E2

 LDA #&33
 STA L7524
 LDA #&88
 STA L7534
 LDA S
 STA L007A
 STA L4FAA,X
 LDA L0079
 STA L4FB2,X
 BNE L210A

.L2102

 LDA L4FAA,X
 STA L007A
 LDA L4FB2,X

.L210A

 STA L007B
 LDA L0077
 STA L0074
 STA L4FD2,X
 LDA L0078
 STA L0075
 STA L4FDA,X
 LDA R
 STA L0076
 STA L4FE2,X
 LDA #0
 STA L007F
 JSR L21CD

 RTS

\ ******************************************************************************
\
\       Name: L2129
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2129

 STA L007F
 LDA L4FEA
 STA L0079
 LDA L4FEC
 CLC
 ADC #&4F
 STA L4FFC
 LDA #&D8
 STA L0077
 LDA #0
 STA S
 LDA #3
 STA L0074
 LDA #1
 STA L0075
 JSR L22CC

 LDA L4FEC
 STA L0079
 LDA L4FEA
 CLC
 ADC #&D6
 STA L4FFC
 LDA #&50
 STA L0077
 LDA #&80
 STA S
 LDA #1
 STA L0074
 LDA #5
 STA L0075
 JSR L22CC

 RTS

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
 STY L007C
 SEC

.L2179

 SBC L007C
 BCS L2182

 ADC L007C
 JMP L21A4

.L2182

 SBC L4F92,X
 BCS L218D

 LDY #&40
 STY R
 BNE L21A2

.L218D

 SBC L007C
 BCS L2199

 ADC L007C
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
 STA L0078
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
 STA L0077
 RTS

\ ******************************************************************************
\
\       Name: L21CD
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L21CD

 LDY #3
 LDA #&11

.L21D1

 STA L0082,Y
 ASL A
 DEY
 BPL L21D1

 LDA #0
 STA L0081
 STA L0080
 LDA L0074
 CMP L0075
 BCC L21E8

 STA L0086
 BCS L223B

.L21E8

 LDA L0075
 STA L0086
 STA L0080
 BCC L223B

.L21F0

 LDA L0081
 CLC
 ADC L0075
 CMP L0074
 BCC L2205

 SBC L0074
 BIT L0076
 BVC L2203

 DEC L007B
 BVS L2205

.L2203

 INC L007B

.L2205

 STA L0081
 BIT L0076
 BPL L2210

 DEC L007A
 JMP L223B

.L2210

 INC L007A
 JMP L223B

.L2215

 LDA L0080
 BEQ L21F0

 LDA L0081
 CLC
 ADC L0074
 CMP L0075
 BCC L222F

 SBC L0075
 BIT L0076
 BPL L222D

 DEC L007A
 JMP L222F

.L222D

 INC L007A

.L222F

 STA L0081
 BIT L0076
 BVC L2239

 DEC L007B
 BVS L223B

.L2239

 INC L007B

.L223B

 LDA L007A
 LSR A
 LSR A
 TAX
 LDA L007B
 LSR A
 LSR A
 LSR A
 TAY
 LDA L4800,Y
 CLC
 ADC L4F00,X
 STA P
 LDA L4820,Y
 ADC L4F28,X
 STA P+1
 LDA #&9F
 SEC
 SBC L007B
 TAY
 LDA L007A
 AND #3
 TAX
 BIT L007F
 BMI L226D

 LDA L0082,X
 ORA (P),Y
 JMP L2273

.L226D

 LDA L0082,X
 EOR #&FF
 AND (P),Y

.L2273

 STA (P),Y
 DEC L0086
 BNE L2215

 RTS

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

 STA L0074
 LDA L423B,Y
 EOR L007C
 AND #1
 BEQ L2296

 LDA #0
 SEC
 SBC L0074
 STA L0074

.L2296

 LDA L427D,Y
 LSR A
 LSR A
 CPY #0
 BNE L22A0

 LSR A

.L22A0

 STA L0075
 LDA L423D,Y
 CPY #0
 BNE L22AB

 EOR #1

.L22AB

 AND #1
 BEQ L22B6

 LDA #0
 SEC
 SBC L0075
 STA L0075

.L22B6

 CLC
 LDA L0074
 ADC L0075
 BMI L22C3

 LSR A
 LSR A
 LSR A
 ADC #0
 RTS

\ ******************************************************************************
\
\       Name: L22C3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
\       Name: L22CC
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L22CC

 LDA L0079
 JMP L22D7

\ ******************************************************************************
\
\       Name: L22D1
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L22D1

 LDA #&80
 STA L007F
 LDA L0078

\ ******************************************************************************
\
\       Name: L22D7
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L22D7

 CLC
 ADC L0077
 BIT S
 BMI L22E8

 STA L007B
 LDA L4FFC
 STA L007A
 JMP L22EF

.L22E8

 STA L007A
 LDA L4FFC
 STA L007B

.L22EF

 LDA #0
 STA L0076
 JSR L21CD

 RTS

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
 JSR L1E42

.L2328

 LDX L4FFB
 INX
 CPX #&0B
 BCC L2332

 LDX #7

.L2332

 STX L4FFB
 JSR L1E42

 LDA #&77
 STA L7BD5
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
 LDA L0CA0,X
 BEQ L2372

 ADC L0C2D,X
 STA L0C2D,X
 LDA L0CB0,X
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
 LDA L0CA3
 BEQ L23B2

 ADC L0C0F
 TAX
 LDA L0CB3
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
 JSR L1E42

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

 LDA L0CA0,X
 BNE L2407

 STA L0CCE,X
 STA L0CD1,X

.L2404

 LDA #0
 RTS

\ ******************************************************************************
\
\       Name: L2407
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L2421
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 STA L0088
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
 STA L0088
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
 STA L0088
 JSR L19A0

 LDA #&61
 STA L0088
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
\       Name: L2532
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2532

 LDA #&81
 LDY #&FF
 JSR OSBYTE

 CPX #&FF
 RTS

\ ******************************************************************************
\
\       Name: L253C
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L253C

 LDA #5
 STA L0076

.L2540

 LDY L0076
 LDX L4F50,Y
 JSR L2532

 BNE L2555

 LDX L0076
 LDY L4F6C,X
 LDA L4F72,X
 JMP L256F

.L2555

 LDY L0076
 LDX L4F56,Y
 JSR L2532

 BNE L256A

 LDX L0076
 LDY L4F60,X
 LDA L4F66,X
 JMP L256F

.L256A

 LDA #0
 LDX L0076
 TAY

.L256F

 STA L0CB0,X
 TYA
 STA L0CA0,X
 DEC L0076
 BPL L2540

 RTS

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
 JSR L1E42

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

 JSR L253C

 JSR L233E

 JSR L2BDC

 JSR FIndicator         \ Update the flaps indicator

 JSR BIndicator         \ Update the brakes indicator

 LDA #&40
 STA VIA+&6B

 LDA #&EA
 STA VIA+&65

.L26C4

 LDA L008F
 STA L0CC6
 JSR L2F1C

 JSR L253C

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

 LDY L008A
 LDA #&3C
 STA L0500,Y
 INY
 LDA #&3D
 STA L0500,Y
 INY
 STY L008A
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

 LDX #&86
 JSR L2532

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

 LDX #&DC
 JSR L2532

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

 LDX #&C8
 JSR L2532

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
 CPX L008F
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

.L2873

 LDX L008A
 BEQ L28B5

 LDA #&FF
 STA L008D
 LDA #0
 STA L008C

.L287F

 LDX L008C
 LDA L0500,X
 STA L008B
 LDA #1
 STA L0089
 JSR L2973

 LDA L008B
 BEQ L2896

 LDX L0CCE
 BNE L28A0

.L2896

 INC L008D
 LDX L008D
 STA L0500,X
 JMP L28A7

.L28A0

 INC L008F
 LDX L008F
 STA L0600,X

.L28A7

 INC L008C
 LDA L008C
 CMP L008A
 BCC L287F

 LDA L008D
 ADC #0
 STA L008A

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

 LDA L008A
 BEQ L2929

 LDA #&FF
 STA L008D
 LDA #0
 STA L008C

.L28C2

 LDX L008C
 LDY L0500,X
 STY L008B
 LDX L3F30,Y
 STX L0088
 STX L007D
 LDX L3E00,Y
 STX L007E
 JSR L0D01

 LDA L007E
 STA L0088
 JSR L0D01

 LDX L007D
 LDA L0400,X
 STA L0CC7
 LDX L007E
 LDA L0400,X
 STA L007F
 AND L0CC7
 AND #&30
 BEQ L2904

 LSR A
 LSR A
 STA L0074
 LDA L007F
 EOR L0CC7
 EOR #&FF
 AND L0074
 BNE L2910

.L2904

 INC L008D
 LDX L008D
 LDA L008B
 STA L0500,X
 JMP L291B

.L2910

 LDA L008B
 BEQ L2904

 INC L008F
 LDX L008F
 STA L0600,X

.L291B

 INC L008C
 LDA L008C
 CMP L008A
 BCC L28C2

 LDA L008D
 ADC #0
 STA L008A

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

 LDA L008E
 CMP L008F
 BEQ L2972

 CLC
 ADC #1
 STA L008E
 TAX
 LDA L0600,X
 STA L008B
 CMP #&3C
 BEQ L293A

 CMP #&3D
 BEQ L293A

.L2953

 LDA #0
 STA L0089
 JSR L2973

 LDA L008B
 LDX L0CCE
 BEQ L2969

 INC L008F
 LDX L008F
 STA L0600,X
 RTS

\ ******************************************************************************
\
\       Name: L2969
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2969

 INC L008A
 INC L008D
 LDX L008D
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
 LDX L008B
 LDY L3E00,X
 STY L007E
 LDY L3F30,X
 STY L007D
 CPX #&0C
 BCS L2999

 CPX #0
 BNE L2993

 JSR L2C95

 RTS

\ ******************************************************************************
\
\       Name: L2993
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 STA L0088
 LDA L04D8,Y
 BMI L29E0

 LDA #&80
 STA L0CCE
 RTS

\ ******************************************************************************
\
\       Name: L29E0
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L2A0D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2A0D

 TYA
 CLC
 ADC #&D8
 STA L0CCF

.L2A14

 PLA
 CMP L0CC0
 BEQ L2A3B

 STA L0088
 LDA #0
 STA L0CC4
 STA L0CCB
 JSR L19A0

 LDA L0CCE
 BNE L2A06

 LDY L0088
 STY L0CCF
 LDA #&80
 ORA L0400,Y
 STA L0400,Y
 BNE L2A14

.L2A3B

 STA L0088
 LDA #0
 STA L0CC4
 STA L0CCB
 JSR L19A0

 LDA L0CCE
 BNE L2A8B

.L2A4D

 LDY L0088

.L2A4F

 LDA L0089
 BNE L2A5D

 LDX L008B
 JSR L4B5F

 STA L0CCE
 BNE L2A8B

.L2A5D

 LDA #&80
 ORA L0400,Y
 STA L0400,Y
 DEC L0CC8
 BEQ L2A6F

 LDY L007E
 JMP L299E

.L2A6F

 LDY L007E
 LDA L4900,Y
 BPL L2A8B

 LDY L007D
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
 STA L007F
 LDA #1
 STA L007C
 CPY #&0C
 BCC L2AB5

 CPY #&10
 BCS L2AB5

 LDA #0
 STA L007C
 LDA L44A0,Y
 BPL L2AD8

 TYA
 AND #1
 BNE L2AD8

 JMP L2B93

.L2AB5

 LDA L007F
 STA L0088
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

 LDX L0088
 SEC
 LDA L4400,Y
 SBC L0CED
 STA L0900,X
 LDA L4478,Y
 SBC L0CFD
 STA L4A00,X
 STA L0074
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
 STA L0074
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
 STA L0074
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

 LDA L0074
 EOR #&FF
 JMP L2BD1

.L2BCD

 BNE L2BD9

 LDA L0074

.L2BD1

 CMP L3BD8,Y
 BCS L2BD9

 LDA #0
 RTS

\ ******************************************************************************
\
\       Name: L2BD9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2BD9

 LDA L007C
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
 STA L008B
 STA L008A
 LDA #&FF
 STA L008F
 STA L008D
 STA L008E

.L2BF7

 JSR L2953

 INC L008B
 LDA L008B
 CMP L4207
 BCC L2BF7

 LDX #3
 JSR L2C1C

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

 LDA L008A
 BNE L2C40

 BEQ L2C91

.L2C40

 LDA #0
 STA L008C

.L2C44

 TAX
 LDA L0500,X
 STA L008B
 BNE L2C51

 JSR L3347

 LDA L008B

.L2C51

 TAX
 LDY L3E00,X
 STY L007E
 LDA #0
 STA L0400,Y
 LDY L3F30,X
 STY L007D
 STA L0400,Y
 JSR L107F

 INC L008C
 LDA L008C
 CMP L008A
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

 LDX L007E
 JSR L4B4A

 LDX L007D
 JSR L4B4A

 LDA #&F0
 STA L4A00,X
 STX L0088

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

 CPX L007E
 BEQ L2CD2

 LDX L007E
 STX L0088
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
 STY L0088
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

.L2D32

 LDX L0CE6
 LDA L3688,X
 STA L007A
 LDA L368A,X
 STA L007B
 LDA #&80
 STA L007F
 LDA L2E9C
 JSR L2E2F

 JSR L21CD

 LDX L0CE6
 BNE L2D66

 LDA #&88
 STA L785E
 STA L7998
 STA L7999
 LDA #&11
 STA L7857
 LDA #&CC
 STA L785F

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
 STA L007A
 STA L3688,X
 LDA L0700
 CLC
 ADC #&D0
 STA L007B
 STA L368A,X
 LDA #0
 STA L007F
 LDA L0CFB
 JSR L2E2F

 JSR L21CD

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

\ ******************************************************************************
\
\       Name: L2DCD
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2DCD

 LDX #0
 STX L0074

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
 STA L0074

.L2DE9

 CPX #&50
 BEQ L2DF1

 LDX #&50
 BNE L2DD1

.L2DF1

 LDA L0074
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
 STA L0076
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

 STX L0074
 STY L0075
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

 EQUB &20, &20, &20, &20

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

 LDY #HI(Row1_Block1)   \ Set (Y X) to the screen address for row 1, block 1
 LDX #LO(Row1_Block1)

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

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A

 DEY                    \ Decrement the byte counter

 BNE FillCanopyRowsL1   \ Loop back until we have set 256 bytes, starting at
                        \ P(1 0), to the value in A

 LDY #47                \ Set a byte counter in Y for 47 bytes

 INC P+1                \ Set P(1 0) = P(1 0) + 256
                        \
                        \ so it points to the next byte to fill after the 256
                        \ bytes we just did

.FillCanopyRowsL2

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A

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

 STA L0074

.L2ED5

 STA L0075

.L2ED7

 STA L0076

.L2ED9

 DEC L0076
 BNE L2ED9

 DEC L0075
 BNE L2ED7

 DEC L0074
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
 STA L0088

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

 LDY L0088
 LDX #&3C
 JSR L4B5F

 BEQ L2F0F

.L2F0A

 LDA #0
 STA L0CF1

.L2F0F

 DEC L0088
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
 LDA VIA+&64
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
 STX L0075
 LDA #&80
 JSR L302C

 LDX L0075
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

 STA L007C
 STY L0074
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
 BIT L007C
 BPL L3049

 AND #&0F
 ORA #&20

.L3049

 STA L35B0,Y
 DEY
 DEX
 BPL L303B

 LDY L0074
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
 STA L0081
 LDA #&40
 STA P+1
 LDA #&A0
 STA L0082
 STA L0080
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

 LSR L0081
 LSR L0082
 LSR L0080
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
 STX L0086

.L30A5

 LDX L0086
 LDA #&1F
 STA L0087
 LDY #0

.L30AD

 STY P+1
 JSR L3181

 LDY P+1
 STA L0CB8,Y
 LDA L0076
 STA L0CA8,Y
 LDA R
 STA L0CE0,Y
 INY
 CPY #3
 BNE L30AD

 LDX #&A8
 LDY #0
 JSR L4B00

 LDY L0086
 JSR L3152

 LDY L0086
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

 DEC L0087
 BPL L30EA

 LDA L0086
 CLC
 ADC #2
 STA L0086
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
 STA L0077,X
 LDA L4478,Y
 ADC #5
 STA L007A,X

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
 STA L0077,X
 LDA L4478,Y
 STA L007A,X
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
 SBC L0077,X
 STA L0074
 LDA L4478,Y
 SBC L007A,X
 BNE L3180

 LDA L0074
 CMP L0080,X
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
 STA L0076
 LDA L4479,X
 SBC L4478,X
 BPL L319F

 DEC P

.L319F

 LDY #4

.L31A1

 LSR P
 ROR A
 ROR L0076
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

 STA L77A9
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

 LDA L008B
 CMP #5
 BCC L31D3

 LDA L0CCA
 STA L0CCE

.L31D3

 RTS

\ ******************************************************************************
\
\       Name: L31D4
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 STA L0088
 JSR L19A0

 LDX #5

.L3200

 LDA L0CE0,X
 STA L0CB8,X
 DEX
 BPL L3200

 LDA #4
 STA L0088
 JSR L19A0

 LDY #2
 LDX #3
 JSR L1A67

 LDA L0CCE
 BEQ L3222

 LDA #&40
 STA L04D9
 RTS

\ ******************************************************************************
\
\       Name: L3222
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 LDA L008B
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

\ ******************************************************************************
\
\       Name: L3250
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 STA L0074,X
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
 ROR L0074,X
 LDY #2

.L32A4

 LSR R
 ROR L0CE3,X
 ROR A
 ROR L0074,X
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
 LDA L0077,X
 ADC L0074,X
 STA L0077,X
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
 STA L0074
 LDA L0900,X
 ASL A
 ROL L0074
 SEC
 SBC L091F
 STA L0900,Y
 LDA L0074
 SBC L4A1F
 STA L4A00,Y
 LDA L0B00,X
 STA L0074
 LDA L0A00,X
 ASL A
 ROL L0074
 SEC
 SBC L0A1F
 STA L0A00,Y
 LDA L0074
 SBC L0B1F
 STA L0B00,Y
 STX L007D
 STY L007E
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

\ ******************************************************************************
\
\       Name: L338F
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 STX L007F
 CLC
 ADC #&B8
 STA L007B
 LDA #2
 STA L007A
 LDA #1
 STA L0074
 STA L0075
 LDA #0
 STA L0076
 JSR L21CD

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

 LDX #&DB
 JSR L2532

 BEQ L33D9

 LDX #&EA
 JSR L2532

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

.L36A0

 EQUB &CD, &E9, &0C, &F0, &1A, &8D, &E9, &0C
 EQUB &AA, &20, &B5, &4D, &AD, &85, &4F, &AE
 EQUB &E9, &0C, &D0, &05, &18, &69, &14, &D0
 EQUB &03, &38, &E9, &14, &8D, &85, &4F, &60

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

.L3F10

 EQUB &A6, &70, &8A, &38, &ED, &9D, &2E, &10
 EQUB &05, &49, &FF, &18, &69, &01, &C9, &09
 EQUB &90, &03, &8E, &9D, &2E, &60, &3D, &41
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

.L4244

 EQUB &AD, &FD, &0C, &38, &F9, &78, &44, &10
 EQUB &02, &49, &FF, &C9, &05, &90, &01, &60
 EQUB &AD, &FF, &0C, &38, &F9, &C8, &44, &4C
 EQUB &84, &42, &4D, &50

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

 EQUB &F7, &10, &02, &49, &FF, &C9, &05, &B0
 EQUB &C7, &C0, &02, &F0, &27, &A9, &0C, &20
 EQUB &9B, &4B, &B0, &3E, &A9, &0F, &20, &9B
 EQUB &4B, &B0, &37, &A9, &09, &20, &9B, &4B
 EQUB &B0, &30, &A9, &12, &20, &9B, &4B, &90
 EQUB &33, &A9, &20, &AE, &A9, &77, &D0, &38
 EQUB &A9, &10, &D0, &34, &A9, &06, &20, &9B
 EQUB &4B, &90, &21, &A9, &03, &20, &9B, &4B
 EQUB &B0, &1A, &A9, &00, &20, &9B, &4B, &90
 EQUB &09, &AE, &A9, &77, &D0, &E2, &A9, &05
 EQUB &D0, &16, &BA, &8A, &38, &E9, &04, &AA
 EQUB &9A, &4C, &6A, &4C, &AD, &D7, &0C, &F0
 EQUB &0A, &A2, &00, &20, &CB, &4B, &A9, &00
 EQUB &8D, &D7, &0C, &60, &20

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

.L46D8

 EQUB &AD, &E4, &7C, &F0, &21, &A2, &01, &20
 EQUB &CA, &25, &8D, &0E, &0C, &A2, &02, &20
 EQUB &CA, &25, &8D, &0C, &0C, &A2, &00, &A9
 EQUB &80, &20, &F4, &FF, &8A, &29, &01, &F0
 EQUB &05, &A9, &08, &8D, &A5, &0C, &60, &36

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

.L4800

 EQUB &28, &F0, &B8, &80, &48, &10, &D8, &A0
 EQUB &68, &30, &F8, &C0, &88, &50, &18, &E0
 EQUB &A8, &70, &38, &00, &C8, &90, &58, &20
 EQUB &E8, &B0, &78, &40, &08, &D0, &98, &60

.L4820

 EQUB &6F, &6D, &6C, &6B, &6A, &69, &67, &66
 EQUB &65, &64, &62, &61, &60, &5F, &5E, &5C
 EQUB &5B, &5A, &59, &58, &7D, &7C, &7B, &7A
 EQUB &78, &77, &76, &75, &74, &72, &71, &70

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

 LDA Row1_Block1,X
 AND P
 ORA P+1
 STA Row1_Block1,X
 LDA Row1_Block39,X
 AND R
 ORA S
 STA Row1_Block39,X
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
\       Name: L48A0
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

.L48A0

 EQUB &A2, &07

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

.L48A2

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

 LDA Row1_Block0,X
 AND P
 ORA P+1
 STA Row1_Block0,X
 LDA Row1_Block38,X
 AND R
 ORA S
 STA Row1_Block38,X
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

 LDY #&5B
 LDX #&C0
 LDA #8
 STA R
 LDA #0
 JSR FillCanopyRows

 RTS

\ ******************************************************************************
\
\       Name: L4900
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

\ ******************************************************************************
\
\       Name: L4B86
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L4BC9
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 STA L0074
 LSR A
 LSR A
 LSR A
 LSR A
 CLC
 ADC #&30
 JSR OSWRCH

 LDA L0074
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

 STY L0074

.L4C5E

 LDA L3DE0,X
 JSR OSWRCH

 INX
 CPX L0074
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

\ ******************************************************************************
\
\       Name: L4CAE
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 STA L0075
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

 STY L0074
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

 LDY L0074
 LDX #&A8
 JSR L4B00

 DEY
 CPY L0075
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
 LDA VIA+&64
 STA L44F1,X

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

.L4D92

 LDA #0
 JSR L4DB5

 JSR L4BF3

 JSR L4C12

.L4D9D

 LDX #&B6
 JSR L2532

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
 STA L007C
 LDA L0C0F
 LDY #3

.L4DD1

 LSR L007C
 ROR A
 DEY
 BPL L4DD1

 CLC
 ADC L0C15
 STA L007C
 LDA #&32
 SEC
 SBC L007C
 BEQ L4DE6

 BPL L4DE8

.L4DE6

 LDA #1

.L4DE8

 STA Envelopes+2
 STA Envelopes+4
 EOR #&FF
 STA Envelopes+3
 LDA L007C
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

 LDX #&DA
 JSR L2532

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
 ORA Row6_Block20,Y
 STA Row6_Block20,Y
 LDA #&88
 ORA Row7_Block20,Y
 STA Row7_Block20,Y
 DEY
 BPL L4E44

 LDA #&77
 ORA Row8_Block11
 STA Row8_Block11
 SEC
 LDY #&88

.L4E62

 LDA #&FF
 STA Row8_Block11,Y
 TYA
 SBC #8
 TAY
 BNE L4E62

.L4E6D

 LDX #&9F
 JSR L2532

 BNE L4E85

 LDA L0CCD
 BNE L4E8A

 LDA L7CE4
 EOR #&88
 STA L7CE4
 LDA #&80
 BNE L4E87

.L4E85

 LDA #0

.L4E87

 STA L0CCD

.L4E8A

 RTS

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

.L4EE8

 EQUB &A2, &0B, &BD, &F4, &4E, &20, &EE, &FF
 EQUB &CA, &10, &F7, &60, &21, &45, &54, &41
 EQUB &4C, &20, &4F, &4F, &54, &07, &06, &1F

.L4F00

 EQUB &00, &08, &10, &18, &20, &28, &30, &38
 EQUB &40, &48, &50, &58, &60, &68, &70, &78
 EQUB &80, &88, &90, &98, &A0, &A8, &B0, &B8
 EQUB &C0, &C8, &D0, &D8, &E0, &E8, &F0, &F8
 EQUB &00, &08, &10, &18, &20, &28, &30, &38

.L4F28

 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &00, &00, &00, &00, &00, &00, &00, &00
 EQUB &01, &01, &01, &01, &01, &01, &01, &01

.L4F50

 EQUB &A9, &BE, &AE, &DE, &CA, &BC

.L4F56

 EQUB &99, &A8, &CD, &DD, &9B, &FF

.L4F5C

 EQUB &00, &00, &00, &00

.L4F60

 EQUB &01, &01, &01, &0F, &07, &08

.L4F66

 EQUB &01, &01, &01, &00, &00, &00

.L4F6C

 EQUB &01, &01, &01, &F1, &04, &05

.L4F72

 EQUB &FF, &FF, &FF, &FF, &00, &00, &10, &00
 EQUB &F3, &FF, &06, &00, &03, &00

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

.L4FEA

 EQUB &00, &00

.L4FEC

 EQUB &00, &00, &4D, &0D, &0C, &08, &15, &20
 EQUB &20, &20, &20, &20, &20, &4C

.L4FFA

 EQUB &44

.L4FFB

 EQUB &59

.L4FFC

 EQUB &23, &31, &3A

.L4FFF

 EQUB &4C

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
 STX L007D
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
 STA L0088
 LDA #&1B
 STA L0CCB
 JSR L1D8D

 LDX #&89
 LDY #&FF
 STY L0088
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
 LDA L007D
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
 STA L0076
 LDA L0C13
 AND #&80
 ORA P
 STA P+1
 TXA
 SEC
 SBC L0076
 STA L09FC
 TXA
 SBC P+1
 STA L4AFC

.L5151

 LDA #9
 STA L0CCB
 LDA #&FC
 STA L0088
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
 STY L0088
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
 STA L0076
 LDA L0C93,X
 BPL L520B

 DEC R

.L520B

 ASL L0076
 ROL A
 ROL R
 PHA
 LDA L0C8C,X
 CLC
 ADC L0076
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
 STA L0082
 STA L0083
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
 STA L007A
 LDA P+1
 ASL L007A
 ROL A
 ASL L007A
 ROL A
 STA L007B
 LDA P+1

.L52D3

 CMP L0083
 BCC L52E7

 BNE L52E1

 LDA P
 CMP L0082
 BCC L52E7

 LDA P+1

.L52E1

 STA L0083
 LDA P
 STA L0082

.L52E7

 DEX
 BPL L529D

 ASL L0082
 ROL L0083
 LDY L0083
 LDX L0082
 JSR L57E4

 STY L0083
 STX L0082
 LDA L4F84
 CMP #&27
 BNE L5307

 LDA L0C15
 CMP #&0B
 BCC L533A

.L5307

 LDA L007B
 CMP L0C15
 BCC L5347

 BNE L5317

 LDA L007A
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

 LDA L007D
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

 LDA L0082
 AND #&FE
 STA R
 LDA L0083
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

 STA L007B
 STY L007A
 LDA #0
 STA L007C
 STX L0086
 JSR L17E3

 LDA L007C
 BPL L5395

 SEC
 LDA #0
 SBC L0077
 STA L0077
 LDA L0078
 SBC #0
 STA L0078
 BCS L5395

 DEC L0079

.L5395

 LDX L0086
 LDY #0
 LDA L0078
 CPX #3
 BCC L53A5

 CPX #5
 BEQ L53A5

 INY
 INY

.L53A5

 ASL L0077
 ROL A
 ROL L0079
 DEY
 BPL L53A5

 STA L0C40,X
 LDA L0079
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

 STA L0077
 STA L0C57
 LDA #0
 STA L0078
 LDA L0C45
 STA L0C47
 LDX #2
 LDA Flaps
 PHP
 BEQ L53E7

 LDX #1

.L53E7

 ASL A
 ROL L0077
 ROL L0078
 DEX
 BPL L53E7

 PLP
 BEQ L53F6

 SEC
 JSR L54AC

.L53F6

 CLC
 LDA L0077
 ADC L0C40
 STA L0C40
 LDA L0078
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

 LDX L0086
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
 LDA L0078
 BPL L5445

 DEC R

.L5445

 LSR R
 ROR L0078
 ROR L0077
 ROR L0076
 INY
 BNE L5445

 BEQ L545B

.L5452

 ASL L0076
 ROL L0077
 ROL L0078
 DEY
 BNE L5452

.L545B

 LDA L0078
 STA L0C70,X
 LDA L0077
 STA L0C60,X
 LDA L0076
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

.L5472

 STX L0086

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

 STA L0078
 LDA L0076
 STA L0077
 LDY R
 LDX P
 JSR L1821

 CLC
 ADC L0077
 STA L0077
 LDA #0
 ADC L0078
 STA L0078
 LDX P+1
 BPL L54B8

 LDA #0
 SEC
 SBC L0076
 STA L0076

.L54AC

 LDA #0
 SBC L0077
 STA L0077
 LDA #0
 SBC L0078
 STA L0078

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

 LDA L0086
 TAX
 EOR #1
 TAY
 SEC
 LDA L0C43,Y
 SBC L0077
 STA L0C06,X
 LDA L0C53,Y
 SBC L0078
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

 LDY L0CA0,X
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

 LDY L007D
 BEQ L552F

.L5525

 EOR L0CB0,X
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

 LDX L0086
 LDY L0C0C,X
 BPL L554F

 SEC
 JSR L54AC

.L554F

 STA L0C5A,X
 LDA L0077
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

 STA L0079
 STA L0078
 LDA L0C05
 LDX #3

.L5603

 LSR L0078
 ROR A
 DEX
 BPL L5603

 STA L0077
 LDY L0C1F
 STY R
 LDA L0C0F
 LDX L007D
 BEQ L562B

 CPY #4
 BCC L561E

 ASL A
 ROL R

.L561E

 LDY L0079
 CPY #4
 BCS L562B

 CPY #1
 BCC L562B

 ASL A
 ROL R

.L562B

 SEC
 SBC L0077
 TAX
 LDA R
 SBC L0078
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

\ ******************************************************************************
\
\       Name: L566E
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 LDA L007D
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
 LDA VIA+&64
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

\ ******************************************************************************
\
\       Name: L56A3
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L56A3

 LDX #&EE
 JSR L57F6

.L56A8

 LDA L0CF0
 CMP L0CEE
 BCC L569D

 LDX L007D
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

\ ******************************************************************************
\
\       Name: L56E8
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L5701
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
 STA L0074
 LDA L0078
 BPL L5779

 DEC L0074

.L5779

 LDX #1

.L577B

 LSR L0074
 ROR A
 ROR L0077
 DEX
 BPL L577B

 STA L0C12
 LDA L0077
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

 AND VIA+&64

.L57BB

 PHP
 BPL L57C0

 EOR #&FF

.L57C0

 STA L0078
 LDA #0

.L57C4

 LSR L0078
 ROR A
 DEY
 BPL L57C4

 STA L0077
 PLP
 BCC L57D2

 JSR L54AC

.L57D2

 LDA L0077
 CLC
 ADC L0C00,X
 STA L0C00,X
 LDA L0078
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
 LDX L0077
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

.L0D01

 LDX L0088
 LDA #0
 STA L007F
 LDA #&10
 STA R
 LDA L0400,X
 TAY
 AND #1
 BEQ L0D14

 RTS

\ ******************************************************************************
\
\       Name: L0D14
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

 STA L0081
 LDA L0900,X
 STA L0080
 JMP L0D6A

.L0D55

 LDA #0
 SEC
 SBC L0900,X
 STA L0080
 LDA #0
 SBC L4A00,X
 STA L0081
 LDA L007F
 ORA #8
 STA L007F

.L0D6A

 LDA L0B00,X
 BMI L0D7C

 STA L0083
 LDA L0A00,X
 ASL A
 ROL L0083
 STA L0082
 JMP L0D94

.L0D7C

 LDA #0
 SEC
 SBC L0A00,X
 STA L0082
 LDA #0
 SBC L0B00,X
 ASL L0082
 ROL A
 STA L0083
 LDA L007F
 ORA #4
 STA L007F

.L0D94

 LDA L0081
 CMP P+1
 BCC L0DA8

 BNE L0DA2

 LDA L0080
 CMP P
 BCC L0DA8

.L0DA2

 LDA #&20
 ORA L007F
 STA L007F

.L0DA8

 LDA L0083
 CMP P+1
 BCC L0DBC

 BNE L0DB6

 LDA L0082
 CMP P
 BCC L0DBC

.L0DB6

 LDA L007F
 ORA #&10
 STA L007F

.L0DBC

 LDY P
 LDX P+1
 JSR L0F48

 TAX
 LDA L3900,X
 STA L0084
 LDA L4700,X
 AND #&F8
 STA S
 STY L007C
 LDA L0087
 STA L0085
 LDY L0080

 LDX L0081
 JSR L0E69

 LDA P+1
 STA L0081
 LDA P
 STA L0080
 LDA L0087
 STA L0086
 LDY L0082
 LDX L0083
 JSR L0E69

 JSR L0FA7

 LDX L0088
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
 SBC L0081
 STA L0900,X
 LDA #0
 SBC L0083
 STA L4A00,X
 JMP L0E28

.L0E19

 LDA #&50
 CLC
 ADC L0081
 STA L0900,X
 LDA #0
 ADC L0083
 STA L4A00,X

.L0E28

 LDX L0088
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
 SBC L0082
 STA L0B00,X
 JMP L0E5D

.L0E4E

 LDA #&60
 CLC
 ADC P+1
 STA L0A00,X
 LDA #0
 ADC L0082
 STA L0B00,X

.L0E5D

 LDA L0400,X
 ORA L007F
 STA L0400,X
 RTS

 JSR L0F48

.L0E69

 JSR L0F48

 STA L007B
 STY L007A
 LDX L0084
 LDY L007B
 LDA L4500,X
 ORA L3700,Y
 STA L0074
 AND #&F0
 ORA L4300,Y
 STA L0075
 AND #&0F
 ORA L3800,X
 STA L0076
 AND #&F0
 ORA L3700,Y
 TAY
 LDX S
 AND #&0F
 ORA L4500,X
 TAX
 LDA L3A00,X
 CLC
 LDX L0076
 ADC L3A00,X
 STA P
 LDX L0074
 LDA L3A00,X
 ADC #1
 STA P+1
 LDX L0075
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

 ADC L007B
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
 ADC L0084
 SEC
 JMP L0EDD

.L0EDB

 ADC L0084

.L0EDD

 ROR A
 ROR P
 STA P+1
 LDA L007A
 BEQ L0F16

 AND #&F0
 LDX L0084
 ORA L3700,X
 TAY
 AND #&F0
 ORA L4300,X
 TAX
 LDA L3A00,X
 TAX
 CLC
 LDA L3800,X
 ADC L007A

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

 LDA L007C
 AND #&C0
 BEQ L0F47

 STA L007C
 CLC
 LDA L0084
 ADC #1
 ROR A
 STA L0077
 LSR A
 BIT L007C
 BVS L0F2F

 LDA #0
 BIT L007C

.L0F2F

 BPL L0F34

 CLC
 ADC L0077

.L0F34

 TAY
 LDX P+1
 JSR L1821

 STA L0078
 LDA P
 SEC
 SBC L0078
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
 STA L0087
 CMP #&0D
 TXA
 STY L0074
 BCC L0F66

.L0F5B

 ASL L0074
 ROL A
 BCC L0F5B

 LDY L0074
 RTS

\ ******************************************************************************
\
\       Name: L0F63
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0F63

 ASL L0074
 ROL A

.L0F66

 BIT R
 BEQ L0F63

 TAY
 LDX L0074
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
 STA L0087
 CMP #4
 TYA
 LDY #0
 BCC L0F8E

.L0F89

 ASL A
 BCC L0F89

 RTS

\ ******************************************************************************
\
\       Name: L0F8D
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0F8D

 ASL A

.L0F8E

 BIT R
 BEQ L0F8D

 TAX
 LDA L3800,X
 RTS

\ ******************************************************************************
\
\       Name: L0F97
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L0F97

 TSX
 INX
 INX
 TXS
 LDA #0
 STA P+1
 STA P
 LDX L0085
 DEX
 STX L0087
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
 STA L0082
 STA L0083
 LDA #7
 STA L0074
 LDA L0086
 SEC
 SBC L0085
 TAX
 INX
 LDA L0087
 SEC
 SBC L0085
 TAY
 INY
 CPY #7
 BCC L0FC6

 JMP L0FCA

.L0FC6

 CPX #7
 BCC L0FE4

.L0FCA

 LDA L0086
 SEC
 SBC L0087
 BEQ L0FDA

 BPL L0FDE

 LDA P+1
 BMI L0FE4

 JMP L0FE2

.L0FDA

 LDA P+1
 BMI L0FE4

.L0FDE

 LDA L0081
 BMI L0FE4

.L0FE2

 INC L0074

.L0FE4

 TYA
 BMI L0FF0

 JMP L0FEC

.L0FEA

 DEX
 DEY

.L0FEC

 CPY L0074
 BCS L0FEA

.L0FF0

 TXA
 BMI L0FFC

 JMP L0FF8

.L0FF6

 DEX
 DEY

.L0FF8

 CPX L0074
 BCS L0FF6

.L0FFC

 TXA
 BMI L1017

.L0FFF

 BNE L1006
 ASL L0080
 JMP L1025

.L1006

 LDA L0081

.L1008

 ASL L0080
 ROL A
 ROL L0083
 DEX
 BNE L1008

 STA L0081
 ASL L0080
 JMP L1025

.L1017

 EOR #&FF
 CLC
 ADC #1
 TAX
 LDA L0081

.L101F

 LSR A
 DEX
 BNE L101F

 STA L0081

.L1025

 BCC L103B

 INC L0081
 BNE L103B

 INC L0083
 LDA L0083
 CMP #&40
 BCC L103B

 LDA #&3F
 STA L0083
 LDA #&FF
 STA L0081

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
 ROL L0082
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

 INC L0082
 LDA L0082
 CMP #&40
 BCC L107A

 LDA #&3F
 STA L0082
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

.L107F

 LDA #0

.L1081

 STA L0076
 LDA #0
 STA L0084
 STA L0085
 LDX L007D
 LDY L007E
 LDA L0900,X
 STA R
 LDA L4A00,X
 STA L0082
 LDA L0A00,X
 STA S
 LDA L0B00,X
 STA L0083
 LDA L0900,Y
 STA L0077
 SEC
 SBC R
 STA L0074
 LDA L4A00,Y
 STA L0081
 SBC L0082
 STA L007A
 BPL L10C9

 LDA #&80
 ORA L0076
 STA L0076
 LDA #0
 SEC
 SBC L0074
 STA L0074
 LDA #0
 SBC L007A
 STA L007A

.L10C9

 LDA L0A00,Y
 STA L0078
 SEC
 SBC S
 STA L0075
 LDA L0B00,Y
 STA L0079
 SBC L0083
 STA L007B
 BPL L10F1

 LDA #&40
 ORA L0076
 STA L0076

 LDA #0
 SEC
 SBC L0075
 STA L0075
 LDA #0
 SBC L007B
 STA L007B

.L10F1

 LDA #0
 LDX S
 LDY L0083
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

 STA (P),Y              \ Zero the Y-th byte of the page at P(1 0)

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

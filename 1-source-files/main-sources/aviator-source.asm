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
GG = &0088              \ PP in original
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

L0400 = &0400           \ Whole page zeroed in Reset
L04D8 = &04D8
L04D9 = &04D9
L04EC = &04EC

L0500 = &0500
L05C8 = &05C8           \ Zeroed in Reset

L0600 = &0600

L0700 = &0700
L075F = &075F
L07E4 = &07E4
L07FC = &07FC

L0900 = &0900           \ Set to 80 in Reset, Reset2
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

TurnLo = &0C01          \ Turn rate (low byte)
                        \
                        \ Stored as 35 * the turn rate in 180 degrees per minute
                        \ 
                        \ Shown on indicator 5

L0C02 = &0C02
L0C03 = &0C03

AirspeedLo = &0C05      \ Air speed (low byte)
                        \
                        \ 100 mph is stored as 9.25 * 256 = 2368
                        \
                        \ so 50 mph  = 0.5 * 2368 = 1184 = (4 160)
                        \ so 70 mph  = 0.7 * 2368 = 1658 = (6 122)
                        \ so 100 mph =   1 * 2368 = 2368 = (9 64)
                        \ so 400 mph =   4 * 2368 = 9472 = (37 00)
                        \
                        \ Shown on indicator 1

L0C06 = &0C06
L0C08 = &0C08
L0C09 = &0C09

Elevator = &0C0C        \ Elevator position (pitch)
                        \
                        \ Shown on indicator 8 or 10 as the joystick y-position

Rudder = &0C0D          \ Rudder position (yaw)
                        \
                        \ Shown on indicator 9

Aileron = &0C0E         \ Aileron position (roll)
                        \
                        \ Shown on indicator 8 or 10 as the joystick x-position

ThrustLo = &0C0F        \ Thrust (low byte)
                        \
                        \ Thrust is in the range 0 to 1280
                        \
                        \ Shown on indicator 11
L0C10 = &0C10

TurnHi = &0C11          \ Turn rate (low byte)
                        \
                        \ Stored as 35 * the turn rate in 180 degrees per minute
                        \
                        \ Shown on indicator 5

L0C12 = &0C12
L0C13 = &0C13

AirspeedHi = &0C15      \ Air speed (high byte)
                        \
                        \ 100 mph is stored as 9.25 * 256 = 2368
                        \
                        \ so 50 mph  = 0.5 * 2368 = 1184 = (4 160)
                        \ so 70 mph  = 0.7 * 2368 = 1658 = (6 122)
                        \ so 100 mph =   1 * 2368 = 2368 = (9 64)
                        \ so 400 mph =   4 * 2368 = 9472 = (37 00)
                        \
                        \ Shown on indicator 1

L0C16 = &0C16
L0C18 = &0C18
L0C19 = &0C19

ThrustHi = &0C1F        \ Thrust (high byte)
                        \
                        \ Thrust is in the range 0 to 1280
                        \
                        \ Shown on indicator 11

L0C20 = &0C20
L0C26 = &0C26
L0C2A = &0C2A

AxisKeyUsage = &0C2D    \ The following locations are updated when keys are
                        \ pressed in ApplyFlightKeys:
                        \
                        \   * AxisKeyUsage   = elevator
                        \   * AxisKeyUsage+1 = rudder
                        \   * AxisKeyUsage+2 = aileron
                        \
                        \ In each case, the value is updated by adding the
                        \ relevant KeyLoggerLow value, which is 1 in each case,
                        \ so these count up by 1 every time a relevant axis
                        \ control key is pressed (in any direction), so they
                        \ measure "axis control key usage"

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

VerticalSpeedLo = &0C8A \ Vertical speed
                        \
                        \ Stored as 128/425 * vertical speed in feet per minute,
                        \ so:
                        \
                        \ 1000 feet/minute is stored as 128/425 * 1000 = 301
                        \ 4000 feet/minute is stored as 128/425 * 4000 = 1205
                        \
                        \ Shown on indicator 4

L0C8C = &0C8C
L0C90 = &0C90
L0C92 = &0C92
L0C93 = &0C93
L0C94 = &0C94
L0C96 = &0C96
L0C99 = &0C99

VerticalSpeedHi = &0C9A \ Vertical speed
                        \
                        \ Shown on indicator 4

Slip = &0C9C            \ Slip rate
                        \
                        \ Shown on indicator 6

KeyLoggerLow = &0CA0    \ Key logger (low value)
                        \
                        \ Populated with values from KeyTable1Lo or KeyTable2Lo
                        \ when a key is pressed, or 0 if neither is pressed:
                        \
                        \ L or < (elevator dive/pitch)      =   1 or  1
                        \ A or + (rudder yaw left/right)    =   1 or  1
                        \ S or D (aileron bank left/right)  =   1 or  1
                        \ W or E (throttle down/up)         = -15 or 15
                        \ U or B (undercarriage, brakes)    =   4 or  7
                        \ F or SHIFT (flaps, fire)          =   5 or  8

L0CA8 = &0CA8

KeyLoggerHigh = &0CB0   \ Key logger (high value)
                        \
                        \ Populated with values from KeyTable1Hi or KeyTable2Hi
                        \ when a key is pressed, or 0 if neither is pressed:
                        \
                        \ L or < (elevator dive/pitch)      = -1 or 1
                        \ A or + (rudder yaw left/right)    = -1 or 1
                        \ S or D (aileron bank left/right)  = -1 or 1
                        \ W or E (throttle down/up)         = -1 or 0
                        \ U or B (undercarriage, brakes)    =  0 or 0
                        \ F or SHIFT (flaps, fire)          =  0 or 0

L0CB8 = &0CB8
L0CBA = &0CBA
L0CBB = &0CBB

GunSights = &0CBE       \ Gun sights status
                        \
                        \ Bit 6 = 1 while "I" is being held down
                        \
                        \ Bit 7 = 1 when sights are being shown
                        \         0 when sights are not being shown

L0CBF = &0CBF
L0CC0 = &0CC0
L0CC1 = &0CC1
L0CC2 = &0CC2           \ Set to 128 for new game
L0CC3 = &0CC3           \ Set to 15 for new game
L0CC4 = &0CC4
L0CC5 = &0CC5           \ Set to 1 in Reset ("on ground" flag?)

L0CC6 = &0CC6           \ Used to store the value of NN during the main loop

L0CC7 = &0CC7
L0CC8 = &0CC8

PressingT = &0CC9       \ Set to 0 in the main loop if "T" is not being pressed,
                        \ otherwise set to 1, to prevent holding down "T" from
                        \ constantly switching the engine on and off

L0CCA = &0CCA
L0CCB = &0CCB
L0CCC = &0CCC           \ OB in original

PressingTab = &0CCD     \ Bit 7 determines whether TAB is being pressed
                        \
                        \   * 0 = not being pressed
                        \   * 128 = being pressed
                        \
                        \ This value is set in the ToggleJoystick routine

L0CCE = &0CCE
L0CCF = &0CCF
L0CD0 = &0CD0           \ Set to 255 in Reset
L0CD1 = &0CD1           \ Set to 47 in Reset

PressingUFBS = &0CD2    \ Determines whether any of the following keys are
                        \ being pressed:
                        \
                        \ PressingUFBS = 1 while the undercarriage key "U" is 
                        \ being pressed, 0 otherwise

                        \ PressingUFBS+1 = 1 while the flaps button "F" is being
                        \ pressed, 0 otherwise

                        \ PressingUFBS+2 is not used

                        \ PressingUFBS+3 = 1 while the brake key "B" is being
                        \ pressed, 0 otherwise

                        \ PressingUFBS+4 = 1 while the fire key SHIFT is being
                        \ pressed, 0 otherwise

L0CD7 = &0CD7

ScoreDisplayTimer = &0CD8   \ Counter for removing the score after displaying it
                        \ for a fixed amount of time

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

Engine = &0CE9          \ Engine status
                        \
                        \   * 0 = engine is off
                        \   * Non-zero = engine is on

L0CEA = &0CEA
L0CEC = &0CEC
L0CED = &0CED           \ Set to 229 in Reset

AltitudeLo = &0CEE      \ Altitude (high byte)
                        \
                        \ Stored as the altitude in feet x 4
                        \
                        \ Shown on indicator 2
                        \ Set to 10 in Reset

L0CEF = &0CEF           \ Set to 92 in Reset

L0CF0 = &0CF0           \ Set to 5 if undercarriage is up, 10 if it is down in
                        \ IndicatorU

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

Propellor = &0CF7       \ Propellor status
                        \
                        \   * 0 = propellor is working
                        \   * Non-zero = propellor is broken
                        \
                        \ If we make a crash landing with the undercarriage up,
                        \ the propellor breaks and we can't turn the engine on

L0CF8 = &0CF8           \ Set to 10 in Reset
L0CF9 = &0CF9
L0CFA = &0CFA           \ Set to 7 in Reset

Compass = &0CFB         \ Compass direction
                        \
                        \   * 0 = North
                        \   * 64 = East
                        \   * 128 = South
                        \   * 192 = West
                        \
                        \ Shown on indicator 0

L0CFC = &0CFC
L0CFD = &0CFD           \ Set to 198 in Reset

AltitudeHi = &0CFE      \ Altitude (high byte)
                        \
                        \ Stored as the altitude in feet x 4
                        \
                        \ Shown on indicator 2
                        \ Set to 0 in Reset

L0CFF = &0CFF           \ Set to 72 in Reset

                        \ Screen address variables
                        \ Row1_Block2_3 = Row 1, block 2, byte 3
                        \ All count from zero

                        \ Canopy screen addresses (rows 0 to 19)

Row1_Block0_0 = &5940   \ First block on second row
Row1_Block1_0 = &5948   \ Second block on second row
Row1_Block38_0 = &5A68  \ Last block but one on second row
Row1_Block39_0 = &5A70  \ Last block on second row

Row3_Block1_0 = &5BC8   \ Top-left corner of the on-screen score display

Row6_Block1_0 = &5F88   \ Top-left corner of the canopy-wide rectangle
                        \ containing the gun sights on rows 6, 7 and 8

Row6_Block20_0 = &6020  \ Top block of the vertical line in the gun sights
Row7_Block20_0 = &6160  \ Bottom block of the vertical line in the gun sights
Row8_Block11_0 = &6258  \ Left end of horizontal bar in the gun sights

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

Row28_Block26_5 = &7BD5 \ Centre block of slip-and-turn indicator

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

CODE% = &1100           \ The start address of the main code block (though note
                        \ that code is moved to &0D00-&1100 before the main game
                        \ is run, so this doesn't represent the start of the
                        \ main game code in memory)

ORG &0B00

\ ******************************************************************************
\
\       Name: SetupScreen
\       Type: Subroutine
\   Category: Setup
\    Summary: Set up the screen mode and load the dashboard image
\
\ ******************************************************************************

.SetupScreen

 LDA #22                \ Switch to screen mode 5 with the following VDU
 JSR OSWRCH             \ command:
 LDA #5                 \
 JSR OSWRCH             \   VDU 22, 5

 LDY #0                 \ We now want to write the VDU command to disable the
                        \ cursor, whose bytes are in the variable at
                        \ DisableCursor, so set up a counter in Y

.sscr1

 LDA DisableCursor,Y    \ Write the Y-th value from DisableCursor
 JSR OSWRCH

 INY                    \ Increment the loop counter

 CPY #10                \ Loop back to write the next character until we have
 BNE sscr1              \ written all 10, in other words:
                        \
                        \   VDU 23, 0, 10, 23, 0, 0, 0, 0, 0, 0

 LDA #31                \ Move the text cursor to column 4, row 10 with the
 JSR OSWRCH             \ following VDU command:
 LDA #4                 \
 JSR OSWRCH             \   VDU 31, 4, 10
 LDA #10
 JSR OSWRCH

 LDY #0                 \ We now want to print the "Please wait" message in
                        \ variable PleaseWaitText, so set up a counter in Y

.sscr2

 LDA PleaseWaitText,Y   \ Print the Y-th character from PleaseWaitText
 JSR OSWRCH

 INY                    \ Increment the loop counter

 CPY #11                \ Loop back to print the next character until we have
 BNE sscr2              \ printed all 11 ("Please wait")

 LDX #LO(LoadDashboard) \ Set (Y X) to point to LoadDashboard ("L.DASHBD 7100")
 LDY #HI(LoadDashboard)

 JSR OSCLI              \ Call OSCLI to run the OS command in LoadDashboard,
                        \ which loads the dashboard image into the screen

 LDA #129               \ Call OSBYTE with A = 129, X = &FF and Y = 0 to scan
 LDX #&FF               \ the keyboard for &FF centiseconds (2.56 seconds)
 LDY #0
 JSR OSBYTE

 JMP DrawCanopy         \ Jump down to DrawCanopy to continue the setup process

\ ******************************************************************************
\
\       Name: LoadDashboard
\       Type: Variable
\   Category: Setup
\    Summary: The OS command string for loading the dashboard image
\
\ ******************************************************************************

.LoadDashboard

 EQUS "L.DASHBD 7100"   \ This is short for "*LOAD DASHBD 7100"
 EQUB 13

\ ******************************************************************************
\
\       Name: DisableCursor
\       Type: Variable
\   Category: Setup
\    Summary: The VDU command for disabling the cursor
\
\ ******************************************************************************

.DisableCursor

 EQUB 23, 0, 10, 23     \ Set 6845 register R10 = 23
 EQUB 0, 0, 0           \
 EQUB 0, 0, 0           \ This is the "cursor start" register, so this sets the
                        \ cursor start line at 23, effectively disabling the
                        \ cursor

\ ******************************************************************************
\
\       Name: PleaseWaitText
\       Type: Variable
\   Category: Setup
\    Summary: The "Please wait" message shown when the game loads
\
\ ******************************************************************************

.PleaseWaitText

 EQUS "Please wait"
 EQUB 13

\ ******************************************************************************
\
\       Name: DrawCanopy
\       Type: Subroutine
\   Category: Setup
\    Summary: Move code around, clear the edges of the canopy view, draw the
\             canopy edges and rivets, and jump to the main code
\
\ ******************************************************************************

.DrawCanopy

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

.dcan1

 LDA &0400,Y            \ Copy the Y-th byte of &0400 to the Y-th byte of &0D00
 STA &0D00,Y

 LDA &0500,Y            \ Copy the Y-th byte of &0500 to the Y-th byte of &0E00
 STA &0E00,Y

 LDA &0600,Y            \ Copy the Y-th byte of &0600 to the Y-th byte of &0F00
 STA &0F00,Y

 LDA &0700,Y            \ Copy the Y-th byte of &0700 to the Y-th byte of &1000
 STA &1000,Y

 DEY                    \ Decrement the loop counter

 BNE dcan1              \ Loop back until we have copied a whole page of bytes

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
 JSR VduMove

 LDX #3                 \ Draw a line to (3, 239)
 LDY #239
 JSR VduDraw

 LDX #156               \ Move the graphics cursor to (156, 96)
 LDY #96
 JSR VduMove

 LDX #156               \ Draw a line to (156, 239)
 LDY #239
 JSR VduDraw

 LDX #8                 \ Move the graphics cursor to (8, 248)
 LDY #248
 JSR VduMove

 LDX #151               \ Draw a line to (151, 248)
 LDY #248
 JSR VduDraw

                        \ We now draw the square rivets around the edge of the
                        \ canopy view, starting with the three rivets up each
                        \ side of the screen

 LDY #121               \ Set Y = 121 so the first rivets are drawn at height
                        \ 121, i.e. at (0, 121) and (158, 121)

.dcan2

 LDX #0                 \ Draw a square rivet at (0, Y)
 JSR DrawRivet

 LDX #158               \ Draw a square rivet at (158, Y)
 JSR DrawRivet

 TYA                    \ Set Y = Y + 48
 CLC                    \
 ADC #48                \ so the next rivet we draw will be 48 pixels higher
 TAY

 CPY #9                 \ Loop back to draw the next rivet until Y = 9, at which
 BNE dcan2              \ point Y has wrapped round off the top of the screen
                        \ back to the bottom and we will have drawn three rivets
                        \ up each side of the canopy view

                        \ Finally, we draw the six square rivets along the top
                        \ of the canopy view

 LDY #255               \ Set X and Y so the first rivet is at (19, 255)
 LDX #19

.dcan3

 JSR DrawRivet          \ Draw a square rivet at (X, Y)

 TXA                    \ Set X = X + 24
 CLC                    \
 ADC #24                \ so the next rivet we draw will be 24 pixels to the
 TAX                    \ right

 CPX #163               \ Loop back to draw the next rivet until X = 163, at
 BNE dcan3              \ which point we will have drawn six rivets along the
                        \ top of the canopy view

 JMP StartGame          \ Jump to StartGame to start the game

\ ******************************************************************************
\
\       Name: VduPoint
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw a point on-screen using the standard VDU routines
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

.VduPoint

 LDA #69                \ Set A = 69 so the following VDU 25 command plots a
                        \ point at an absolute position on-screen

 BNE VduPlot            \ Jump to VduPlot to do the move (this BNE is
                        \ effectively a JMP as A is never zero

\ ******************************************************************************
\
\       Name: VduMove
\       Type: Subroutine
\   Category: Graphics
\    Summary: Move the graphics cursor using the standard VDU routines
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

.VduMove

 LDA #4                 \ Set A = 4 so the following VDU 25 command moves the
                        \ graphics cursor an absolute position on-screen

 BNE VduPlot            \ Jump to VduPlot to do the move (this BNE is
                        \ effectively a JMP as A is never zero

\ ******************************************************************************
\
\       Name: VduDraw
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw a line using the standard VDU routines
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

.VduDraw

 LDA #5                 \ Set A = 5 to denote "draw line absolute in the current
                        \ graphics foreground colour"

\ ******************************************************************************
\
\       Name: VduPlot
\       Type: Subroutine
\   Category: Graphics
\    Summary: Perform a plot command the standard VDU routines
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

.VduPlot

 PHA                    \ Store the value of A on the stack, so we can retrieve
                        \ it after the call to OSWRCH

 LDA #25                \ Start a VDU 25 command, which is the equivalent of a
 JSR OSWRCH             \ PLOT command in BBC BASIC, and which has the following
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
\       Name: DrawRivet
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

.DrawRivet

 JSR VduPoint           \ Draw a point at (X, Y)

 DEY                    \ Draw a point at (X, Y - 1)
 JSR VduPoint

 DEY                    \ Draw a point at (X, Y - 2)
 JSR VduPoint

 DEY                    \ Draw a point at (X, Y - 3)
 JSR VduPoint

 INX                    \ Draw a point at (X + 1, Y - 3)
 JSR VduPoint

 INY                    \ Draw a point at (X + 1, Y - 2)
 JSR VduPoint

 INY                    \ Draw a point at (X + 1, Y - 1)
 JSR VduPoint

 INY                    \ Draw a point at (X + 1, Y)
 JSR VduPoint

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

.clrw1

 LDA #0                 \ We are about to zero a block of memory, so set A = 0
                        \ so we can use it as our overwrite value

 LDY S                  \ Fetch the width of each character row, which we stored
                        \ in S above

.clrw2

 STA (P),Y              \ Zero the Y-th byte of the page at P(1 0), which sets 4
                        \ pixels to black

 DEY                    \ Decrement the byte pointer

 BNE clrw2              \ Loop back until we have zeroed P(1 0) to P(1 0) + Y

 LDA P                  \ Set P(1 0) = P(1 0) + 320
 CLC                    \
 ADC #LO(320)           \ starting with the low bytes
 STA P

 LDA P+1                \ And then the high bytes
 ADC #HI(320)
 STA P+1

 DEC R                  \ Decrement the row counter in R

 BNE clrw1              \ Loop back until we have zeroed R rows

 RTS                    \ Return from the subroutine

 SKIP 30                \ These bytes appear to be unused
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 EQUB &FF, &FF
 SKIP 32
 EQUB &40

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
 LDA Lookup3900,X
 STA TT
 LDA Lookup4700,X
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
 LDA HighNibble,X
 ORA Times16Hi,Y
 STA T
 AND #&F0
 ORA LowNibble,Y
 STA U
 AND #&0F
 ORA Times16Lo,X
 STA V
 AND #&F0
 ORA Times16Hi,Y
 TAY
 LDX S
 AND #&0F
 ORA HighNibble,X
 TAX
 LDA TimesTable,X
 CLC
 LDX V
 ADC TimesTable,X
 STA P
 LDX T
 LDA TimesTable,X
 ADC #1
 STA P+1
 LDX U
 LDA TimesTable,X
 ADC TimesTable,Y
 TAX
 LDY #0
 BCC L0EBB

 LDY #&10

.L0EBB

 LDA Times16Lo,X
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
 ADC Times16Hi,X
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
 ORA Times16Hi,X
 TAY
 AND #&F0
 ORA LowNibble,X
 TAX
 LDA TimesTable,X
 TAX
 CLC
 LDA Times16Lo,X
 ADC I

.L0EFE

 LDA TimesTable,Y
 ADC Times16Hi,X
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

 LDA Lookup4700,X
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
 LDA Times16Hi,X
 ORA Times16Lo,Y
 LDY Times16Lo,X
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

 LDA Lookup4700,Y
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
 LDA Times16Lo,X
 RTS

.L0F97

 TSX                    \ Remove two bytes from the top of the stack
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
 BEQ L1101

 PHP
 LDX #0
 PLP
 CLC
 BMI L1102

 DEX

.L1101

 SEC

.L1102

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
 LDA XLookupLo,X
 ADC YLookupLo,Y
 STA P
 LDA XLookupHi,X
 ADC YLookupHi,Y
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

 LDA Lookup2E60,X

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

 LDA Lookup2E6A,X

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

 LDA Lookup2E60,X

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

 TSX                    \ Remove two bytes from the top of the stack
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

 TSX                    \ Remove two bytes from the top of the stack
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

 LDA LowNibble,X
 ORA HighNibble,Y
 STA T
 AND #&F0
 ORA Times16Hi,X
 STA U
 AND #&0F
 ORA Times16Lo,Y
 TAY
 AND #&F0
 ORA LowNibble,X
 TAX
 LDA TimesTable,X
 STA V
 LDX T
 LDA TimesTable,X
 CLC
 ADC TimesTable,Y
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
 ADC TimesTable,X
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
 LDA Lookup4000+1,X
 SBC Lookup4000,X
 STA I
 LDA Lookup4101+1,X
 SBC Lookup4101,X
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
 ADC Lookup4000,X
 TAY
 LDA #0
 ADC Lookup4101,X
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
 LDA Times16Lo,Y
 ORA Times16Hi,X
 TAY
 AND #&F0
 ORA LowNibble,X
 STA U
 LDX R
 AND #&F0
 ORA Times16Hi,X
 TAX
 LDA TimesTable,X
 TAX
 STX T
 LDA TimesTable,Y
 TAY
 LDA Times16Hi,X
 ORA Times16Lo,Y
 CLC
 LDX U
 ADC TimesTable,X
 STA W
 LDA Times16Hi,Y
 ADC #0
 STA G
 BIT K
 BPL L198E

 LDX R
 LDA V
 AND #&0F
 ORA Times16Lo,X
 TAY
 LDX T
 LDA Times16Lo,X
 CLC
 ADC TimesTable,Y
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
 LDY Lookup3400,X
 STY PP
 LDY Lookup34D8,X
 STY QQ
 LDY L35B0,X
 STY RR
 LDA Times16Hi,Y
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
\       Name: UpdateIndicator (Part 1 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update a single indicator on the dashboard
\
\ ------------------------------------------------------------------------------
\
\ This long routine performs calculations for the various indicators on the
\ dashboard. This typically involves taking the relevant measurement, scaling it
\ to fit on the relevant indicator, and then preparing a suitable vector line
\ (for dial hands), orthogonal line (for vertical bar indicators), joystick
\ cross (for the joystick position display) or artificial horizon line.
\
\ A common feature of a number of these calculations is scaling, which is done
\ by multiplying the measurement by a specific scale factor. Shift-and-add
\ multiplication is used to do this, but instead of using a generic multiply
\ routine, the relevant indicators contain hard-coded multiply routines that
\ have their scale factors backed into the code.
\
\ Generally, if we want to calculate A * T / 256, then the traditional approach
\ if to use a shift-and-add loop like this:
\
\   LSR A               \ Set P = A >> 1 and C flag = bit 0 of A
\   STA P
\
\   LDX T               \ Set T1 = T - 1
\   DEX                 \
\   STX T1              \ We subtract 1 as the C flag will be set when we want
\                       \ to do an addition in the loop below
\
\                       \ We are now going to work our way through the bits of
\                       \ P, and do a shift-add for any bits that are set,
\                       \ keeping the running total in A. We already set up
\                       \ the first shift at the start of this routine, as
\                       \ P = |A| >> 1 and C = bit 0 of A, so we now need to set
\                       \ up a loop to sift through the other 7 bits in P
\
\   LDA #0              \ Set A = 0 so we can start building the answer in A
\
\   LDX #7              \ Set up a counter in X to count the 7 bits remaining
\                       \ in P
\
\  .MUL4
\
\   BCC P%+4            \ If C (i.e. the next bit from P) is set, do the
\   ADC T1              \ addition for this bit of P:
\                       \
\                       \   A = A + T1 + C
\                       \     = A + T - 1 + 1
\                       \     = A + T
\
\   ROR A               \ As mentioned above, this ROR shifts A right and
\                       \ catches bit 0 in C - giving another digit for our
\                       \ result - and the next ROR sticks that bit into the
\                       \ left end of P while also extracting the next bit of P
\                       \ for the next addition
\
\   ROR P               \ Add the overspill from shifting A to the right onto
\                       \ the start of P, and shift P right to fetch the next
\                       \ bit for the calculation
\
\   DEX                 \ Decrement the loop counter
\
\   BNE MUL4            \ Loop back for the next bit until P has been rotated
\                       \ all the way
\
\   LSR A               \ Rotate (A P) once more to get the final result, as
\   ROR P               \ we only pushed 7 bits through the above process
\
\ You can read all about this algorithm in the Elite source code at:
\
\ https://www.bbcelite.com/deep_dives/shift-and-add_multiplication.html
\
\ and you can see it in situ in the Elite source code here:
\
\ https://www.bbcelite.com/cassette/main/subroutine/mult1.html
\
\ If we aren't worried about memory usage, then we can unroll the central loop
\ of the algorithm like this, to save a bit of time going around the loop:
\
\   BCC P%+4            \ Shift-and-add the first bit of P
\   ADC T1
\   ROR A
\   ROR P
\
\   BCC P%+4            \ Repeat for the second bit
\   ADC T1
\   ROR A
\   ROR P
\
\   BCC P%+4            \ Repeat for the third bit
\   ADC T1
\   ROR A
\   ROR P
\
\ and so on for all the bits of n. You can see this approach in the 6502 Second
\ Processor version of Elite, here:
\
\ https://www.bbcelite.com/6502sp/main/subroutine/mult1.html
\
\ Note that we still have to shift the result right by one place after the
\ unrolled loop (i.e. the LSR A and ROR P after the end of the loop).
\
\ Aviator takes this to the next level by hard-coding a specific value of T into
\ the code itself - let's refer to this fixed value of T as n, so our routine
\ will now calculate A * n / 256, for a fixed n.
\
\ Given this, let's look at the above unrolled code. If a bit of n is 0 above,
\ then the BCC P%+4 will skip the next instruction (ADC T), leaving just the
\ ROR A and ROR P instructions. Also, in this case, we know the C flag is clear,
\ as we took the BCC, so the ROR A is identical to LSR A.
\
\ We can therefore hard-code the value of n into the code by replacing each of
\ these unrolled blocks:
\
\   BCC P%+4
\   ADC T1
\   ROR A
\   ROR P
\
\ with either this, when that bit of n is 0:
\
\   LSR A
\   ROR P
\
\ or this, when that bit of n is 1:
\
\   ADC T1
\   ROR A
\   ROR P
\
\ We can also ditch the need to calculate T1 = T - 1 by adding in a CLC, like
\ this:
\
\   CLC
\   ADC T
\   ROR A
\   ROR P
\
\ Finally, we only need to keep the ROR P instructions if we need to keep the
\ overspill from the result, as we are no longer shifting P to see whether or
\ not to branch over each bit's addition. If we don't need the overspill, we
\ can replace the unrolled calculation with this, when that bit of n is 0:
\
\   LSR A
\
\ or this, when that bit of n is 1:
\
\   CLC
\   ADC T
\   ROR A
\
\ Putting this all together into a working example, the following code
\ calculates A = T * 68 / 256, using a value of n = 34 (%00100010). The factor
\ of 2 is because the following omits the final LSR A that normally appears
\ after the loop, for optimal performance.
\
\   LDA T               \ Set A = T
\
\   LSR A               \ Bit 0 of n is 0
\
\   CLC                 \ Bit 1 of n is 1
\   ADC T
\   ROR A
\
\   LSR A               \ Bit 2 of n is 0
\
\   LSR A               \ Bit 3 of n is 0
\
\   LSR A               \ Bit 4 of n is 0
\
\   CLC                 \ Bit 5 of n is 1
\   ADC T
\   ROR A
\
\   LSR A               \ Bit 6 of n is 0
\
\                       \ Bit 7 of n is 0 and the final right shift is missing
\
\ You can see this exact code in part 7 below.
\
\ The result is a streamlined multiplication algorithm that is tailored to the
\ specific requirements of the UpdateIndicator routine.
\
\ Arguments:
\
\   X                   Indicator number:
\
\                         * 0 = Compass
\
\                         * 1 = Airspeed indicator
\
\                         * 2 = Altimeter
\                               Small "hour" hand, whole dial = 10,000 feet
\
\                         * 3 = Altimeter
\                               Large "minute" hand, whole dial = 1,000 feet
\
\                         * 4 = Vertical speed indicator
\
\                         * 5 = Turn indicator
\                               Bottom part of the slip-and-turn indicator
\
\                         * 6 = Slip indicator
\                               Top part of the slip-and-turn indicator
\
\                         * 7 = Artificial horizon
\
\                         * 8 or 10 = Joystick position display
\
\                         * 9 = Rudder indicator
\
\                         * 11 = Thrust indicator
\
\ ******************************************************************************

.UpdateIndicator

 STX WW                 \ Set WW to the value in X, so we can refer to it later
                        \ if we overwrite the value in X

 CPX #0                 \ If X = 0, jump down to uind1 to update indicator 0
 BEQ uind1

 CPX #2                 \ If X < 2 (i.e. X = 1), jump down to uind2 to update
 BCC uind2              \ indicator 1

 BEQ uind4              \ If X = 2, jump down to uind4 to update indicator 2

 JMP uind7              \ X > 2, so jump down to uind7 to check for more values
                        \ of X

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 2 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the compass (indicator 0)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the compass heading from Compass and reduces it to the
\ range 0 to 73, before passing it to the DrawIndicatorHand to update the
\ on-screen compass.
\
\ ******************************************************************************

.uind1

                        \ If we get here then the indicator number in X is 0

 LDA Compass            \ Set T = Compass
 STA T

                        \ We now calculate A = T * n / 256 with a hardcoded n,
                        \ using unrolled shift-and-add multiplication

                        \ We don't need an LDA T instruction as A already
                        \ contains the same value as T

 LSR A                  \ Bit 0 of n is 0

 LSR A                  \ Bit 1 of n is 0

 CLC                    \ Bit 2 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 3 of n is 0

 LSR A                  \ Bit 4 of n is 0

 CLC                    \ Bit 5 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 6 of n is 0

                        \ Bit 7 of n is 0 and the final right shift is missing

                        \ So by now, A is in the range 0 to 73 - here's why:
                        \
                        \ From the above, n = %00100100 (36), so we just
                        \ calculated:
                        \
                        \   A = (T * n / 256) << 1
                        \     = (T * 36 / 256) << 1
                        \     = T * 72 / 256
                        \
                        \ which takes the compass heading in the range 0 to 255
                        \ and reduces it to the range 0 to 73

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 3 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the airspeed indicator (indicator 1)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the airspeed from (AirspeedHi AirspeedLo) and reduces it to
\ match the scale of the indicator, which is represented by a value of 9 (for
\ 50 mph) to 74 (for 400 mph). The airspeed value can be outside these limits,
\ but this shows the scale factor.
\
\ It then passes this value to the DrawIndicatorHand to update the on-screen
\ airspeed indicator.
\
\ ******************************************************************************

.uind2

                        \ If we get here then the indicator number in X is 1

 LDA AirspeedHi         \ If the high byte of the airspeed in AirspeedHi is
 BPL uind3              \ positive, jump down to uind3 to skip the following

 LDA #0                 \ The airspeed is negative, so set A to 0 and jump to
 JMP DrawIndicatorHand  \ DrawIndicatorHand to zero the indicator on-screen,
                        \ returning from the subroutine using a tail call

.uind3

 LDA AirspeedLo         \ Set A = (AirspeedHi AirspeedLo) * 2 / 256
 ASL A                  \
 LDA AirspeedHi
 ROL A

                        \ So by now, A matches the range of the airspeed
                        \ indicator - here's why:
                        \
                        \ The IndicatorBase for this indicator is 48 and the
                        \ IndicatorMin/Max range shown on the dial is 57 to 122,
                        \ which represents 50 to 400 mph (according to the game
                        \ manual)
                        \
                        \ So after this scaling, a result in A of 9 represents
                        \ 50 mph (as 48 + 9 = 57), and a result in A of 74
                        \ represents 400 mph (as 48 + 74 = 122), for example
                        \
                        \ These values correspond to the following 16-bit values
                        \ of (AirspeedHi AirspeedLo):
                        \
                        \   * If A = 9, then Airspeed = (00000100 10100000),
                        \     which is 1184, or 50 mph
                        \
                        \   * If A = 74, then Airspeed = (00100101 00000000),
                        \     which is 9472, or 400 mph
                        \
                        \ The plane can go faster or slower than in these
                        \ examples, but the dial only shows speeds between 50mph
                        \ and 400 mph, so higher or lower speeds will be clipped

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 4 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the altimeter's small "hour" hand (indicator 2)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the altitude from (AltitudeHi AltitudeLo) and reduces it to
\ the range 0 to 254, before passing it to the DrawIndicatorHand to update the
\ small hand of the on-screen altimeter.
\
\ It also sets AltitudeMinutes to the low byte of the altitude, reduced to the
\ range 0 to 104, so it can be used in part 5 to update the large hand of the
\ on-screen altimeter.
\
\ ******************************************************************************

.uind4

                        \ If we get here then the indicator number in X is 2

 LDA AltitudeLo         \ Set (A R) = (AltitudeHi AltitudeLo)
 STA R
 LDA AltitudeHi

 LSR A                  \ Set (S R) = (A R) / 4
 ROR R                  \           = (AltitudeHi AltitudeLo) / 4
 LSR A                  \           = altitude
 ROR R                  \
 STA S                  \ so (S R) is the altitude in feet, as the value stored
                        \ in (AltitudeHi AltitudeLo) is the actual altitude x 4

 LDA #0                 \ Set T = 0
 STA T

                        \ We now calculate A = R * n /256 with a hardcoded n,
                        \ using unrolled shift-and-add multiplication

 LDA R                  \ Set A = R

 LSR A                  \ Bit 0 of n is 0

 LSR A                  \ Bit 1 of n is 0

 CLC                    \ Bit 2 of n is 1
 ADC R
 ROR A

 LSR A                  \ Bit 3 of n is 0

 CLC                    \ Bit 4 of n is 1
 ADC R
 ROR A

 CLC                    \ Bit 5 of n is 1
 ADC R
 ROR A

 LSR A                  \ Bit 6 of n is 0

                        \ Bit 7 of n is 0 and the final right shift is missing

                        \ From the above, n = %000110100 (52), so we just
                        \ calculated:
                        \
                        \   A = (R * n / 256) << 1
                        \     = (R * 52 / 256) << 1
                        \     = R * 104 / 256
                        \
                        \ which is the low byte of the altitude in (S R),
                        \ reduced to a range of 0 to 104 to represent the whole
                        \ dial's range of 0 to 1,000 feet

 STA AltitudeMinutes    \ Store the result in AltitudeMinutes, so we can draw
                        \ the altimeter's minute hand in indicator 3

                        \ We now calculate A = S * n / 256 with a hardcoded n,
                        \ using unrolled shift-and-add multiplication and
                        \ keeping the overspill from the result

 LDA S                  \ Set A = S

 LSR A                  \ Bit 0 of n is 0
 ROR T

 LSR A                  \ Bit 1 of n is 0
 ROR T

 CLC                    \ Bit 2 of n is 1
 ADC S
 ROR A
 ROR T

 LSR A                  \ Bit 3 of n is 0
 ROR T

 CLC                    \ Bit 4 of n is 1
 ADC S
 ROR A
 ROR T

 CLC                    \ Bit 5 of n is 1
 ADC S
 ROR A
 ROR T

 LSR A                  \ Bit 6 of n is 0
 ROR T

                        \ Bit 7 of n is 0 and the final right shift is missing

                        \ From the above, n = %00110100 (52), so we just
                        \ calculated:
                        \
                        \   A = (S * n / 256) << 1
                        \     = (S * 52 / 256) << 1
                        \     = S * 104 / 256
                        \
                        \ and T contains the overspill from the result
                        
 STA U                  \ Set U = S * 104 / 256

 LDA T                  \ Set (U A) = (U AltitudeMinutes) + (0 T)
 CLC                    \
 ADC AltitudeMinutes    \ by adding the low bytes

 BCC uind5              \ And, if the addition overflowed, incrementing the high
 INC U                  \ byte in U

                        \ So we have just calculated:
                        \
                        \   (U A) = (U AltitudeMinutes) + (0 T)
                        \
                        \ and we already know that:
                        \
                        \   U = S * 104 / 256
                        \
                        \   AltitudeMinutes = R * 104 / 256
                        \
                        \ so plugging these into the above, we get:
                        \
                        \   (U A) = (U AltitudeMinutes) + (0 T)
                        \         = (S*104 R*104) / 256 + (0 T)
                        \         = (S R) * 104 / 256

.uind5

 LSR U                  \ Set (U A) = (U A) / 16
 ROR A                  \           = ((S R) * 104 / 256) / 16
 LSR U                  \           = (S R) * 6.5 / 256
 ROR A                  \
 LSR U
 ROR A
 LSR U
 ROR A
 
                        \ So by now, A is in the range 0 to 254 - here's why:
                        \
                        \ The maximum altitude that the altimeter can show is
                        \ 10,000 feet (after which it just wraps around), so the
                        \ final result of all these calculations is that the
                        \ altitude in (S R) has been reduced from a range of 0
                        \ to 10,000 to a range of 0 to 254 in (U A), as:
                        \
                        \   10000 * 6.5 / 256 = 254
                        \
                        \ and that value is in A alone, as (U A) < 255, so U = 0

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 5 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the altimeter's "minute" hand (indicator 3)
\
\ ******************************************************************************

.uind6

                        \ If we get here then the indicator number in X is 3

 LDA AltitudeMinutes    \ Fetch the value of the altimeter's minute hand that we
                        \ calculated in part 4

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 6 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Logic for checking which indicator to update
\
\ ******************************************************************************

.uind7

                        \ If we get here then X > 2

 CPX #4                 \ If X < 4 (i.e. X = 3), jump up to uind6 to update
 BCC uind6              \ indicator 3

 BEQ uind8              \ If X = 4, jump down to uind8 to update indicator 4

 JMP uind13             \ X > 4, so jump down to uind13 to check for more values
                        \ of X

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 7 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the vertical speed indicator (indicator 4)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the vertical speed from (VerticalSpeedHi VerticalSpeedLo)
\ and reduces it to the range -40 to +40, before passing it to the
\ DrawIndicatorHand to update the on-screen vertical speed indicator.
\
\ ******************************************************************************

.uind8

                        \ If we get here then the indicator number in X is 4

 LDA VerticalSpeedLo    \ Set (A T) = (VerticalSpeedHi VerticalSpeedLo)
 STA T                  \           = VerticalSpeed
 LDA VerticalSpeedHi

 BPL uind9              \ If the vertical speed is positive, jump down to uind9

 LDA #0                 \ The vertical speed is negative, so we make it positive
 SEC                    \ by calculating:
 SBC T                  \
 STA T                  \   (A T) = (0 0) - (A T)
                        \
                        \ starting with the low bytes

 LDA #0                 \ And then the high bytes
 SBC VerticalSpeedHi

.uind9

                        \ By this point, (A T) = |VerticalSpeed|

 LSR A                  \ Set (A T) = (A T) / 8
 ROR T                  \           = |VerticalSpeed| / 8
 LSR A
 ROR T
 LSR A
 ROR T

 CMP #0                 \ If A = 0, so (A T) = (0 T) = T, so jump to uind10 to
 BEQ uind10             \ skip the following as T contains the correct value of
                        \ |VerticalSpeed| / 8

 LDA #255               \ A is non-zero, which means that (A T) > 255, so set
 STA T                  \ T = 255 so that T has a maximum value of 255

.uind10

                        \ At this point, T contains |VerticalSpeed| / 8, capped
                        \ to a maximum value of 255

                        \ We now calculate A = T * n / 256 with a hardcoded n,
                        \ using unrolled shift-and-add multiplication

 LDA T                  \ Set A = T

 LSR A                  \ Bit 0 of n is 0

 CLC                    \ Bit 1 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 2 of n is 0

 LSR A                  \ Bit 3 of n is 0

 LSR A                  \ Bit 4 of n is 0

 CLC                    \ Bit 5 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 6 of n is 0

                        \ Bit 7 of n is 0 and the final right shift is missing

                        \ From the above, n = %00100010 (34), so we just
                        \ calculated:
                        \
                        \   A = (T * n / 256) << 1
                        \     = (T * 34 / 256) << 1
                        \     = T * 68 / 256
                        \
                        \ which takes |VerticalSpeed| / 8 in the range 0 to 255
                        \ and reduces it to the range 0 to 68

 CMP #40                \ If A < 40, jump to uind11 to skip the following
 BCC uind11             \ instruction

 LDA #40                \ Set A = 40, so A has a maximum of 40 and is now in the
                        \ range 0 to 40

.uind11

 BIT VerticalSpeedHi    \ If the high byte in VerticalSpeedHi is positive (and
 BPL uind12             \ therefore so is the vertical speed), jump to uind12 to
                        \ skip the following

 STA T                  \ Negate the value in A by calculating:
 LDA #0                 \
 SEC                    \   A = 0 - A
 SBC T

                        \ So by now, A is in the range -40 to +40
                        \
                        \ In terms of the original value of VerticalSpeed, this
                        \ means that:
                        \
                        \   VerticalSpeed / 8 * (68 / 256) = A
                        \
                        \ so:
                        \
                        \   VerticalSpeed = A * (256 / 68) * 8
                        \                 = A * 2048 / 68
                        \
                        \ If A is 40 then this shows as a vertical speed of
                        \ 4000 feet per minute on the indicator, so if v is the
                        \ vertical speed in feet per minute, A = v / 100, and:
                        \
                        \   VerticalSpeed = A * 2048 / 68
                        \                 = (v / 100) * 2048 / 68
                        \                 = v * 2048 / 6800
                        \                 = v * 128 / 425
                        \
                        \ so VerticalSpeed is stored as 128 / 425 * the vertical
                        \ speed in feet per minute

.uind12

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 8 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Logic for checking which indicator to update
\
\ ******************************************************************************

.uind13

                        \ If we get here then X > 4

 CPX #6                 \ If X < 6 (i.e. X = 5), jump down to uind14 to update
 BCC uind14             \ indicator 5

 BEQ uind19             \ If X = 6, jump down to uind19 to update indicator 6

 JMP uind23             \ X > 6, so jump down to uind23 to check for more values
                        \ of X

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 9 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the turn indicator (indicator 5), the bottom part
\             of the slip-and-turn indicator
\
\ ------------------------------------------------------------------------------
\
\ This section takes the turn rate from (TurnHi TurnLo) and reduces it to the
\ range -19 to +19, before passing it to the DrawIndicatorHand to update the
\ bottom part of the on-screen slip-and-turn indicator.
\
\ ******************************************************************************

.uind14

                        \ If we get here then the indicator number in X is 5

 LDA TurnLo             \ Set (A T) = (TurnHi TurnLo)
 STA T                  \           = Turn
 LDA TurnHi

 BPL uind15             \ If the turn rate is positive, jump down to uind9

 LDA #0                 \ The turn rate is negative, so we make it positive
 SEC                    \ by calculating:
 SBC T                  \
 STA T                  \   (A T) = (0 0) - (A T)
                        \
                        \ starting with the low bytes

 LDA #0                 \ And then the high bytes
 SBC TurnHi

.uind15

                        \ By this point, (A T) = |Turn|

 BNE uind16             \ If the high byte in A is non-zero, this means that
                        \ (A T) > 255, so skip the following three instructions
                        \ to set A to the maximum value of 140

 LDA T                  \ A is 0, so set A = T, so A now contains the correct
                        \ value of |Turn|

 CMP #140               \ If T < 140, jump to uind17 to skip the following two
 BCC uind17             \ instructions

.uind16

 LDA #140               \ Set T = 140, so T is always a maximum value of 140
 STA T

.uind17

                        \ At this point, T contains |Turn|, capped to a maximum
                        \ value of 140

                        \ We now calculate A = T * n / 256 with a hardcoded n,
                        \ using unrolled shift-and-add multiplication

                        \ We don't need an LDA T instruction as A already
                        \ contains the same value as T

 LSR A                  \ Bit 0 of n is 0

 CLC                    \ Bit 1 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 2 of n is 0

 LSR A                  \ Bit 3 of n is 0

 CLC                    \ Bit 4 of n is 1
 ADC T
 ROR A

 LSR A                  \ Bit 5 of n is 0

 LSR A                  \ Bit 6 of n is 0

                        \ Bit 7 of n is 0 and the final right shift is missing

                        \ From the above, n = %00010010 (18), so we just
                        \ calculated:
                        \
                        \   A = (T * n / 256) << 1
                        \     = (T * 18 / 256) << 1
                        \     = T * 36 / 256
                        \
                        \ which takes |Turn| in the range 0 to 140 and reduces
                        \ it to the range 0 to 19

 BIT TurnHi             \ If the high byte in TurnHi is negative (and therefore
 BMI uind18             \ so is the turn rate), jump to uind18 to skip the
                        \ following

 STA T                  \ Negate the value in A by calculating:
 LDA #0                 \
 SEC                    \   A = 0 - A
 SBC T

.uind18

                        \ So by now, A is in the range -19 to +19
                        \
                        \ The maximum turn rate shown on the indicator is
                        \ 4 x 180 degrees per minute, which is shown when
                        \ T = 140, so Turn is stored as around 35 * the turn
                        \ rate, as 140 / 4 = 35

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 10 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the slip indicator (indicator 6), the top part of
\             the slip-and-turn indicator
\
\ ******************************************************************************

.uind19

                        \ If we get here then the indicator number in X is 6

 LDA Slip               \ Set A = Slip

 JMP DrawIndicatorHand  \ Apply min and max limits to the value in A and update
                        \ the indicator on-screen, returning from the subroutine
                        \ using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 11 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the artificial horizon (indicator 7)
\
\ ------------------------------------------------------------------------------
\
\ Calculations for the artificial horizon's line vector are all performed in
\ the ArtificialHorizon routine, which calculates the starting coordinates and
\ deltas for the vector line. This routine simply takes those results, sets the
\ direction bits for the line, and moves the starting point so the line is
\ centred on the artificial horizon indicator.
\
\ ******************************************************************************

.uind20

                        \ If we get here then the indicator number in X is 7

 LDY #0                 \ Set Y = 0, to use as an argument to ArtificialHorizon

 STY K                  \ Set K = 0, to use as an argument to ArtificialHorizon

 STY R                  \ Set R = 0, to use as the first guess for the direction
                        \ of the horizon line (we will change it below if
                        \ required)

 JSR ArtificialHorizon  \ Call ArtificialHorizon with K = 0, Y = 0 to calculate
                        \ the x-coordinate of the line's starting point in A

 CLC                    \ Clear the C flag (this appears to have no effect)

 STA S                  \ Set H = S, so this sets the x-coordinate of the line's
                        \ starting point

 LDY #3                 \ Set Y = 3

 JSR ArtificialHorizon  \ Call ArtificialHorizon with K = 0, Y = 3 to calculate
                        \ the y-coordinate of the line's starting point in A

 STA H                  \ Set H = A, so this sets the y-coordinate of the line's
                        \ starting point

 LDY #0                 \ Set Y = 0, to use as an argument to ArtificialHorizon

 LDA #1                 \ Set K = 1, to use as an argument to ArtificialHorizon
 STA K

 JSR ArtificialHorizon  \ Call ArtificialHorizon with K = 1, Y = 0 to calculate
                        \ the x-delta of the line

 SEC                    \ Set A = A - S
 SBC S                  \       = A - x-coordinate of start

 BPL uind21             \ If A is positive, the sign of the x-delta is correct,
                        \ so jump to uind21

 STA T                  \ The returned x-delta is negative, so store it in T so
                        \ we can negate it below

 LDA #%10000000         \ Set bit 7 of R to indicate that the x-delta for the
 STA R                  \ line is negative and the y-delta is positive

 LDA #0                 \ Set A = 0 - T
 SEC                    \
 SBC T                  \ so the x-delta in A is now positive

.uind21

 CLC                    \ Set W = A + 1
 ADC #1                 \
 STA W                  \ so this sets the line's x-delta, making sure the line
                        \ is at least one pixel wide

 LDY #3                 \ Set Y = 3, to use as an argument to ArtificialHorizon

 JSR ArtificialHorizon  \ Call ArtificialHorizon with K = 1, Y = 3 to calculate
                        \ the y-delta of the line

 SEC                    \ Set A = A - H
 SBC H                  \       = A - y-coordinate of start

 BPL uind22             \ If A is positive, the sign of the y-delta is correct,
                        \ so jump to uind22

 STA T                  \ The returned y-delta is negative, so store it in T so
                        \ we can negate it below

 LDA #%01000000         \ Set bit 6 of R to indicate that the y-delta is
 ORA R                  \ negative, making sure to leave bit 7 as it is
 STA R

 LDA #0                 \ Set A = A - T
 SEC                    \
 SBC T                  \ so the y-delta in A is now positive

.uind22

 CLC                    \ Set G = A + 1
 ADC #1                 \
 STA G                  \ so this sets the line's y-delta, making sure the line
                        \ is at least 1 pixel tall

 LDA S                  \ Set S = S + 53
 CLC                    \
 ADC #53                \ so the start x-coordinate is moved to be relative to
 STA S                  \ the centre of the artificial horizon indicator, which
                        \ is at (53, 160 + 29)

 LDA H                  \ Set H = H - 29
 CLC                    \
 ADC #227               \ so the start y-coordinate is moved to be relative to
 STA H                  \ the centre of the artificial horizon indicator, which
                        \ is at (53, 160 + 29)

 JMP DrawIndicatorLine  \ Draw the new artificial horizon, returning from the
                        \ subroutine using a tail call

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 12 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Logic for checking which indicator to update
\
\ ******************************************************************************

.uind23

                        \ If we get here then X > 6

 CPX #7                 \ If X = 7, jump up to uind20 to update indicator 7
 BEQ uind20

 CPX #9                 \ If X < 9 (i.e. X = 8), jump down to uind25 to update
 BCC uind25             \ indicator 8

 BEQ uind24             \ If X = 9, jump down to uind24 to update indicator 9

 CPX #11                \ If X < 11 (i.e. X = 10), jump down to uind25 to update
 BCC uind25             \ indicator 10

 BEQ uind26             \ If X = 11, jump down to uind26 to update indicator 11

                        \ If we get here then X > 11, which should not happen,
                        \ but if it does, we simply do nothing

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 13 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the rudder indicator (indicator 9)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the rudder position from Rudder and reduces it to the
\ range -8 to +8, before passing it to DrawIndicatorBar to update the rudder
\ indicator.
\
\ ******************************************************************************

.uind24

                        \ If we get here then the indicator number in X is 9

 LDX #1                 \ Set X = 1 so the current value of the indicator gets
                        \ stored in JoyYC+1 in DrawIndicatorBar

 LDA #128               \ Set S = 128, to denote that when we fall through into
 STA S                  \ DrawIndicatorBar below, JC is the y-coordinate, so
                        \ we draw the indicator's vertical bar from point
                        \ (H + W, JC)

 LDA #80                \ Set W = 80 to use as the centre y-coordinate for the
 STA W                  \ rudder indicator (i.e. the centre bar)

 LDA Rudder             \ Set A = Rudder

 SEC                    \ Set the C flag so the following call to ScaleSigned
                        \ divides the rudder value by 16

 JSR ScaleSigned        \ Scale the value in A down by a factor of 16, retaining
                        \ the sign and being sensitive to small values

 STA H                  \ Store the scaled value in H, which has now been
                        \ reduced from the range -128 to 127 down to -8 to +8,
                        \ to use as the x-coordinate offset from the centre of
                        \ the indicator in DrawIndicatorBar

 LDY #163               \ Set Y = 163 to use as the y-coordinate of the top of
                        \ the vertical bar

 LDA #11                \ Set A = 11 to set the height of the vertical bar at 11
                        \ pixels

 BNE DrawIndicatorBar   \ Jump to DrawIndicatorBar to update indicator 9 by
                        \ drawing a vertical bar of height 11 pixels with
                        \ the top at (80 + H, 163)

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 14 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the joystick position display (indicator 8 or 10)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the joystick position from Aileron and Elevator and reduces
\ it to -8 to +8 (for the x-position in Aileron) and to -32 to +32 (for the
\ y-position in Elevator), before passing it to the DrawJoystickCross to
\ update the cross in the joystick position display. The x-position is reduced
\ more because the joystick position display is taller than it is wide.
\
\ Note that this indicator has two IDs, 8 and 10, so that it gets updated twice
\ as often by UpdateDashboard.
\
\ ******************************************************************************

.uind25

                        \ If we get here then the indicator number in X is 8 or
                        \ 10

 LDA #128               \ Redraw the existing cross on the joystick position
 JSR DrawJoystickCross  \ display using EOR logic, which removes it

 LDA #%00100010         \ Redraw the joystick position display's x-axis, in case
 STA Row24_Block18_7    \ the old cross was overwriting the axis
 STA Row24_Block21_7
 LDA #%01000100
 STA Row24_Block19_7

 LDA #%10011001         \ Redraw the joystick position display's y-axis, in case
 STA Row24_Block20_7    \ the old cross was overwriting the axis
 LDA #%10001000
 STA Row21_Block20_7
 STA Row22_Block20_7
 STA Row23_Block20_7
 STA Row25_Block20_7
 STA Row26_Block20_7
 STA Row27_Block20_7

 LDA Aileron            \ Set A = Aileron, the x-position of the joystick

 SEC                    \ Set the C flag so the following call to ScaleSigned
                        \ divides the joystick x-position by 16 

 JSR ScaleSigned        \ Scale the value in A down by a factor of 16, retaining
                        \ the sign and being sensitive to small values
 
 STA JoyXC              \ Store the scaled value of A in JoyXC, so we can pass
                        \ it to DrawJoystickCross below to draw the new cross,
                        \ but also so we can erase this cross when we need to
                        \ update the indicator in the future

 LDA Elevator           \ Set A = Elevator, the y-position of the joystick

 CLC                    \ Clear the C flag so the following call to ScaleSigned
                        \ divides the joystick y-position by 4

 JSR ScaleSigned        \ Scale the value in A down by a factor of 4, retaining
                        \ the sign and being sensitive to small values

 EOR #&FF               \ Set A = -A using two's complement
 CLC                    \
 ADC #1                 \ This flips the sign of the y-position, because the
                        \ joystick value will be high when we pull up, but this
                        \ corresponds to moving the stick down, which should be
                        \ shown lower down the indicator

 STA JoyYC              \ Store the scaled value of A in JoyYC, so we can pass
                        \ it to DrawJoystickCross below to draw the new cross,
                        \ but also so we can erase this cross when we need to
                        \ update the indicator in the future

 LDA #0                 \ Draw a new cross on the joystick position display
 JSR DrawJoystickCross

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 15 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculations for the thrust indicator (indicator 11)
\
\ ------------------------------------------------------------------------------
\
\ This section takes the thrust from (ThrustHi ThrustLo) and reduces it to the
\ range 0 to 60, before falling througn into DrawIndicatorBar to update the
\ rudder indicator.
\
\ ******************************************************************************

.uind26

                        \ If we get here then the indicator number in X is 11

 LDA #128               \ Set S = 128, to denote that when we fall through into
 STA S                  \ DrawIndicatorBar below, JC is the y-coordinate, so
                        \ we draw the indicator's vertical bar from point
                        \ (H + W, JC)

 LDA #125               \ Set W = 125 to use as the centre y-coordinate for the
 STA W                  \ thrust indicator (i.e. the left end of the bar, as we
                        \ are only showing positive thrust values)

 LDA ThrustHi           \ Set (R A) = (ThrustHi ThrustLo)
 STA R                  \           = Thrust
 LDA ThrustLo

 LDX #3                 \ Set X = 3 to act as a shift counter in the following
                        \ loop, where we right shift (R A) four times

.uind27

 LSR R                  \ Set (R A) = (R A) / 2
 ROR A                  \           = Thrust / 2

 DEX                    \ Decrement the shift counter

 BPL uind27             \ Loop back until we have shifted right by 4 places, so
                        \ we now have:
                        \
                        \   (R A) = (R A) / 8
                        \         = Thrust / 8
                        \
                        \ We now ignore the high byte in R, so presumably it is
                        \ zero

 STA R                  \ Set A = A + A / 2
 LSR A                  \       = 1.5 * A
 ADC R                  \       = 1.5 * (Thrust / 8), rounded up
                        \       = Thrust * 3 / 16

 LSR A                  \ Set A = A / 4
 LSR A                  \       = Thrust * 3 / 64

 STA H                  \ Store the scaled value in H, which has now been
                        \ reduced from the range 0 to 1280 down to 0 to 60,
                        \ to use as the x-coordinate offset from the left end of
                        \ the indicator in DrawIndicatorBar

 LDX #3                 \ Set X = 3 so the current value of the indicator gets
                        \ stored in JoyYC+3 in DrawIndicatorBar

 LDY #243               \ Set Y = 243 to use as the y-coordinate of the top of
                        \ the vertical bar

 LDA #7                 \ Set A = 7 to set the height of the vertical bar at 7
                        \ pixels

                        \ Fall through into DrawIndicatorBar to update indicator
                        \ 11 by drawing a vertical bar of height 7 pixels with
                        \ the top at (125 + H, 243)

\ ******************************************************************************
\
\       Name: DrawIndicatorBar
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Draw a vertical bar on indicator 9 (rudder) or 11 (thrust)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The height of the vertical bar in pixels
\
\   S                   Defines the starting coordinate for the line:
\
\                         * 0 = (JC, H + W)
\
\                         * 128 = (H + W, JC)
\
\                       As all the vertical bar indicators are horizontal in
\                       Aviator, only the second option is used
\
\   X                   The offset from JoyYC where we store the indicator
\                       value, so it can be erased when the bar needs to move:
\
\                         * 1 = rudder indicator (indicator 9)
\
\                         * 3 = thrust indicator (indicator 11)
\
\   W                   The x-coordinate of the centre point of the indicator
\
\   Y                   The y-coordinate of the top of the bar
\
\ ******************************************************************************

.DrawIndicatorBar

 STA U                  \ Set U = A, so the line is A pixels tall

 LDA #1                 \ Set T = 1, so the line is 1 pixel wide
 STA T

 STY JC                 \ Set JC = Y, the y-coordinate of the top of the bar

 LDA JoyYC,X            \ Set G = the X-th byte of JoyYC, which contains the
 STA G                  \ x-coordinate of the current bar, so we can erase it

 LDA H                  \ Store H in the X-th byte of JoyYC, so the next time we
 STA JoyYC,X            \ call this routine, we can use this to erase the bar
                        \ we are about to draw

 JSR EraseOrthoLine     \ Erase the current vertical bar at x-coordinate G

 LDA #0                 \ Set N = 0 to switch the drawing mode to OR logic, so
 STA N                  \ the bar gets drawn on-screen

 JSR DrawOrthoLine      \ Draw a new vertical bar at x-coordinate H

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawIndicatorHand
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Apply min and max limits to an indicator value and draw a hand
\             on the indicator
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The value to show on the indicator
\
\   X                   The indicator number (0-6)
\
\ ******************************************************************************

.DrawIndicatorHand

                        \ When we get here, the values of A are set as follows:
                        \
                        \   * X = 0: Compass                A =   0 to  73
                        \   * X = 1: Airspeed               A =   9 to  74
                        \   * X = 2: Altimeter small hand   A =   0 to 254
                        \   * X = 3: Altimeter large hand   A =   0 to 104
                        \   * X = 4: Vertical speed         A = -40 to  40
                        \   * X = 5: Turn                   A = -19 to  19
                        \   * X = 6: Slip                   A =  ?? to  ??

 CLC                    \ Set A = A + the X-th byte of IndicatorBase
 ADC IndicatorBase,X    \
                        \ This adds the relevant indicator's base value from the
                        \ IndicatorBase table to give the following:
                        \
                        \   * Compass                 +0    A =  0 to  73
                        \   * Airspeed               +48    A = 57 to 122
                        \   * Altimeter small hand    +0    A =  0 to 254
                        \   * Altimeter large hand    +0    A =  0 to 104
                        \   * Vertical speed         +67    A = 27 to 107
                        \   * Turn                   +53    A = 34 to  72
                        \   * Slip                  +106    A = ?? to  ??

 CMP IndicatorMin,X     \ If A >= the X-th byte of IndicatorMin, jump to dinh1
 BCS dinh1              \ to skip the following

 LDA IndicatorMin,X     \ Set A to the X-th byte of IndicatorMin, so A is at
                        \ least the relevant value in IndicatorMin

 BCC dinh2              \ Jump to dinh2 to skip the following, as we don't need
                        \ to check the maximum limit (this BCC is effectively a
                        \ JMP as we passed through the BCS above)

.dinh1

                        \ If we get here then A >= the X-th byte of IndicatorMin

 CMP IndicatorMax,X     \ If A >= the X-th byte of IndicatorMax, jump to dinh2
 BCC dinh2              \ to skip the following

 LDA IndicatorMax,X     \ Set A to the X-th byte of IndicatorMax, so A is no
                        \ more than the relevant value in IndicatorMax

.dinh2

                        \ A is now clipped to this indicator's range as given in
                        \ the IndicatorMin and IndicatorMax tables, so the final
                        \ ranges are:
                        \
                        \   * Compass                       A =  0 to  73
                        \   * Airspeed                      A = 57 to 122
                        \   * Altimeter small hand          A =  0 to 254
                        \   * Altimeter large hand          A =  0 to 104
                        \   * Vertical speed                A = 30 to 104
                        \   * Turn                          A = 33 to  72
                        \   * Slip                          A = 91 to 120

 STA H                  \ Store the clipped indicator value in H

 JSR DialHandVector     \ Calculate the vector for drawing the new dial hand
                        \ with value A, returning the result in W, G and R

                        \ Fall through into DrawIndicatorLine to draw the new
                        \ hand on the indicator

\ ******************************************************************************
\
\       Name: DrawIndicatorLine
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Draw a line on indicators 0 to 7, i.e. a dial hand (0-6) or an
\             artificial horizon (7)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   S                   Start point x-coordinate (artificial horizon only)
\
\   H                   Start point y-coordinate (artificial horizon only)
\
\   W                   Magnitude of x-coordinate of line's vector |x-delta|
\
\   G                   Magnitude of y-coordinate of line's vector |y-delta|
\
\   R                   Direction of vector (T, U):
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                       Direction is like a clock, so positive is up and right
\
\   X                   The indicator number (0-7)
\
\   WW                  The indicator number (0-7)
\
\ ******************************************************************************

.DrawIndicatorLine

 LDA IndicatorLineI,X   \ Set I = x-coordinate of the starting point of the
 STA I                  \ current line

 LDA IndicatorLineJ,X   \ Set J = y-coordinate of the starting point of the
 STA J                  \ current line

 LDA IndicatorLineT,X   \ Set T = x-delta of the current line
 STA T

 LDA IndicatorLineU,X   \ Set U = y-delta of the current line
 STA U

 LDA IndicatorLineV,X   \ Set V = direction of the current line
 STA V

 LDA #128               \ Set N = 128 so the call to DrawVectorLine erases the
 STA N                  \ current line

 JSR DrawVectorLine     \ Erase a line from (I, J) as a vector (T, U) with
                        \ direction V

 LDX WW                 \ If this is not indicator 7, jump to dinl2
 CPX #7
 BNE dinl2

                        \ If we get here then this is the artificial horizon
                        \ (indicator 7)

 LDA #%11111111         \ Set A to the pixel byte for four white pixels, to use
                        \ for the bottom row of pixels in the centre block of
                        \ the artificial horizon's centre line

 LDY #2                 \ We want to redraw the three pixel rows in the centre
                        \ block of the artificial horizon's centre line, which
                        \ from bottom to top contain 3 pixels, 1 pixel and 1
                        \ pixel, so so set a counter in Y for 3 bytes

.dinl1

 STA Row23_Block13_2,Y  \ Redraw the Y-th pixel row in the centre block

 LDA #%01000100         \ The top two pixel rows of the centre block contain the
                        \ vertical mark at the centre of the indicator, so set A
                        \ to the appropriate single-pixel byte

 DEY                    \ Decrement the counter to move up to the next pixel row

 BPL dinl1              \ Loop back until we have redrawn all three pixel rows
                        \ in the centre block

 LDA #%00110011         \ Redraw the two-pixels at the left end of the
 STA Row23_Block12_4    \ artificial horizon's centre line

 LDA #%10001000         \ Redraw the single pixel at the right end of the
 STA Row23_Block14_4    \ artificial horizon's centre line

 LDA S                  \ Fetch the x-coordinate of the the starting point of
                        \ the new line from S

 STA I                  \ Set I = the x-coordinate of the starting point of the
                        \ new line to draw

 STA IndicatorLineI,X   \ Store the x-coordinate in IndicatorLineI, so we can
                        \ use it to erase the line later

 LDA H                  \ Set A = the y-coordinate of the starting point of the
                        \ new line to draw

 STA IndicatorLineJ,X   \ Store the y-coordinate in IndicatorLineJ, so we can
                        \ use it to erase the line later

 BNE dinl3              \ Jump to dinl3 to draw the new line (this BNE is
                        \ effectively a JMP as A is never zero)

.dinl2

                        \ If we get here then this is indicator 0-6, so it's a
                        \ hand-based dial

 LDA IndicatorLineI,X   \ Set I = x-coordinate of starting point of hand, which
 STA I                  \ is a fixed value for hand-based dials

 LDA IndicatorLineJ,X   \ Set J = y-coordinate of starting point of hand, which
                        \ is a fixed value for hand-based dials

.dinl3

 STA J                  \ Store A in J as the y-coordinate of the starting
                        \ point of the new line to draw

 LDA W                  \ Fetch the x-delta of the new line from W

 STA T                  \ Set T = the x-delta of the new line

 STA IndicatorLineT,X   \ Store the x-delta in IndicatorLineT, so we can use it
                        \ to erase the line later

 LDA G                  \ Fetch the y-delta of the new line from G

 STA U                  \ Set U = the y-delta of the new line

 STA IndicatorLineU,X   \ Store the y-delta in IndicatorLineU, so we can use it
                        \ to erase the line later

 LDA R                  \ Fetch the direction of the new line from R

 STA V                  \ Set V = the direction of the new line

 STA IndicatorLineV,X   \ Store the direction in IndicatorLineV, so we can use
                        \ it to erase the line later

 LDA #0                 \ Set N = 0 so the call to DrawVectorLine draws the new
 STA N                  \ line

 JSR DrawVectorLine     \ Draw a line from (I, J) as a vector (T, U) with
                        \ direction V

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawJoystickCross
\       Type: Subroutine
\   Category: 
\    Summary: Draw a cross in the joystick position display (indicator 8 or 10)
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

 LDA JoyXC              \ Set JC = JoyXC + 79
 CLC                    \
 ADC #79                \ to get the x-coordinate of the left end of the
 STA JC                 \ horizontal line at 79 + x

 LDA #216               \ Set W = 216, the y-coordinate of the centre point, so
 STA W                  \ we draw the line from a y-coordinate of 216 + y

 LDA #0                 \ Set S = 0, to denote that JC is the x-coordinate, so
 STA S                  \ we draw the line from point (JC, H + W)

 LDA #3                 \ Set T = 3, so we draw a horizontal 3-pixel line
 STA T

 LDA #1                 \ Set U = 1, so the line is 1 pixel high
 STA U

 JSR DrawOrthoLine      \ Draw the horizontal part of the cross, starting from
                        \ (79 + x, 216 + y) and drawing to the right for three
                        \ pixels

                        \ Now we draw the 5-pixel vertical line down from
                        \ (80 + x, 214 + y)

 LDA JoyXC              \ Set H = JoyXC
 STA H

 LDA JoyYC              \ Set JC = JoyYC + 214
 CLC                    \
 ADC #214               \ to get the y-coordinate of the top end of the vertical
 STA JC                 \ line at 214 + y

 LDA #80                \ Set W = 80, the x-coordinate of the centre point, so
 STA W                  \ we draw the line from an x-coordinate of 80 + x

 LDA #128               \ Set S = 128, to denote that JC is the y-coordinate,
 STA S                  \ so we draw the line from point (H + W, JC)

 LDA #1                 \ Set T = 1, so the line is 1 pixel wide
 STA T

 LDA #5                 \ Set U = 5, so we draw a vertical 5-pixel line
 STA U

 JSR DrawOrthoLine      \ Draw the vertical part of the cross, starting from
                        \ (80 + x, 214 + y) and drawing down for five pixels

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DialHandVector
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Vector line calculation for a hand on indicators 0 to 6
\
\ ------------------------------------------------------------------------------
\
\ This routine performs a calculation to work out the vector for a dial
\ indicator hand, given a value to show on the dial. It calculates this using a
\ simple triangle model - there's no trigonometry here.
\
\ First, we work out which quadrant of the dial we want to draw the hand in, and
\ set the direction in R accordingly. We do this by repeatedly subtracting the
\ range of a single quadrant from the value to show, counting quadrants as we
\ go, until we go past zero, at which point we now which quadrant we the dial
\ hand is in.
\
\ Then we work out the vector from the centre point of the dial to the end of
\ the hand, using a simple triangle. Imagine the possible positions of the end
\ of the dial hand as a vertical diamond shape, like this:
\
\                         ^                         ^
\                       .´ `.                       |`. (x, y)
\                     .´     `.  r                  |  /.
\                   .´         `.                   | /  `.
\                 .´             `.                 |/     `.
\                <        +        >                +--------> 
\                 `.             .´          (0, 0)     w
\                   `.         .´
\                     `.     .´
\                       `. .´
\                         v
\
\ It doesn't necessarily look like it in in ASCII, but imagine that the diamond
\ is a rotated square, so all the angles are right angles.
\
\ If the end of our hand is always on the outside of the diamond shape above,
\ then if we consider the top-right quadrant, the equation of the edge line is
\ is y = - x + w. So as the hand goes from pointing straight up to pointing to
\ the right (12 o'clock to 3 o'clock), x goes from 0 to w, y goes from w to 3,
\ and y = x - w. For the next quadrant down, 3 to 6 o'clock, we can negate y to
\ get y = -(x - w) = w - x, and we can do a similar sign switch for the other
\ two quadrants.
\
\ So, given an x-coordinate for our hand, we can work out the y-coordinate using
\ y = x - w or y = w - x, depending on the quadrant. Ans because we chose to set
\ the origin at the centre of the dial, the x and y-coordinates are effectively
\ x and y-deltas, which is what we want to generate for use in the vector line
\ routine at DrawVectorLine.
\
\ If we then cap the values of x and y, this has the effect of "blunting" the
\ corners of the diamond, like this:
\
\                     _______
\                   .´       `.
\                  |           |
\                  |     +     |
\                  |           |
\                   `._______.´
\
\ It turns out that this kind of movement for the end of a dial hand is pretty
\ good, even though it isn't describing anything like a perfect circle.
\
\ Arguments:
\
\   A                   The value to show as a hand on the dial indicator
\
\ Returns:
\
\   W                   Magnitude of x-coordinate of line's vector |x-delta|
\
\   G                   Magnitude of y-coordinate of line's vector |y-delta|
\
\   R                   Direction of vector (T, U):
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                       Direction is like a clock, so positive is up and right,
\                       so this means the following:
\
\                         * x-delta +ve, y-delta +ve: 12 to 3 o'clock
\
\                         * x-delta +ve, y-delta -ve: 3 to 6 o'clock
\
\                         * x-delta -ve, y-delta -ve: 6 to 9 o'clock
\
\                         * x-delta -ve, y-delta +ve: 9 to 12 o'clock
\
\ ******************************************************************************

.DialHandVector

 LDY #0                 \ Set R = 0, to use as the first guess for the direction
 STY R                  \ of the hand on the dial (we will change it below if
                        \ required)

 LDY DialQuadrant,X     \ Set Y = the DialQuadrant value for this indicator,
                        \ which is the size of a quarter of the dial in terms of
                        \ the value in A

 INY                    \ Set K = Y + 1
 STY K                  \       = DialQuadrant + 1
                        \
                        \ Doing this enables us to subtract this value below,
                        \ leaving the result in a suitable state for negating
                        \ using two's complement (see dhvc2)

 SEC                    \ Set the C flag for the subtraction we are about to do

.dhvc1

 SBC K                  \ Set A = A - K
                        \       = A - (DialQuadrant + 1)
                        \
                        \ so we have subtracted a quadrant's worth of value from
                        \ the value we want to show in A

 BCS dhvc2              \ If the subtraction didn't underflow, jump to dhvc2 to
                        \ skip the following two instructions

                        \ The subtraction underflowed, so we know that the hand
                        \ is in the first quadrant, i.e 3 to 6 o'clock

 ADC K                  \ Reverse the subtraction by adding K to A, so A is now
                        \ back to its original value

 JMP dhvc6              \ Jump down to dhvc5 to calculate the hand's vector,
                        \ with R set to 0 to indicate that both the x-delta and
                        \ y-delta for the line are positive

.dhvc2

 SBC DialQuadrant,X     \ Subtract a second quadrant's worth, so:
                        \
                        \   A = A - (DialQuadrant + 1) - DialQuadrant
                        \     = A - 2 * DialQuadrant - 1
                        \
                        \ If we want to negate this value below, then we can do
                        \ this using two's complement by simply inverting all
                        \ the bits, as we have already subtracted 1, and we can
                        \ negate by either inverting-and-adding-1, or by
                        \ subtracting-1-and-inverting (as they are equivelent)

 BCS dhvc3              \ If the subtraction didn't underflow, jump to dhvc3 to
                        \ skip the following three instructions

                        \ The subtraction underflowed, so we know that the hand
                        \ is in the second quadrant, i.e 6 to 9 o'clock

 LDY #%01000000         \ Set bit 6 of R to indicate that the x-delta for the
 STY R                  \ line is positive and the y-delta is negative

 BNE dhvc5              \ Jump down to dhvc5 to negate A before calculating the
                        \ hand's vector (this BNE is effectively a JMP as A is
                        \ never zero)

.dhvc3

 SBC K                  \ Subtract a third quadrant's worth

 BCS dhvc4              \ If the subtraction didn't underflow, jump to dhvc4 to
                        \ skip the following four instructions

                        \ The subtraction underflowed, so we know that the hand
                        \ is in the third quadrant on the dial

 ADC K                  \ Reverse the subtraction by adding K to A, so A is now
                        \ back to its original value

 LDY #%11000000         \ Set bits 7 and 6 of R to indicate that both the
 STY R                  \ x-delta and y-delta for the line are negative

 BNE dhvc6              \ Jump down to dhvc5 to calculate the hand's vector
                        \ (this BNE is effectively a JMP as A is never zero)

.dhvc4

 SBC DialQuadrant,X     \ Subtract a fourth quadrant's worth

 BCS dhvc1              \ If the subtraction didn't underflow, jump to dhvc1 to
                        \ start the subtraction process again, as we have now
                        \ subtracted a whole dial's worth and need to keep going

                        \ The subtraction underflowed, so we know that the hand
                        \ is in the fourth quadrant on the dial

 LDY #%10000000         \ Set bit 7 of R to indicate that the x-delta for the
 STY R                  \ line is negative and the y-delta is positive

.dhvc5

                        \ If we get here then the hand is either in the second
                        \ or fourth quadrant on the dial

 EOR #&FF               \ Invert the value of A (i.e. negate it) using two's
                        \ complement, which works because we can negate a number
                        \ by subtracting 1 and then inverting, and we
                        \ effectively subtracted 1 in the above by using K

.dhvc6

                        \ By the time we get here, the direction of the new
                        \ dial hand is in R, the value of A has been reduced
                        \ into negative territory by repeated subtraction, and
                        \ it has been switched to be positive if the quadrant is
                        \ bottom-right or top-left, i.e. 3 to 6 o'clock or
                        \ 9 to 12 o'clock)
                        \
                        \ We now use this value of A as our value of x in the
                        \ above calculation

 STA S                  \ Store the reduced value of A in S

                        \ We now calculate y-delta, where y = w - x or y = x - w
                        \ depending on the quadrant. We already set the sign of
                        \ x correctly with the above EOR, so if we calculate
                        \ y = w - x, it will be correct

 LDA DialQuadrant,X     \ Set A = the DialQuadrant value for this indicator,
                        \ which is the size of a quarter of the dial in terms of
                        \ the value in A. This is what we use for w in the above

 SEC                    \ Set A = A - S
 SBC S                  \       = w - x
                        \
                        \ so A contains our y-delta

                        \ We now cap the y-delta, which has the effect of
                        \ blunting the points of our diamond
                        
 CMP YDeltaMax,X        \ If A < YDeltaMax for this indicator, jump to dhvc7 to
 BCC dhvc7              \ skip the following instruction

 LDA YDeltaMax,X        \ Set A = YDeltaMax, so A is never greater than the
                        \ YDeltaMax value for this indicator

.dhvc7

 CLC                    \ Set G = A + 1
 ADC #1                 \       = y-delta + 1
 STA G                  \
                        \ so G contains the y-delta, plus 1 to ensure it is
                        \ non-zero

 LDA S                  \ Fetch the reduced value of A that we stored in S we
                        \ above, which we know is our x-delta

 CLC                    \ Set A = (A + 1) / 2
 ADC #1                 \
 LSR A                  \ because mode 5 pixels are twice as wide as they are
                        \ high, so this scales the x-delta to be a pixel value

 CMP XDeltaMax,X        \ If A < XDeltaMax for this indicator, jump to dhvc8 to
 BCC dhvc8              \ skip the following instruction

 LDA XDeltaMax,X        \ Set A = XDeltaMax, so A is never greater than the
                        \ XDeltaMax value for this indicator

.dhvc8

 CLC                    \ Set W = A + 1
 ADC #1                 \       = x-delta + 1
 STA W                  \
                        \ so W contains the y-delta, plus 1 to ensure it is
                        \ non-zero

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawVectorLine (Part 1 of 3)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Draw a line: set up pixel bytes and slope variables
\
\ ------------------------------------------------------------------------------
\
\ Draw/erase a line from (I, J) as a vector (T, U) with direction V.
\
\ This routine uses Bresenham's algorithm to draw the line, by working along the
\ longer axis of the line vector, one pixel at a time, plotting a pixel after
\ each step. All the while we keep a cumulative tally of fractional pixel counts
\ along the shorter axis (known as the "slope error"), and move one pixel along
\ the shorter axis when the tally reaches a multiple of the axis length.
\
\ Arguments:
\
\   I                   Start point x-coordinate
\
\   J                   Start point y-coordinate, relative to the bottom of the
\                       canopy/top of the dashboard. Specifically:
\
\                        * J = 0 to 151 are all within the bounds of the canopy
\
\                        * The bottom pixel inside the canopy is 0, while the
\                          top pixel just below the top canopy edge is 151
\
\                        * J = -1 to -96 are all on the dashboard
\
\                        * The white horizontal edge at the bottom of the
\                          canopy/top of the dashboard is -1
\
\                        * The bottom row of pixels on-screen is -96
\
\   N                   Drawing mode:
\
\                         * Bit 7 clear = draw
\
\                         * Bit 7 set = erase
\
\   T                   Magnitude of x-coordinate of line's vector |x-delta|
\                       Horizontal width/length of line when V = 0
\
\   U                   Magnitude of y-coordinate of line's vector |y-delta|
\                       Vertical width/length of line when V = 0
\
\   V                   Direction of vector (T, U):
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                       Direction is like a clock, so positive is up and right
\
\ ******************************************************************************

.DrawVectorLine

 LDY #3                 \ Set Y = 3 to use as a byte counter in the following
                        \ loop, so it writes four bytes

 LDA #%00010001         \ Set A = %00010001, the pixel pattern for pixel 0 in
                        \ white

.dlin1

 STA RR,Y               \ Set the Y-th byte of RR to A

 ASL A                  \ Set A = A * 2

 DEY                    \ Decrement the byte counter

 BPL dlin1              \ Loop back until we have updated RR to RR+3 as
                        \ follows:
                        \
                        \   RR   = %10001000 = pixel 3 in white
                        \   RR+1 = %01000100 = pixel 2 in white
                        \   RR+2 = %00100010 = pixel 1 in white
                        \   RR+3 = %00010001 = pixel 0 in white

 LDA #0                 \ Set QQ = 0
 STA QQ

 STA PP                 \ Set PP = 0

 LDA T                  \ If T < U, jump down to dlin2 to skip the following
 CMP U                  \ two instructions
 BCC dlin2

                        \ If we get here then T >= U, so the line is a shallow
                        \ horizontal slope

 STA VV                 \ Set VV = T, the length of the longer axis

 BCS dlin11             \ Jump down to dlin11 to start drawing the line (this
                        \ BCS is effectively a JMP as we just passed through a
                        \ BCC)

.dlin2

                        \ If we get here then T < U, so the line is a steep
                        \ vertical slope

 LDA U                  \ Set VV = U, the length of the longer axis
 STA VV

 STA PP                 \ Set PP = U

 BCC dlin11             \ Jump down to dlin11 to start drawing the line (this
                        \ BCC is effectively a JMP as we got here by taking a
                        \ BCC)

\ ******************************************************************************
\
\       Name: DrawVectorLine (Part 2 of 3)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Calculate the coordinates of the next pixel as we step along the
\             line by one pixel
\
\ ******************************************************************************

.dlin3

                        \ If we get here then we need to step along the x-axis

 LDA QQ                 \ Set A = QQ + U
 CLC                    \
 ADC U                  \ so A contains the cumulative step along the y-axis
                        \ (the shorter axis)

 CMP T                  \ If A < T, then we haven't yet reached a full step of
 BCC dlin5              \ length T along the y-axis, so we don't change the
                        \ y-coordinate and instead jump to dlin5 to do the step
                        \ along the x-axis by one pixel

                        \ We now need to step along the y-axis by one pixel as
                        \ the cumulative step has just crossed over into a new
                        \ multiple of T

 SBC T                  \ Set A = A - T
                        \
                        \ so we keep the cumulative step within the bounds of a
                        \ single byte (as we are only interested in when it
                        \ crosses the boundary into a new multiple of T)

                        \ We now move one pixel along the y-axis in the
                        \ direction given in V

 BIT V                  \ If bit 6 of V is clear, jump to dlin4 to step along
 BVC dlin4              \ the y-axis in a positive direction

 DEC J                  \ Bit 6 of V is set, so decrement the y-coordinate in
                        \ J so we move along the y-axis in a negative dirction

 BVS dlin5              \ Jump to dlin5 to do the step along the x-axis by one
                        \ pixel (this BVS is effectively a JMP as we know the V
                        \ flag is set)

.dlin4

 INC J                  \ Bit 6 of V is clear, so increment the y-coordinate in
                        \ J so we move along the y-axis in a positive direction

.dlin5

 STA QQ                 \ Store the updated fractional value in QQ

                        \ We now move one pixel along the x-axis in the
                        \ direction given in V

 BIT V                  \ If bit 7 of V is clear, jump to dlin6 to step along
 BPL dlin6              \ the x-axis in a positive direction

 DEC I                  \ Bit 7 of V is set, so decrement the x-coordinate in
                        \ I so we move along the x-axis in a negative dirction

 JMP dlin11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dlin11 to plot the next pixel

.dlin6

 INC I                  \ Bit 7 of V is clear, so increment the x-coordinate in
                        \ I so we move along the x-axis in a positive direction

 JMP dlin11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dlin11 to plot the next pixel

.dlin7

                        \ We jump here when we need to calculate the coordinates
                        \ of the next pixel in the line when stepping along the
                        \ longer delta axis one pixel at a time

 LDA PP                 \ If PP = 0 then this is a shallow horizontal line, so
 BEQ dlin3              \ jump up to dlin3 step along the x-axis

                        \ If we get here then this is a steep vertical line, so
                        \ we need to step along the y-axis

 LDA QQ                 \ Set A = QQ + T
 CLC                    \
 ADC T                  \ so A contains the cumulative step along the x-axis
                        \ (the shorter axis)

 CMP U                  \ If A < U, then we haven't yet reached a full step of
 BCC dlin9              \ length U along the x-axis, so we don't change the
                        \ x-coordinate and instead jump to dlin9 to do the step
                        \ along the y-axis by one pixel

                        \ We now need to step along the x-axis by one pixel as
                        \ the cumulative step has just crossed over into a new
                        \ multiple of U

 SBC U                  \ Set A = A - U
                        \
                        \ so we keep the cumulative step within the bounds of a
                        \ single byte (as we are only interested in when it
                        \ crosses the boundary into a new multiple of U)

                        \ We now move one pixel along the x-axis in the
                        \ direction given in V

 BIT V                  \ If bit 7 of V is clear, jump to dlin8 to step along
 BPL dlin8              \ the x-axis in a positive direction

 DEC I                  \ Bit 7 of V is set, so decrement the x-coordinate in
                        \ I so we move along the x-axis in a negative dirction

 JMP dlin9              \ Jump to dlin9 to do the step along the y-axis by one
                        \ pixel

.dlin8

 INC I                  \ Bit 7 of V is clear, so increment the x-coordinate in
                        \ I so we move along the x-axis in a positive direction

.dlin9

 STA QQ                 \ Store the updated fractional value in QQ

                        \ We now move one pixel along the y-axis in the
                        \ direction given in V

 BIT V                  \ If bit 6 of V is clear, jump to dlin10 to step along
 BVC dlin10             \ the y-axis in a positive direction

 DEC J                  \ Bit 6 of V is set, so decrement the y-coordinate in
                        \ J so we move along the y-axis in a negative dirction

 BVS dlin11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dlin11 to plot the next pixel (this BVS
                        \ is effectively a JMP as we know the V flag is set)

.dlin10

 INC J                  \ Bit 6 of V is clear, so increment the y-coordinate in
                        \ J so we move along the y-axis in a positive direction

                        \ Now that we have moved (I, J) to the next pixel in the
                        \ line, we fall through into part 3 to plot that pixel

\ ******************************************************************************
\
\       Name: DrawVectorLine (Part 3 of 3)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Plot a pixel at (I, J)
\
\ ******************************************************************************

.dlin11

                        \ When we first arrive here:
                        \
                        \   * QQ = 0, where we will tally up the fractional part
                        \          of the move along the shortest axis
                        \   * RR = pixel byte table
                        \   * VV = longest side of delta triangle
                        \   * PP = 0 (shallow horizontal)
                        \          VV (steep vertical)
                        \
                        \ so we now draw a line from (I, J), moving one pixel
                        \ at a time along the longest side of the delta triangle

 LDA I                  \ Set X = I / 4
 LSR A                  \
 LSR A                  \ so X is the number of the character block containing
 TAX                    \ pixel (I, J), as each character block is 4 pixels wide

 LDA J                  \ Set Y = J / 8
 LSR A                  \
 LSR A                  \ so Y is the number of the character row containing
 LSR A                  \ pixel (I, J), as each character row is 8 pixels high
 TAY

 LDA YLookupLo,Y        \ Set P = Y-th byte of YLookupLo
 CLC                    \         + X-th byte of XLookupLo
 ADC XLookupLo,X        \       = LO(screen address) + LO(X * 8)
 STA P

 LDA YLookupHi,Y        \ Set P+1 = Y-th byte of YLookupHi
 ADC XLookupHi,X        \           + X-th byte of XLookupHi
 STA P+1                \         = HI(screen address) + HI(X * 8)

                        \ So P(1 0) is the screen address of the pixel row
                        \ containing (I, J), out by 8 bytes for each row above
                        \ or below the top of the dashboard

 LDA #159               \ Set Y = 159 - J
 SEC                    \
 SBC J                  \ so Y is the number of pixels that (I, J) is above
 TAY                    \ (+ve) or below (-ve) the top of the dashboard, where a
                        \ value of 0 is the bottom pixel inside the canopy, and
                        \ a value of -1 is the white horizontal edge at the
                        \ bottom of the canopy

 LDA I                  \ Set X = bits 0 and 1 of I
 AND #%00000011         \       = I mod 4
 TAX                    \       = pixel number within the 4-pixel byte

 BIT N                  \ If bit 7 of N is set, jump to dlin12 to erase the line
 BMI dlin12             \ with EOR logic instead of drawing it with OR logic

 LDA RR,X               \ Fetch the X-th byte of RR, which is a pixel byte with
                        \ the X-th pixel set to white

 ORA (P),Y              \ OR it with P(1 0) + Y, which is the screen address of
                        \ the pixel row containing (I, J)
                        \
                        \ This will keep all pixels the same except the X-th
                        \ pixel, which is set to white, so this will plot a
                        \ pixel at (I, J) when stored in screen memory

 JMP dlin13             \ Jump to dlin13 to skip the following three
                        \ instructions

.dlin12

 LDA RR,X               \ Fetch the X-th byte of RR, which is a pixel byte with
                        \ the X-th pixel set to white

 EOR #%11111111         \ Invert all the bits, so A is now a pixel byte that is
                        \ all white except for the X-th pixel, which is black

 AND (P),Y              \ AND it with P(1 0) + Y, which is the screen address of
                        \ pixel (I, J)
                        \
                        \ This will keep all pixels the same except the X-th
                        \ pixel, which is set to black, so this will erase the
                        \ pixel at (I, J) when stored in screen memory

.dlin13

 STA (P),Y              \ Store the byte in A in sceen memory at P(1 0) + Y,
                        \ which sets all four pixels to the pixel pattern in A,
                        \ which either draws or erases the pixel at (I, J)

 DEC VV                 \ Decrement VV to step one pixel along the longer axis

 BNE dlin7              \ If VV is non-zero, jump up to dlin7 to calculate the
                        \ coordinate of the next pixel in the line

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ArtificialHorizon
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Vector line calculation for the artificial horizon on indicator 7
\
\ ------------------------------------------------------------------------------
\
\ L423B, L423D, L423E, L423F are only used to provide signs in bit 0:
\   Negative if bit 0 is set, positive if clear
\
\ L427B, L427E provide values for T calculations
\ L427D, L427F provide values for U calculations
\
\ Y = 0, K = 0:
\   T = (L423B L427B) / 4
\   U = -(L423D L427D) / 4
\   Return (T + U) / 8 with the sign bits retained = x-coord of start
\
\ Y = 0, K = 1:
\   T = -(L423B L427B) / 4
\   U = -(L423D L427D) / 4
\   Return (T + U) / 8 with the sign bits retained = y-coord of start
\
\ Y = 3, K = 0:
\   T = (L423E L427E) / 4
\   U = -(L423F L427F) / 4
\   Return (T + U) / 8 with the sign bits retained = x-delta
\
\ Y = 3, K = 1:
\   T = -(L423E L427E) / 4
\   U = -(L423F L427F) / 4
\   Return (T + U) / 8 with the sign bits retained = y-delta
\
\ The line is returned relative to the origin (0, 0), so that's as if the centre
\ of the artificial horizon indicator were at (0, 0). This means that the deltas
\ that are calculated are the equivalent to the end point of the line. The line
\ itself gets moved to the location of the on-screen indicator in part 11 of
\ UpdateIndicator.
\
\ Arguments:
\
\   K                   The axis to calculate:
\
\                         * 0 = x-axis
\
\                         * 1 = y-axis
\
\   Y                   The value to calculate:
\
\                         * 0 = coordinate of starting point
\
\                         * 3 = deltas (i.e. coordinates of end point)
\
\ Returns:
\
\   A                   Depending on the values of K and Y:
\
\                         * K = 0, Y = 0: returns the x-coordinate of the
\                                         artificial horizon's starting point
\
\                         * K = 0, Y = 3: returns the y-coordinate of the
\                                         artificial horizon's starting point
\
\                         * K = 1, Y = 0: returns the x-delta of the artificial
\                                         horizon
\
\                         * K = 1, Y = 3: returns the y-delta of the artificial
\                                         horizon
\
\ ******************************************************************************

.ArtificialHorizon

 LDA L427B,Y            \ Set A = L427B (Y = 0) or L427E (Y = 3)

 LSR A                  \ Set A = A / 4
 LSR A

 CPY #0                 \ If Y = 3, halve A again, so A = A / 8
 BNE arhi1
 LSR A

.arhi1

 STA T                  \ Set T = A, so T = A / 4 or A / 8

 LDA L423B,Y            \ Set A = L423B (Y = 0) or L423E (Y = 3)

 EOR K                  \ If K = 1, flip bit 0 of A

 AND #1                 \ If bit 0 of A is zero, jump to arhi2 to skip the
 BEQ arhi2              \ following

 LDA #0                 \ Set T = 0 - T
 SEC
 SBC T
 STA T

.arhi2

 LDA L427D,Y            \ Set A = L427D (Y = 0) or L427F (Y = 3)

 LSR A                  \ Set A = A / 4
 LSR A

 CPY #0                 \ If Y = 3, halve A again, so A = A / 8
 BNE arhi3
 LSR A

.arhi3

 STA U                  \ Set U = A, so U = A / 4 or A / 8

 LDA L423D,Y            \ Set A = L423D (Y = 0) or L423F (Y = 3)

 CPY #0                 \ If Y = 0, flip bit 0 of A
 BNE arhi4
 EOR #1

.arhi4

 AND #1                 \ If bit 0 of A is zero, jump to arhi5 to skip the
 BEQ arhi5              \ following

 LDA #0                 \ Set U = 0 - U
 SEC
 SBC U
 STA U

.arhi5

 CLC                    \ A = T + U
 LDA T
 ADC U

 BMI arhi6

 LSR A                  \ A = A / 8
 LSR A
 LSR A

 ADC #0                 \ Round up the A/8 division

 RTS                    \ Return from the subroutine

.arhi6

 SEC                    \ A = A / 8 + with bits 5-7 set
 ROR A
 SEC
 ROR A
 SEC
 ROR A

 ADC #0                 \ Round up the A / 8 division

 RTS                    \ Return from the subroutine

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
\                         * 0 = (JC, H + W)
\
\                         * 128 = (H + W, JC)
\
\   H + W               Coordinate of the start of the line (it doesn't matter
\                       how this value is split between H and W as only the sum
\                       is used)
\
\   JC                  Coordinate of the start of the line
\
\   T                   Horizontal width/length of line
\
\   U                   Vertical width/length of line
\
\   N                   Drawing mode:
\
\                         * 0 = Draw (using OR logic)
\
\                         * 128 = Erase (using EOR logic)
\
\ Other entry points:
\
\   EraseOrthoLine      Use the value of G instead of H (so the coordinate is
\                       G + W) and always use EOR Logic to draw the line (which
\                       will erase it if it is already on-screen)
\
\ ******************************************************************************

.DrawOrthoLine

 LDA H                  \ Set A = H

 JMP dort1              \ Jump to dort1 to draw the orthogonal line and skip the
                        \ code for the EraseOrthoLine entry point

.EraseOrthoLine

 LDA #128               \ Set N = 128 so the line is drawn with EOR logic, which
 STA N                  \ erases the line if it is already on-screen

 LDA G                  \ Set A = G

.dort1

 CLC                    \ Set A = A + W
 ADC W

 BIT S                  \ If bit 7 of S is set, jump down to dort2
 BMI dort2

 STA J                  \ Set J = A

 LDA JC                 \ Set I = JC
 STA I

                        \ We now have (I, J) = (JC, A + W)

 JMP dort3              \ Jump down to dort3

.dort2

 STA I                  \ Set I = A

 LDA JC                 \ Set J = JC
 STA J

                        \ We now have (I, J) = (A + W, JC)

.dort3

 LDA #0                 \ Set V = 0 so the line is drawn in a positive direction
 STA V                  \ for both axes

 JSR DrawVectorLine     \ Draw/erase a line from (I, J) as a vector (T, U) with
                        \ direction V

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScaleSigned
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Scale an indicator value by 4 or 16, retaining the sign and adding
\             sensitivity for smaller values
\
\ ------------------------------------------------------------------------------
\
\ This routine is used to scale the values for the following indicators:
\
\   * The joystick position display (indicator 8 or 10), where the x-coordinate
\     is scaled by 16 and the y-coordinate by 4, as the display is taller than
\     it is wide
\
\   * Rudder (indicator 9), which is divided by 16
\
\ When scaling down by a factor of 16, some smaller values scale to 1 instead of
\ 0 (specifically, 4 to 7), and in all cases the final scaling is rounded up, so
\ this routine shows small deviations on the rudder and joystick indicators that
\ otherwise wouldn't register.
\
\ Arguments:
\
\   A                   The value to scale
\
\   C flag              Determines the scale factor:
\
\                         * C flag set = divide A by 16
\
\                         * C flag clear = divide A by 4
\
\ ******************************************************************************

.ScaleSigned

 PHP                    \ Store the flags on the stack, so we can check later
                        \ what their values were on entry

 BPL scsi1              \ If A is positive, jump to scsi1 to skip the following
                        \ three instructions

 EOR #&FF               \ Set A = -A using two's complement, so A is positive
 CLC
 ADC #1

.scsi1

                        \ By this point, A = |A|

 LSR A                  \ Set A = |A| / 2

 PLP                    \ Restore the flags from the stack, leaving them on the
 PHP                    \ stack for later

 BCC scsi3              \ If the C flag is clear, jump to scsi3 so we only
                        \ divide the original value by 4

                        \ If we get here then the C flag was set on entry, so we
                        \ want to divide A by 16 using four shifts in total

 LSR A                  \ Set A = A / 2
                        \       = |A| / 4

 CMP #1                 \ If A <> 1, skip the following instruction
 BNE scsi2

 LDA #2                 \ A = 1 (so the original |A| was in the range 4 to 7),
                        \ so set A = 2, which will give us an end result of 1
                        \
                        \ In other words, this scales smaller values to 1 that
                        \ would otherwise scale to 0, like this:
                        \
                        \   * 0 to 3 scale down to 0
                        \   * 4 to 23 scale down to 1
                        \   * 24 to 39 scale down to 2
                        \   * 40 to 55 scale down to 3
                        \
                        \ and so on

.scsi2

 LSR A                  \ Set A = A / 2
                        \       = |A| / 8

.scsi3

 LSR A                  \ Set A = A / 2
                        \
                        \ so this is:
                        \
                        \   * |A| / 16 if the C flag was set on entry
                        \   * |A| / 4  if the C flag was clear on entry

 ADC #0                 \ Increment A if the value of A before the LSR was odd
                        \ (so the result of the last division gets rounded up)
                        \
                        \ This works because the LSR will set the C flag if bit
                        \ 0 of A was set before the shift, so A gets bumped up
                        \ by 1 by the ADC

 PLP                    \ Restore the flags from the stack

 BPL scsi4              \ If the N flag is clear, then the result already has
                        \ the correct sign (positive), so jump to scsi4 to
                        \ return from the subroutine

 EOR #&FF               \ Set A = -A using two's complement, so A is now
 CLC                    \ negative and the sign matches the original value of A
 ADC #1                 \ on entry into the subroutine

.scsi4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateDashboard
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update two indicators on the dashboard, one from 0-6, one from
\             7-11, cycling through them with each subsequent call
\
\ ------------------------------------------------------------------------------
\
\ Each call to this routine updates two indicators, one from the range 0 to 6,
\ and the other from 7 to 11, with subsequent calls working their way through
\ the ranges in order (so the first call updates indicators 0 and 7, the second
\ call updates indicators 1 and 8, and so on). When we reach the end of a range,
\ we wrap round to the start again.
\
\ Note that the joystick position display has two numbers, 8 and 10, so it gets
\ updated at twice the rate of the other indicators.
\
\ Also, because the first group covers seven indicators (0 to 6) and the second
\ group covers five (7 to 11), the indicators in the second group are updated
\ more frequently than those in the first group.
\
\ Other entry points:
\
\   UpdateDash7To11     Update the next indicator in the range 7 to 11
\
\ ******************************************************************************

.UpdateDashboard

 LDX Indicator0To6      \ Increment the indicator number to point to the next
 INX                    \ indicator within the range 0 to 6

 CPX #7                 \ If X < 7, skip the following instruction
 BCC udas1

 LDX #0                 \ Set X = 0, so X steps through the range 0 to 6 with
                        \ each subsequent call to UpdateDashboard

.udas1

 STX Indicator0To6      \ Store the updated indicator number

 JSR UpdateIndicator    \ Update indicator X (0 to 6)

.UpdateDash7To11

 LDX Indicator7To11     \ Increment the indicator number to point to the next
 INX                    \ indicator within the range 7 to 11

 CPX #11                \ If X < 11, skip the following instruction
 BCC udas2

 LDX #7                 \ Set X = 7, so X steps through the range 7 to 11 with
                        \ each subsequent call to UpdateDashboard

.udas2

 STX Indicator7To11     \ Store the updated indicator number

 JSR UpdateIndicator    \ Update indicator X (7 to 11)

 LDA #%01110111         \ Redraw the small horizontal line in the centre of the
 STA Row28_Block26_5    \ slip-and-turn indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ApplyFlightKeys (Part 1 of 4)
\       Type: Subroutine
\   Category: Flight
\    Summary: Apply any axis control key presses to the current axis values
\
\ ******************************************************************************

.ApplyFlightKeys

 LDX #2                 \ We start with the aileron, rudder and elevator key
                        \ pairs, whose values are stored in these key logger
                        \ offsets in KeyLoggerLow and KeyLoggerHigh:
                        \
                        \   * 2 = aileron
                        \   * 1 = rudder
                        \   * 0 = elevator
                        \
                        \ So we set a counter in X to count down through these
                        \ index values, from 2 to 1 to 0

.fkey1

 CLC                    \ Clear the C flag for the addition below

 LDA KeyLoggerLow,X     \ Fetch the low value for this key pair, which will be 1
                        \ if a key is being pressed, or 0 if no key is pressed

 BEQ fkey4              \ If A = 0 then neither key in this key pair is being
                        \ pressed, so jump down to fkey4

 ADC AxisKeyUsage,X     \ Add the low value to the corresponding variable for
 STA AxisKeyUsage,X     \ this key pair in AxisKeyUsage, so we increment the
                        \ value every time a key from this pair is used

 LDA KeyLoggerHigh,X    \ Fetch the high value for this key pair, which will be
                        \ +1 or -1 if a key is being pressed, or 0 if no key is
                        \ pressed

 STA P                  \ Store the value in P so we can check its sign below

 ADC Elevator,X         \ Set A = A + one of the following axis values:
                        \
                        \   * Aileron if this is the aileron key pair
                        \   * Rudder if this is the rudder key pair
                        \   * Elevator if this is the elevator key pair
                        \
                        \ so the relevant value is increased or decreased by 1
                        \ according to the key press

 LDY AxisChangeRate,X   \ If this key pair's AxisChangeRate value is already
 BEQ fkey2              \ zero, skip the following instruction

 DEC AxisChangeRate,X   \ Decrement this key pair's AxisChangeRate value

.fkey2

 BNE fkey3              \ If this key pair's AxisChangeRate value is non-zero,
                        \ skip the following

                        \ If we get here, then this key pair's AxisChangeRate
                        \ value has been reduced down to zero by repeated calls
                        \ to ApplyFlightKeys with the key being held down, so
                        \ the relavant control is now fully engaged and we bump
                        \ up the rate of change by another 3 in the relevant
                        \ direction

 CLC                    \ Set A = A + 3
 ADC #3

 BIT P                  \ If P is positive (so we are increasing the relevant
 BPL fkey3              \ axis value), skip the following instruction

 ADC #250               \ P is negative (so we are decreasing the relevant
                        \ axis value), so set A = A - 6, giving a net change of
                        \ setting A = A - 3

.fkey3

 TAY                    \ If the adjusted axis value is positive, jump down to
 BPL fkey5              \ fkey5 to check the maximum allowed value

                        \ If we get here then the adjusted axis value is
                        \ negative, so now we check against the minimum allowed
                        \ value

 CMP #140               \ If A >= -116, the value is within limits, so jump to
 BCS fkey6              \ fkey6 to store it

 LDA #140               \ Set A = -116 as the minimum allowed value for the axis
 BNE fkey6              \ value and jump to fkey6 to store it

.fkey4

                        \ If we get here then neither key was pressed from this
                        \ key pair

 LDA #6                 \ Set the AxisChangeRate value for this key pair to 6,
 STA AxisChangeRate,X   \ so the rate of change goes back to 1 until we fully
                        \ engage the control once again

 BNE fkey7              \ Jump down to fkey7 to move on to the next key pair
                        \ (this BNE is effectively a JMP as A is never zero)

.fkey5

                        \ If we get here then the adjusted axis value is
                        \ positive, so now we check against the maximum allowed
                        \ value

 CMP #119               \ If A < 119, the value is within limits, so jump to
 BCC fkey6              \ fkey6 to store it

 LDA #118               \ Set A = 118 as the maximum allowed value for the axis
                        \ value

.fkey6

 STA Elevator,X         \ Store the adjusted axis value in the relevant axis
                        \ variable:
                        \
                        \   * Aileron if this is the aileron key pair
                        \   * Rudder if this is the rudder key pair
                        \   * Elevator if this is the elevator key pair

.fkey7

 DEX                    \ Decrement the key pair index

 BPL fkey1              \ Loop back to process the next key pair until we have
                        \ done all three axes of movement (aileron roll, rudder
                        \ yaw and elevator pitch)

 JSR ReadJoystick       \ Read the joystick axes and fire button and update the
                        \ aileron, elevator and fire key values accordingly

\ ******************************************************************************
\
\       Name: ApplyFlightKeys (Part 2 of 4)
\       Type: Subroutine
\   Category: Flight
\    Summary: Apply any throttle key presses to the current thrust value
\
\ ******************************************************************************

                        \ Now we process the thrust keys

 CLC                    \ Clear the C flag for the addition below

 LDA KeyLoggerLow+3     \ Fetch the low value for the throttle key

 BEQ fkey11             \ If A = 0 then neither key in this key pair is being
                        \ pressed, so jump down to fkey11 to skip the throttle
                        \ calculations below

                        \ We now want to add the key logger value to the current
                        \ thrust value, which we do like this:
                        \
                        \   (Y X) = (KeyLoggerHigh+3 KeyLoggerLow+3)
                        \           +  (ThrustHi ThrustLo)

 ADC ThrustLo           \ We start by adding the low bytes
 TAX


 LDA KeyLoggerHigh+3    \ And then add the high bytes, so now (Y X) contains the
 ADC ThrustHi           \ updated thrust value
 TAY

 BMI fkey8              \ If the result is negative, jump to fkey8 to set both X
                        \ and Y to zero, so the minimum thrust value is zero

 CPY #5                 \ If the high byte in Y < 5, then the result is within
 BCC fkey10             \ bounds, so jump to fkey10 to store the new thrust
                        \ value

 LDY #5                 \ Set Y = 5 and jump to fkey9 to set X to 0, so the
 BNE fkey9              \ maximum thrust value is (5 0), or 1280 (this BNE is
                        \ effectively a JMP, as Y is never zero)

.fkey8

 LDY #0                 \ If we get here then the new thrust in (Y X) turned out
                        \ to be negative, so we set Y = 0 and then X = 0 to zero
                        \ the thrust

.fkey9

 LDX #0                 \ Zero the low byte of the new thrust as we are either at
                        \ the maxiumum value of (5 0) or the minimum value of
                        \ (0 0)

.fkey10

 STX ThrustLo           \ Store the thrust value in (ThrustHi ThrustLo) to the
 STY ThrustHi           \ updated thrust value in (Y X)

 LDX #11                \ Update the thrust indicator
 JSR UpdateIndicator

\ ******************************************************************************
\
\       Name: ApplyFlightKeys (Part 3 of 4)
\       Type: Subroutine
\   Category: Flight
\    Summary: Process the undercarriage, brake, flaps and fire keys
\
\ ******************************************************************************

.fkey11

 LDX #4                 \ Apply the undercarriage or brake keys, if pressed
 JSR ApplyUFBSKeys

 BEQ fkey13             \ If neither are being pressed, jump to fkey13 to check
                        \ for the next set of key presses

 BMI fkey12             \ If the brake key is being pressed, then the returned
                        \ value is 128, so jump to fkey12

 JSR IndicatorU         \ The undercarriage key is being pressed, so update the
                        \ undercarriage indicator

 JMP fkey13             \ Jump to fkey13 to check for the next set of key
                        \ presses

.fkey12

 JSR IndicatorB         \ The brake key is being pressed, so update the brakes
                        \ indicator

.fkey13

 LDX #5                 \ Apply the flaps or fire keys, if pressed
 JSR ApplyUFBSKeys

 BEQ fkey15             \ If neither are being pressed, jump to fkey15 to check
                        \ for the next set of key presses


 BMI fkey14             \ If the fire key is being pressed, then the returned
                        \ value is 128, so jump to fkey14

 JSR IndicatorF         \ The flaps key is being pressed, so update the flaps
                        \ indicator

 JMP fkey15             \ Jump to fkey15 to check for the next set of key
                        \ presses

.fkey14

 JSR FireGuns           \ The fire key is being pressed, so call FireGuns

\ ******************************************************************************
\
\       Name: ApplyFlightKeys (Part 4 of 4)
\       Type: Subroutine
\   Category: Flight
\    Summary: 
\
\ ******************************************************************************

.fkey15

 LDY #2

.fkey16

 STY L0CC4

 JSR L1862

 LDY L0CC4

 DEY

 BPL fkey16

 LDA #0
 STA L0CCB
 STA L0CC4

 JSR L1AFC

 JSR L5000

 JSR UpdateDashboard    \ Update the next two indicators in the ranges 0 to 6
                        \ and 7 to 11

 JSR UpdateDash7To11    \ Update the next indicator in the range 7 to 11

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ApplyUFBSKeys
\       Type: Subroutine
\   Category: 
\    Summary: Apply the undercarriage, brakes, flaps and fire keys
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The offset within the key logger for the keys to check:
\
\                         * 4 = U or B (undercarriage, brakes)
\
\                         * 5 = F or SHIFT (flaps, fire)
\
\ Returns:
\
\   A                   Returns the status of the relevant key presses:
\
\                         * 0 = neither key in the pair is being pressed, or a
\                             key is still being held down from a previous call
\                             to the routine, when it was already processed
\
\                         * 1 = U or F (undercarriage, flaps) is being pressed
\
\                         * 128 = B or SHIFT (brakes, fire) is being pressed
\
\ ******************************************************************************

.ApplyUFBSKeys

 LDA KeyLoggerLow,X     \ Fetch the low value for this key pair

 BNE ufbs2              \ If A is non-zero then a key from this key pair is
                        \ being pressed, so jump down to ufbs2 to process the
                        \ key press

 STA PressingUFBS-4,X   \ Zero the relevant value in PressingUFBS (for U) or
                        \ PressingUFBS+1 (for F) to indicate that the first key
                        \ from this pair is not being held down

 STA PressingUFBS-4+3,X \ Zero the relevant value in PressingUFBS+3 (for B) or
                        \ PressingUFBS+4 (for SHIFT) to indicate that the second
                        \ key from this pair is not being held down

.ufbs1

 LDA #0                 \ Set A = 0 as the return value

 RTS                    \ Return from the subroutine

.ufbs2

 TAY                    \ Copy the low value into Y, so we have:
                        \
                        \   * Y = 4 if U is being pressed (undercarriage)
                        \   * Y = 5 if F is being pressed (flaps)
                        \   * Y = 7 if B is being pressed (brakes)
                        \   * Y = 8 if SHIFT is being pressed (fire)

 LDA PressingUFBS-4,Y   \ Fetch the relevant value from PressingUFBS to see if
 BNE ufbs1              \ the key press has already been processed, and if it is
                        \ non-zero, this indicates that it is still being held
                        \ down from a previous visit to this routine, so jump to
                        \ ufbs1 to return a value of 0, so we can ignore the key
                        \ press

 LDA Undercarriage-4,Y  \ Flip the value of the relevant status byte, as
 EOR #1                 \ follows:
 STA Undercarriage-4,Y  \
                        \   * Flip Undercarriage if U is being pressed
                        \   * Flip Flaps if F is being pressed
                        \   * Flip Brakes if B is being pressed
                        \   * Flip Brakes+1 if SHIFT is being pressed (which has
                        \     no effect

 LDA #1                 \ Set the relevant value in PressingUFBS to denote that
 STA PressingUFBS-4,Y   \ this key is being pressed, so if we revisit this
                        \ routine before the key is released, we don't keep on
                        \ flipping the status byte

 CPY #7                 \ If Y < 7, i.e. U or F are being pressed, jump to ufbs3
 BCC ufbs3              \ to return a result of 1

 LDA #128               \ Y >= 7, i.e. B or SHIFT are being pressed, so set
                        \ A = 128 as the return value

 RTS                    \ Return from the subroutine

.ufbs3

 LDA #1                 \ Set A = 1 as the return value

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: IndicatorU
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the undercarriage indicator ("U") and related variables
\
\ ******************************************************************************

.IndicatorU

 LDA L4F85              \ Set A = L4F85

 LDY Undercarriage      \ If Undercarriage is non-zero then the undercarriage is
 BNE indu1              \ down, so jump to indu1

                        \ If we get here then the undercarriage is up

 SEC                    \ Set A = A - 10
 SBC #10

 LDX #5                 \ Set X = 5 to store in L0CF0 below

 LDY #%01010101         \ Set Y to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the undercarriage
                        \ indicator when turned off

 BNE indu2              \ Jump to indu2 to update the indicator (this BNE is
                        \ effectively a JMP as Y is never zero)

.indu1

                        \ If we get here then the undercarriage is down

 LDY L0CC5              \ If L0CC5 <> 0, jump to indu4 to set the undercarriage
 BNE indu4              \ to up and return from the subroutine

 CLC                    \ Set A = A + 10
 ADC #10

 LDX #10                \ Set X = 10 to store in L0CF0 below

 LDY #%01110111         \ Set Y to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the undercarriage
                        \ indicator when turned on

.indu2

 STA L4F85              \ Store A in L4F85 (which is L4F85 incremented by 10 or
                        \ reduced by 10 for undercarriage down/up) ???

 STX L0CF0              \ Store X in L0CF0 (5 if undercarriage is up, 10 if it
                        \ is down) ???

 TYA                    \ Set A to the pixel pattern in Y

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the undercarriage indicator

.indu3

 STA Row30_Block32_2,X  \ Update pixel row X of the undercarriage indicator to
                        \ the pixel pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indu3              \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

.indu4

 LDA #0                 \ Set Undercarriage = 0 to set the undercarriage to up
 STA Undercarriage

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: IndicatorF
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the flaps indicator ("F") and and related variables
\
\ ------------------------------------------------------------------------------
\
\ Other entry points:
\
\   IndicatorF_RTS      Contains an RTS
\
\ ******************************************************************************

.IndicatorF

 LDA L4F85              \ Set A = L4F85
 
 LDY Flaps              \ If Flaps is non-zero then the flaps are on, so jump
 BNE indf1              \ to indf1

                        \ If we get here then the flaps are off

 SEC                    \ Set A = A - 200
 SBC #200

 LDX #0                 \ Set X = 5 to store in L4F87 below

 LDY #%01000100         \ Set Y to a four-pixel block with pixel 2 in white, to
                        \ act as the centre of the flaps indicator when turned
                        \ off

 BNE indf2              \ Jump to indf2 to update the indicator (this BNE is
                        \ effectively a JMP as Y is never zero)

.indf1

                        \ If we get here then the flaps are on

 CLC                    \ Set A = A + 200
 ADC #200

 LDX #152               \ Set X = 152 to store in L4F87 below

 LDY #%11001100         \ Set Y to a four-pixel block with pixels 2 and 3 in
                        \ white, to act as the centre of the flaps indicator
                        \ when turned on

.indf2

 STA L4F85              \ Store A in L4F85 (which is L4F85 incremented by 200 or
                        \ reduced by 200 for flaps on/off) ???

 STX L4F87              \ Store X in L4F87 (5 if flaps are off, 152 if they are
                        \ on) ???

 TYA                    \ Set A to the pixel pattern in Y

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the flaps indicator

.indf3

 STA Row30_Block35_2,X  \ Update pixel row X of the flaps indicator to the pixel
                        \ pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indf3              \ Loop back to update the next row of the indicator

.IndicatorF_RTS

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: FireGuns
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.FireGuns

 LDA L0CF1
 ORA L368F
 BNE IndicatorF_RTS

 LDX #&E4
 JSR L4B4A

 LDA AirspeedHi
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
\       Name: IndicatorB
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the brakes indicator ("B")
\
\ ******************************************************************************

.IndicatorB

 LDA #%01110111         \ Set A to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the brakes indicator
                        \ when turned on

 LDX Brakes             \ If Brakes is non-zero then the brakes are on, so
 BNE indb1              \ jump to indb1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the brakes indicator
                        \ when turned off

.indb1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the brakes indicator

.indb2

 STA Row30_Block37_2,X  \ Update pixel row X of the brakes indicator to the
                        \ pixel pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indb2              \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: IndicatorT
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the Theme indicator ("T")
\
\ ******************************************************************************

.IndicatorT

 LDA #%01110111         \ Set A to a four-pixel block with pixels 0, 1 and 2 in
                        \ white, to act as the centre of the Theme indicator
                        \ when turned on

 LDX Theme              \ If Theme is positive then the Theme is enabled, so
 BPL indt1              \ jump to indt1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the Theme indicator
                        \ when turned off

.indt1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the Theme indicator

.indt2

 STA Row30_Block0_2,X   \ Update pixel row X of the Theme indicator to the pixel
                        \ pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indt2              \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScanKeyboard
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Scan the keyboard for a specific key
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
\ are stored in KeyTable1Lo/KeyTable1Hi and KeyTable2Lo/KeyTable2Hi.
\
\ ******************************************************************************

.ScanKeyTable

 LDA #5                 \ Set V = 5 to act as an offset as we work our way
 STA V                  \ through the six keys in KeyTable1

.sckt1

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX KeyTable1,Y        \ Scan the keyboard to see if the Y-th key in KeyTable1
 JSR ScanKeyboard       \ is being pressed

 BNE sckt2              \ If the key is not being pressed, jump down to sckt2 to
                        \ check the Y-th key in KeyTable1

 LDX V                  \ Set X = the offset of the key we are processing
 
 LDY KeyTable1Lo,X      \ Fetch the key logger value for this key press into
 LDA KeyTable1Hi,X      \ (A Y)
 
 JMP sckt4              \ Jump down to sckt4 to store (A Y) in the key logger

.sckt2

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX KeyTable2,Y        \ Scan the keyboard to see if the Y-th key in KeyTable2
 JSR ScanKeyboard       \ is being pressed

 BNE sckt3              \ If the key is not being pressed, jump down to sckt3 to
                        \ store 0 in the key logger

 LDX V                  \ Set X = the offset of the key we are processing

 LDY KeyTable2Lo,X      \ Fetch the key logger value for this key press into
 LDA KeyTable2Hi,X      \ (A Y)

 JMP sckt4              \ Jump down to sckt4 to store (A Y) in the key logger

.sckt3

 LDA #0                 \ Set A = 0

 LDX V                  \ Set X = the offset of the key we are processing

 TAY                    \ Set Y = 0, so the key logger value in (A Y) is 0

.sckt4

 STA KeyLoggerHigh,X    \ Store the high byte of the key logger value in (A Y)
                        \ in the X-th byte of KeyLoggerHigh

 TYA                    \ Store the low byte of the key logger value in (A Y)
 STA KeyLoggerLow,X     \ in the X-th byte of KeyLoggerLow

 DEC V                  \ Decrement the offset to point to the next key to
                        \ process

 BPL sckt1              \ Loop back until we have processed all six key pairs

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
\       Name: ReadADCChannel
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Read the joystick position from one of the ADC channels
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The ADC channel to read:
\
\                         * 1 = joystick X
\
\                         * 2 = joystick Y
\
\ Returns:
\
\   A                   The joystick position, inverted and clipped to the range
\                       -118 to +116
\
\ ******************************************************************************

.ReadADCChannel

 LDA #128               \ Call OSBYTE with A = 128 to fetch the 16-bit value
 JSR OSBYTE             \ from ADC channel X, returning (Y X), i.e. the high
                        \ byte in Y and the low byte in X

 TYA                    \ Copy Y to A, so the result is now in (A X)

 CMP #247               \ If A < 247, jump to radc1 to skip the next instruction
 BCC radc1

 LDA #246               \ Set A = 246, so A now has a maximum value of 246

.radc1

 CMP #12                \ If A >= 12, jump to radc2 to skip the next instruction
 BCS radc2

 LDA #12                \ Set A = 12, so A now has a minimum value of 12

.radc2

                        \ By the time we get here, A is in the range 12 to 246

 SEC                    \ Set A = A - 128, so A is now in the range -116 to +118
 SBC #128

 EOR #&FF               \ Negate A using two's complement, so A is now in the
 CLC                    \ range -118 to +116
 ADC #1

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Reset
\       Type: Subroutine
\   Category: Setup
\    Summary: Reset most variables to prepare for a new flight
\
\ ******************************************************************************

.Reset

 LDX #0                 \ Set A = 0 to use as our zero value

 TXA                    \ Set X = 0 to use as a counter for zeroing 256 bytes in
                        \ the rset1 loop

 STA L4202              \ Set L4202 = 0

 STA L4F87              \ Set L4F87 = 0

 STA L368F              \ Set L368F = 0

 STA L44F0              \ Set L44F0 = 0

 STA ScoreLo            \ Set ScoreLo = 0

 STA ScoreHi            \ Set ScoreHi = 0

.rset1

                        \ This loop zeroes &0400 to &04FF

 STA L0400,X            \ Zero the X-th byte of page &4

 DEX                    \ Decrement the byte counter

 BNE rset1              \ Loop back until we have zeroed &0400 to &04FF

 LDX #255               \ Set X = 255 to use as a counter for zeroing 255 bytes
                        \ in the rset2 loop

 STA L05C8              \ Set L05C8 = 0

 STA MainLoopCounter    \ Set MainLoopCounter = 0

.rset2

                        \ This loop zeroes &0C00 to &0CFE, which resets all of
                        \ the variables in the &0C00 workspace

 STA L0BFF,X            \ Zero the X-1-th byte of page &C

 DEX                    \ Decrement the byte counter

 BNE rset2              \ Loop back until we have zeroed &0C00 to &0CFE

 LDX #7                 \ Set X = 7 to use as a counter for zeroing 8 bytes in
                        \ the rset3 loop

.rset3

                        \ This loop zeroes 8 bytes at L4210

 STA L4210,X            \ Zero the X-th byte of L4210

 DEX                    \ Decrement the byte counter

 BPL rset3              \ Loop back until we have zeroed L4210 to L4210+7

 LDA #72                \ Set L0CFF = 72
 STA L0CFF

 LDA #92                \ Set L0CEF = 92
 STA L0CEF

 LDA #198               \ Set L0CFD = 198
 STA L0CFD

 LDA #229               \ Set L0CED = 229
 STA L0CED

 LDA #10                \ Set AltitudeLo = 10
 STA AltitudeLo

 STA L0CF8              \ Set L0CF8 = 10

 LDA #242               \ Set L4F85 = 242
 STA L4F85

 LDA #1                 \ Set Undercarriage = 1 (undercarriage is down)
 STA Undercarriage

 STA Brakes             \ Set Brakes = 1 (brakes on)

 STA L0CE8              \ Set L0CE8 = 1

 JSR IndicatorU         \ Update the undercarriage indicator

 LDA #1                 \ Set L0CC5 = 1
 STA L0CC5

 LDA #47                \ Set L0CD1 = 47
 STA L0CD1

 LDA #255               \ Set Theme = 255
 STA Theme

 STA L0CD0              \ Set L0CD0 = 255

 LDX #7                 \ Set X = 7 to use as a counter for zeroing 8 bytes in
                        \ the rset4 loop

 STX L0CFA              \ Set L0CFA = 7

.rset4

                        \ This loop zeroes 8 bytes at L4208

 STA L4208,X            \ Zero the X-th byte of L4208

 DEX                    \ Decrement the byte counter

 BPL rset4              \ Loop back until we have zeroed L4208 to L4208+7

 LDX #2                 \ Set X = 2 to use as a counter for zeroing 3 bytes in
                        \ the rset5 loop

.rset5

                        \ This loop zeroes L4203, L4203 and L4204

 STA L4203,X            \ Zero the X-th byte of L4203

 DEX                    \ Decrement the byte counter

 BPL rset5              \ Loop back until we have zeroed L4203 to L4203+2

 JSR IndicatorT         \ Update the Theme indicator

 LDX #11                \ Update the thrust indicator
 JSR UpdateIndicator

 LDA #65                \ Set FuelLevel = 65, which indicates a full tank
 STA FuelLevel

                        \ We now drain the fuel tank one point at a time,
                        \ updating the fuel gauge as we go so the fuel gauge
                        \ gets cleared down to empty at the same time as
                        \ the value in FuelLevel

.rset6

 DEC FuelLevel          \ Decrement the counter in FuelLevel

 JSR UpdateFuelGauge    \ Update the fuel gauge

 LDA FuelLevel          \ Loop back until FuelLevel = 0, by which point we have
 BNE rset6              \ reset the fuel tanks and cleared the fuel gauge

                        \ Fall through into Reset2 to finish resetting the rest
                        \ of the flight variables

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

 LDA #80                \ Set L0900 = 80
 STA L0900

 LDA #1                 \ Set L0CE6 = 1
 STA L0CE6

 STA L4A00              \ Set L4A00 = 1

 JSR L2D32

 LDY #33
 JSR L25B5

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: StartGame
\       Type: Subroutine
\   Category: Setup
\    Summary: Reset the high score, set up the gunfire sound envelope and start
\             a new game
\
\ ******************************************************************************

.StartGame

 LDA #0                 \ Set (HighScoreHi HighScoreLo) = 0
 STA HighScoreHi
 STA HighScoreLo

 LDA #14                \ Call DefineEnvelope with A = 14 to set up the second
 JSR DefineEnvelope     \ sound envelope

                        \ Fall through into NewGame to start a new game

\ ******************************************************************************
\
\       Name: NewGame
\       Type: Subroutine
\   Category: Main loop
\    Summary: Start a new game
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.NewGame

 JSR ClearCanopy        \ Clear the canopy to black, leaving the canopy edges
                        \ alone

 JSR Reset              \ Reset most variables to prepare for a new flight

 JSR ScanKeyTable       \ Scan for key presses and update the key logger

 JSR ApplyFlightKeys

 JSR L2BDC

 JSR IndicatorF         \ Update the flaps indicator

 JSR IndicatorB         \ Update the brakes indicator

 LDA #%01000000         \ Set the 6522 User VIA auxiliary control register
 STA VIA+&6B            \ (SHEILA &6B) to %01000000 to disable the shift
                        \ register

 LDA #234               \ Set 6522 User VIA T1C-L timer 1 high-order counter
 STA VIA+&65            \ (SHEILA &65) to 234 to start the T1 counter
                        \ counting down at a rate of 1 MHz

\ ******************************************************************************
\
\       Name: MainLoop
\       Type: Subroutine
\   Category: Main loop
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.MainLoop

 LDA NN                 \ Fetch the value of NN, which appears to be a counter
 STA L0CC6              \ of things at L0600

 JSR L2F1C

 JSR ScanKeyTable       \ Scan for key presses and update the key logger

 LDA L0CF1
 BNE main2

 JSR ApplyFlightKeys

 LDA L0CF1
 BEQ main3

 LDA #2
 STA L0CD9
 LDY #&21

.main1

 LDA L04D8,Y
 STA L41FA,Y
 DEY
 CPY #&1E
 BCS main1

 LDY II
 LDA #&3C
 STA L0500,Y
 INY
 LDA #&3D
 STA L0500,Y
 INY
 STY II
 JMP main3

.main2

 JSR ApplyFlightKeys

.main3

 LDX #&13
 LDA #0
 STA L0CCA
 STA L05C8

.main4

 STA L04D8,X
 STA L04EC,X
 DEX
 BPL main4

 LDA L0CF1
 BEQ main5

 JSR L2EE6

 LDA L0CD9
 BEQ main5

 DEC L0CD9
 LDA #6
 JSR MakeSound

.main5

 LDA Theme
 BMI main6

 JSR L2DAC

.main6

 JSR L2873

 JSR L4CB0

 LDY #2
 JSR L4244

 LDY #&22
 JSR L4244

 INC MainLoopCounter

 LDA MainLoopCounter
 CLC
 ADC #4
 AND #7
 BNE main7

 LDY #1
 JSR L2CD3

 LDX L4205
 BMI main7

 LDY #&21
 LDA L4210,X
 CMP #&1B
 BCC main7

 JSR L2CD3

.main7

 LDA Theme
 BNE main12

 LDA L0CF1
 BEQ main11

 LDA #&21
 STA L0CCC

.main8

 LDY L0CCC
 LDA L41FA,Y
 BPL main9

 JSR L3053

 LDA L368F
 BNE main10

.main9

 DEC L0CCC
 LDA L0CCC
 CMP #&1E
 BCS main8

 BCC main11

.main10

 STA L368C
 LDA #0
 STA L0CF1

.main11

 JSR L2F4E

.main12

 LDA L0CC5
 BEQ main13

 LDX #&86               \ Scan the keyboard to see if the right arrow is being
 JSR ScanKeyboard       \ pressed

 BNE main13             \ If the right arrow is not being pressed, jump to
                        \ main13

 JSR TerminateGame      \ The right arrow is being pressed, which is the key to
                        \ terminate the game, so call TerminateGame to do
                        \ exactly that

 JMP NewGame            \ Jump to NewGame to start a new game

.main13

 LDA L0CE8
 BEQ main17

 BMI main16

 LDA L0CF1
 BEQ main14

 LDA Theme              \ If Theme is positive then the Theme is enabled, so
 BPL main14             \ jump to main14 to skip the following three
                        \ instructions

 LDA #8                 \ Set Theme = 8 to enable the Theme
 STA Theme

 JSR IndicatorT         \ Update the Theme indicator

.main14

 LDA Engine             \ If the Engine is on, jump to main15 to skip the
 BNE main15             \ following instruction

 JSR FillUpFuelTank     \ Fill up the fuel tank by one unit

.main15

 JSR VolumeKeys         \ Check the volume keys and adjust the sound volume
                        \ accordingly

.main16

 LDA L0CF9
 BEQ main17

 LDX #0
 STX L0CF9
 LDA #&15
 JSR L4BCB

.main17

 JSR UpdateFuelGauge    \ Update the fuel gauge

                        \ Handle engine start/stop

 LDX #&DC               \ Scan the keyboard to see if "T" is being pressed
 JSR ScanKeyboard

 BNE main18             \ If "T" is not being pressed, jump to main18

 LDA PressingT          \ If PressingT is non-zero, then we are still pressing
 BNE main19             \ "T" having already toggled the engine, so jump down
                        \ to main19 so we don't keep switching the engine on and
                        \ off by accident

 LDA Propellor          \ If Propellor is non-zero, then the propellor is broken
 BNE main20             \ and we can't turn on the engine, so jump to main20 to
                        \ skip the following

                        \ At this point, we know that "T" is being pressed,
                        \ PressingT is zero (so we haven't yet acted on the key
                        \ press), and Propellor is zero (so the propellor is
                        \ working), so now we toggle the engine status to switch
                        \ it on or off

 LDA Engine             \ Fetch the value of Engine and invert bit 0 so it
 EOR #1                 \ changes to the opposite state

 JSR SetEngine          \ Set the engine status to the value in A

 LDA #1                 \ Set A = 1 to use as the new value of PressingT below,
 BNE main19             \ so that holding down "T" won't keep toggling the
                        \ engine status

.main18

 LDA #0                 \ "T" is not being pressed, so set A = 0 to use as the
                        \ new value of PressingT

.main19

 STA PressingT          \ Set PressingT = A, so we don't try toggling the engine
                        \ again until we release the "T" key

.main20

 LDA L05C8
 CMP #&23
 BCS main21

 JSR L293A

 JSR L293A

 JSR L293A

.main21

 LDX #&70               \ Call OSWORD with A = 1 and (Y X) = &0070, which reads
 LDY #&00               \ the system clock and writes the result into the five
 LDA #1                 \ bytes from &0070 to &0074 (P, Q, R, S and T)
 JSR OSWORD

 JSR L3F10

 BCC main20

 JSR L28B6

 JSR L2C37

 JSR L4D6E

                        \ Handle score display

 LDA ScoreDisplayTimer  \ If ScoreDisplayTimer = 0, jump to main22 to skip the
 BEQ main22             \ following three instructions, as we are not currently
                        \ displaying the score

 CMP #220               \ If ScoreDisplayTimer <> 220, jump down to main23 to
 BNE main23             \ decrement the timer and keep displaying the score

 BEQ main24             \ If ScoreDisplayTimer = 220, it's time to remove the
                        \ score from the screen, so jump down to main24

.main22

 LDX #&C8               \ Scan the keyboard to see if "P" is being pressed
 JSR ScanKeyboard

 BNE main25             \ If "P" is not being pressed, jump to main25 to
                        \ continue with the main loop

.main23

                        \ If we get here then either we just pressed "P" or the
                        \ score is already being displayed, so in either case we
                        \ should update the timer and display the score

 DEC ScoreDisplayTimer  \ Decrement the score timer

 JSR DisplayScore       \ Display the score, so we show it for the first time if
                        \ we just pressed "P", or update it if it changes while
                        \ being displayed

 JMP main25             \ Jump down to main25 to continue with the main loop

.main24

 JSR RemoveScore        \ Remove the score from the screen

 LDA #0                 \ Set ScoreDisplayTimer = 0 as we are no longer showing
 STA ScoreDisplayTimer  \ the score on-screeen

.main25

                        \ ??? Update object handles

 LDX L0CC6              \ If L0CC6 <> NN, jump down to main26
 CPX NN
 BNE main26

 JMP MainLoop           \ L0CC6 = NN, so jump back up to the top of the main
                        \ loop for the next iteration

.main26

 INX                    \ Increment X to point to the next thing

 LDY L0600,X            \ Set Y to this thing's handle in L0600

 STX L0CC6              \ Increment the value of L0CC6, which was the value of
                        \ NN at the start of the main loop

 LDX Lookup3F30,Y       \ Set X to the Y-th byte from Lookup3F30

 LDA #0                 \ Zero the X-th byte of L0400
 STA L0400,X

 LDX Lookup3E00,Y       \ Set X to the Y-th byte from Lookup3E00

 STA L0400,X            \ Zero the X-th byte of L0400

 JMP main25             \ Jump back to main25 to repeat this process until we
                        \ have processed all the new things

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

 INC NN                 \ Increment NN, which contains the number of things at
                        \ &0600

 LDX NN                 \ Store A at the NN-th byte of L0600, so this adds a new
 STA L0600,X            \ thing to the end of the L0600 table

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
 LDX Lookup3F30,Y
 STX GG
 STX L
 LDX Lookup3E00,Y
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

 INC NN                 \ Increment NN, which contains the number of things at
                        \ &0600

 LDX NN                 \ Store A at the NN-th byte of L0600, so this adds a new
 STA L0600,X            \ thing to the end of the L0600 table

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

 INC NN                 \ Increment NN, which contains the number of things at
                        \ &0600

 LDX NN                 \ Store A at the NN-th byte of L0600, so this adds a new
 STA L0600,X            \ thing to the end of the L0600 table

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
 LDY Lookup3E00,X
 STY M
 LDY Lookup3F30,X
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

 LDA Lookup4600,Y
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
 SBC AltitudeLo
 STA L0A00,X
 LDA L44A0,Y
 SBC AltitudeHi
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

 CMP Lookup3BD8,Y
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

 LDA #128               \ Set L0CC2 = -1
 STA L0CC2

 LDA #15                \ Set L0CC3 = 15
 STA L0CC3

 JSR L14AC

 LDA #0                 \ Set JJ = 0
 STA JJ

 STA II                 \ Set II = 0

 LDA #255               \ Set NN = 255
 STA NN

 STA LL                 \ Set LL = 255

 STA MM                 \ Set MM = 255

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
 LDY Lookup3E00,X
 STY M
 LDA #0
 STA L0400,Y
 LDY Lookup3F30,X
 STY L
 STA L0400,Y
 JSR L107F

 INC KK
 LDA KK
 CMP II
 BCC L2C44

 JSR DrawGunSights

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

 JSR DrawVectorLine     \ Erase a line from (I, J) as a vector (T, U) with
                        \ direction V

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
 LDA Compass
 JSR L2E2F

 JSR DrawVectorLine     \ Draw a line from (I, J) as a vector (T, U) with
                        \ direction V

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

 JSR PrintTooLate

 LDA #&5A
 JSR Delay

 JSR TerminateGame

 TSX                    \ Remove two bytes from the top of the stack
 INX
 INX
 TXS

 JMP NewGame

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
\       Name: Lookup2E60
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup2E60

 EQUB %00001000
 EQUB %00001100
 EQUB %00001110
 EQUB %00001111

 EQUB %00000100
 EQUB %00000110
 EQUB %00000111

 EQUB %00000010
 EQUB %00000011
 EQUB %00000001

\ ******************************************************************************
\
\       Name: Lookup2E6A
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup2E6A

 EQUB %00000001
 EQUB %00000011
 EQUB %00000111
 EQUB %00001111

 EQUB %00000010
 EQUB %00000110
 EQUB %00001110

 EQUB %00000100
 EQUB %00001100
 EQUB %00001000

 EQUB %10000000
 EQUB %11000000
 EQUB %11100000
 EQUB %11110000

 EQUB %01000000
 EQUB %01100000
 EQUB %01110000

 EQUB %00100000
 EQUB %00110000
 EQUB %00010000

 EQUB %00010000
 EQUB %00110000
 EQUB %01110000
 EQUB %11110000

 EQUB %00100000
 EQUB %01100000
 EQUB %11100000

 EQUB %01000000
 EQUB %11000000
 EQUB %10000000

 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111
 EQUB %00001111

 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000
 EQUB %11110000

\ ******************************************************************************
\
\       Name: L2E9C
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2E9C

 EQUB &20

\ ******************************************************************************
\
\       Name: L2E9D
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L2E9D

 EQUB &20

 EQUB &20, &20

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

.fcrw1

 LDY #0                 \ Set a byte counter in Y

 LDA S                  \ Fetch the value of A that we stored in S above

.fcrw2

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BNE fcrw2              \ Loop back until we have set 256 bytes, starting at
                        \ P(1 0), to the value in A

 LDY #47                \ Set a byte counter in Y for 47 bytes

 INC P+1                \ Set P(1 0) = P(1 0) + 256
                        \
                        \ so it points to the next byte to fill after the 256
                        \ bytes we just did

.fcrw3

 STA (P),Y              \ Set the Y-th byte of P(1 0) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BPL fcrw3              \ Loop back until we have set 47 bytes, starting at
                        \ P(1 0), to the value in A

 LDA P                  \ Set P(1 0) = P(1 0) + 64
 CLC                    \
 ADC #64                \ starting with the low bytes
 STA P

 BCC fcrw4              \ If the above addition didn't overflow, skip the next
                        \ instruction

 INC P+1                \ The above addition overflowed, so increment the high
                        \ byte of P(1 0) to point to the next page in memory

                        \ So now P(1 0) is 320 greater than at the start, so it
                        \ points to the next character row in screen memory

.fcrw4

 DEC R                  \ Decrement the row counter in R

 BNE fcrw1              \ Loop back until we have updated R rows

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Delay
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Delay for a specified number of loops
\
\ ------------------------------------------------------------------------------
\
\ This routine performs A^3 loop iterations, to create a delay.
\
\ Fragments of the original source for this routine appear in the game code, as
\ follows:
\
\   .dlp2 STA&76
\   .dl ...
\   ... :BNE dlp2
\   DEC&74:BNE dlp1
\   rts
\
\ ******************************************************************************

.Delay

 STA T                  \ Set T as the counter for the outer loop

.delp1

 STA U                  \ Set U as the counter for the middle loop

.delp2

 STA V                  \ Set V as the counter for the inner loop

.delp3

 DEC V                  \ Loop around for A iterations in the inner loop
 BNE delp3

 DEC U                  \ Loop around for A iterations in the middle loop
 BNE delp2

 DEC T                  \ Loop around for A iterations in the outer loop
 BNE delp1

 RTS                    \ Return from the subroutine

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

 LDA MainLoopCounter
 AND #127
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

 LDA MainLoopCounter
 AND #127
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

 TSX                    \ Remove two bytes from the top of the stack
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
\       Name: FillUpFuelTank
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Fill up the fuel tank by 1/65th of a full tank every four
\             iterations of the main loop
\
\ ******************************************************************************

.FillUpFuelTank

 LDA MainLoopCounter    \ If the MainLoopCounter is a multiple of 4, jump to
 AND #3                 \ fuel1 to add some fuel to the tank (so we do this
 BEQ fuel1              \ every four iterations of the main loop)

 RTS                    \ Return from the subroutine

.fuel1

 TAX                    \ We got here because A contains 3, so this sets X = 0

 LDA FuelLevel          \ If FuelLevel >= 65, then the tank is already full, so
 CMP #65                \ jump to fuel2 to skip filling it up any more
 BCS fuel2

 INC FuelLevel          \ FuelLevel < 65, so increment the fuel level by 1, to
                        \ fill up the fuel tank by 1/65th of a full tank

 JMP DrawFuelPixel      \ Draw an extra pixel at the top of the fuel level, so
                        \ the fuel gauge goes up by one pixel, returning from
                        \ the subroutine using a tail call

.fuel2

                        \ If we get here then the fuel tank is full

 STX L0CE8              \ Set L0CE8 = 0

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateFuelGauge
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the fuel gauge every 16 iterations of the main loop
\
\ ******************************************************************************

.UpdateFuelGauge

 LDA MainLoopCounter    \ If the MainLoopCounter is a multiple of 16, jump to
 AND #15                \ upfu1 to update the fuel gauge
 BEQ upfu1

 RTS                    \ Return from the subroutine

.upfu1

 LDX #128               \ Set X = 128, so we erase a pixel from the top of the
                        \ fuel gauge in DrawFuelPixel below, if there is one

 LDA FuelLevel          \ Set A = FuelLevel

                        \ Fall through into DrawFuelPixel to erase a pixel from
                        \ the fuel gauge at the top of the gauge if there is
                        \ one, which will set the amount shown on the fuel gauge
                        \ to FuelLevel

\ ******************************************************************************
\
\       Name: DrawFuelPixel
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Draw or erase a pixel on the fuel gauge on the dashboard
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The fuel gauge pixel to draw or erase (0 to 65)
\
\   X                   Drawing mode:
\
\                         * Bit 7 clear = draw (using OR logic)
\
\                         * Bit 7 set = erase (using EOR logic)
\
\ ******************************************************************************

.DrawFuelPixel

 STX N                  \ Store the drawing mode in N 

 CLC                    \ Set J = A + 184
 ADC #184               \
 STA J                  \ so the line's start y-coordinate is between:
                        \
                        \   * 184, or -72, for A = 0  (empty tank)
                        \   * 249, or  -7, for A = 65 (full tank)
                        \
                        \ As y-coordinates that we send to DrawVectorLine are
                        \ relative to the top of the dashboard, this means we
                        \ draw a pixel on the vertical line from 72 pixels below
                        \ the top of the dashboard (i.e. the bottom of the fuel
                        \ gauge at screen y-coordinate 231), up to 7 pixels
                        \ below the top of the dashboard (i.e. the top of the
                        \ fuel gauge at screen y-coordinate 166)

 LDA #2                 \ Set I = 2, the x-coordinate of the fuel gauge line
 STA I

 LDA #1                 \ Set T = 1, so line is 1 pixel wide
 STA T

 STA U                  \ Set U = 1, so the line is 1 pixel high

 LDA #0                 \ Set V = 0 so the line is drawn in a positive direction
 STA V                  \ for both axes

 JSR DrawVectorLine     \ Draw/erase a pixel at (2, A + 184)

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: VolumeKeys
\       Type: Subroutine
\   Category: Sound
\    Summary: Adjust the volume when the volume keys are pressed
\
\ ******************************************************************************

.VolumeKeys

 LDX #&DB               \ Scan the keyboard to see if "7" is being pressed
 JSR ScanKeyboard

 BEQ volk1              \ If "7" is being pressed, jump to volk1

 LDX #&EA               \ Scan the keyboard to see if "8" is being pressed
 JSR ScanKeyboard

 BNE volk4              \ If "8" is not being pressed, jump to volk4 to return
                        \ from the subroutine

 LDA #255               \ "8" is being pressed, which is the increase volume
 BNE volk2              \ key, so set A = 255 = -1 and jump to volk2

.volk1

 LDA #1                 \ If we get here then "7" is being pressed, which is the
                        \ decrease volume key, so set A = 1

.volk2

                        \ By this point, A contains 1 if we want to decrease the
                        \ volume, or -1 if we want to increase it, which we can
                        \ now add to the SOUND command's amplitude parameter to
                        \ adjust the volume, as -15 is the loudest volume and 0
                        \ is the quietest

 CLC                    \ Add A to byte #3 of sound #1 (low byte of amplitude)
 ADC Sounds+10

 BMI volk3              \ If the result is negative, then jump to volk3 to
                        \ update the volume

 BNE volk4              \ If the result is non-zero, then we have just reduced
                        \ the volume beyond the quietest setting of 0, so jump
                        \ to volk4 to return from the subroutine without
                        \ changing the volume, as it is already at the quietest
                        \ setting

.volk3

 CMP #241               \ If A < 241, i.e. A < -15, then we have just increased
 BCC volk4              \ the volume past the loudest setting of -15, so jump
                        \ to volk4 to return from the subroutine without
                        \ changing the volume, as it is already at the loudest
                        \ setting

 STA Sounds+10          \ The new volume is valid, so update byte #3 of sound #1
                        \ (low byte of amplitude) with the new volume

 INC Sounds+60          \ Increment byte #5 of sound #7 (low byte of engine
                        \ pitch) to make the engine pitch jump up a bit, so we
                        \ can hear the engine noise changing while adjusting the
                        \ volume (the MakeEngineSound routine will bring it back
                        \ down to the correct pitch)

.volk4

 RTS                    \ Return from the subroutine

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
 JSR IndicatorF

.L33FF

 RTS

\ ******************************************************************************
\
\       Name: Lookup3400
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3400

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

\ ******************************************************************************
\
\       Name: Lookup34D8
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup34D8

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

\ ******************************************************************************
\
\       Name: L35B0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: Lookup3675
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3675

 EQUB &40, &52, &44, &54, &80

\ ******************************************************************************
\
\       Name: Lookup367A
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup367A

 EQUB &80, &4C, &50, &40, &50, &40, &40, &40
 EQUB &40, &74, &84, &82, &85, &75

\ ******************************************************************************
\
\       Name: L3688 to HighScoreHi
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

.FuelLevel

 EQUB &41               \ Current fuel level
                        \
                        \   * 0 = empty
                        \   * 65 = full

 EQUB &B2, &B7, &BC, &C1, &0F, &B4, &BA, &BF, &C8

.ScoreLo

 EQUB &49               \ Score (high byte of a BCD number)

.ScoreHi

 EQUB &3D               \ Score (low byte of a BCD number)

.HighScoreLo

 EQUB &26               \ High score (high byte of a BCD number)

.HighScoreHi

 EQUB &34               \ High score (low byte of a BCD number)

\ ******************************************************************************
\
\       Name: SetEngine
\       Type: Subroutine
\   Category: Flight
\    Summary: Set the engine status
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The new status of the engine:
\
\                         * 0 = engine off
\
\                         * 1 = engine on
\
\ ******************************************************************************

.SetEngine

 CMP Engine             \ If the value of Engine is already the same as A, jump
 BEQ seng3              \ to seng3 to return from the subroutine

 STA Engine             \ Update the value of Engine to the new status in A

 TAX                    \ Either turn the engine sound off (if A = 0) or turn it
 JSR ToggleEngineSound  \ on (if A is non-zero)

 LDA L4F85              \ Set A = L4F85

 LDX Engine             \ If the engine is now on, jump to seng1
 BNE seng1

 CLC                    \ Set A = A + 20
 ADC #20

 BNE seng2              \ Jump to seng2 (this BNE is effectively a JMP as A is
                        \ never zero)

.seng1

 SEC                    \ Set A = A - 20
 SBC #20

.seng2

 STA L4F85              \ Update the value of L4F85

.seng3

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Lookup36C0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup36C0

 EQUB &A8, &00, &56, &A8, &60, &56, &88, &00
 EQUB &56, &30, &00, &30, &D0, &00, &70, &10
 EQUB &00, &70, &E0, &00, &C0

\ ******************************************************************************
\
\       Name: Lookup36D5
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup36D5

 EQUB &4C, &00, &86, &4C, &00, &86, &4C, &00
 EQUB &86, &04, &00, &03, &04, &00, &04, &06
 EQUB &00, &04, &04, &00, &03

\ ******************************************************************************
\
\       Name: Lookup36EA
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup36EA

 EQUB &A8, &10, &18, &A8, &16, &18, &B8, &2C
 EQUB &18, &A8, &44, &28, &28, &84, &48, &60
 EQUB &24, &38, &78, &20, &60, &20

\ ******************************************************************************
\
\       Name: Times16Hi
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the high byte of a value * 16
\
\ ------------------------------------------------------------------------------
\
\ In the table below, Times16Hi,X contains the high byte of X * 16.
\
\ ******************************************************************************

.Times16Hi

FOR I%, 0, 255

 EQUB HI(I% * 16)

NEXT

\ ******************************************************************************
\
\       Name: Times16Lo
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the low byte of a value * 16
\
\ ------------------------------------------------------------------------------
\
\ In the table below, Times16Lo,X contains the low byte of X * 16.
\
\ ******************************************************************************

.Times16Lo

FOR I%, 0, 255

 EQUB LO(I% * 16)

NEXT

\ ******************************************************************************
\
\       Name: Lookup3900
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3900

\FOR I%, 0, 255

\ EQUB INT(0.5 - 0.000003*I%*I%*I% + 0.0025*I%*I% - 0.945*I% + 255)

\NEXT

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

\ ******************************************************************************
\
\       Name: TimesTable
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for multiplication times tables
\
\ ------------------------------------------------------------------------------
\
\ In the table below, TimesTable+X*16,Y contains X * Y.
\
\ To put it another way, X and Y are both in the range 0 to 15, so they are
\ 4-bit values. If, in binary, they are X = %xxxx and Y = %yyyy, then:
\
\   TimesTable,%xxxxyyyy contains X * Y.
\
\ This table is used in conjunction with the HighNibble and LowNibble tables to
\ look up multiplication results.
\
\ ******************************************************************************

.TimesTable

FOR I%, 0, 15

 FOR J%, 0, 15

  EQUB I% * J%

 NEXT

NEXT

\ ******************************************************************************
\
\       Name: Lookup3B00
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3B00

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

\ ******************************************************************************
\
\       Name: Lookup3BD8
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3BD8

 EQUB &6C, &7D, &7D, &7D, &7D, &7D, &28, &28
 EQUB &6E, &6E, &3A, &42, &1E, &1E, &1E, &1E
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &7D, &7D
 EQUB &7D, &7D, &7D, &7D, &7D, &7D, &19, &5A
 EQUB &5A, &5A, &7D

\ This is workspace noise, containing original assembly code

 EQUB &3A, &42, &4E, &45, &20

\ ******************************************************************************
\
\       Name: L3C00
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L3C60
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L3CC0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L3D20
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: L3D80
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ End of workspace noise

\ ******************************************************************************
\
\       Name: ScoreText
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.ScoreText

 EQUB 31, 1, 3          \ VDU 31, 1, 3 moves the text cursor to column 1, row 3
 EQUS "HIGH SCORE:  "

 EQUB "0"
 EQUB 31, 3, 10         \ VDU 31, 3, 10 moves the text cursor to column 3, row
                        \ 10

 EQUB &3A, &4A          \ These bytes appear to be unused and contain assembly
 EQUB &4D, &50          \ code
 EQUB &20, &73
 EQUB &75, &74
 EQUB &35, &0D
 EQUB &04, &6A

\ ******************************************************************************
\
\       Name: Lookup3E00
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3E00

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

\ ******************************************************************************
\
\       Name: L3EC2
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3EC2

 EQUB &74, &72, &75, &32

\ ******************************************************************************
\
\       Name: L3EC6
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3EC6

 EQUB &3A, &43, &00, &08, &10, &18, &00, &08
 EQUB &10, &18

\ ******************************************************************************
\
\       Name: L3ED0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L3ED0

 EQUB &C8, &2A, &CF, &82, &1D, &75, &1A, &CF
 EQUB &9C, &43, &E5, &8A, &EA, &22, &6A, &C5
 EQUB &15, &C4, &C4, &CE, &CE, &CE, &15, &11
 EQUB &38, &D5, &D5, &DA, &DA, &0D, &38, &0D

\ ******************************************************************************
\
\       Name: L3EF0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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
\       Name: Lookup3F26
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3F26

 EQUB &3D, &41
 EQUB &42, &43, &77, &78, &44, &45, &46, &50

\ ******************************************************************************
\
\       Name: Lookup3F30
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3F30

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

\ ******************************************************************************
\
\       Name: Lookup3FFA
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3FFA

 EQUB &05, &10, &15, &25, &00

\ ******************************************************************************
\
\       Name: Lookup3FFF
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup3FFF

 EQUB &40

\ ******************************************************************************
\
\       Name: Lookup4000
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup4000

 EQUB &00
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

\ ******************************************************************************
\
\       Name: Lookup4101
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup4101

 EQUB &00
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

\ ******************************************************************************
\
\       Name: L41E4
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L41E4

 EQUB &FB, &FC, &FC, &FC, &FC, &FD, &FD, &FD
 EQUB &FD, &FE, &FE, &FE, &FE, &FE, &FE, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF

\ ******************************************************************************
\
\       Name: L41FA to L4243
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

.MainLoopCounter

 EQUB &67               \ The main loop counter, which is incremented every
                        \ iteration of the main loop

.L4207

 EQUB &C1

.L4208                  \ ? FLDPTR in original

 EQUB &65, &64, &62, &61, &60, &5F, &5E \ Zeroed in Reset

.L420F

 EQUB &5C               \ Zeroed in Reset

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

 EQUB &20               \ Bit 0 used as sign for L427B in artificial horizon
                        \ calculations when Y = 0 (x-axis)

 EQUB &4C

.L423D

 EQUB &44               \ Bit 0 used as sign for L427D in artificial horizon
                        \ calculations when Y = 0 (x-axis)

.L423E

 EQUB &58               \ Bit 0 used as sign for L427E in artificial horizon
                        \ calculations when Y = 3 (y-axis)

.L423F

 EQUB &20               \ Bit 0 used as sign for L427F in artificial horizon
                        \ calculations when Y = 3 (y-axis)

 EQUB &50, &00

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
\       Name: L425E to L4283
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

 EQUB &FA               \ Used as a value in artificial horizon calculations
                        \ when Y = 0 (x-axis), sign bit is in L423B

 EQUB &32

.L427D

 EQUB &0D               \ Used as a value in artificial horizon calculations
                        \ when Y = 0 (x-axis), sign bit is in L423D

.L427E

 EQUB &34               \ Used as a value in artificial horizon calculations
                        \ when Y = 3 (y-axis), sign bit is in L423E

.L427F

 EQUB &F2               \ Used as a value in artificial horizon calculations
                        \ when Y = 3 (y-axis), sign bit is in L423F

 EQUB &3F, &00

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

 TSX                    \ Add four bytes to the top of the stack
 TXA
 SEC
 SBC #&04
 TAX
 TXS

 JMP Crash

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
\       Name: Lookup42EF
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup42EF

 EQUB &20

\ ******************************************************************************
\
\       Name: Lookup42F0
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup42F0

 EQUB &00, &FE, &FF, &01, &04, &00, &FB, &02
 EQUB &33, &3A, &FF, &FE, &FE, &23, &31, &38

\ ******************************************************************************
\
\       Name: LowNibble
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the low nibble of a value
\
\ ------------------------------------------------------------------------------
\
\ In the table below, LowNibble,X contains the low nibble of X:
\
\   X AND %00001111
\
\ ******************************************************************************

.LowNibble

FOR I%, 0, 255

 EQUB I% AND %00001111

NEXT

\ ******************************************************************************
\
\       Name: L4400 to L44F1
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

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

\ ******************************************************************************
\
\       Name: HighNibble
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the high nibble of a value
\
\ ------------------------------------------------------------------------------
\
\ In the table below, HighNibble,X contains the high nibble of X:
\
\   X AND %11110000
\
\ ******************************************************************************

.HighNibble

FOR I%, 0, 255

 EQUB I% AND %11110000

NEXT

\ ******************************************************************************
\
\       Name: Lookup4600
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup4600

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
\       Name: ReadJoystick
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Read the joystick axes and fire button and update the aileron,
\             elevator and fire key values accordingly
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.ReadJoystick

 LDA Row29_Block20_4    \ If the screen byte at row 29, block 20, pixel row 4 is
 BEQ rjoy1              \ zero (i.e. black) then the joystick is not enabled, so
                        \ jump to rjoy1 to return from the subroutine

 LDX #1                 \ Set Aileron to the value from ADC channel 1, the
 JSR ReadADCChannel     \ joystick's x-position, inverted and clipped to the
 STA Aileron            \ range -118 to +116

 LDX #2                 \ Set Elevator to the value from ADC channel 2, the
 JSR ReadADCChannel     \ joystick's y-position, inverted and clipped to the
 STA Elevator           \ range -118 to +116

 LDX #0                 \ Call OSBYTE with A = 128 and X = 0 to read the status
 LDA #128               \ of the joystick's fire button into X
 JSR OSBYTE

 TXA                    \ If bit 0 of X is zero, the fire button is not being
 AND #1                 \ pressed, so jump to rjoy1
 BEQ rjoy1

 LDA #8                 \ The fire button is being pressed, so update the key
 STA KeyLoggerLow+5     \ logger at KeyLoggerLow+5, which corresponds to the
                        \ flaps and fire keys. We set the value to 8, the value
                        \ from KeyTable2Lo for the fire button

.rjoy1

 RTS                    \ Return from the subroutine

 EQUB &36

\ ******************************************************************************
\
\       Name: Lookup4700
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.Lookup4700

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

\ ******************************************************************************
\
\       Name: YLookupLo
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel y-coordinate to low byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ See YLookupHi for an explanation of this table.
\
\ ******************************************************************************


.YLookupLo

FOR I%, 19, 0, -1

 EQUB LO(&5800 + (I% * &138))

NEXT

FOR I%, 31, 20, -1

 EQUB LO(&5800 + (I% * &138))

NEXT

\ ******************************************************************************
\
\       Name: YLookupHi
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel y-coordinate to high byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ Each character row contains &140 bytes, so this lookup table lets us convert a
\ pixel y-coordinate to the 16-bit address of the start of that row. There are
\ two twists, however.
\
\   * The table counts backwards from the bottom of the canopy/top of the
\     dashboard, so the first entry in this table is for the bottom row of the
\     canopy, the next entry is for the row above that, and so on until we hit
\     the top of the canopy, after which we wrap around to the bottom of the
\     screen (i.e. the bottom of the dashboard) and keep going up until the last
\     entry, which is for the top row of the dashboard. To be more explicit,
\     the first 20 entries cover the canopy:
\
\        * Entry 0 = &6F28 = Row18_Block21
\        * Entry 1 = &6DF0 = Row17_Block22
\        * Entry 2 = &6CB8 = Row16_Block23
\        * Entry 3 = &6B80 = Row15_Block24
\
\          ...
\
\        * Entry 17 = &5A70 = Row1_Block38
\        * Entry 18 = &5938 = Row0_Block39
\        * Entry 19 = &5800 = Row0_Block0
\
\     while the last 12 entries cover the dashboard:
\
\        * Entry 20 = &7DC8 = Row30_Block9
\        * Entry 21 = &7C90 = Row29_Block10
\
\          ...
\
\        * Entry 30 = &7198 = Row20_Block19
\        * Entry 31 = &7060 = Row19_Block20
\
\   * The start addresses for each character row are offset by one character
\     block (8 bytes) per row, so instead of being a simple lookup table for
\     multiples of &140, it's actually a lookup table for multiples of &138,
\     and the addresses in the table are out by +8 bytes for each row above
\     the top of the dashboard, and -8 bytes for each row below.
\
\ The lookup table works this way so the y-coordinates treat the bottom of the
\ canopy as the origin, with negative coordinates for the dashboard and positive
\ coordinates for the canopy. The DrawVectorLine subtracts the y-coordinate from
\ 159 to achieve this effect, which makes the coordinate system for the canopy
\ a lot simpler, at the expense of making the lookup tables more convoluted. 
\
\ ******************************************************************************


.YLookupHi

FOR I%, 19, 0, -1

 EQUB HI(&5800 + (I% * &138))

NEXT

FOR I%, 31, 20, -1

 EQUB HI(&5800 + (I% * &138))

NEXT

\ ******************************************************************************
\
\       Name: DrawCanopyCorners
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw the diagonal corners at the top of the canopy
\
\ ------------------------------------------------------------------------------
\
\ This routine draws the diagonal lines in the top corners of the canopy. They
\ are drawn so that the area outside the canopy is set to black, while anything
\ that is already on-screen inside the canopy is left alone. The diagonals are
\ made up of four squares, each of them one pixel wide and two pixels high, so
\ the overall size of each diagonal is one character block (four pixels wide and
\ eight pixels high).
\
\ ******************************************************************************

.DrawCanopyCorners

 LDX #7                 \ Set X as a pixel row counter, starting with the last
                        \ pixel row, so we draw the diagonals upwards from the
                        \ bottom row of the character block to the top row of
                        \ the character block

 LDA #%01110111         \ Set P to a pixel mask to clear the first pixel
 STA P

 LDA #%10001000         \ Set Q to a pixel byte with a white first pixel
 STA Q

 LDA #%11101110         \ Set R to a pixel mask to clear the last pixel
 STA R

 LDA #%00010001         \ Set S to a pixel byte with a white last pixel
 STA S

.corn1

 LDY #1                 \ Each square in the diagonal is two pixels high, so we
                        \ set a counter in Y to count the height of each square

.corn2

 LDA Row1_Block1_0,X    \ We want to update the X-th pixel row in the character
                        \ block in the top-left corner of the canopy, so fetch
                        \ the current contents of the row

 AND P                  \ Clear the pixel pointed to by P, which on the first
                        \ iteration round the loop will be the first pixel

 ORA Q                  \ Set the pixel pointed to by Q, which on the first
                        \ iteration round the loop will be the first pixel

 STA Row1_Block1_0,X    \ Store the updated pixel row back in screen memory, so
                        \ on the first iteration round the loop, we just set the
                        \ first pixel in the bottom pixel row, which is the
                        \ bottom-left pixel of the diagonal in the top-left
                        \ corner of the canopy

 LDA Row1_Block39_0,X   \ We want to update the X-th pixel row in the character
                        \ block in the top-right corner of the canopy, so fetch
                        \ the current contents of the row

 AND R                  \ Clear the pixel pointed to by R, which on the first
                        \ iteration round the loop will be the last pixel

 ORA S                  \ Set the pixel pointed to by S, which on the first
                        \ iteration round the loop will be the last pixel

 STA Row1_Block39_0,X   \ Store the updated pixel row back in screen memory, so
                        \ on the first iteration round the loop, we just set the
                        \ last pixel in the bottom pixel row, which is the
                        \ bottom-right pixel of the diagonal in the top-right
                        \ corner of the canopy

 DEX                    \ Decrement the pixel row counter so we move up to the
                        \ pixel row above

 DEY                    \ Decrement the square counter in Y, and if it is still
 BPL corn2              \ positive, loop back to corn2 to draw the second row in
                        \ this square, so we end up drawing the same pattern on
                        \ two consecutive pixel rows, making each square two
                        \ pixels high and one pixel wide

 LDA R                  \ We now shift each nibble in R to the left by one, so
 ASL A                  \ it moves through the following values:
 AND R                  \
 STA R                  \   %11101110 -> %11001100 -> %10001000 -> %00000000
                        \
                        \ so with each step up the diagonal, the mask clears
                        \ the area to the right of the diagonal to black
                        \
                        \ We do this as follows (taking the case of the first
                        \ transformation above):
                        \
                        \   R = R AND (R << 1)
                        \     = %11101110 AND (%11101110 << 1)
                        \     = %11101110 AND %11011100
                        \     = %11001100

 LDA P                  \ We now shift each nibble in P to the right by one, so
 LSR A                  \ it moves through the following values:
 AND P                  \
 STA P                  \   %01110111 -> %00110011 -> %00010001 -> %00000000
                        \
                        \ so with each step up the diagonal, the mask clears
                        \ the area to the left of the diagonal to black
                        \
                        \ We do this as follows (taking the case of the first
                        \ transformation above):
                        \
                        \   P = P AND (P >> 1)
                        \     = %01110111 AND (%01110111 >> 1)
                        \     = %01110111 AND %00111011
                        \     = %00110011

 ASL S                  \ We also shift S to the left, so the pixel we draw in
                        \ the top-right diagonal moves to the left as we move up
                        \ the diagonal, like this:
                        \
                        \   %00010001 -> %00100010 -> %01000100 -> %10001000
                        \
                        \ or, putting them in the order on-screen with two rows
                        \ per square, we get a top-right diagonal like this:
                        \
                        \   %10001000       x...
                        \   %10001000       x...
                        \   %01000100       .x..
                        \   %01000100       .x..
                        \   %00100010       ..x.
                        \   %00100010       ..x.
                        \   %00010001       ...x
                        \   %00010001       ...x

 LSR Q                  \ Finally, we shift Q to the right, so the pixel we draw
                        \ in the top-left diagonal moves to the right as we move
                        \ up the diagonal, like this:
                        \
                        \   %10001000 -> %01000100 -> %00100010 -> %00010001
                        \
                        \ or, putting them in the order on-screen with two rows
                        \ per square, we get a top-left diagonal like this:
                        \
                        \   %00010001       ...x
                        \   %00010001       ...x
                        \   %00100010       ..x.
                        \   %00100010       ..x.
                        \   %01000100       .x..
                        \   %01000100       .x..
                        \   %10001000       x...
                        \   %10001000       x...

 CPX #255               \ Loop back until we have drawn all eight rows in the
 BNE corn1              \ diagonal, at which point we will have decremented X
                        \ from 0 to 255

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: RemoveScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: Remove the score display from the screen
\
\ ******************************************************************************

.RemoveScore

 LDY #HI(Row3_Block1_0) \ Set (Y X) to the screen address for row 3, block 1
 LDX #LO(Row3_Block1_0)

 LDA #8                 \ Set R = 19, so we clear 8 character rows
 STA R

 LDA #0                 \ Set X = 0 so we clear the canopy to black

 JSR FillCanopyRows     \ Fill the 8 screen rows with black, avoiding the canopy
                        \ edges and removing the score display from the screen

 RTS                    \ Return from the subroutine

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
\       Type: Variable
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This variable contains workspace noise that disassembles into code that is
\ never called:
\
\ 
\ .L48A0
\ 
\  LDX #7
\ 
\ .L48A2
\ 
\  LDA #&77
\  STA P
\  LDA #&88
\  STA P+1
\  LDA #&EE
\  STA R
\  LDA #&11
\  STA S
\ 
\ .L48B2
\ 
\  LDY #1
\ 
\ .L48B4
\ 
\  LDA Row1_Block0_0,X
\  AND P
\  ORA P+1
\  STA Row1_Block0_0,X
\  LDA Row1_Block38_0,X
\  AND R
\  ORA S
\  STA Row1_Block38_0,X
\  DEX
\  DEY
\  BPL L48B4
\ 
\  LSR R
\  LSR S
\  LSR P
\  LSR P+1
\  CPX #&FF
\  BNE L48B2
\ 
\  RTS
\ 
\ .L48D9
\ 
\  LDY #&5B
\  LDX #&C0
\  LDA #8
\  STA R
\  LDA #0
\  JSR FillCanopyRows
\  RTS
\
\ ******************************************************************************

.L48A0

 EQUB &A2, &07
 EQUB &A9, &77
 EQUB &85, &70
 EQUB &A9, &88
 EQUB &85, &71
 EQUB &A9, &EE
 EQUB &85, &72
 EQUB &A9, &11
 EQUB &85, &73
 EQUB &A0, &01
 EQUB &BD, &40
 EQUB &59, &25
 EQUB &70, &05
 EQUB &71, &9D
 EQUB &40, &59
 EQUB &BD, &68
 EQUB &5A, &25
 EQUB &72, &05
 EQUB &73, &9D
 EQUB &68, &5A
 EQUB &CA, &88
 EQUB &10, &E8
 EQUB &46, &72
 EQUB &46, &73
 EQUB &46, &70
 EQUB &46, &71
 EQUB &E0, &FF
 EQUB &D0, &DA
 EQUB &60, &A0
 EQUB &5B, &A2
 EQUB &C0, &A9
 EQUB &08, &85
 EQUB &72, &A9
 EQUB &00, &20
 EQUB &AB, &2E
 EQUB &60

\ ******************************************************************************
\
\       Name: L48E7 to L4AFC
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

 LDA &0C00,X
 STA L0900,Y
 LDA &0C01,X
 STA L0A00,Y
 LDA &0C02,X
 STA L0700,Y
 LDA &0C10,X
 STA L4A00,Y
 LDA &0C11,X
 STA L0B00,Y
 LDA &0C12,X
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
 STA &0C00,X
 LDA L0A00,Y
 STA &0C01,X
 LDA L0700,Y
 STA &0C02,X
 LDA L4A00,Y
 STA &0C10,X
 LDA L0B00,Y
 STA &0C11,X
 LDA L4900,Y
 STA &0C12,X
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

 CMP Lookup3B00,X
 BCS L4B83

 LDA L0B00,Y
 BPL L4B72

 EOR #&FF

.L4B72

 CMP Lookup3B00,X
 BCS L4B83

 LDA L4900,Y
 BPL L4B7E

 EOR #&FF

.L4B7E

 CMP Lookup3B00,X
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
 SBC Lookup36C0,X
 STA P
 LDA L0CFD,Y
 SBC Lookup36D5,X
 BMI L4BC9

 LSR A
 ROR P
 LSR A
 BNE L4BC9

 ROR P
 LDA P
 CMP Lookup36EA,X
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
\   Category: Scoring
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
 JSR MakeSound

 RTS

\ ******************************************************************************
\
\       Name: L4BD4
\       Type: Subroutine
\   Category: Scoring
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
 ADC ScoreLo
 STA ScoreLo
 TXA
 ADC ScoreHi
 STA ScoreHi
 BCS L4BF1

 CPX #&99
 BNE L4BF1

 LDA #0
 STA ScoreLo
 STA ScoreHi

.L4BF1

 CLD
 RTS

\ ******************************************************************************
\
\       Name: L4BF3
\       Type: Subroutine
\   Category: Scoring
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4BF3

 LDA ScoreHi
 CMP HighScoreHi
 BCC L4C11

 BNE L4C05

 LDA ScoreLo
 CMP HighScoreLo
 BCC L4C11

.L4C05

 LDA ScoreLo
 STA HighScoreLo
 LDA ScoreHi
 STA HighScoreHi

.L4C11

 RTS

\ ******************************************************************************
\
\       Name: DisplayScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: Print the scores on-screen
\
\ ******************************************************************************

.DisplayScore

 LDX #0                 \ Print characters 0-15 from ScoreText, which moves the
 LDY #16                \ text cursor to column 1, row 3 and prints
 JSR PrintScoreText     \ "HIGH SCORE:  "

 LDA HighScoreHi        \ Print the high byte of the high score
 JSR PrintScore

 LDA HighScoreLo        \ Print the low byte of the high score
 JSR PrintScore

 LDX #16                \ Print characters 16-19 from ScoreText, which prints a
 LDY #20                \ "0" and moves the text cursor to column 3, row 10
 JSR PrintScoreText

 LDX #8                 \ Print characters 8-15 from ScoreText, which prints
 LDY #16                \ "SCORE:  "
 JSR PrintScoreText

 LDA ScoreHi            \ Print the high byte of the score
 JSR PrintScore

 LDA ScoreLo            \ Print the low byte of the score
 JSR PrintScore

 LDA #'0'               \ Print a "0"
 JSR OSWRCH

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: PrintScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: Print a score
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The byte to print, in BCD format (so each nibble is one
\                       decimal digit)
\
\ ******************************************************************************

.PrintScore

 STA T                  \ Store the byte to print in T

 LSR A                  \ Set A to the high nibble of the score (bits 4-7)
 LSR A
 LSR A
 LSR A

 CLC                    \ Print the high nibble as a digit
 ADC #'0'
 JSR OSWRCH

 LDA T                  \ Set A to the low nibble of the score (bits 0-3)
 AND #%00001111

 CLC                    \ Print the low nibble as a digit
 ADC #'0'
 JSR OSWRCH

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: PrintScoreText
\       Type: Subroutine
\   Category: Scoring
\    Summary: Print text when showing the scores on-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   Offset of the first character to print from ScoreText
\
\   Y                   Offset of the character that's just after the end of the
\                       string that we want to print from ScoreText
\
\ ******************************************************************************

.PrintScoreText

 STY T                  \ Set Y to the offset of the character that's just after
                        \ the end of the string to print

.L4C5E

 LDA ScoreText,X        \ Print the X-th character from ScoreText
 JSR OSWRCH

 INX                    \ Increment X to point to the next character

 CPX T                  \ Loop back to print the next character until we have
 BNE L4C5E              \ printed all of them

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Crash
\       Type: Subroutine
\   Category: Flight
\    Summary: Make a crashing sound, flash the canopy and start a new game
\
\ ******************************************************************************

.Crash

 LDA #0                 \ Turn off the engine sound
 JSR ToggleEngineSound

 LDA #5                 \ Make the sound of a crash
 JSR MakeSound

 LDX #%11111111         \ Fill the canopy with white, leaving the canopy edges
 JSR FillCanopy         \ alone, to give a flash effect

 LDA #10                \ Delay for 10^3 loop iterations
 JSR Delay

 JSR ClearCanopy        \ Clear the canopy to black, leaving the canopy edges
                        \ alone

 JSR DrawCanopyCorners  \ Redraw the diagonal canopy corners, which were cleared
                        \ by the flashing canopy effect

 LDA #90                \ Delay for 90^3 loop iterations
 JSR Delay

 JSR TerminateGame      \ Terminate the game

 TSX                    \ Remove six bytes from the top of the stack
 TXA
 CLC
 ADC #6
 TAX
 TXS

 JMP NewGame            \ Jump to NewGame to start a new game

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
 JSR MakeSound

 LDX L368E
 LDY Lookup367A,X
 LDA Lookup3675,X
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

 LDA Lookup3FFF
 JMP L4D68

.L4D65

 LDA Lookup3FFA,X

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
\       Name: MakeSound
\       Type: Subroutine
\   Category: Sound
\    Summary: Make a sound
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The sound number from the Sounds table (0 to 7)
\
\ ******************************************************************************

.MakeSound

 ASL A                  \ Set A = A * 8
 ASL A                  \
 ASL A                  \ so we can use it as an index into the Sounds table,
                        \ which has 8 bytes per entry

 CLC                    \ Set (Y X) = Sounds + A
 ADC #LO(Sounds)        \
 TAX                    \ starting with the low byte in X

 LDA #7                 \ Set A = 7 for the OSWORD command to make a sound

 BNE SoundEnvelope      \ Jump to SoundEnvelope to set up Y and apply the OSWORD
                        \ command to the (Y X) block, which makes the relevant
                        \ sound (this BNE is effectively a JMP as A is never
                        \ zero)

\ ******************************************************************************
\
\       Name: TerminateGame
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.TerminateGame

 LDA #0                 \ Turn off the engine sound
 JSR ToggleEngineSound

 JSR L4BF3

 JSR DisplayScore

.term1

 LDX #&B6               \ Scan the keyboard to see if RETURN is being pressed
 JSR ScanKeyboard

 BNE term1              \ Loop back to keep scanning until RETURN is pressed

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DefineEnvelope
\       Type: Subroutine
\   Category: Sound
\    Summary: Define a sound envelope
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

.DefineEnvelope

 CLC                    \ Set (Y X) = Envelopes + A
 ADC #LO(Envelopes)     \
 TAX                    \ starting with the low byte

 LDA #8                 \ Set A = 8 for the OSWORD command to define an envelope

                        \ Fall through into SoundEnvelope to set up Y and apply
                        \ the OSWORD command to the (Y X) block, which defines
                        \ the relevant sound envelope

\ ******************************************************************************
\
\       Name: SoundEnvelope
\       Type: Subroutine
\   Category: Sound
\    Summary: Either make a sound or set up an envelope
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The action:
\
\                         * A = 7 make a sound
\
\                         * A = 8 to define a sound envelope
\
\   X                   The low byte of the address of the OSWORD block
\
\   C flag              The outcome of the addition of the low bytes of (Y X)
\
\ ******************************************************************************

.SoundEnvelope

 LDY #HI(Envelopes)     \ Set y to the high byte of the Envelopes block address,
                        \ so (Y X) now points to the relevant envelope or sound
                        \ data block

 BCC senv1              \ If the addition we did before calling SoundEnvelope
                        \ didn't overflow, skip the next instruction

 INY                    \ The above addition overflowed, so increment the high
                        \ byte of (Y X) to point to the next page in memory

.senv1

 JSR OSWORD             \ Call OSWORD with A = 8 to set up the sound envelope at
                        \ location (Y X)

 RTS                    \ Return from the subroutine

 NOP                    \ This instruction appears to be unused

\ ******************************************************************************
\
\       Name: ToggleEngineSound
\       Type: Subroutine
\   Category: Sound
\    Summary: Turn the engine sound on or off
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   Defines the action:
\
\                         * 0 = turn engine sound off
\
\                         * Non-zero = turn engine sound on with pitch A
\
\ ******************************************************************************

.ToggleEngineSound

 BNE MakeEngineSound    \ If A is non-zero then jump to MakeEngineSound to set
                        \ up and make the engine sound

 LDA #0                 \ Make sound #0 to turn off the engine sound
 JSR MakeSound

                        \ Fall through into ResetEngineSound to reset the pitch
                        \ of the engine sound

\ ******************************************************************************
\
\       Name: ResetEngineSound
\       Type: Subroutine
\   Category: Sound
\    Summary: Reset the pitch of the engine sound
\
\ ******************************************************************************

.ResetEngineSound

 LDA #255               \ Set byte #5 of sound #7 (low byte of engine pitch) to
 STA Sounds+60          \ 255, which is the default setting

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: MakeEngineSound
\       Type: Subroutine
\   Category: Sound
\    Summary: Make the engine sound, with the choppiness and pitch affected by
\             thrust and airspeed
\
\ ******************************************************************************

.MakeEngineSound

 LDA Engine             \ If Engine is zero, then the engine is not running, so
 BEQ engs4              \ jump to engs4 to return from the subroutine

 LDA ThrustHi           \ Set (K A) = (Thrusthi ThrustLo)
 STA K                  \           = Thrust
 LDA ThrustLo

 LDY #3                 \ Set Y = 3 to act as a shift counter in the following
                        \ loop, where we right shift (K A) four times

.engs1

 LSR K                  \ Set (K A) = (R A) / 2
 ROR A                  \           = Thrust / 2

 DEY                    \ Decrement the shift counter

 BPL engs1              \ Loop back until we have shifted right by 4 places, so
                        \ we now have:
                        \
                        \   (K A) = (K A) / 8
                        \         = Thrust / 8
                        \
                        \ We now ignore the high byte in K, so presumably it is
                        \ zero

 CLC                    \ Set K = A + AirspeedHi
 ADC AirspeedHi         \       = (Thrust / 8) + AirspeedHi
 STA K

 LDA #50                \ Set A = 50 - K
 SEC                    \       = 50 - ((Thrust / 8) + AirspeedHi)
 SBC K

 BEQ engs2              \ If A = 0, jump to engs2 to set the engine choppiness
                        \ to 1 (a very smooth engine sound)

 BPL engs3              \ If A is positive, jump to engs3 to set the engine
                        \ choppiness to A

.engs2

 LDA #1                 \ If we get here then A is either 0 or negative, so we
                        \ set A = 1 to use as the choppiness value in the engine
                        \ sound, giving a very smooth engine sound

.engs3

                        \ By the time we get here, A is in the range 1 to 50 and
                        \ represents the engine choppiness, with a lower value
                        \ indicating a smoother engine, and a higher value
                        \ making the sound jump up and down in pitch more
                        \
                        \ In other words, the lower the air speed and thrust,
                        \ the choppier the engine sound
                        \
                        \ We can apply this to the sound envelope for the engine
                        \ by altering the amount that the pitch changes in each
                        \ stage of the sound envelope. These values are set in
                        \ the third, fourth and fifth values in the envelope
                        \ definition, with larger values giving us a larger
                        \ amount of pitch change, and hence more choppiness in
                        \ the engine sound

 STA Envelopes+2        \ Set the third and fifth values of sound envelope 1 to
 STA Envelopes+4        \ the value in A, and set the fourth value to the
 EOR #&FF               \ inverse of A, which is -(A + 1) as this is a signed
 STA Envelopes+3        \ value

                        \ We now want to set the pitch of the engine sound so
                        \ that higher thrust and airspeed give us a higher
                        \ pitch, making our Spitfire scream through the air
                        \
                        \ The engine pitch is controlled by byte #5 of sound #7,
                        \ at Sounds+60, which contains the low byte of the
                        \ engine pitch, so we now need to calculate a suitable
                        \ pitch value

 LDA K                  \ Set A = K + 80
 CLC                    \       = (Thrust / 8) + AirspeedHi + 50
 ADC #80                \
                        \ so A is a higher value when we have higher thrust and
                        \ airspeed, which is what we want

 CMP Sounds+60          \ If the pitch in byte #5 of sound #7 is already at this
 BEQ engs4              \ value, jump to engs4 to return from the subroutine, as
                        \ we don't need to change the pitch

 STA Sounds+60          \ Otherwise set byte #5 of sound #7 to our new pitch in
                        \ A, so the pitch of the engine sound goes up with our
                        \ thrust and airspeed

 LDA #0                 \ Call DefineEnvelope with A = 0 to redefine the first
 JSR DefineEnvelope     \ sound envelope with the new choppiness values

 LDA #7                 \ Make sound #7 to change the engine sound's pitch and
 JSR MakeSound          \ choppiness

 LDA #1                 \ Make sound #1 to ensure that both engine sounds are
 JSR MakeSound          \ being made, as we need to make both #1 and #7 for the
                        \ sound to work

.engs4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawGunSights
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw or erase the gun sights
\
\ ******************************************************************************

.DrawGunSights

 JSR DrawCanopyCorners  \ Draw the canopy corners

 LDX #&DA               \ Scan the keyboard to see if "I" is being pressed
 JSR ScanKeyboard

 BNE guns1              \ If "I" is not being pressed, jump to guns1

 BIT GunSights          \ If bit 6 of GunSights is set, then "I" is still being
 BVS guns3              \ held down from a previous call to this routine, so jump
                        \ to guns3 to move on from the subroutine

 LDA #%11000000         \ Set A = GunSights with bits 6 and 7 flipped, which we
 EOR GunSights          \ will set as the new value of GunSights below

 BMI guns2              \ If the result has bit 7 set, that means that bit 7 of
                        \ GunSights is currently clear, so jump to guns2 as the
                        \ sights are not already being shown, so we don't need
                        \ to remove them

                        \ If we get here then bit 7 of GunSights is set, so the
                        \ sights are already on-screen, and we aren't still
                        \ holding down "I" from a previous call, so now we
                        \ remove the sights

 PHA                    \ Store A on the stack so we can retrieve it below

 LDY #HI(Row6_Block1_0) \ Set (Y X) to the screen address for row 6, block 0
 LDX #LO(Row6_Block1_0)

 LDA #3                 \ Set R = 3, so we clear 3 character rows for the sights
 STA R

 LDA #0                 \ Set X = 0 so we clear the sights to black

 JSR FillCanopyRows     \ Fill the 3 screen rows with black, avoiding the canopy
                        \ edges and removing the sights from the screen

 PLA                    \ Retrieve A from the stack

 JMP guns2              \ Jump down to guns2 to set GunSights to the value in A

.guns1

                        \ If we get here then "I" is not being pressed

 LDA #%10000000         \ Extract bit 7 from GunSights into A, which clears bit
 AND GunSights          \ 6 to indicate that "I" is not being pressed, while
                        \ leaving the current state of bit 7 alone

.guns2

 STA GunSights          \ Update GunSights to the new value in A

.guns3

 BPL ToggleJoystick     \ If bit 7 of the new value of GunSights is clear, then
                        \ the sights are no longer being shown, so jump down to
                        \ ToggleJoystick to move onto the next routine

                        \ If we get here, then bit 7 of GunSights is set, so we
                        \ need to draw the sights

 LDY #7                 \ First we draw the vertical bar in the middle of the
                        \ sights, which runs through block 20 on rows 6 and 7,
                        \ so we set a pixel row counter in Y to count through
                        \ the rows in each character block

.guns4

 LDA #%10001000         \ Draw a vertical bar in the first pixel of the Y-th
 ORA Row6_Block20_0,Y   \ pixel row in block 20 on row 6, keeping whatever is
 STA Row6_Block20_0,Y   \ already on screen

 LDA #%10001000         \ Draw a vertical bar in the first pixel of the Y-th
 ORA Row7_Block20_0,Y   \ pixel row in block 20 on row 7, keeping whatever is
 STA Row7_Block20_0,Y   \ already on screen

 DEY                    \ Decrement the pixel row counter

 BPL guns4              \ Loop back to draw the next pixel row until we have
                        \ drawn a vertical line through both character blocks

                        \ Now to draw the horizontal bar of the gun sights

 LDA #%01110111         \ First we draw the left end of the horizontal bar,
 ORA Row8_Block11_0     \ which is starts with the three rightmost pixels in
 STA Row8_Block11_0     \ block 11 on row 8

 SEC                    \ Set the C flag for the subtraction below

 LDY #136               \ The rest of the line is made up of 17 character blocks
                        \ with four pixels in each block, so we set a counter in
                        \ Y to work as an offset from the left end of the line,
                        \ counting 8 bytes per character block (17 * 8 = 136),
                        \ working from the right end of the line to the left

.guns5

 LDA #%11111111         \ Draw a horizontal bar of four pixels starting at the
 STA Row8_Block11_0,Y   \ Y-th offset from the start of block 11 on row 8

 TYA                    \ Set Y = Y - 8, so Y now points to the four pixels to
 SBC #8                 \ the left, as we work or way along the line
 TAY

 BNE guns5              \ Loop back to draw the next four pixels of the line
                        \ until we have drawn the whole horizontal line

                        \ Fall through into ToggleJoystick to check for the
                        \ joystick key

\ ******************************************************************************
\
\       Name: ToggleJoystick
\       Type: Subroutine
\   Category: 
\    Summary: Toggle the joystick setting
\
\ ------------------------------------------------------------------------------
\
\ Note that the game uses Row29_Block20_4 to check the joystick status, so it
\ is not only an on-screen indicator, it's also the joystick status variable.
\
\ ******************************************************************************

.ToggleJoystick

 LDX #&9F               \ Scan the keyboard to see if TAB is being pressed
 JSR ScanKeyboard

 BNE tjoy1              \ If TAB is not being pressed, jump to tjoy1

 LDA PressingTab        \ If PressingTab is non-zero, then we are still pressing
 BNE tjoy3              \ TAB from a previous visit to this routine, so jump to
                        \ tjoy3 to return from the subroutine

                        \ This is a new press of TAB, so now we want to toggle
                        \ the joystick setting

 LDA Row29_Block20_4    \ Toggle the joystick indicator pixel above the middle
 EOR #%10001000         \ of the rudder indicator
 STA Row29_Block20_4

 LDA #128               \ Set A = 128 to use as the value for PressingTab below,
                        \ to indicate that TAB is being pressed

 BNE tjoy2              \ Jump to tjoy2 to skip the following instruction (this
                        \ BNE is effectively a JMP as A is never zero)

.tjoy1

 LDA #0                 \ If we get here then TAB is not being pressed, so we set
                        \ A = 0 to set as the value for PressingTab

.tjoy2

 STA PressingTab        \ Set PressingTab to the value in A, which will be 0 if
                        \ TAB is not being pressed, or 128 if it is being
                        \ pressed

.tjoy3

 RTS                    \ Return from the subroutine

 EQUB &8D               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: Envelopes
\       Type: Variable
\   Category: Sound
\    Summary: Data for two sound Envelopes
\
\ ------------------------------------------------------------------------------
\
\ There are two sound envelopes defined in Aviator.
\
\   * Envelope 1 defines the engine sound. The third, fourth and fifth values
\     (Envelopes+2, Envelopes+3 and Envelopes+4) control the choppiness of the
\     engine sound and get altered by the MakeEngineSound routine, depending on
\     the thrust and airspeed. These values control the change of pitch per step
\     in the three stages of the sound envelope, so higher values make the sound
\     jump up and down more in terms of pitch, which makes the sound more
\     choppy and less smooth.
\
\   * Envelope 2 defines the sound of gunfire, both for our Spitfire and for the
\     Theme aliens.
\
\ ******************************************************************************

.Envelopes

 EQUB 1, 1, 50, -50, 50, 1, 2, 1, 0, 0, 0, 0, 0, 0

 EQUB 2, 1, -5, 0, 0, 10, 0, 0, 120, -1, -24, -10, 120, 116

\ ******************************************************************************
\
\       Name: Sounds
\       Type: Variable
\   Category: Sound
\    Summary: OSWORD blocks for making the various game sounds
\
\ ------------------------------------------------------------------------------
\
\ Sound data. To make a sound, the MakeSound passes the bytes in this table to
\ OSWORD 7. These bytes are the OSWORD equivalents of the parameters passed to
\ the SOUND keyword in BASIC. The parameters have these meanings:
\
\   channel/flush, amplitude (or envelope number if 1-4), pitch, duration
\
\ where each value consists of two bytes, with the low byte first and the high
\ byte second.
\
\ For the channel/flush parameter, the first byte is the channel while the
\ second is the flush control (where a flush control of 0 queues the sound,
\ while a flush control of 1 makes the sound instantly). When written in
\ hexadecimal, the first figure gives the flush control, while the second is
\ the channel (so &13 indicates flush control = 1 and channel = 3).
\
\ So when we call MakeSound with A = 5 to make sound #5, this is what the
\ routine effectively does:
\
\   SOUND &10, -13, 4, 12
\
\ which makes a sound with flush control 1 on channel 0, and with amplitude -13,
\ pitch 4 and duration 12. Meanwhile, sound #2 is like this:
\
\   SOUND &13, 2, 220, 2
\
\ which makes a sound with flush control 1 on channel 3, using envelope 2,
\ and with pitch 220 and duration 2. The two sound envelopes (1 and 2) are set
\ up by the DefineEnvelope routine.
\
\ ******************************************************************************

.Sounds

 EQUB &10, &00          \ Sound #0: Stop engine sound  (SOUND &10, 0, 0, 0)
 EQUB &00, &00
 EQUB &00, &00
 EQUB &00, &00

 EQUB &10, &00          \ Sound #1: Engine amplitude (SOUND &10, -5, 3, 255)
 EQUB &FB, &FF          \ 
 EQUB &03, &00          \ Second parameter (Sounds+10) gets changed in the
 EQUB &FF, &00          \ VolumeKeys routine to alter the volume

 EQUB &13, &00          \ Sound #2: Theme gunfire ??? (SOUND &13, 2, 220, 2)
 EQUB &02, &00          \
 EQUB &DC, &00          \ Uses sound envelope 2
 EQUB &02, &00

 EQUB &13, &00          \ Sound #3: Long, medium beep (SOUND &13, -15, 120, 7)
 EQUB &F1, &FF
 EQUB &78, &00
 EQUB &07, &00

 EQUB &13, &00          \ Sound #4: Short, low beep (SOUND &13, -12, 0, 1)
 EQUB &F4, &FF
 EQUB &00, &00
 EQUB &01, &00

 EQUB &10, &00          \ Sound #5: Crash (SOUND &10, -13, 4, 12)
 EQUB &F3, &FF
 EQUB &04, &00
 EQUB &0C, &00

 EQUB &13, &00          \ Sound #6: Our gunfire (SOUND &13, 2, 60, 2)
 EQUB &02, &00
 EQUB &3C, &00
 EQUB &02, &00

 EQUB &11, &00          \ Sound #7: Engine pitch (SOUND &11, 1, 255, 255)
 EQUB &01, &00          \
 EQUB &FF, &00          \ Uses sound envelope 1 
 EQUB &FF, &00          \
                        \ The fifth byte (Sounds+60) is the low byte of the
                        \ sound's pitch and gets changed in various places
                        \ to change the pitch of the engine sound

\ ******************************************************************************
\
\       Name: PrintTooLate
\       Type: Subroutine
\   Category: Text
\    Summary: Print the "TOO LATE!" message at column 6, row 7 on-screen
\
\ ******************************************************************************

.PrintTooLate

 LDX #11                \ There are 11 VDU characters in the message, so set up
                        \ a counter in X

.late1

 LDA TooLateText,X      \ Print the X-th character from PleaseWaitText
 JSR OSWRCH

 DEX                    \ Decrement the loop counter, as the characters are
                        \ stored backwards in the PleaseWaitText variable

 BPL late1              \ Loop back to print the next character until we have
                        \ printed all 11

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: TooLateText
\       Type: Variable
\   Category: Text
\    Summary: The "TOO LATE!" message shown when the aliens land in Acornville
\
\ ------------------------------------------------------------------------------
\
\ The text and VDU codes in this variable are stored backwards, perhaps to
\ discourage hackers from working out how to cheat.
\
\ ******************************************************************************

.TooLateText

 EQUB "!ETAL OOT"       \ "TOO LATE!", stored backwards

 EQUB 7, 6, 31          \ VDU 31, 6, 7 moves the text cursor to column 6, row 7

\ ******************************************************************************
\
\       Name: XLookupLo
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel x-coordinate to low byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ See XLookupHi for an explanation of this table.
\
\ ******************************************************************************

.XLookupLo

FOR I%, 0, 39

 EQUB LO(I% * 8)

NEXT

\ ******************************************************************************
\
\       Name: XLookupHi
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel x-coordinate to high byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ Each character block contains 8 bytes, so this lookup table lets us convert a
\ pixel x-coordinate to a 16-bit address offset from the beginning of the
\ character row. We could achieve the same effect by simply multiplying the
\ pixel x-coordinate by 8, but using a lookup table is quicker than doing the
\ multiplication.
\
\ ******************************************************************************

.XLookupHi

FOR I%, 0, 39

 EQUB HI(I% * 8)

NEXT


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
\ KeyTable1Hi and the low byte from KeyTable1Lo.
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
\ set to the 16-bit value, with the high byte coming from KeyTable2Hi and the
\ low byte from KeyTable2Lo.
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
\       Name: AxisChangeRate
\       Type: Variable
\   Category: Flight
\    Summary: Stores the amount by which the three axes of movement change when
\             the aileron, elevator or rudder are moved
\
\ ------------------------------------------------------------------------------
\
\ If an axis control key is held down (e.g. dive, yaw left, roll right and so
\ on), then it will change that axis value by 1 in the relevant direction (by
\ updating Elevator, Rudder or Aileron). If the key is held down, then after six
\ calls to ApplyFlightKeys without the key being released, the relevant control
\ is fully engaged, and the rate of change increases to 4 in the relevant
\ direction.
\
\ ******************************************************************************

.AxisChangeRate

 EQUB 0                 \ The rate of change of the elevator (pitch)
 EQUB 0                 \ The rate of change of the rudder (yaw)
 EQUB 0                 \ The rate of change of the aileron (roll)

 EQUB 0

\ ******************************************************************************
\
\       Name: KeyTable2Lo
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

.KeyTable2Lo

 EQUB 1                 \ <         Elevator (stick backwards, ascend)
 EQUB 1                 \ +         Right rudder
 EQUB 1                 \ D         Aileron (joystick right, bank right)
 EQUB 15                \ E         Increase throttle
 EQUB 7                 \ B         Brakes on/off
 EQUB 8                 \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: KeyTable2Hi
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

.KeyTable2Hi

 EQUB 1                 \ <         Elevator (stick backwards, ascend)
 EQUB 1                 \ +         Right rudder
 EQUB 1                 \ D         Aileron (joystick right, bank right)
 EQUB 0                 \ E         Increase throttle
 EQUB 0                 \ B         Brakes on/off
 EQUB 0                 \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: KeyTable1Lo
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

.KeyTable1Lo

 EQUB 1                 \ L         Elevator (stick forwards, dive)
 EQUB 1                 \ A         Left rudder
 EQUB 1                 \ S         Aileron (joystick left, bank left)
 EQUB 241               \ W         Decrease throttle
 EQUB 4                 \ U         Undercarriage up/down
 EQUB 5                 \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: KeyTable1Hi
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

.KeyTable1Hi

 EQUB 255               \ L         Elevator (stick forwards, dive)
 EQUB 255               \ A         Left rudder
 EQUB 255               \ S         Aileron (joystick left, bank left)
 EQUB 255               \ W         Decrease throttle
 EQUB 0                 \ U         Undercarriage up/down
 EQUB 0                 \ F         Flaps on/off

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
\ Goes up by 20 if engine is on
\ Goes down by 20 if engine is switched off
\ Is this acceleration? Drag factor?

 EQUB &16               \ Set to 198 in Reset
 EQUB &28

.L4F87

 EQUB 152               \ Zeroed in Reset
                        \ Set to 5 if flaps are off, 152 if they are on

 EQUB &00, &00, &FF, &8D, &BE, &00, &05
 EQUB &7D, &FF, &50

.DialQuadrant

                        \ The value range of a quadrant in each indicator

 EQUB 18                \ Centre value for indicator 0 (compass)
 EQUB 22                \ Centre value for indicator 1 (airspeed)
 EQUB 16                \ Centre value for indicator 2 (altimeter small)
 EQUB 26                \ Centre value for indicator 3 (altimeter large)
 EQUB 22                \ Centre value for indicator 4 (vertical speed)
 EQUB 26                \ Centre value for indicator 5 (turn)
 EQUB 26                \ Centre value for indicator 6 (slip)

 EQUB &41

.XDeltaMax

                        \ The maximum x-delta for the hand in each indicator

 EQUB 7                 \ Maximum x-delta for indicator 0 (compass)
 EQUB 9                 \ Maximum x-delta for indicator 1 (airspeed)
 EQUB 5                 \ Maximum x-delta for indicator 2 (altimeter small)
 EQUB 10                \ Maximum x-delta for indicator 3 (altimeter large)
 EQUB 8                 \ Maximum x-delta for indicator 4 (vertical speed)
 EQUB 9                 \ Maximum x-delta for indicator 5 (turn)
 EQUB 9                 \ Maximum x-delta for indicator 6 (slip)

 EQUB &0D

.YDeltaMax

                        \ The maximum y-delta for the hand in each indicator

 EQUB 12                \ Maximum y-delta for indicator 0 (compass)
 EQUB 10                \ Maximum y-delta for indicator 1 (airspeed)
 EQUB 10                \ Maximum y-delta for indicator 2 (altimeter small)
 EQUB 14                \ Maximum y-delta for indicator 3 (altimeter large)
 EQUB 12                \ Maximum y-delta for indicator 4 (vertical speed)
 EQUB 14                \ Maximum y-delta for indicator 5 (turn)
 EQUB 14                \ Maximum y-delta for indicator 6 (slip)

 EQUB &20

.IndicatorLineI

                        \ Storage for the x-coordinate of the starting point of
                        \ of the current hand on indicators 0-7, so we can erase
                        \ it again (this value matches the value of I passed to
                        \ DrawVectorLine)

 EQUB 54                \ Start x-coordinate for indicator 0 (compass)
 EQUB 21                \ Start x-coordinate for indicator 1 (airspeed)
 EQUB 22                \ Start x-coordinate for indicator 2 (altimeter small)
 EQUB 22                \ Start x-coordinate for indicator 3 (altimeter large)
 EQUB 106               \ Start x-coordinate for indicator 4 (vertical speed)
 EQUB 106               \ Start x-coordinate for indicator 5 (turn)
 EQUB 106               \ Start x-coordinate for indicator 6 (slip)
 EQUB 84                \ Start x-coordinate for indicator 7 (horizon)

.IndicatorLineJ

                        \ Storage for the y-coordinate of the starting point of
                        \ of the current hand on indicators 0-6, so we can erase
                        \ it again (this value matches the value of J passed to
                        \ DrawVectorLine and is relative to the top of the
                        \ dashboard at screen y-coordinate 160)

 EQUB -72               \ Start y-coordinate for indicator 0 (compass)
 EQUB -23               \ Start y-coordinate for indicator 1 (airspeed)
 EQUB -68               \ Start y-coordinate for indicator 2 (altimeter small)
 EQUB -68               \ Start y-coordinate for indicator 3 (altimeter large)
 EQUB -24               \ Start y-coordinate for indicator 4 (vertical speed)
 EQUB -70               \ Start y-coordinate for indicator 5 (turn)
 EQUB -70               \ Start y-coordinate for indicator 6 (slip)

                        \ Storage for the y-coordinate of the starting point of
                        \ of the current artificial horizon on indicator 7, so
                        \ we can erase it again (this value matches the value of
                        \ H passed to DrawVectorLine)

 EQUB 88                \ Start y-coordinate for indicator 7 (horizon) ???

.IndicatorBase

 EQUB 0                 \ Base value for indicator 0 (compass)
 EQUB 48                \ Base value for indicator 1 (airspeed)
 EQUB 0                 \ Base value for indicator 2 (altimeter small)
 EQUB 0                 \ Base value for indicator 3 (altimeter large)
 EQUB 67                \ Base value for indicator 4 (vertical speed)
 EQUB 53                \ Base value for indicator 5 (turn)
 EQUB 106               \ Base value for indicator 6 (slip)

 EQUB &4C

.IndicatorMin

 EQUB 0                 \ Minimum value shown on indicator 0 (compass)
 EQUB 57                \ Minimum value shown on indicator 1 (airspeed)
 EQUB 0                 \ Minimum value shown on indicator 2 (altimeter small)
 EQUB 0                 \ Minimum value shown on indicator 3 (altimeter large)
 EQUB 30                \ Minimum value shown on indicator 4 (vertical speed)
 EQUB 33                \ Minimum value shown on indicator 5 (turn)
 EQUB 91                \ Minimum value shown on indicator 6 (slip)

 EQUB &F4

.IndicatorMax

 EQUB 255               \ Maximum value shown on indicator 0 (compass)
 EQUB 122               \ Maximum value shown on indicator 1 (airspeed)
 EQUB 255               \ Maximum value shown on indicator 2 (altimeter small)
 EQUB 255               \ Maximum value shown on indicator 3 (altimeter large)
 EQUB 104               \ Maximum value shown on indicator 4 (vertical speed)
 EQUB 72                \ Maximum value shown on indicator 5 (turn)
 EQUB 120               \ Maximum value shown on indicator 6 (slip)

 EQUB &4C

.IndicatorLineT

                        \ Storage for the x-delta of the current line on
                        \ indicators 0-7, so we can erase it again (this value
                        \ matches the value of T passed to DrawVectorLine)

 EQUB 2                 \ Line x-delta for indicator 0 (compass)
 EQUB 2                 \ Line x-delta for indicator 1 (airspeed)
 EQUB 2                 \ Line x-delta for indicator 2 (altimeter small)
 EQUB 2                 \ Line x-delta for indicator 3 (altimeter large)
 EQUB 2                 \ Line x-delta for indicator 4 (vertical speed)
 EQUB 2                 \ Line x-delta for indicator 5 (turn)
 EQUB 2                 \ Line x-delta for indicator 6 (slip)
 EQUB 2                 \ Line x-delta for indicator 7 (artificial horizon)

.IndicatorLineU

                        \ Storage for the y-delta of the current line on
                        \ indicators 0-7, so we can erase it again (this value
                        \ matches the value of U passed to DrawVectorLine)

 EQUB 2                 \ Line y-delta for indicator 0 (compass)
 EQUB 2                 \ Line y-delta for indicator 1 (airspeed)
 EQUB 2                 \ Line y-delta for indicator 2 (altimeter small)
 EQUB 2                 \ Line y-delta for indicator 3 (altimeter large)
 EQUB 2                 \ Line y-delta for indicator 4 (vertical speed)
 EQUB 2                 \ Line y-delta for indicator 5 (turn)
 EQUB 2                 \ Line y-delta for indicator 6 (slip)
 EQUB 2                 \ Line y-delta for indicator 7 (artificial horizon)

.IndicatorLineV

                        \ Storage for the direction of the current line on
                        \ indicators 0-7, so we can erase it again (this value
                        \ matches the value of V passed to DrawVectorLine)

 EQUB 2                 \ Direction for indicator 0 (compass)
 EQUB 2                 \ Direction for indicator 1 (airspeed)
 EQUB 0                 \ Direction for indicator 2 (altimeter small)
 EQUB 0                 \ Direction for indicator 3 (altimeter large)
 EQUB 0                 \ Direction for indicator 4 (vertical speed)
 EQUB 0                 \ Direction for indicator 5 (turn)
 EQUB 0                 \ Direction for indicator 6 (slip)
 EQUB 0                 \ Direction for indicator 7 (artificial horizon)

.JoyYC

 EQUB 0                 \ Temporary storage, typically used for storing
                        \ y-coordinates when drawing indicators
 
 EQUB 0                 \ The y-coordinate of the top of the current vertical
                        \ bar for indicator 9 (rudder), so we can erase it when
                        \ required

.JoyXC

 EQUB 0                 \ Temporary storage, typically used for storing
                        \ x-coordinates when drawing indicators

 EQUB 0                 \ The y-coordinate of the top of the current vertical
                        \ bar for indicator 11 (thrust), so we can erase it when
                        \ requird

 EQUB &4D, &0D, &0C, &08, &15, &20
 EQUB &20, &20, &20, &20, &20, &4C

.Indicator0To6

 EQUB &44               \ The first indicator counter, which cycles through
                        \ indicators 0 to 6, and is used to denote the first
                        \ indicator that gets refreshed in UpdateDashboard

.Indicator7To11

 EQUB &59               \ The first indicator counter, which cycles through
                        \ indicators 7 to 10, and is used to denote the second
                        \ indicator that gets refreshed in UpdateDashboard

.JC

 EQUB &23               \ Temporary storage, typically used to store coordinates
                        \ when drawing the crosses on the joystick position
                        \ display

 EQUB &31, &3A

.AltitudeMinutes

 EQUB &4C               \ The value of the altimeter's large "minute" hand,
                        \ in the range 0 to 104 to match the 1,000 feet range
                        \ of the large hand

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
 STA Slip
 LDA L
 BNE L5099

 JMP L5151

.L5099

 LDX #0
 LDY #0
 LDA AirspeedHi
 BMI L50B1

 BNE L50AB

 LDA AirspeedLo
 CMP #&14
 BCC L50B1

.L50AB

 LDY Rudder
 BPL L50B1

 DEX

.L50B1

 STY TurnLo
 TXA
 LDX #1

.L50B7

 ASL TurnLo
 ROL A
 DEX
 BPL L50B7

 STA TurnHi
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

 LDX AirspeedHi
 BMI L5113

 BNE L5115

 LDX AirspeedLo
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
 STX Slip
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

 LDA #7                 \ Make the engine sound
 JSR ToggleEngineSound

 JSR L5670

 JSR L31AC

 LDA FuelLevel
 BEQ L51D1

 LDA Engine
 BEQ L51D6

 LDA ThrustHi
 STA R
 LDA ThrustLo
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

 LDA FuelLevel
 BEQ L51D1

 DEC FuelLevel
 BNE L51D6

.L51D1

 LDA #0                 \ Turn the engine off
 JSR SetEngine

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

 LDA Compass,X
 EOR #&80
 STA Compass,X
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

 LDA AirspeedHi
 CMP #&0B
 BCC L533A

.L5307

 LDA J
 CMP AirspeedHi
 BCC L5347

 BNE L5317

 LDA I
 CMP AirspeedLo
 BCC L5347

.L5317

 LDA AltitudeHi
 BNE L5323

 LDA AltitudeLo
 CMP #&14
 BCC L533A

.L5323

 LDA L4F84
 CMP #&27
 BEQ L533A

 LDA TurnHi
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
 JSR MakeSound

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
 JSR MakeSound

 LDX #4

.L5434

 LDY Lookup42F0,X
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

 LDA Elevator,X
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

 STA Elevator,X

.L552F

 LDA Elevator,X
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
 LDY Elevator,X
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
 LDA AirspeedHi
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

 LDX Engine
 BEQ L5636

 STA H
 STA G
 LDA AirspeedLo
 LDX #3

.L5603

 LSR G
 ROR A
 DEX
 BPL L5603

 STA W
 LDY ThrustHi
 STY R
 LDA ThrustLo
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

 LDA AltitudeHi
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
 CMP AltitudeLo
 BCC L569D

 LDX L
 BEQ L5701

 STA AltitudeLo
 LDX VerticalSpeedHi
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
 SBC AltitudeLo
 LSR A
 CLC
 ADC L0CF0
 STA AltitudeLo
 LDA VerticalSpeedHi
 BPL L5720

 SEC
 LDA #0
 SBC VerticalSpeedLo
 STA VerticalSpeedLo
 LDA #0
 SBC VerticalSpeedHi

.L5720

 STA VerticalSpeedHi
 LSR A
 BNE L573D

 LDA VerticalSpeedLo
 ROR A
 STA R

 LDX Undercarriage      \ If Undercarriage is non-zero, then the undercarriage
 BNE L5739              \ is down, so jump to L5739

                        \ If we get here then the undercarriage is up and
                        \ VerticalSpeedHi / 2 = 0, so we are in the process of
                        \ making a crash landing (or we've pulled up the
                        \ undercarriage when still on the runway)

 DEX                    \ Set Propellor = 255 to denote that the propellor is
 STX Propellor          \ broken, so we can't turn the engine on again

 CMP #&A0
 BCC L5740

.L5739

 CMP #&6E
 BCC L5745

.L573D

 JMP Crash

.L5740

 LDA #0                 \ Turn the engine off
 JSR SetEngine

.L5745

 JSR L564D

 BCC L575A

 LDA R
 STA VerticalSpeedLo
 LDX Undercarriage
 BEQ L575A

 CMP #&50
 BCC L5762

 BCS L573D

.L575A

 LDA #&1A
 JSR MakeSound

 JSR ResetEngineSound

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

 LDA AltitudeLo
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

 LDA AirspeedHi
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
 LDA AltitudeHi
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
\       Name: Entry
\       Type: Subroutine
\   Category: Setup
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
                        \ the DrawCanopy routine, so it ends up at &0D00-&10FF

.entr1    

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

 BNE entr1              \ Loop back until we have copied a whole page of bytes

 NOP                    \ Presumably this contained some kind of copy protection
 NOP                    \ or decryption code that has been replaced by NOPs in
 NOP                    \ this unprotected version of the game
 NOP
 NOP
 NOP
 NOP

 JMP SetupScreen        \ Jump to the routine that we just moved to &0B00 to
                        \ set up the screen and continue the setup process

\ ******************************************************************************
\
\ Save AVIA.bin
\
\ ******************************************************************************

\ Code between &0D00 and &1100 starts out at &5800 before being moved
COPYBLOCK &0D00, &1100, &5800

\ Code between &0B00 and &CFF starts out at &5C00 before being moved
COPYBLOCK &0B00, &0D00, &5C00

SAVE "3-assembled-output/AVIA.bin", CODE%, P%

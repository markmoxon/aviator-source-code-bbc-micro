\ ******************************************************************************
\
\ AVIATOR SOURCE
\
\ Aviator was written by Geoffrey J Crammond and is copyright Acornsoft 1983
\
\ The code on this site has been disassembled from the original game discs
\
\ The commentary is copyright Mark Moxon, and any misunderstandings or mistakes
\ in the documentation are entirely my fault
\
\ The terminology and notations used in this commentary are explained at
\ https://www.bbcelite.com/about_site/terminology_used_in_this_commentary.html
\
\ The deep dive articles referred to in this commentary can be found at
\ https://aviator.bbcelite.com/deep_dives
\
\ ------------------------------------------------------------------------------
\
\ This source file produces the following binary file:
\
\   * AVIA.bin
\
\ ******************************************************************************

GUARD &6000             \ Guard against assembling over screen memory

\ ******************************************************************************
\
\ Configuration variables
\
\ ******************************************************************************

LOAD% = &1100           \ The load address of the main code binary

CODE% = &0B00           \ The address of the main game code once the code has
                        \ been rearranged. The code starts off at &1100-&5EFF
                        \ and is moved in three stages:
                        \
                        \   * &5800-&5BFF is copied to &0400-&07FF
                        \   * &5C00-&5DFF is copied to &0B00-&0CFF
                        \   * &0400-&07FF is copied to &0D00-&10FF
                        \
                        \ This address points to the start of the executable
                        \ code after all these moves, which is at &0B00

                        \ The following configuration variables represent screen
                        \ addresses, with names in the following format:
                        \
                        \   row1_block2_3 = Row 1, block 2, byte 3
                        \
                        \ The first batch refers to screen addresses in the
                        \ canopy (character rows 0 to 19)

row1_block1_0 = &5948   \ Second block on second row
row1_block38_0 = &5A68  \ Last block but one on second row
row1_block39_0 = &5A70  \ Last block on second row

row3_block1_0 = &5BC8   \ Top-left corner of the on-screen score display

row6_block1_0 = &5F88   \ Top-left corner of the canopy-wide rectangle
                        \ containing the gun sights on rows 6, 7 and 8

row6_block20_0 = &6020  \ Top block of the vertical line in the gun sights
row7_block20_0 = &6160  \ Bottom block of the vertical line in the gun sights
row8_block11_0 = &6258  \ Left end of horizontal bar in the gun sights

                        \ The second batch refers to screen addresses in the
                        \ dashboard (character rows 20 to 31)

row21_block20_7 = &72E7 \ Top block of joystick position display y-axis
row22_block20_7 = &7427 \ Second block of joystick position display y-axis
row23_block20_7 = &7567 \ Third block of joystick position display y-axis
row24_block20_7 = &76A7 \ Fourth block of joystick position display y-axis and
                        \ right-middle block of joystick position display x-axis
row25_block20_7 = &77E7 \ Fifth block of joystick position display y-axis
row26_block20_7 = &7927 \ Sixth block of joystick position display y-axis
row27_block20_7 = &7A67 \ Bottom block of joystick position display y-axis

row24_block18_7 = &7697 \ Left block of joystick position display x-axis
row24_block19_7 = &769F \ Left-middle block of joystick position display x-axis
row24_block21_7 = &76AF \ Right block of joystick position display x-axis

row23_block12_4 = &7524 \ Left block of artificial horizon centre marker
row23_block13_2 = &752A \ Middle block of artificial horizon centre marker
row23_block14_4 = &7534 \ Right block of artificial horizon centre marker
row25_block13_1 = &77A9 \ Bottom middle block of artificial horizon

row25_block34_7 = &7857 \ Left spur of the radar's cross
row25_block35_6 = &785E \ Bottom pixel of the top spur of the radar's cross
row25_block35_7 = &785F \ Centre and right spur of the radar's cross
row26_block35_0 = &7998 \ Top pixel of the bottom spur of the radar's cross
row26_block35_1 = &7999 \ Bottom pixel of the bottom spur of the radar's cross

row28_block26_5 = &7BD5 \ Centre block of the slip-and-turn indicator

row29_block20_4 = &7CE4 \ Joystick indicator block (above middle of rudder)

row30_block0_2 = &7D82  \ Theme indicator
row30_block32_2 = &7E82 \ Undercarriage indicator
row30_block35_2 = &7E9A \ Flaps indicator
row30_block37_2 = &7EAA \ Brakes indicator

VIA = &FE00             \ Memory-mapped space for accessing internal hardware,
                        \ such as the video ULA, 6845 CRTC and 6522 VIAs (also
                        \ known as SHEILA)

OSBYTE = &FFF4          \ The address for the OSBYTE routine
OSWORD = &FFF1          \ The address for the OSWORD routine
OSWRCH = &FFEE          \ The address for the OSWRCH routine
OSCLI = &FFF7           \ The address for the OSCLI routine

\ ******************************************************************************
\
\       Name: Zero page
\       Type: Workspace
\    Address: &0070 to &008F
\   Category: Workspaces
\    Summary: Mainly temporary variables that are used a lot
\
\ ******************************************************************************

ORG &0070

.P

 SKIP 1                 \ Temporary storage, used in a number of places

.Q

 SKIP 1                 \ Temporary storage, used in a number of places
                        \
                        \ This is called DTIP in the original source code

.R

 SKIP 1                 \ Temporary storage, used in a number of places

.S

 SKIP 1                 \ Temporary storage, used in a number of places

.T

 SKIP 1                 \ Temporary storage, used in a number of places

.U

 SKIP 1                 \ Temporary storage, used in a number of places

.V

 SKIP 1                 \ Temporary storage, used in a number of places

.W

 SKIP 1                 \ Temporary storage, used in a number of places

.G

 SKIP 1                 \ Temporary storage, used in a number of places

.H

 SKIP 1                 \ Temporary storage, used in a number of places

.I

 SKIP 1                 \ Temporary storage, used in a number of places

.J

 SKIP 1                 \ Temporary storage, used in a number of places

.K

 SKIP 1                 \ Temporary storage, used in a number of places

.L

 SKIP 1                 \ Temporary storage, used in a number of places

.M

 SKIP 1                 \ Temporary storage, used in a number of places

.N

 SKIP 1                 \ Temporary storage, used in a number of places

.PP

 SKIP 1                 \ Temporary storage, used in a number of places

.QQ

 SKIP 1                 \ Temporary storage, used in a number of places

.RR

 SKIP 1                 \ Temporary storage, used in a number of places

.SS

 SKIP 1                 \ Temporary storage, used in a number of places

.TT

 SKIP 1                 \ Temporary storage, used in a number of places

.UU

 SKIP 1                 \ Temporary storage, used in a number of places

.VV

 SKIP 1                 \ Temporary storage, used in a number of places

.WW

 SKIP 1                 \ Temporary storage, used in a number of places

.GG

 SKIP 1                 \ Temporary storage, used in a number of places
                        \
                        \ This is called PP in the original source code

.HH

 SKIP 1                 \ Temporary storage, used in a number of places

.linesToShowEnd

 SKIP 1                 \ The index of the first empty entry in the linesToShow
                        \ list
                        \
                        \ Set to 0 in ResetLineLists

.lineId

 SKIP 1                 \ The line ID, used to pass lines to routines
                        \
                        \ Line 0 is the horizon
                        \ Lines 1-11 are the runway
                        \ Lines 12-15 are bullets

.lineCounter

 SKIP 1                 \ Temporary storage, typically used to loop through
                        \ lines

.linesToShowPointer

 SKIP 1                 \ A pointer into the linesToShow list to keep track of
                        \ where we have processed up to
                        \
                        \ Set to 255 in ResetLineLists

.linesToHidePointer

 SKIP 1                 \ A pointer into the linesToHide list to keep track of
                        \ where we have processed up to
                        \
                        \ Set to 255 in ResetLineLists

.linesToHideEnd

 SKIP 1                 \ The index of the last entry in the linesToHide list
                        \
                        \ Set to 255 in ResetLineLists

\ ******************************************************************************
\
\       Name: Page 1 variables
\       Type: Workspace
\    Address: &0100 to &0175
\   Category: Workspaces
\    Summary: Variables that share page 1 with the stack
\
\ ******************************************************************************

ORG &0100

.lineBufferU

 SKIP 96                \ Line buffer storage for the line's |y-delta| (U)
                        \
                        \ Stores information about lines that are drawn
                        \ on-screen, so they can be quickly erased without
                        \ having to spend precious time recalculating the line
                        \ coordinates. The information is stored when a line is
                        \ drawn by the DrawClippedLine routine, and is read by
                        \ the EraseCanopyLines routine when the line is erased

ORG &0160

.L0160

 SKIP 1

.L0161

 SKIP 1

.L0162

 SKIP 1

.L0163

 SKIP 1

.L0164

 SKIP 1

.L0165

 SKIP 1

ORG &0170

.L0170

 SKIP 1

.L0171

 SKIP 1

.L0172

 SKIP 1

.L0173

 SKIP 1

.L0174

 SKIP 1

.L0175

 SKIP 1

\ ******************************************************************************
\
\       Name: Non-zero page variables (block 1)
\       Type: Workspace
\    Address: &0400 to &07FF
\   Category: Workspaces
\    Summary: The main block of game variables
\
\ ******************************************************************************

ORG &0400

.pointStatus

 SKIP 216               \ Each point's status byte
                        \
                        \   * Bit 0:
                        \
                        \     * 0 = we have not yet projected this point
                        \
                        \     * 1 = we have already projected this point
                        \
                        \   * Bit 2:
                        \
                        \     * 0 = yPoint is positive
                        \
                        \     * 1 = yPoint is negative
                        \
                        \   * Bit 3:
                        \
                        \     * 0 = xPoint is positive
                        \
                        \     * 1 = xPoint is negative
                        \
                        \   * Bit 4:
                        \
                        \     * 0 = |yPoint| * 2 < |zPoint|
                        \
                        \     * 1 = |yPoint| * 2 >= |zPoint|
                        \
                        \   * Bit 5:
                        \
                        \     * 0 = |xPoint| < |zPoint|
                        \
                        \     * 1 = |xPoint| >= |zPoint|
                        \
                        \   * Bit 7:
                        \
                        \     * 0 = the point's coordinates and visibility have
                        \           not been calculated
                        \
                        \     * 1 = the point's coordinates and visibility have
                        \           already been calculated
                        \
                        \ Zeroed in ResetVariables

.objectStatus

 SKIP 40                \ Each object's status byte
                        \
                        \   * Bit 6:
                        \
                        \     * 0 = the object's coordinates and visibility have
                        \           not been calculated in this iteration of the
                        \           main loop
                        \
                        \     * 1 = the object's coordinates and visibility have
                        \           already been calculated in this iteration of
                        \           the main loop
                        \
                        \   * Bit 7:
                        \
                        \     * 0 = the object is not visible
                        \
                        \     * 1 = the object is visible
                        \
                        \ Zeroed in ResetVariables and in part 2 of the main
                        \ loop

.linesToShow

 SKIP 200               \ A list of line IDs for lines that are visible

.relatedPoints

 SKIP 56                \ Contains a list, from relatedPoints+1 onwards, with
                        \ the list size in relatedPoints
                        \
                        \ Point IDs get added in part 3 of ProcessLine when
                        \ those points are part of an object - only points
                        \ that we haven't already processed are added
                        \
                        \ Zeroed in ResetVariables

.linesToHide

 SKIP 256               \ A list of line IDs for lines that are not visible

.zPointLo

 SKIP 256               \ The low byte of the z-coordinate for the point with
                        \ ID X is at zPointLo,X

\ ******************************************************************************
\
\       Name: Non-zero page variables (block 2)
\       Type: Workspace
\    Address: &0900 to &0CFF
\   Category: Workspaces
\    Summary: The main block of game variables
\
\ ******************************************************************************

ORG &0900

.xPointLo

 SKIP 256               \ The low byte of the x-coordinate for the point with
                        \ ID X is at xPointLo,X

.yPointLo

 SKIP 256               \ The low byte of the y-coordinate for the point with
                        \ ID X is at yPointLo,X

.yPointHi

 SKIP 256               \ The high byte of the y-coordinate for the point with
                        \ ID X is at yPointHi,X

.L0C00

 SKIP 1

.turnLo

 SKIP 1                 \ Turn rate (low byte)
                        \
                        \ Stored as 35 * the turn rate in 180 degrees per minute
                        \ 
                        \ Shown on indicator 5

.L0C02

 SKIP 1

.L0C03

 SKIP 2

.airspeedLo

 SKIP 1                 \ Air speed (low byte)
                        \
                        \ 100 mph is stored as 9.25 * 256 = 2368
                        \
                        \ so 50 mph  = 0.5 * 2368 = 1184 = (4 160)
                        \ so 70 mph  = 0.7 * 2368 = 1658 = (6 122)
                        \ so 100 mph =   1 * 2368 = 2368 = (9 64)
                        \ so 400 mph =   4 * 2368 = 9472 = (37 00)
                        \
                        \ Shown on indicator 1

.L0C06

 SKIP 2

.L0C08

 SKIP 1

.L0C09

 SKIP 3

.elevatorPosition

 SKIP 1                 \ Elevator position (pitch)
                        \
                        \ Shown on indicator 8 or 10 as the joystick y-position

.rudderPosition

 SKIP 1                 \ Rudder position (yaw)
                        \
                        \ Shown on indicator 9

.aileronPosition

 SKIP 1                 \ Aileron position (roll)
                        \
                        \ Shown on indicator 8 or 10 as the joystick x-position

.thrustLo

 SKIP 1                 \ Thrust (low byte)
                        \
                        \ Thrust is in the range 0 to 1280
                        \
                        \ Shown on indicator 11

.L0C10

 SKIP 1

.turnHi

 SKIP 1                 \ Turn rate (low byte)
                        \
                        \ Stored as 35 * the turn rate in 180 degrees per minute
                        \
                        \ Shown on indicator 5

.L0C12

 SKIP 1

.L0C13

 SKIP 2

.airspeedHi

 SKIP 1                 \ Air speed (high byte)
                        \
                        \ 100 mph is stored as 9.25 * 256 = 2368
                        \
                        \ so 50 mph  = 0.5 * 2368 = 1184 = (4 160)
                        \ so 70 mph  = 0.7 * 2368 = 1658 = (6 122)
                        \ so 100 mph =   1 * 2368 = 2368 = (9 64)
                        \ so 400 mph =   4 * 2368 = 9472 = (37 00)
                        \
                        \ Shown on indicator 1

.L0C16

 SKIP 2

.L0C18

 SKIP 1

.L0C19

 SKIP 6

.thrustHi

 SKIP 1                 \ Thrust (high byte)
                        \
                        \ Thrust is in the range 0 to 1280
                        \
                        \ Shown on indicator 11

.L0C20

 SKIP 6

.L0C26

 SKIP 4

.L0C2A

 SKIP 3

.axisKeyUsage

 SKIP 3                 \ The following locations are updated when keys are
                        \ pressed in UpdateFlightModel:
                        \
                        \   * axisKeyUsage   = elevator
                        \   * axisKeyUsage+1 = rudder
                        \   * axisKeyUsage+2 = aileron
                        \
                        \ In each case, the value is updated by adding the
                        \ relevant keyLoggerLow value, which is 1 in each case,
                        \ so these count up by 1 every time a relevant axis
                        \ control key is pressed (in any direction), so they
                        \ measure "axis control key usage"

.L0C30

 SKIP 2

.L0C32

 SKIP 14

.L0C40

 SKIP 3

.L0C43

 SKIP 2

.L0C45

 SKIP 1

.L0C46

 SKIP 1

.L0C47

 SKIP 3

.L0C4A

 SKIP 6

.L0C50

 SKIP 3

.L0C53

 SKIP 2

.L0C55

 SKIP 1

.L0C56

 SKIP 1

.L0C57

 SKIP 3

.L0C5A

 SKIP 6

.L0C60

 SKIP 3

.L0C63

 SKIP 1

.L0C64

 SKIP 1

.L0C65

 SKIP 1

.L0C66

 SKIP 1

.L0C67

 SKIP 3

.L0C6A

 SKIP 3

.xPlaneTop

 SKIP 1                 \ The top byte of the plane's location, so the byte
                        \ above the high byte in xPlaneHi

.yPlaneTop

 SKIP 1                 \ The top byte of the plane's location, so the byte
                        \ above the high byte in yPlaneHi

.zPlaneTop

 SKIP 1                 \ The top byte of the plane's location, so the byte
                        \ above the high byte in zPlaneHi

.L0C70

 SKIP 3

.L0C73

 SKIP 1

.L0C74

 SKIP 1

.L0C75

 SKIP 1

.L0C76

 SKIP 1

.L0C77

 SKIP 3

.L0C7A

 SKIP 6

.L0C80

 SKIP 2

.L0C82

 SKIP 1

.L0C83

 SKIP 1

.L0C84

 SKIP 2

.L0C86

 SKIP 3

.L0C89

 SKIP 1

.verticalSpeedLo

 SKIP 1                 \ Vertical speed (low byte)
                        \
                        \ Stored as 128/425 * vertical speed in feet per minute,
                        \ so:
                        \
                        \ 1000 feet/minute is stored as 128/425 * 1000 = 301
                        \ 4000 feet/minute is stored as 128/425 * 4000 = 1205
                        \
                        \ Shown on indicator 4

 SKIP 1

.L0C8C

 SKIP 4

.L0C90

 SKIP 2

.L0C92

 SKIP 1

.L0C93

 SKIP 1

.L0C94

 SKIP 2

.L0C96

 SKIP 3

.L0C99

 SKIP 1

.verticalSpeedHi

 SKIP 1                 \ Vertical speed (high byte)
                        \
                        \ Shown on indicator 4

 SKIP 1

.slipRate

 SKIP 1                 \ Slip rate
                        \
                        \ Shown on indicator 6

 SKIP 3

.keyLoggerLow

 SKIP 6                 \ Key logger (low value)
                        \
                        \ Populated with values from keyTable1Lo or keyTable2Lo
                        \ when a key is pressed, or 0 if neither is pressed:
                        \
                        \ L or < (elevator dive/pitch)      =   1 or  1
                        \ A or + (rudder yaw left/right)    =   1 or  1
                        \ S or D (aileron bank left/right)  =   1 or  1
                        \ W or E (throttle down/up)         = -15 or 15
                        \ U or B (undercarriage, brakes)    =   4 or  7
                        \ F or SHIFT (flaps, fire)          =   5 or  8

 SKIP 2

.xTemp2Lo

 SKIP 1

.yTemp2Lo

 SKIP 1

.zTemp2Lo

 SKIP 1

 SKIP 5

.keyLoggerHigh

 SKIP 6                 \ Key logger (high value)
                        \
                        \ Populated with values from keyTable1Hi or keyTable2Hi
                        \ when a key is pressed, or 0 if neither is pressed:
                        \
                        \ L or < (elevator dive/pitch)      = -1 or 1
                        \ A or + (rudder yaw left/right)    = -1 or 1
                        \ S or D (aileron bank left/right)  = -1 or 1
                        \ W or E (throttle down/up)         = -1 or 0
                        \ U or B (undercarriage, brakes)    =  0 or 0
                        \ F or SHIFT (flaps, fire)          =  0 or 0

 SKIP 2

.xTemp2Hi

 SKIP 1

.yTemp2Hi

 SKIP 1

.zTemp2Hi

 SKIP 1

.xTemp2Top

 SKIP 1

.yTemp2Top

 SKIP 1

.zTemp2Top

 SKIP 1

.gunSights

 SKIP 1                 \ Gun sights status
                        \
                        \   * Bit 6 = 1 while "I" is being held down
                        \
                        \   * Bit 7 = 1 when sights are being shown
                        \             0 when sights are not being shown

.isObject

 SKIP 1                 \ Temporary storage, used to store the object ID when we
                        \ check the visibility of an object in ProcessLine and
                        \ call SetObjectCoords to set its coordinates

.pointId

 SKIP 1                 \ Temporary storage, used to store the ID of the current
                        \ point when checking a line's visibility in the
                        \ ProcessLine routine

.maxCoord

 SKIP 1                 \ Temporary storage, used to store the maximum start
                        \ point coordinate when clipping lines

.colourLogic

 SKIP 1                 \ Determines the logic and bit patterns used to draw the
                        \ canopy view:
                        \
                        \   * %00000000 = erase lines
                        \     Gets set to this value after each screen flip
                        \     Sets AND logic for screen writing
                        \     Sets bit patterns to erase the screen
                        \     See EraseCanopyLines
                        \
                        \   * %01000000 when colourCycle is %11110000
                        \     Sets ORA logic for screen writing
                        \     See FlipColours
                        \
                        \   * %10000000 when colourCycle is %00001111
                        \     Sets ORA logic for screen writing
                        \     See ResetLineLists, FlipColours
                        \
                        \ Set to %10000000 for each new game


.colourCycle

 SKIP 1                 \ Determines which of the two canopy screens we are
                        \ showing, so we can use colour cycling for smooth
                        \ animation
                        \
                        \ %00001111 = show colour 1, hide colour 2
                        \ %11110000 = show colour 2, hide colour 1
                        \
                        \ We show a colour by mapping it to white, and hide a
                        \ colour by mapping it to black
                        \
                        \ Set to %00001111 for each new game

.matrixAxis

 SKIP 1                 \ The axis to be processed by the matrix routines
                        \
                        \   * 0 = x-axis
                        \   * 1 = y-axis
                        \   * 2 = z-axis

.onGround

 SKIP 1                 \ "On the ground" status
                        \
                        \   * 0 = we are not on the ground
                        \   * 1 = we are on the ground
                        \
                        \ Set to 1 in ResetVariables (on the ground)

.previousListEnd

 SKIP 1                 \ Used to store the value of linesToHideEnd at the
                        \ start of each iteration of the main loop, so we can
                        \ refer to it at the end of the main loop to see if
                        \ we have added anything to the list during the main
                        \ loop

.startStatus

 SKIP 1                 \ Temporary storage, used to store the point status byte
                        \ for the start point of a projected line

.pointCount

 SKIP 1                 \ Temporary storage, used as a counter in ProcessLine
                        \ to check the start and end points of the line

.pressingT

 SKIP 1                 \ Set to 0 in the main loop if "T" is not being pressed,
                        \ otherwise set to 1, to prevent holding down "T" from
                        \ constantly switching the engine on and off

.showRunwayDashes

 SKIP 1                 \ Determines whether the dashes down the middle of the
                        \ runway are close enough to be visible:
                        \
                        \   * Bit 7:
                        \
                        \     * 0 = the runway dashes are visible
                        \
                        \     * 1 = the runway dashes are not visible

.matrixNumber

 SKIP 1                 \ The matrix used in matrix operations:
                        \
                        \   * 0 = matrix 1
                        \   * 9 = matrix 2
                        \   * 18 = matrix 3
                        \   * 27 = matrix 4

.objectId

 SKIP 1                 \ Temporary storage for an object ID (0 to 39)
                        \
                        \ This is called OB in the original source code

.pressingTab

 SKIP 1                 \ Bit 7 determines whether TAB is being pressed
                        \
                        \   * 0 = not being pressed
                        \
                        \   * 128 = being pressed
                        \
                        \ This value is set in the ToggleJoystick routine

.showLine

 SKIP 1                 \ Determines whether a line is visible:
                        \
                        \   * Bit 6:
                        \
                        \     * 0 = the line fits into Aviator's 3D world
                        \
                        \     * 1 = the line calculations overflowed, so the
                        \           line does not fit into Aviator's 3D world
                        \
                        \   * Bit 7:
                        \
                        \     * 0 = the line is visible
                        \
                        \     * 1 = the line is not visible

.objectAnchorPoint

 SKIP 1                 \ Used to store the anchor point of the current object
                        \
                        \ This is the point to which all the other points in
                        \ the object, i.e. those in xObjectPoint, yObjectPoint
                        \ and zObjectPoint, are relative
                        \
                        \ In other words, this is effectively the object's
                        \ coordinate

.lineBuffer1Count

 SKIP 1                 \ Offset of the last line stored in buffer 1
                        \
                        \   * -1 = buffer 1 is empty
                        \
                        \   * 0 to 46 = buffer 1 contains lineBuffer1Count + 1
                        \               lines but is not full
                        \
                        \   * 47 = buffer 1 is full and contains 48 lines
                        \
                        \ Set to -1 in ResetVariables

.lineBuffer2Count

 SKIP 1                 \ Offset of the last line stored in buffer 2
                        \
                        \   * 47 = buffer 2 is empty
                        \
                        \   * 48 to 94 = buffer 2 contains lineBuffer2Count + 1
                        \                lines but is not full
                        \
                        \   * 95 = buffer 2 is full, contains 48 lines
                        \
                        \ Set to 47 in ResetVariables

.pressingUFBS

 SKIP 5                 \ Determines whether any of the following keys are
                        \ being pressed:
                        \
                        \ pressingUFBS = 1 while the undercarriage key "U" is 
                        \ being pressed, 0 otherwise

                        \ pressingUFBS+1 = 1 while the flaps button "F" is being
                        \ pressed, 0 otherwise

                        \ pressingUFBS+2 is not used

                        \ pressingUFBS+3 = 1 while the brake key "B" is being
                        \ pressed, 0 otherwise

                        \ pressingUFBS+4 = 1 while the fire key SHIFT is being
                        \ pressed, 0 otherwise

.pointsToAward

 SKIP 1                 \ Used to store the points scored from flying skills, so
                        \ they can be added to the score once the task has been
                        \ completed

.scoreDisplayTimer

 SKIP 1                 \ Counter for removing the score after displaying it
                        \ for a fixed amount of time



.gunSoundCounter

 SKIP 1                 \ Counter for the number of firing sounds we make when
                        \ firing our guns (which makes the sound of two shots)


.xTemp3Lo

 SKIP 1

.yTemp3Lo

 SKIP 1

.zTemp3Lo

 SKIP 1

.xTemp3Hi

 SKIP 1

.yTemp3Hi

 SKIP 1

.zTemp3Hi

 SKIP 1

.xTempLo

 SKIP 1

.yTempLo

 SKIP 1

.zTempLo

 SKIP 1

.xTempHi

 SKIP 1

.yTempHi

 SKIP 1

.zTempHi

 SKIP 1

.TC

 SKIP 1                 \ Temporary storage, used as a flag when updating the
                        \ radar, and as a loop counter in the visibility checks

.themeStatus

 SKIP 1                 \ Theme status
                        \
                        \   * Positive (bit 7 = 0) = the Theme is enabled and
                        \     the value is ???
                        \
                        \   * Negative (bit 7 = 1) = the Theme is not enabled
                        \
                        \ Set to 255 (Theme not enabled) in ResetVariables

.landingStatus

 SKIP 1                 \ Our landing status
                        \
                        \ A flag that determines whether we have landed safely
                        \ on the runway, and therefore whether we fill up with
                        \ fuel and so on
                        \
                        \   * Positive = do all the landing-based tasks
                        \                mentioned below
                        \
                        \   * 0 = do not enable the Theme on firing
                        \         do not fill up with fuel
                        \         do not award points for landing
                        \
                        \   * Negative = do not enable the Theme on firing
                        \                do not fill up with fuel
                        \
                        \ Set to 1 in ResetVariables (do all landing tasks)
                        \
                        \ Set to %01000000 when speed is 0 in L50F7
                        \
                        \ Gets shifted left with a 1 inserted in bit 0 in
                        \ CheckLanding if we are not on the runway

.engineStatus

 SKIP 1                 \ Engine status
                        \
                        \   * 0 = engine is off
                        \
                        \   * Non-zero = engine is on

.L0CEA

 SKIP 2                 \ Low byte in (L0CFA L0CEA)

.L0CEC

 SKIP 1                 \ Low byte in (L0CFC L0CEC)

.xPlaneLo

 SKIP 1                 \ Plane longitude/x-coordinate (high byte)
                        \
                        \ Set to &C6E5 in ResetVariables

.yPlaneLo

 SKIP 1                 \ Plane altitude/y-coordinate (high byte)
                        \
                        \ Stored as the altitude in feet x 4
                        \
                        \ Shown on indicator 2
                        \
                        \ Set to (0 10) in ResetVariables

.zPlaneLo

 SKIP 1                 \ Plane latitude/z-coordinate (low byte)
                        \
                        \ Set to &485C in ResetVariables

.L0CF0

 SKIP 1                 \ Set to 5 if undercarriage is up, 10 if it is down in
                        \ IndicatorU

.firingStatus

 SKIP 1                 \ Firing status
                        \
                        \   * 0 = no bullets in the air
                        \
                        \   * Non-zero = guns fired, bullets in the air
                        \
                        \ This is called FRFLAG in the original source code
                        \
                        \ Can't fire guns if this or L368F are non-zero

.ucStatus

 SKIP 1                 \ Undercarriage status
                        \
                        \   * 0 = undercarriage is up
                        \
                        \   * Non-zero = undercarriage is down
                        \
                        \ Set to 1 (undercarriage is down) in ResetVariables
             
.flapsStatus

 SKIP 1                 \ Flaps status
                        \
                        \   * 0 = flaps are off (raised)
                        \   * Non-zero = flaps are on (dropped)
                        \
                        \ Set to 0 (flaps are off) in ResetVariables

 SKIP 1

.brakesStatus

 SKIP 1                 \ Brakes status
                        \
                        \   * 0 = brakes are off
                        \
                        \   * Non-zero = brakes are on
                        \
                        \ Set to 1 (brakes are on) in ResetVariables

 SKIP 1

.propellorStatus

 SKIP 1                 \ Propellor status
                        \
                        \   * 0 = propellor is working
                        \
                        \   * Non-zero = propellor is broken
                        \
                        \ If we make a crash landing with the undercarriage up,
                        \ the propellor breaks and we can't turn the engine on

.L0CF8

 SKIP 1                 \ Set to 10 in ResetVariables

.reached512ft

 SKIP 1                 \ Have we reached 512 feet in altitude since taking off?
                        \
                        \   * 0 = no
                        \
                        \   * Non-zero = yes
                        \
                        \ The height measured is 512 feet, rather than the 500
                        \ feet mentioned in the maunal, as this is set to
                        \ non-zero when the plane's altitude in yPlaneHi >= 2

.L0CFA

 SKIP 1                 \ Set to 7 in ResetVariables
                        \
                        \ High byte in (L0CFA L0CEA)

.compassHeading

 SKIP 1                 \ Direction of the compass (i.e. its heading)
                        \
                        \   * 0 = North
                        \   * 64 = East
                        \   * 128 = South
                        \   * 192 = West
                        \
                        \ Shown on indicator 0

.L0CFC

 SKIP 1                 \ High byte in (L0CFC L0CEC)


.xPlaneHi

 SKIP 1                 \ Plane longitude/x-coordinate (high byte)
                        \
                        \ Set to &C6E5 in ResetVariables

.yPlaneHi

 SKIP 1                 \ Plane altitude/y-coordinate (high byte)
                        \
                        \ Stored as the altitude in feet x 4
                        \
                        \ Shown on indicator 2
                        \
                        \ Set to (0 10) in ResetVariables

.zPlaneHi

 SKIP 1                 \ Plane latitude/z-coordinate (high byte)
                        \
                        \ Set to &485C in ResetVariables

\ ******************************************************************************
\
\ AVIATOR MAIN GAME CODE
\
\ Produces the binary file AVIA.bin that contains the main game code.
\
\ ******************************************************************************

CLEAR &0B00, &0D00      \ Clear the guard on the &0B00-&0CFF workspace so we can
                        \ assemble the loader code into this address range

ORG CODE%

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
                        \ disableCursor, so set up a counter in Y

.sscr1

 LDA disableCursor,Y    \ Write the Y-th value from disableCursor
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
                        \ variable pleaseWaitText, so set up a counter in Y

.sscr2

 LDA pleaseWaitText,Y   \ Print the Y-th character from pleaseWaitText
 JSR OSWRCH

 INY                    \ Increment the loop counter

 CPY #11                \ Loop back to print the next character until we have
 BNE sscr2              \ printed all 11 ("Please wait")

 LDX #LO(loadDashboard) \ Set (Y X) to point to loadDashboard ("L.DASHBD 7100")
 LDY #HI(loadDashboard)

 JSR OSCLI              \ Call OSCLI to run the OS command in loadDashboard,
                        \ which loads the dashboard image into the screen

 LDA #129               \ Call OSBYTE with A = 129, X = &FF and Y = 0 to scan
 LDX #&FF               \ the keyboard for &FF centiseconds (2.56 seconds)
 LDY #0
 JSR OSBYTE

 JMP DrawCanopy         \ Jump down to DrawCanopy to continue the setup process

\ ******************************************************************************
\
\       Name: loadDashboard
\       Type: Variable
\   Category: Setup
\    Summary: The OS command string for loading the dashboard image
\
\ ******************************************************************************

.loadDashboard

 EQUS "L.DASHBD 7100"   \ This is short for "*LOAD DASHBD 7100"
 EQUB 13

\ ******************************************************************************
\
\       Name: disableCursor
\       Type: Variable
\   Category: Setup
\    Summary: The VDU command for disabling the cursor
\
\ ******************************************************************************

.disableCursor

 EQUB 23, 0, 10, 23     \ Set 6845 register R10 = 23
 EQUB 0, 0, 0           \
 EQUB 0, 0, 0           \ This is the "cursor start" register, so this sets the
                        \ cursor start line at 23, effectively disabling the
                        \ cursor

\ ******************************************************************************
\
\       Name: pleaseWaitText
\       Type: Variable
\   Category: Setup
\    Summary: The "Please wait" message shown when the game loads
\
\ ******************************************************************************

.pleaseWaitText

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
                        \ &5800-&5BFF by the Entry routine, so in all we end up
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

 LDA #&58               \ Set (P Q) = &5800, so the call to ClearRows starts
 STA Q                  \ clearing from the start of the first character row
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

 LDA #&58               \ Set (P Q) = &58FF, so the call to ClearRows starts
 STA Q                  \ clearingfrom character block 32 in the first character
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

 LDA #&5A               \ Set (P Q) = &5A7F, so the call to ClearRows starts
 STA Q                  \ clearing from the start of the third character row
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

 LDA #&5B               \ Set (P Q) = &5BB7, so the call to ClearRows starts
 STA Q                  \ clearing from the start of the last character block
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
\ address (P Q) on the first row.
\
\ A value of Y = 0 will zero 256 bytes.
\
\ In other words, (P Q) represents the top-left pixel to blank, Y represents
\ the width of the area to blank (with a value of 8 per character block), and R
\ contains the number of rows to blank.
\
\ Arguments:
\
\   Y                   The width of each character row to zero (in bytes),
\                       0 indicates 256 bytes
\
\   (P Q)               The screen address to start zeroing from
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

 STA (P),Y              \ Zero the Y-th byte of the page at (P Q), which sets 4
                        \ pixels to black

 DEY                    \ Decrement the byte pointer

 BNE clrw2              \ Loop back until we have zeroed (P Q) to (P Q) + Y

 LDA P                  \ Set (P Q) = (P Q) + 320
 CLC                    \
 ADC #LO(320)           \ starting with the low bytes
 STA P

 LDA Q                  \ And then the high bytes
 ADC #HI(320)
 STA Q

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
\       Name: ProjectPoint (Part 1 of 3)
\       Type: Subroutine
\   Category: Maths
\    Summary: Project a point onto the screen (i.e. convert from 3D coordinates
\             to screen coordinates)
\
\ ------------------------------------------------------------------------------
\
\ This routine projects a point in 3D space onto the screen. If the point in 3D
\ space is (xPoint, yPoint, zPoint), then the resulting projection is at pixel
\ coordinate (x, y) on-screen, where:
\
\   x = 80 + 256 * (xPoint / zPoint)
\   y = 96 + 256 * (2 * yPoint / zPoint)
\
\ The result is stored in (xPoint, yPoint), while zPoint is left alone so we can
\ check its sign. The coordinates are all signed 16-bit values.
\
\ Also, various bits are set in the point's status byte. These describe the
\ relationship between the x- and y-coordinates of the point, which we can use
\ to quickly determine whether the line containing this point is on-screen. We
\ also set a bit that records that we have projected this point, so we don't
\ repeat the process during this iteration of the main loop.
\
\ The routine breaks down as follows:
\
\   * Part 1 sets the various bits in the point's status byte
\
\   * Part 2 calculates the divisions by zPoint
\
\   * Part 3 calculates the addition of (80, 96)
\
\ Arguments:
\
\   GG                  The point ID to process
\
\   xPoint+GG           The point's x-coordinate in 3D space
\
\   yPoint+GG           The point's y-coordinate in 3D space
\
\   zPoint+GG           The point's z-coordinate in 3D space
\
\ Returns:
\
\   pointStatus+GG      The following bits are set as follows, so they can be
\                       used in ProcessLinesToShow to determine the visibility
\                       of the line containing this point:
\
\                         * Bit 0:
\
\                           * 0 = we have not projected this point before
\
\                           * 1 = we have already projected this point
\
\                         * Bit 2:
\
\                           * 0 = yPoint is positive
\
\                           * 1 = yPoint is negative
\
\                         * Bit 3:
\
\                           * 0 = xPoint is positive
\
\                           * 1 = xPoint is negative
\
\                         * Bit 4:
\
\                           * 0 = |yPoint| * 2 < |zPoint|
\
\                           * 1 = |yPoint| * 2 >= |zPoint|
\
\                         * Bit 5:
\
\                           * 0 = |xPoint| < |zPoint|
\
\                           * 1 = |xPoint| >= |zPoint|
\
\   xPoint+GG           The pixel x-coordinate of the point, projected onto the
\                       screen
\
\   yPoint+GG           The pixel y-coordinate of the point, projected onto the
\                       screen
\
\ ******************************************************************************

.ProjectPoint

 LDX GG                 \ Set X to the point ID to process

 LDA #0                 \ Set N = 0, which we use for collecting set bits to
 STA N                  \ apply to the point's status byte

 LDA #%00010000         \ Set bit 4 of R, for use in ScaleUp
 STA R

 LDA pointStatus,X      \ Set Y = A = the status byte for the point to process
 TAY

 AND #1                 \ If bit 0 of the status byte is clear, then we have not
 BEQ proj1              \ yet projected this point onto the screen, so jump to
                        \ proj1 to skip the following instruction and move on
                        \ to the projection process

 RTS                    \ Bit 0 of the point's status byte is set, which means
                        \ we have already projected this point, so return from
                        \ the subroutine

.proj1

 TYA                    \ Set bit 0 of the point's status byte in pointStatus
 ORA #1                 \ to indicate that we have now called ProjectPoint for
 STA pointStatus,X      \ this point, i.e. the point has been projected (or soon
                        \ will be, anyway)

                        \ The first step is to set the four bits in the point's
                        \ status byte, which we will return from the subroutine
                        \ to be used in ProcessLinesToShow for determining the
                        \ visibility of the line containing this point

                        \ We first set (Q P) = |zPoint|
                        \
                        \ bumping (Q P) up to 1 if zPoint = 0, so (Q P) has a
                        \ minimum value of 1

 LDA zPointHi,X         \ Set A = the high byte of the point's z-coordinate

 BMI proj4              \ If the z-coordinate is negative, jump to proj4 to
                        \ change its sign

 STA Q                  \ Set Q = the high byte of the point's z-coordinate

 BEQ proj2              \ If the high byte of the z-coordinate is 0, jump to
                        \ proj2

 LDA zPointLo,X         \ Set P = the low byte of the point's z-coordinate, so
 STA P                  \ (Q P) now contains the point's z-coordinate, as
                        \ required

 JMP proj5              \ Jump to proj5 to move on to the point's x-coordinate

.proj2

                        \ If we get here then the high byte of the z-coordinate
                        \ is 0

 LDA zPointLo,X         \ Set A = the low byte of the point's z-coordinate

 BNE proj3              \ If the low byte of the point's z-coordinate is
                        \ non-zero, skip the following instructions

                        \ If we get here then both the high and low bytes of the
                        \ z-coordinate are 0, so zPoint = 0

 LDA #1                 \ Set A = 1 to use as the low byte of (Q P), so we will
                        \ end up with (Q P) = 1, as required

.proj3

 STA P                  \ Set P = the low byte of the point's z-coordinate, or
                        \ 1 if the low byte was zero, so (Q P) now contains
                        \ |zPoint|, with a minimum value of 1, as required

 JMP proj5              \ Jump to proj5 to move on to the point's x-coordinate

.proj4

                        \ If we get here then the high byte of the z-coordinate
                        \ is negative, so now we negate it to make it positive

 LDA #0                 \ Negate zPoint and store it in (Q P), starting with the
 SEC                    \ low bytes
 SBC zPointLo,X
 STA P

 LDA #0                 \ And then the high bytes, so (Q P) now contains the
 SBC zPointHi,X         \ point's z-coordinate made positive, i.e. |zPoint|,
 STA Q                  \ as required

.proj5

                        \ We now set (QQ PP) = |xPoint|

 LDA xPointHi,X         \ Set A = the high byte of the point's x-coordinate

 BMI proj6              \ If the x-coordinate is negative, jump to proj6 to
                        \ change its sign

 STA QQ                 \ Set QQ = the high byte of the point's x-coordinate

 LDA xPointLo,X         \ Set PP = the low byte of the point's x-coordinate, so
 STA PP                 \ so (QQ PP) now contains |xPoint|, as required

 JMP proj7              \ Jump to proj7 to move on to the point's y-coordinate

.proj6

                        \ If we get here then the high byte of the x-coordinate
                        \ is negative, so now we negate it to make it positive

 LDA #0                 \ Negate xPoint and store it in (QQ PP), starting with
 SEC                    \ the low bytes
 SBC xPointLo,X
 STA PP

 LDA #0                 \ And then the high bytes, so (QQ PP) now contains the
 SBC xPointHi,X         \ point's x-coordinate made positive, i.e. |xPoint|,
 STA QQ                 \ as required

 LDA N                  \ Set bit 3 of N (so we set bit 3 of the point's status
 ORA #%00001000         \ byte when we're done) to indicate that xPoint is
 STA N                  \ negative

.proj7

                        \ We now set (SS RR) = |yPoint| * 2

 LDA yPointHi,X         \ Set A = the high byte of the point's y-coordinate

 BMI proj8              \ If the y-coordinate is negative, jump to proj8 to
                        \ change its sign

 STA SS                 \ Set SS = the high byte of the point's y-coordinate

 LDA yPointLo,X         \ Set A = the high byte of the point's y-coordinate, so
                        \ (SS A) now contains |yPoint|

 ASL A                  \ Set (SS RR) = (SS A) * 2
 ROL SS                 \             = |yPoint| * 2
 STA RR

 JMP proj9              \ Jump to proj9 to move on to the next stage

.proj8

                        \ If we get here then the high byte of the y-coordinate
                        \ is negative, so now we negate it to make it positive
                        \ before multiplying by 2

 LDA #0                 \ Negate yPoint and store it in (A RR), starting with
 SEC                    \ the low bytes
 SBC yPointLo,X
 STA RR

 LDA #0                 \ And then the high bytes, so (A RR) now contains the
 SBC yPointHi,X         \ point's y-coordinate made positive, i.e. |yPoint|

 ASL RR                 \ Set (SS RR) = (A RR) * 2
 ROL A                  \             = |yPoint| * 2
 STA SS

 LDA N                  \ Set bit 2 of N (so we set bit 2 of the point's status
 ORA #%00000100         \ byte when we're done) to indicate that yPoint is
 STA N                  \ negative

.proj9

                        \ We now set bit 5 of the status byte in N by comparing
                        \ the |xPoint| and |zPoint| values we just calculated

 LDA QQ                 \ If QQ < Q, jump to proj11 to leave bit 5 clear
 CMP Q
 BCC proj11

 BNE proj10             \ If QQ > Q, jump to proj10 to set bit 5

                        \ If we get here then QQ = Q

 LDA PP                 \ If PP < P, jump to proj11 to leave bit 5 clear
 CMP P
 BCC proj11

.proj10

                        \ If we get here then QQ = Q and PP >= P, which means
                        \ (QQ PP) >= (Q P), i.e. |xPoint| >= |zPoint|

 LDA #%00100000         \ Set bit 5 of N (so we set bit 5 of the point's status
 ORA N                  \ byte when we're done) to indicate that
 STA N                  \ |xPoint| >= |zPoint|

.proj11

                        \ We now set bit 4 of the status byte in N by comparing
                        \ the |yPoint| and |zPoint| values we just calculated

 LDA SS                 \ If SS < Q, jump to proj13 to leave bit 4 clear
 CMP Q
 BCC proj13

 BNE proj12             \ If SS > Q, jump to proj12 to set bit 4

                        \ If we get here then SS = Q

 LDA RR                 \ If RR < P, jump to proj13 to leave bit 4 clear
 CMP P
 BCC proj13

.proj12

                        \ If we get here then SS = Q and RR >= P, which means
                        \ (SS RR) >= (Q P), i.e. |yPoint| * 2 >= |zPoint|

 LDA N                  \ Set bit 4 of N (so we set bit 4 of the point's status
 ORA #%00010000         \ byte when we're done) to indicate that
 STA N                  \ |yPoint| * 2 >= |zPoint|

\ ******************************************************************************
\
\       Name: ProjectPoint (Part 2 of 3)
\       Type: Subroutine
\   Category: Maths
\    Summary: Calculate the screen coordinates of the projected point
\
\ ******************************************************************************

.proj13

                        \ By this point, we have the following:
                        \
                        \   (QQ PP) = |xPoint|
                        \   (SS RR) = |yPoint| * 2
                        \   (Q P)   = |zPoint|
                        \
                        \ with (Q P) set to a minimum value of 1

 LDY P                  \ Set (X Y) = (Q P)
 LDX Q                  \           = |zPoint|
                        \
                        \ so we call ScaleUp with a non-zero (X Y), as we know
                        \ (Q P) is at least 1

 JSR ScaleUp            \ Set (A Y) = (X Y), scaled up until it doesn't fit into
                        \ 16 bits any more, and set WW to the minimum number of
                        \ bits in the original number

 TAX                    \ Set (TT S) = the A-th entry from Lookup3900/Lookup4700
 LDA Lookup3900,X       \ (is this a logarithm? or a division table?)
 STA TT
 LDA Lookup4700,X
 AND #%11111000
 STA S

 STY K                  \ Set K = Y, the low byte of the result from ScaleUp

 LDA WW                 \ Set UU = WW
 STA UU

 LDY PP                 \ Set (X Y) = (QQ PP)
 LDX QQ                 \           = |xPoint|

 JSR L0E69              \ ??? Starts with JSR ScaleUp, does a calculation into
                        \ (Q P) and WW

 LDA Q                  \ Set (QQ PP) = (Q P)
 STA QQ
 LDA P
 STA PP

 LDA WW                 \ Set VV = WW
 STA VV

 LDY RR                 \ Set (X Y) = (SS RR)
 LDX SS                 \           = |yPoint| * 2

 JSR L0E69              \ ??? Starts with JSR ScaleUp, does a calculation into
                        \ (Q P) and WW

 JSR L0FA7              \ ??? Converts UU, VV, (Q P) and (QQ PP) into screen
                        \ coordinates in (SS QQ) and (RR Q)

\ ******************************************************************************
\
\       Name: ProjectPoint (Part 3 of 3)
\       Type: Subroutine
\   Category: Maths
\    Summary: Move the projected coordinates to the centre of the screen and
\             update the point's status byte
\
\ ******************************************************************************

                        \ By this point we have the following projected
                        \ coordinates for the point whose ID is in GG:
                        \
                        \   (SS QQ) = screen x-coordinate of 3D point projected
                        \             onto the screen
                        \
                        \   (RR Q) = screen y-coordinate of 3D point projected
                        \             onto the screen
                        \
                        \ We now move the projected coordinate to the correct
                        \ place on screen, as the projected coordinates have the
                        \ origin straight ahead of us, i.e. in the centre of the
                        \ screen, while the screen has the origin in the
                        \ bottom-left corner
                        \
                        \ In other words, we add (80, 96) to the projected
                        \ coordinates so that a projected coordinate of (0, 0),
                        \ which is straight ahead of us, will appear in the
                        \ centre of the canopy view, which is 160 x 192 pixels
                        \ in size
                        \
                        \ We also set the correct sign for the projected
                        \ coordinate

 LDX GG                 \ Set X to the point ID to process

 LDA zPointHi,X         \ If the point's z-coordinate is negative, jump to
 BMI proj14             \ proj14

 LDA xPointHi,X         \ If the point's x-coordinate is positive, jump to
 BPL proj16             \ proj16 as the coordinates have the same sign

 JMP proj15             \ Otherwise jump to proj15 as the coordinates have
                        \ opposite signs

.proj14

                        \ If we get here then the point's z-coordinate is
                        \ negative

 LDA xPointHi,X         \ If the point's x-coordinate is negative, jump to
 BMI proj16             \ proj16 as the coordinates have the same sign

.proj15

                        \ If we get here then either the point's z-coordinate is
                        \ positive and the point's x-coordinate is negative, or
                        \ the point's z-coordinate is negative and the point's
                        \ x-coordinate is positive - in other words, the point's
                        \ x- and z-coordinates have opposite signs

 LDA #80                \ Set (xPointHi xPointLo) = 80 - (SS QQ)
 SEC                    \
 SBC QQ                 \ starting with the low bytes
 STA xPointLo,X

 LDA #0                 \ And then the high bytes
 SBC SS
 STA xPointHi,X

 JMP proj17             \ Jump to proj17 to move onto the y-coordinate

.proj16

                        \ If we get here then either the point's z-coordinate is
                        \ positive and the point's x-coordinate is positive, or
                        \ the point's z-coordinate is negative and the point's
                        \ x-coordinate is negative - in other words, the point's
                        \ x- and z-coordinates have the same sign

 LDA #80                \ Set (xPointHi xPointLo) = 80 + (SS QQ)
 CLC                    \
 ADC QQ                 \ starting with the low bytes
 STA xPointLo,X

 LDA #0                 \ And then the high bytes
 ADC SS
 STA xPointHi,X

.proj17

                        \ We now move the y-coordinate in the projected result
                        \ to the correct place on screen, by adding 96 to the
                        \ result and setting the correct sign in the process

 LDX GG                 \ Set X to the point ID to process

 LDA zPointHi,X         \ If the point's z-coordinate is negative, jump to
 BMI proj18             \ proj18

 LDA yPointHi,X         \ If the point's y-coordinate is positive, jump to
 BPL proj20             \ proj20 as the coordinates have the same sign

 JMP proj19             \ Otherwise jump to proj19 as the coordinates have
                        \ opposite signs

.proj18

                        \ If we get here then the point's z-coordinate is
                        \ negative

 LDA yPointHi,X         \ If the point's y-coordinate is negative, jump to
 BMI proj20             \ proj20 as the coordinates have the same sign

.proj19

                        \ If we get here then either the point's z-coordinate is
                        \ positive and the point's y-coordinate is negative, or
                        \ the point's z-coordinate is negative and the point's
                        \ y-coordinate is positive - in other words, the point's
                        \ y- and z-coordinates have opposite signs

 LDA #96                \ Set (yPointHi yPointLo) = 96 - (RR Q)
 SEC                    \
 SBC Q                  \ starting with the low bytes
 STA yPointLo,X

 LDA #0                 \ And then the high bytes
 SBC RR
 STA yPointHi,X

 JMP proj21             \ Jump to proj17 to move onto the point's status byte

.proj20

 LDA #96                \ Set (yPointHi yPointLo) = 96 + (RR Q)
 CLC                    \
 ADC Q                  \ starting with the low bytes
 STA yPointLo,X

 LDA #0                 \ And then the high bytes
 ADC RR
 STA yPointHi,X

.proj21

 LDA pointStatus,X      \ Apply any set bits from N to the point's status byte
 ORA N
 STA pointStatus,X

 RTS                    \ Return from the subroutine

 EQUB &20, &48, &0F     \ These bytes appear to be unused

\ ******************************************************************************
\
\       Name: L0E69
\       Type: Subroutine
\   Category: Maths
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (X Y)               A positive 16-bit number containing a coordinate
\                       magnitude
\
\   Z flag              Set according to the high byte in X (i.e. the routine is
\                       called after setting register X)
\
\   R                   Contains %00010000 (which is set at the start of
\                       ProjectPoint)
\
\   (TT S)              ??? A lookup from Lookup3900/Lookup4700
\
\ Returns:
\
\   (Q P)          
\
\ ******************************************************************************

.L0E69

 JSR ScaleUp            \ Set (A Y) = (X Y), scaled up until it doesn't fit into
                        \ 16 bits any more, and set WW to the minimum number of
                        \ bits in the original number

 STA J                  \ Set (J I) = (A Y)
 STY I

 LDX TT                 \ Set X = TT
                        \       = %TTTTtttt

 LDY J                  \ Set Y = J
                        \       = %JJJJjjjj

 LDA highNibble,X       \ Set T = (X AND %11110000) OR (Y >> 4)
 ORA shift4Right,Y      \       = %TTTTJJJJ
 STA T

 AND #%11110000         \ Set U = (T AND %11110000) OR (Y AND %00001111)
 ORA lowNibble,Y        \       = %TTTTjjjj
 STA U

 AND #%00001111         \ Set V = (U AND %00001111) OR (X << 4)
 ORA shift4Left,X       \       = %ttttjjjj
 STA V

 AND #%11110000         \ Set Y = (V AND %11110000) OR (Y >> 4)
 ORA shift4Right,Y      \       = %ttttJJJJ
 TAY

 LDX S                  \ Set X = S
                        \       = %SSSSssss

 AND #%00001111         \ Set X = (Y AND %00001111) OR (X AND %11110000)
 ORA highNibble,X       \       = %SSSSJJJJ
 TAX

                        \ So by this point we have:
                        \
                        \   T = %TTTTJJJJ
                        \   U = %TTTTjjjj
                        \   V = %ttttjjjj
                        \   Y = %ttttJJJJ
                        \   X = %SSSSJJJJ
                        \
                        \ where the following are arguments that were passed to
                        \ the routine:
                        \
                        \   (TT S) = (%TTTTtttt %SSSSssss)
                        \   (J I)  = (%JJJJjjjj %IIIIiiii) and contains the
                        \            original argument (A Y)

                        \ Does the following calculate (Q P) = (TT S) * (1 J I)
                        \ ???

 LDA timesTable,X       \ Set A = %SSSS * %JJJJ

 CLC                    \ Set P = A + (%tttt * %jjjj)
 LDX V                  \       = (%SSSS * %JJJJ) + (%tttt * %jjjj)
 ADC timesTable,X
 STA P

 LDX T                  \ Set Q = (%TTTT * %JJJJ) + 1
 LDA timesTable,X
 ADC #1
 STA Q

                        \ So (Q P) = (%SSSS * %JJJJ) + (%tttt * %jjjj)
                        \            + ((%TTTT * %JJJJ) + 1) << 8

 LDX U                  \ Set X = (%TTTT * %jjjj) + (%tttt * %JJJJ)
 LDA timesTable,X
 ADC timesTable,Y
 TAX

 LDY #0                 \ Set Y = 0

 BCC L0EBB              \ If the above addition didn't overflow, skip the
                        \ following instruction

 LDY #16                \ The above addition overflowed, so set Y = 16

.L0EBB

 LDA shift4Left,X       \ Set A = (X << 4)

 ADC P                  \ Set (Y A) = (Y A) + P + J + S

 BCC L0EC3
 INY

.L0EC3

 ADC J
 BCC L0EC8

 INY

.L0EC8

 ADC S                  \ End here

 STA P

 TYA
 ADC shift4Right,X
 ADC Q
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
 STA Q
 LDA I
 BEQ L0F16

 AND #&F0
 LDX TT
 ORA shift4Right,X
 TAY
 AND #&F0
 ORA lowNibble,X
 TAX
 LDA timesTable,X
 TAX
 CLC
 LDA shift4Left,X
 ADC I

.L0EFE

 LDA timesTable,Y
 ADC shift4Right,X
 ROR A
 CLC
 ADC P
 STA P
 BCC L0F16

 INC Q
 BNE L0F16

 LDA #&FF
 STA Q
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
 LDX Q

 JSR Multiply8x8        \ Set (A V) = X * Y

 STA G                  \ Set (Q P) = (Q P) - A
 LDA P                  \
 SEC                    \ starting with the high bytes
 SBC G
 STA P

 BCS L0F47              \ If the subtraction didn't underflow, skip the next
                        \ instruction

 DEC Q                  \ Decrement the high byte

.L0F47

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScaleUp
\       Type: Subroutine
\   Category: Maths
\    Summary: Scale up a 16-bit number until it doesn't fit into 16 bits any
\             more
\
\ ------------------------------------------------------------------------------
\
\ Given a positive 16-bit argument, this routine scales the number up until it
\ doesn't fit into 16 bits any more. It does this by doubling it (i.e. shifting
\ it left) until a set bit pops out of the left end).
\
\ The number of shifts is returned (in the form of the minimum number of binary
\ digits in the original number) so we know how much the value was scaled up by.
\
\ Arguments:
\
\   (X Y)               A positive 16-bit number containing a coordinate
\                       magnitude
\
\   Z flag              Set according to the high byte in X (i.e. the routine is
\                       called after setting register X)
\
\   R                   Contains %00010000 (which is set at the start of
\                       ProjectPoint)
\
\ Returns:
\
\   (A Y)               The original argument in (X Y), left-shifted until a set
\                       bit pops out of the left end, so the leftmost set bit is
\                       not in (A Y)
\
\   WW                  WW + 1 is the minimum number of binary digits that the
\                       original value of (X Y) fitted into (from which we can
\                       calculate the number of shifts we had to do to scale the
\                       number up)
\
\ ******************************************************************************

.ScaleUp

 BEQ scup4              \ If the high byte in X = 0, jump down to scup4

 LDA Lookup4700,X       \ Set A = int(log2(X))
 AND #%00000111         \
                        \ so we know X fits into a minimum of A + 1 binary
                        \ digits

 CLC                    \ Set WW = A + 8
 ADC #8                 \
 STA WW                 \ so (X Y) fits into WW + 1 binary digits

 CMP #13                \ Set the flags for the WW < 13 comparison below

 TXA                    \ Set (A T) = (X Y)
 STY T

 BCC scup3              \ If WW < 13, jump to scup3

.scup1

                        \ If we get here, then (X Y) fits into 13 + 1 digits or
                        \ more, i.e. it fits into 14 digits or more
                        \
                        \ Also, (A T) = (X Y)

 ASL T                  \ Left-shift (A T) until we shift a 1 out of bit 7 of
 ROL A                  \ the high byte in A
 BCC scup1

 LDY T                  \ Set Y = T

                        \ So now we have:
                        \
                        \   (A Y) = (A T)
                        \
                        \ which is the result that we want

 RTS                    \ Return from the subroutine

.scup2

 ASL T                  \ Left-shift (A T) by one place
 ROL A

.scup3

                        \ If we get here, then (X Y) fits into fewer than 13 + 1
                        \ binary digits, i.e. it fits into 13 digits or fewer
                        \
                        \ Also, (A T) = (X Y)

 BIT R                  \ If bit 4 of A is clear, loop back to scup2 to keep
 BEQ scup2              \ shifting (A T) left until bit 4 of A is set (we check
                        \ bit 4 because R = %00010000)

 TAY                    \ Set (Y X) = (A T)
 LDX T                  \
                        \ so (Y X) contains the original value of (X Y), shifted
                        \ left until bit 4 of X is set (note that the X and Y
                        \ have swapped round here)
                        \
                        \ Let's say (Y X) = (%AAAAaaaa %TTTTtttt), which is the
                        \ original (X Y) shifted left until bit 4 is set

 LDA shift4Right,X      \ Set A = (X >> 4) OR (Y << 4)
 ORA shift4Left,Y       \       = (%TTTTtttt >> 4) OR (%AAAAaaaa << 4)
                        \       = %aaaaTTTT

 LDY shift4Left,X       \ Set Y = X << 4
                        \       = %TTTTtttt << 4
                        \       = %tttt0000

                        \ So we now have:
                        \
                        \   (A Y) = (%aaaaTTTT %tttt0000)
                        \         = (%AAAAaaaa %TTTTtttt) << 4
                        \         = (A T) << 4
                        \         = (X Y) << 4
                        \
                        \ which is the result that we want

 RTS                    \ Return from the subroutine

.scup4

                        \ If we get here, then the high byte in X = 0

 CPY #0                 \ If the low byte in Y = 0, jump down to scup8
 BEQ scup8

 LDA Lookup4700,Y       \ Set WW = int(log2(Y))
 AND #%00000111         \
 STA WW                 \ so we know Y fits into a minimum of WW + 1 binary
                        \ digits

 CMP #4                 \ Set the flags for the WW < 4 comparison below

 TYA                    \ Set (A Y) = (Y 0)
 LDY #0

 BCC scup7              \ If WW < 4, jump to scup7

.scup5

                        \ If we get here, then (X Y) fits into 4 + 1 digits or
                        \ more, i.e. it fits into 5 digits or more, so 
                        \ (X Y) = (0 Y)
                        \
                        \ Also, (A Y) = (Y 0), which effectively does the first
                        \ 8 left-shifts for us, as we know none of those shifts
                        \ will shift a 1 out of bit 7 of the high byte

 ASL A                  \ Left-shift (A Y) until we shift a 1 out of bit 7 of
 BCC scup5              \ the high byte in A (we don't need to shift the low
                        \ byte as we know it's 0)

                        \ So now we have:
                        \
                        \   (A Y) = (X Y) shifted left until we shift a 1 out of
                        \           bit 7
                        \
                        \ which is the result that we want

 RTS                    \ Return from the subroutine

.scup6

                        \ If we get here, then (X Y) fits into fewer than 4 + 1
                        \ binary digits, i.e. it fits into 4 digits or fewer, so
                        \ (X Y) = (0 Y) = (0 %0000yyyy)
                        \
                        \ Also, (A Y) = (Y 0), which effectively does the first
                        \ 8 left-shifts for us, as we know none of those shifts
                        \ will shift a 1 out of bit 7 of the high byte

 ASL A                  \ Left-shift (A Y) by one place (we don't need to shift
                        \ the low byte as we know it's 0)

.scup7

 BIT R                  \ If bit 4 of A is clear, loop back to scup6 to keep
 BEQ scup6              \ shifting (A Y) left until bit 4 of A is set (we check
                        \ bit 4 because R = %00010000), so now we have something
                        \ like this (depending on how many of %yyyy are set):
                        \
                        \   (A Y) = (%0001yyy0 %00000000)

 TAX                    \ Set A = A << 4
 LDA shift4Left,X       \
                        \ which moves the result into the top byte of (A Y) like
                        \ this:
                        \
                        \   (A Y) = (%yyy00000 %00000000)
                        \
                        \ which is the result that we want

 RTS                    \ Return from the subroutine

.scup8

                        \ If we get here, then (X Y) = 0

 TSX                    \ We can only get here if we called this routine from
 INX                    \ the L0E69 routine, as the only other call of this
 INX                    \ routine is from ProjectPoint, when we know we are
 TXS                    \ calling it with a value of at least 1 in (X Y)
                        \
                        \ These instructions remove two bytes from the top of
                        \ the stack so the RTS below returns an extra level up
                        \ the call chain, and as L0E69 itself must have been
                        \ called from ProjectPoint, this returns us to
                        \ ProjectPoint with the following results

 LDA #0                 \ Set (Q P) = 0
 STA Q
 STA P

 LDX UU                 \ Set WW = UU - 1
 DEX
 STX WW

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: L0FA7
\       Type: Subroutine
\   Category: Maths
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   UU                  Scale factor for z-coordinate from ScaleUp routine
\
\   VV                  Scale factor for x-coordinate from ScaleUp routine
\
\   WW                  Scale factor for y-coordinate from ScaleUp routine
\
\   (QQ PP)             Result from L0E69 routine for x-coordinate
\
\   (Q P)               Result from L0E69 routine for y-coordinate
\
\ Returns:
\
\   (SS QQ)             Screen x-coordinate of the 3D point projected onto the
\                       screen
\
\   (RR Q)              Screen y-coordinate of the 3D point projected onto the
\                       screen
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

 LDA Q
 BMI L0FE4

 JMP L0FE2

.L0FDA

 LDA Q
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

 LDA Q

.L1047

 ASL P
 ROL A
 ROL RR
 DEY
 BNE L1047

 STA Q
 ASL P
 JMP L1064

.L1056

 EOR #&FF
 CLC
 ADC #1
 TAY
 LDA Q

.L105E

 LSR A
 DEY
 BNE L105E

 STA Q

.L1064

 BCC L107A

 INC Q
 BNE L107A

 INC RR
 LDA RR
 CMP #&40
 BCC L107A

 LDA #&3F
 STA RR
 LDA #&FF
 STA Q

.L107A

 RTS

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 1 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Clip a line to fit on-screen, starting with the line deltas
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   L                   The point ID for the line's start point
\
\   M                   The point ID for the line's end point
\
\ Other entry points:
\
\   DrawClippedHorizon  Set bit 1 of the line direction in V (for the horizon)
\
\ ******************************************************************************

.DrawClippedHorizon

 LDA #%00000010         \ For the horizon, set bit 1 of A to use as the starting
 BNE dcln1              \ value for the line direction in V (so bit 1 of V gets
                        \ set)

.DrawClippedLine

 LDA #0                 \ Set A = 0 to use as the starting value for the line
                        \ direction in V

.dcln1

 STA V                  \ Set V = A to set the starting value for the line
                        \ direction in V (we will set bits 6 and 7 later)

 LDA #0                 \ Set TT = 0, which we will use to store information
 STA TT                 \ about whether the line's start point fits on screen

 STA UU                 \ Set UU = 0, which we will use to store information
                        \ about whether the line's end point fits on screen

                        \ The first step is to calculate the line's |x-delta|
                        \ and |y-delta| values, updating the line direction
                        \ information in V as we do so

 LDX L                  \ Set X to the point ID for the line's start point

 LDY M                  \ Set Y to the point ID for the line's end point

 LDA xPointLo,X         \ Set (RR R) = the X-th entry from (xPointHi xPointLo)
 STA R                  \
 LDA xPointHi,X         \ i.e. the x-coordinate of the line's start point
 STA RR

 LDA yPointLo,X         \ Set (SS S) = the X-th entry from (yPointHi yPointLo)
 STA S                  \
 LDA yPointHi,X         \ i.e. the y-coordinate of the line's start point
 STA SS

 LDA xPointLo,Y         \ Set (QQ W) = the Y-th entry from (xPointHi xPointLo)
 STA W                  \
                        \ starting with the low byte in W

 SEC                    \ Set T = W - R
 SBC R                  \
 STA T                  \ which is the low byte of the calculation:
                        \
                        \   (I T) = (QQ W) - (RR R)

 LDA xPointHi,Y         \ Set (QQ W) = the Y-th entry from (xPointHi xPointLo)
 STA QQ                 \
                        \ i.e. the x-coordinate of the line's end point

 SBC RR                 \ Set I = QQ - RR
 STA I                  \
                        \ so we now have:
                        \
                        \   (I T) = (QQ W) - (RR R)
                        \         = x-coordinate of the line's end point
                        \           - x-coordinate of the line's start point
                        \
                        \ so (I T) is the line's x-delta

 BPL dcln2              \ If the high byte in I is positive, then so is (I T),
                        \ so jump to dcln2 to skip the following, as the x-delta
                        \ is positive

                        \ Otherwise the x-delta is negative, so we need to set
                        \ the x-direction in V and negate x-delta so it is
                        \ positive (as we want to calculate |x-delta|)

 LDA #%10000000         \ Set bit 7 of V to indicate a negative x-delta in the
 ORA V                  \ line direction in V
 STA V

 LDA #0                 \ Negate (I T), starting with the low bytes
 SEC
 SBC T
 STA T

 LDA #0                 \ And then negating the high bytes
 SBC I                  \
 STA I                  \ so now (I T) is positive, and contains |x-delta|

.dcln2

 LDA yPointLo,Y         \ Set (H G) = the Y-th entry from (yPointHi yPointLo)
 STA G                  \
                        \ starting with the low byte in G

 SEC                    \ Set U = G - S
 SBC S                  \
 STA U                  \ which is the low byte of the calculation:
                        \
                        \   (J U) = (H G) - (SS S)

 LDA yPointHi,Y         \ Set (H G) = the Y-th entry from (yPointHi yPointLo)
 STA H                  \
                        \ i.e. the y-coordinate of the line's end point

 SBC SS                 \ Set J = H - SS
 STA J                  \
                        \ so we now have:
                        \
                        \   (J U) = (H G) - (SS S)
                        \         = y-coordinate of the line's end point
                        \           - y-coordinate of the line's start point
                        \
                        \ so (J U) is the line's y-delta

 BPL dcln3              \ If the high byte in J is positive, then so is (J U),
                        \ so jump to dcln3 to skip the following, as the y-delta
                        \ is positive

                        \ Otherwise the y-delta is negative, so we need to set
                        \ the y-direction in V and negate y-delta so it is
                        \ positive (as we want to calculate |y-delta|)

 LDA #%01000000         \ Set bit 6 of V to indicate a negative y-delta in the
 ORA V                  \ line direction in V
 STA V

 LDA #0                 \ Negate (J U), starting with the low bytes
 SEC
 SBC U
 STA U

 LDA #0                 \ And then negating the high bytes
 SBC J                  \
 STA J                  \ so now (J U) is positive, and contains |y-delta|

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 2 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Work out whether the line's start point is on-screen
\
\ ******************************************************************************

.dcln3

 LDA #0                 \ The next step is to work out where the line's
                        \ coordinates lie in relation to the visible screen,
                        \ i.e. are the coordinates to the right or left of the
                        \ screen bounds, or above or below
                        \
                        \ We will capture this information for a single
                        \ coordinate in the top 4 bits of A, so we start by
                        \ setting A = 0 so we can populate it with information
                        \ of how the line's coordinates relate to the screen
                        \ edges

                        \ We start by looking at the y-coordinate for the start
                        \ point, and will store the result in bits 4 and 5 of
                        \ the final result in A

 LDX S                  \ Set (Y X) = (SS S)
 LDY SS                 \           = the y-coordinate of the line's start point

 BEQ dcln4              \ If the high byte in Y is zero, jump to dcln4

 PHP                    \ Set X = 0, but without affecting the processor flags,
 LDX #0                 \ which will still be set according to the value of the
 PLP                    \ high byte in Y

 CLC                    \ Clear the C flag

 BMI dcln5              \ If the high byte in Y is negative, jump to dcln5

 DEX                    \ Decrement X from 0 to 255

.dcln4

 SEC                    \ Set the C flag

.dcln5

                        \ By this point we have the following, depending on the
                        \ value of the high byte of the start point's
                        \ y-coordinate:
                        \
                        \   * If SS < 0, C = 0 and X = 0
                        \   * If SS = 0, C = 1 and X = S
                        \   * If SS > 0, C = 1 and X = 255

 ROR A                  \ Put the C flag into bit 7 of A, which will end up
                        \ being bit 4 in the final result (as we are going to
                        \ shift three more bits into A). Note that we flip this
                        \ bit in the EOR below

 CPX #152               \ The result of this comparison depends on the value
                        \ that we gave to X above:
                        \
                        \   * If SS < 0, X = 0 and 0 < 152, so C = 0
                        \   * If SS = 0, X = S, so if S < 152, C = 0 
                        \                          if S >= 152, C = 1
                        \   * If SS > 0, X = 255 and 255 >= 152, so C = 1

 ROR A                  \ Rotate the C flag into bit 7 of A, which will end up
                        \ being bit 5 in the final result (as we are going to
                        \ shift two more bits into A)

 EOR #%01000000         \ Flip bit 6

                        \ We now have the following in bits 6 and 7, which will
                        \ be shifted down to bits 4 and 5 in the final result:
                        \
                        \   * Bit 6 (4) is set   if SS < 0
                        \                  clear if SS >= 0
                        \
                        \   * Bit 7 (5) is clear if SS < 0
                        \                        or SS = 0 and S < 152
                        \                    set if SS = 0 and S >= 152
                        \                        or SS > 0
                        \
                        \ The visible part of the canopy screen has its origin
                        \ (0, 0) at the bottom-left corner of the canopy, just
                        \ above the dashboard, and it is 19 character blocks
                        \ high, which is 8 * 19 = 152 pixels high, so this sets
                        \ bits 0 and 1 in the final result depending on whether
                        \ the start y-coordinate is within this range, and if
                        \ not, whether it is above or below the range - in other
                        \ words, it determines whether this coordinate is
                        \ on-screen or off-screen, as follows:
                        \
                        \                             Bit 6 (4)     Bit 7 (5)
                        \   Off top of screen            0             1
                        \   On-screen                    0             0
                        \   Off bottom of screen         1             0
                        \
                        \ We never have both bits set

                        \ We now repeat the above process for the start point's
                        \ x-coordinate in (RR R), putting the result into bits 6
                        \ and 7 of A while shifting the above result into bits 4
                        \ and 5
                        \
                        \ The process is slightly different as this time the
                        \ on-screen x-coordinate range is 4 to 155

 LDX R                  \ Set (Y X) = (RR R)
 LDY RR                 \           = the x-coordinate of the line's start point

 BEQ dcln6              \ If the high byte in Y is zero, jump to dcln6

 PHP                    \ Set X = 0, but without affecting the processor flags,
 LDX #0                 \ which will still be set according to the value of the
 PLP                    \ high byte in Y

 BMI dcln6              \ If the high byte in Y is negative, jump to dcln6

 DEX                    \ Decrement X from 0 to 255

.dcln6

                        \ By this point we have the following, depending on the
                        \ value of the high byte of the start point's
                        \ x-coordinate:
                        \
                        \   * If RR < 0, X = 0
                        \   * If RR = 0, X = R
                        \   * If RR > 0, X = 255

 CPX #4                 \ The result of this comparison depends on the value
                        \ that we gave X above:
                        \
                        \   * If RR < 0, X = 0 and 0 < 4, so C = 0
                        \   * If RR = 0, X = R, so if R < 4, C = 0
                        \                          if R >= 4, C = 1
                        \   * If RR > 0, X = 255 and 255 >= 4, so C = 1

 ROR A                  \ Rotate the C flag into bit 7 of A, which will end up
                        \ being bit 6 in the final result (as we are going to
                        \ shift one more bit into A). Note that we flip this
                        \ bit in the EOR below

 CPX #156               \ The result of this comparison depends on the value
                        \ that we gave X above:
                        \
                        \   * If RR < 0, X = 0 and 0 < 156, so C = 0
                        \   * If RR = 0, X = R, so C = 0 if R < 156,
                        \                          C = 1 if R >= 156
                        \   * If RR > 0, X = 255 and 255 >= 156, so C = 1

 ROR A                  \ Rotate the C flag into bit 7 of A, which is where it
                        \ will stay

 EOR #%01000000         \ Flip bit 6

                        \ We now have the following in bits 6 and 7:
                        \
                        \   * Bit 6 is clear if RR > 0
                        \                    or RR = 0 and R >= 4
                        \                    i.e. if (RR R) >= 4
                        \              set   if RR < 0
                        \                    or RR = 0 and R < 4
                        \                    i.e. if (RR R) < 4
                        \
                        \   * Bit 7 is clear if RR < 0
                        \                    or RR = 0 and R < 156
                        \                    i.e. if (RR R) < 156
                        \                set if RR = 0 and R >= 156
                        \                    or RR > 0
                        \                    i.e. if (RR R) >= 156
                        \
                        \ The visible part of the canopy screen has its origin
                        \ (0, 0) at the bottom-left corner of the canopy, just
                        \ above the dashboard, but the rivets and the left edge
                        \ of the canopy take up the first four pixels, so the
                        \ leftmost x-coordinate inside the canopy is 4
                        \
                        \ Similarly, the right edge of the canopy is four pixels
                        \ wide, and the whole screen is 160 pixels wide, so the
                        \ rightmost x-coordinate inside the canopy is 155
                        \
                        \ So the above sets bits 6 and 7 in the final result
                        \ depending on whether the start x-coordinate is within
                        \ this range, and if not, whether it is to the left or
                        \ right of the range - in other words, it determines
                        \ whether this coordinate is on-screen or off-screen,
                        \ as follows:
                        \
                        \                             Bit 6     Bit 7
                        \   Off right of screen         0         1
                        \   On-screen                   0         0
                        \   Off left of screen          1         0
                        \
                        \ We never have both bits set

 STA TT                 \ Store A in TT
                        \
                        \ So TT contains the clipping requirements for the start
                        \ point, in bits 4 to 7, as follows:
                        \
                        \                             Bit 4     Bit 5
                        \   Off top of screen           0         1
                        \   On-screen                   0         0
                        \   Off bottom of screen        1         0
                        \
                        \                             Bit 6     Bit 7
                        \   Off right of screen         0         1
                        \   On-screen                   0         0
                        \   Off left of screen          1         0

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 3 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Work out whether the line's end point is on-screen
\
\ ******************************************************************************

                        \ We now repeat the above process, but for the line's
                        \ end point, whose y-coordinate is in (H G) and
                        \ x-coordinate is in (QQ W). Refer to the previous part
                        \ for a detailed description

 LDA #0                 \ Set A = 0 so we can capture bits 4 to 7 for the end
                        \ point

 LDX G                  \ Set (Y X) to the end point's y-coordinate in (H G)
 LDY H

 BEQ dcln7              \ This section sets the following:
 PHP                    \
 LDX #0                 \   * If H < 0, C = 0 and X = 0
 PLP                    \   * If H = 0, C = 1 and X = G
 CLC                    \   * If H > 0, C = 1 and X = 255
 BMI dcln8
 DEX

.dcln7

 SEC                    \ See above

.dcln8

 ROR A                  \ This section sets bits 6 and 7, which will become
 CPX #152               \ bits 4 and 5 of the final result:
 ROR A                  \
 EOR #%01000000         \                             Bit 6 (4)     Bit 7 (5)
                        \   Off top of screen            0             1
                        \   On-screen                    0             0
                        \   Off bottom of screen         1             0

 LDX W                  \ Set (Y X) to the end point's x-coordinate in (QQ W)
 LDY QQ

 BEQ dcln9              \ This section sets the following:
 PHP                    \
 LDX #0                 \   * If QQ < 0, X = 0
 PLP                    \   * If QQ = 0, X = W
 BMI dcln9              \   * If QQ > 0, X = 255
 DEX

.dcln9

 CPX #4                 \ This section sets bits 6 and 7:
 ROR A                  \
 CPX #156               \                             Bit 6     Bit 7
 ROR A                  \   Off right of screen         0         1
 EOR #%01000000         \   On-screen                   0         0
                        \   Off left of screen          1         0
 
 STA UU                 \ Store A in UU
                        \
                        \ So UU contains the clipping requirements for the end
                        \ point, in bits 4 to 7, as follows:
                        \
                        \                             Bit 4     Bit 5
                        \   Off top of screen           0         1
                        \   On-screen                   0         0
                        \   Off bottom of screen        1         0
                        \
                        \                             Bit 6     Bit 7
                        \   Off right of screen         0         1
                        \   On-screen                   0         0
                        \   Off left of screen          1         0

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 4 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Calculate the starting point and direction for our clipped vector
\             line
\
\ ******************************************************************************

                        \ In this part, the end-goal is to calculate the start
                        \ point and direction for an on-screen vector line,
                        \ which we can pass them to the DrawCanopyLine routine
                        \ later on
                        \
                        \ This means we want to calculate a pixel coordinate in
                        \ (R, S) and a direction in V, by clipping the current
                        \ start and end points to fit on-screen, if necessary

 LDX L                  \ Set X to the point ID for the line's start point

 LDY M                  \ Set Y to the point ID for the line's end point

 LDA zPointHi,Y         \ If the z-coordinate for the line's end point is
 BPL dcln10             \ positive, then it's in front of us, so jump to dcln10

 LDA V                  \ The end point is behind us, so flip bits 6 and 7 in V
 EOR #%11000000         \ to reverse the line direction in both axes
 STA V

                        \ The end point is behind us, so we can't use the end
                        \ point as our vector line's starting point, so now we
                        \ check whether we can use the start point

 LDA TT                 \ If TT is zero then the start point is on-screen, so
 BEQ dcln15             \ jump to dcln15 to use the current values of (R, S) as
                        \ our pixel coordinate, which works because RR and SS
                        \ have to be zero for the start point to be on-screen,
                        \ so (RR R) = (0 R) = R and (SS S) = (0 S) = S, so we
                        \ can just use the low bytes as the two coordinates,
                        \ i.e. (R, S)

 BNE dcln12             \ TT is non-zero, so the start point is off-screen, so
                        \ jump to dcln12 to clip the start of the line so it
                        \ fits on-screen (this BNE is effectively a JMP as A is
                        \ never zero)

.dcln10

                        \ If we get here then the end point is in front of us

 LDA zPointHi,X         \ If the z-coordinate for the line's start point is
 BPL dcln11             \ positive, which is in front of us, jump to dcln11

 JSR SwapLinePoints     \ The start point is behind us and the end point is in
                        \ front of us, so copy the end point's coordinates and
                        \ clipping information into the start point, so the
                        \ start point is now in front of us

 LDA TT                 \ If TT is zero then the start point is on-screen, so
 BEQ dcln15             \ jump to dcln15

 BNE dcln12             \ TT is non-zero, so the start point is off-screen, so
                        \ jump to dcln12 to clip the start of the line (this BNE
                        \ is effectively a JMP as A is never zero)

.dcln11

                        \ If we get here then both the start and end points are
                        \ in front of us

 LDA TT                 \ If TT is non-zero then the start point is off-screen,
 BNE dcln14             \ so jump to dcln14 to potentially clip from the end of
                        \ the line (i.e. if the end point is off-screen)

 LDA UU                 \ If UU is non-zero then the end point is off-screen, so
 BNE dcln15             \ jump to dcln13 via dcln15 to clip from the end of the
                        \ line

 BEQ dcln21             \ Both TT and UU are zero, so both points are on-screen
                        \ and we don't need to do any clipping, so jump to
                        \ dcln21

.dcln12

                        \ If we get here then the one point is off-screen but
                        \ in front of us, and the other point is behind us and
                        \ can't be used as our vector line starting point
                        \ point, and we've set the start point to be the point
                        \ that is in front of us

 JSR ClipStartOfLine    \ Clip the line at the start to move the start point
                        \ on-screen, so we can use it as our vector line's
                        \ starting point

 JMP dcln15             \ We now have an on-screen pixel coordinate in (R, S),
                        \ so jump to dcln15 to move on to the next stage

.dcln13

                        \ If we get here then both the start and end points are
                        \ off-screen, but they are both in front of us, so we
                        \ need to clip both ends of the line

 JSR ClipBestEndOfLine  \ Clip the line at either the start or end point,
                        \ whichever is best, so that it fits on-screen

 JMP dcln15             \ We now have an on-screen pixel coordinate in (R, S),
                        \ so jump to dcln15 to move on to the next stage

.dcln14

                        \ If we get here then both the start and end points are
                        \ in front of us and the start point is off-screen

 LDA UU                 \ If UU is non-zero then the end point is also
 BNE dcln13             \ off-screen, so jump to dcln13 to clip both ends of the
                        \ line

                        \ If we get here then the start point is off-screen but
                        \ the end point is on-screen, so we now use the end
                        \ point for our vector line's starting point

 LDA V                  \ Flip bits 6 and 7 in V to reverse the line direction
 EOR #%11000000
 STA V

 LDA W                  \ Set (R, S) to the end point's coordinate in (W, G)
 STA R
 LDA G
 STA S

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 5 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Calculate the deltas for our clipped vector line
\
\ ******************************************************************************

.dcln15

 LDA #4                 \ If bit 7 of V is set, so the direction of the x-delta
 BIT V                  \ is to the left, set A = 4
 BMI dcln16

 LDA #155               \ Otherwise the direction of the x-delta is to the
                        \ right, so set A = 155

.dcln16

 STA W                  \ Set W = 4 or 155, depending on the direction of the
                        \ x-delta, so W is the value of the x-coordinate at the
                        \ edge of the screen in the direction given in V

 LDA #0                 \ If bit 6 of V is set, so the direction of the y-delta
 BVS dcln17             \ is down, set A = 0

 LDA #151               \ Otherwise the direction of the y-delta is up, so set
                        \ A = 151

.dcln17

 STA G                  \ Set G = 0 or 151, depending on the direction of the
                        \ y-delta, so W is the value of the y-coordinate at the
                        \ edge of the screen in the direction given in V

 JMP dcln19             \ Jump to dcln19

.dcln18

 LSR I                  \ Right-shift (I T)
 ROR T

 LSR J                  \ Right-shift (J U)
 ROR U

.dcln19

                        \ Back in part 1 we set the following values:
                        \
                        \   * (I T) is the line's |x-delta|
                        \   * (J U) is the line's |y-delta|
                        \
                        \ We now reduce these 16-bit values to 8-bit values by
                        \ shifting them until they fit into one byte each

 LDA I                  \ If the high bytes of either of the line delta's is
 ORA J                  \ non-zero, loop up to dcln18 to right-shift both deltas
 BNE dcln18

                        \ We now have the following:
                        \
                        \   * T = |x-delta|
                        \   * U = |y-delta|

 LDA #255               \ If T <> 255, jump to dcln20
 CMP T
 BNE dcln20

 LSR T                  \ T = 255, which is too big to use as our line delta, so
 LSR U                  \ divide both T and U by 2

.dcln20

 CMP U                  \ If U <> 255, jump to dcln21
 BNE dcln21

 LSR T                  \ U = 255, which is too big to use as our line delta, so
 LSR U                  \ divide both T and U by 2

.dcln21

 INC T                  \ Increment T to give us our final |x-delta|, so it is
                        \ at least 1

 INC U                  \ Increment U to give us our final |y-delta|, so it is
                        \ at least 1

\ ******************************************************************************
\
\       Name: DrawClippedLine (Part 6 of 6)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Add the clipped line to the line buffer and draw it
\
\ ******************************************************************************

 LDA colourCycle        \ If bit 7 of colourCycle is set, i.e. %11110000, jump
 BMI dcln23             \ jump down to dcln23 to add a line to buffer 1

 LDX lineBuffer2Count   \ If lineBuffer2Count <> 95, line buffer 2 is not full,
 CPX #95                \ so jump down to dcln22 to add a new line to the buffer
 BNE dcln22

 RTS                    \ Return from the subroutine

.dcln22

 INX                    \ Increment the value in lineBuffer2Count as we are
 STX lineBuffer2Count   \ about to add a new line to line buffer 2

 JMP dcln25             \ Jump down to dcln25 to buffer the line and draw it

.dcln23

 LDX lineBuffer1Count   \ If lineBuffer1Count <> 47, line buffer 1 is not full,
 CPX #47                \ so jump down to dcln24 to add a new line to the buffer
 BNE dcln24

 RTS                    \ Return from the subroutine

.dcln24

 INX                    \ Increment the value in lineBuffer1Count as we are
 STX lineBuffer1Count   \ about to add a new line to line buffer 1

.dcln25

 LDA R                  \ Save the start x-coordinate in lineBufferR
 STA lineBufferR,X

 LDA W                  \ Save the max/min x-coordinate in lineBufferW
 STA lineBufferW,X

 LDA S                  \ Save the start y-coordinate in lineBufferS
 STA lineBufferS,X

 LDA G                  \ Save the max/min y-coordinate in lineBufferG
 STA lineBufferG,X

 LDA T                  \ Save the |x-delta| in lineBufferT
 STA lineBufferT,X

 LDA U                  \ Save the |y-delta| in lineBufferU
 STA lineBufferU,X

 LDA V                  \ Save the direction in lineBufferV
 STA lineBufferV,X

                        \ Fall through into DrawCanopyLine to draw the line

\ ******************************************************************************
\
\       Name: DrawCanopyLine (Part 1 of 4)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ The code in this routine is modified by the ModifyDrawRoutine routine, and by
\ the DrawCanopyLine routine itself.
\
\ The default code (i.e. the unmodified version in the source) is run when U < T
\ (shallow horizontal slope), bit 6 of V is clear (y-axis up) and bit 7 is set
\ (x-axis left).
\
\ Arguments:
\
\   R                   Start point x-coordinate
\
\   S                   Start point y-coordinate
\
\   T                   Relative magnitude of line's vector |x-delta|
\
\   U                   Relative magnitude of line's vector |y-delta|
\
\   V                   Direction of vector (T, U):
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                         * Bit 1 is set if this is the horizon line
\
\                         * Bit 0 is set if the line has been clipped
\
\                       Direction is like a clock, so positive (clear) is up and
\                       right
\
\                       Also bits 0 and 1 are involved
\
\   W                   Max/min x-coordinate for the end of the line
\
\   G                   Max/min y-coordinate for the end of the line
\
\ ******************************************************************************

.DrawCanopyLine

 LDA R                  \ Set X = R / 4
 LSR A                  \
 LSR A                  \ so X is the number of the character block containing
 TAX                    \ pixel (R, S), as each character block is 4 pixels wide

 LDA S                  \ Set Y = S / 8
 LSR A                  \
 LSR A                  \ so Y is the number of the character row containing
 LSR A                  \ pixel (R, S), as each character row is 8 pixels high
 TAY

 CLC                    \ Set P = X-th byte of xLookupLo
 LDA xLookupLo,X        \         + Y-th byte of yLookupLo
 ADC yLookupLo,Y        \       = LO(X * 8) + LO(screen address)
 STA P

 LDA xLookupHi,X        \ Set Q = X-th byte of xLookupHi
 ADC yLookupHi,Y        \         + Y-th byte of yLookupHi
 STA Q                  \       = HI(X * 8) + HI(screen address)

                        \ So (P Q) is the screen address of the pixel row
                        \ containing pixel (R, S), out by 8 bytes for each row
                        \ above or below the top of the dashboard

 LDA U                  \ If U < T, the line is a shallow horizontal slope, so
 CMP T                  \ jump down to dlin1 to draw the line
 BCC dlin1

 JMP dlin41             \ Otherwise U >= T and the line is a steep vertical
                        \ slope, so jump down to part 3 to draw the line

.dlin1

                        \ If we get here then the line is a shallow horizontal
                        \ slope

 BIT V                  \ If bit 7 of V is set, jump to dlin3 to step along the
 BMI dlin3              \ x-axis in a negative direction, i.e. to the left

                        \ Bit 7 of V is clear, so we step along the x-axis in a
                        \ positive direction, i.e. to the right
 
 LDA #5                 \ Modify the following instruction at dlin20:
 STA dlin20+1           \
                        \   BCC dlin22 -> BCC dlin22
                        \
                        \ i.e. set it back to the default

 LDA #9                 \ Modify the following instruction at dlin21:
 STA dlin21+1           \
                        \   BNE dlin25 -> BNE dlin25
                        \
                        \ i.e. set it back to the default

.dlin2

 LDA #LO(Lookup2E60)    \ Modify the following instruction at dlin33:
 STA dlin33+1           \
                        \   LDA Lookup2E60,X -> LDA Lookup2E60,X
                        \
                        \ The LDA #&60 gets modified by the ModifyDrawRoutine
                        \ routine as follows:
                        \
                        \   * &60 when colourLogic = %01000000
                        \     so the bit pattern lookup table uses colour 1
                        \     i.e. LDA Lookup2E60,X
                        \
                        \   * &74 when colourLogic = %01000000
                        \     so the bit pattern lookup table uses colour 2
                        \     i.e. LDA Lookup2E74,X
                        \
                        \   * &88 when colourLogic = %00000000
                        \          and colourCycle = %00001111
                        \     so the bit pattern lookup is always %00001111
                        \     i.e. LDA Lookup2E88,X
                        \
                        \   * &92 when colourLogic = %00000000
                        \          and colourCycle = %11110000
                        \     so the bit pattern lookup is always %11110000
                        \     i.e. LDA Lookup2E92,X

 LDA #39                \ Set I = 39
 STA I

 BNE dlin5              \ Junp to dlin5 (this BNE is effectively a JMP as A is
                        \ never zero)

.dlin3

                        \ Bit 7 of V is set, so we step along the x-axis in a
                        \ negative direction, i.e. to the left

 LDA #&24               \ Modify the following instruction at dlin20:
 STA dlin20+1           \
                        \   BCC dlin22 -> BCC dlin27

 LDA #&28               \ Modify the following instruction at dlin21:
 STA dlin21+1           \
                        \   BNE dlin25 -> BNE dlin30

.dlin4

                        \ Modify the following instruction at dlin33:
 LDA #LO(Lookup2E6A)    \
 STA dlin33+1           \   LDA Lookup2E60,X -> LDA Lookup2E6A,X
                        \
                        \ The LDA #&6A gets modified by the ModifyDrawRoutine
                        \ routine as follows:
                        \
                        \   * &6A when colourLogic = %01000000
                        \     so the bit pattern lookup table uses colour 1
                        \     i.e. LDA Lookup2E6A,X
                        \
                        \   * &7E when colourLogic = %01000000
                        \     so the bit pattern lookup table uses colour 2
                        \     i.e. LDA Lookup2E7E,X
                        \
                        \   * &88 when colourLogic = %00000000
                        \          and colourCycle = %00001111
                        \     so the bit pattern lookup is always %00001111
                        \     i.e. LDA Lookup2E88,X
                        \
                        \   * &92 when colourLogic = %00000000
                        \          and colourCycle = %11110000
                        \     so the bit pattern lookup is always %11110000
                        \     i.e. LDA Lookup2E92,X

 LDA #0                 \ Set I = 0
 STA I

.dlin5

 BIT V                  \ If bit 6 of V is set, jump to dlin6 to step along the
 BVS dlin6              \ y-axis in a negative direction, i.e. down the screen

                        \ Bit 6 of V is clear, so we step along the y-axis in a
                        \ positive direction, i.e. up the screen

 LDA #&98               \ Modify the following instruction at dlin35:
 STA dlin35             \
                        \   INY -> TYA

 LDA #&88               \ Modify the following instruction at dlin36:
 STA dlin36             \
                        \   TYA -> DEY

 LDA #&C8               \ Modify the following instruction at dlin37:
 STA dlin37+1           \
                        \   ADC #&38 -> ADC #&C8

 LDA #&FE               \ Modify the following instruction at dlin38:
 STA dlin38+1           \
                        \   ADC #1 -> ADC #&FE

 LDA #158               \ Set J = 158 - G
 SEC
 SBC G
 STA J

 JMP dlin7

.dlin6

                        \ Bit 6 of V is set, so we step along the y-axis in a
                        \ negative direction, i.e. down the screen

 LDA #&C8               \ Modify the following instruction at dlin35:
 STA dlin35             \
                        \   INY -> INY
                        \
                        \ i.e. set it back to the default

 LDA #&98               \ Modify the following instruction at dlin36:
 STA dlin36             \
                        \   TYA -> TYA
                        \
                        \ i.e. set it back to the default

 LDA #&38               \ Modify the following instruction at dlin37:
 STA dlin37+1           \
                        \   ADC #&38 -> ADC #&38
                        \
                        \ i.e. set it back to the default

 LDA #1                 \ Modify the following instruction at dlin38:
 STA dlin38+1           \
                        \   ADC #1 -> ADC #1
                        \
                        \ i.e. set it back to the default

 LDA #160               \ Set J = 160 - G
 SEC
 SBC G
 STA J

.dlin7

 LDA #&9F               \ Set Y = 159 - S
 SEC
 SBC S
 TAY

 LDA #255               \ Set RR = 255 - T
 SEC
 SBC T
 STA RR

 CLC                    \ Set SS = RR = 255 - T + 1
 ADC #1
 STA SS

 LDA V                  \ If bits 0 and 1 of V are both clear, jump to dlin8
 AND #%00000011
 BEQ dlin8

 LDA U                  \ If U < 2, jump to dlin8
 CMP #2
 BCC dlin8

 LDA #255               \ Set SS = 255
 STA SS

.dlin8

 LDA R                  \ Set X = bits 0 and 1 of R, so X is the pixel number
 AND #%00000011         \ in the character row for pixel (R, S)
 TAX

 LDA R                  \ Set QQ = R / 4
 LSR A                  \
 LSR A                  \ so QQ is the number of the character block containing
 STA QQ                 \ pixel (R, S), as each character block is 4 pixels wide

 LDA SS
 BIT V
 BMI dlin10

 CPX #1
 BCC dlin13

 BNE dlin9

 CLC
 BCC dlin14

.dlin9

 CPX #3
 BCC dlin16

 CLC
 BCC dlin18

.dlin10

 CPX #1
 BCC dlin18

 BNE dlin11

 CLC
 BCC dlin16

.dlin11

 CPX #3
 BCC dlin14

 CLC
 BCC dlin13

.dlin12

 CLC
 LDA SS

.dlin13

 LDX #0
 ADC U
 BCC dlin15

 JSR dlin32

.dlin14

 LDX #3

.dlin15

 INX
 ADC U
 BCC dlin17

 JSR dlin32

.dlin16

 LDX #6

.dlin17

 INX
 ADC U
 BCC dlin19

 JSR dlin32

.dlin18

 LDX #8

.dlin19

 INX
 ADC U

.dlin20

 BCC dlin22             \ If the addition did not overflow, jump to dlin22
                        \
                        \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * BCC dlin22 when bit 7 of V is clear
                        \
                        \   * BCC dlin27 when bit 7 of V is set

 JSR dlin32             \ If the addition overflowed, call dlin32

.dlin21

 BNE dlin25             \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * BNE dlin25 when bit 7 of V is clear
                        \
                        \   * BNE dlin30 when bit 7 of V is set

.dlin22

 STA SS

.dlin23

 LDA Lookup2E60,X       \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA Lookup2E60,X when colourLogic = %10000000
                        \
                        \   * LDA Lookup2E74,X when colourLogic = %01000000
                        \
                        \   * LDA Lookup2E88,X when colourLogic = %00000000
                        \                       and colourCycle = %00001111
                        \
                        \   * LDA Lookup2E92,X when colourLogic = %00000000
                        \                       and colourCycle = %11110000

.dlin24

 ORA (P),Y              \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * ORA (P),Y when colourLogic = %01000000
                        \
                        \   * AND (P),Y when colourLogic = %00000000

 STA (P),Y              \ Update the Y-th byte of (P Q) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

.dlin25

 LDA P
 CLC
 ADC #8
 STA P
 BCC dlin26

 INC Q

.dlin26

 INC QQ
 LDA QQ
 CMP I
 BNE dlin12

 JMP dlin65

.dlin27

 STA SS

.dlin28

 LDA Lookup2E6A,X       \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA Lookup2E6A,X when colourLogic = %10000000
                        \
                        \   * LDA Lookup2E7E,X when colourLogic = %01000000
                        \
                        \   * LDA Lookup2E88,X when colourLogic = %00000000
                        \                       and colourCycle = %00001111
                        \
                        \   * LDA Lookup2E92,X when colourLogic = %00000000
                        \                       and colourCycle = %11110000

.dlin29

 ORA (P),Y              \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * ORA (P),Y when colourLogic = %01000000
                        \
                        \   * AND (P),Y when colourLogic = %00000000

 STA (P),Y              \ Update the Y-th byte of (P Q) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

.dlin30

 LDA P
 SEC
 SBC #8
 STA P
 BCS dlin31

 DEC Q

.dlin31

 DEC QQ
 LDA QQ
 CMP I
 BNE dlin12

 JMP dlin65

\ ******************************************************************************
\
\       Name: DrawCanopyLine (Part 2 of 4)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ The code in this routine is modified by the ModifyDrawRoutine, and by the
\ DrawCanopyLine routine itself.
\
\ ******************************************************************************

.dlin32

 ADC RR                 \ Set SS = A + RR + C
 STA SS

.dlin33

 LDA Lookup2E60,X       \ Gets modified by the DrawCanopyLine routine, which in
                        \ turn gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * Lookup2E60 when colourLogic = %01000000
                        \
                        \   * Lookup2E74 when colourLogic = %01000000
                        \
                        \   * Lookup2E88 when colourLogic = %00000000
                        \                 and colourCycle = %00001111
                        \
                        \   * Lookup2E92 when colourLogic = %00000000
                        \                 and colourCycle = %11110000
.dlin34

 ORA (P),Y              \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * ORA (P),Y when colourLogic = %01000000
                        \
                        \   * AND (P),Y when colourLogic = %00000000

 STA (P),Y              \ Update the Y-th byte of (P Q) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

.dlin35

 INY                    \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * INY when bit 6 of V is set
                        \
                        \   * TYA when bit 6 of V is clear

.dlin36

 TYA                    \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * TYA when bit 6 of V is set
                        \
                        \   * DEY when bit 6 of V is clear

 AND #7
 BNE dlin39

 LDA P
 CLC

.dlin37

 ADC #&38               \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * ADC #&38 when bit 6 of V is set
                        \
                        \   * ADC #&E8 when bit 6 of V is clear

 STA P
 LDA Q

.dlin38

 ADC #1                 \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * ADC #1 when bit 6 of V is set
                        \
                        \   * ADC #&FE when bit 6 of V is clear

 STA Q

.dlin39

 LDA SS
 CPY J
 CLC
 BEQ dlin40

 RTS

.dlin40

 TSX                    \ Remove two bytes from the top of the stack
 INX
 INX
 TXS

 JMP dlin65

\ ******************************************************************************
\
\       Name: DrawCanopyLine (Part 3 of 4)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ The code in this routine is modified by the ModifyDrawRoutine routine, and by
\ the DrawCanopyLine routine itself.
\
\ The default code (i.e. the unmodified version in the source) is run when bit 6
\ of V is clear (y-axis up) and bit 7 is set (x-axis left).
\
\ ******************************************************************************

.dlin41

                        \ If we get here then the line is a steep vertical slope

 BIT V                  \ If bit 6 of V is set, jump to dlin42
 BVS dlin42

 LDA #&98               \ Modify the following instruction at dlin53:
 STA dlin53             \
                        \   TYA -> TYA
                        \
                        \ i.e. set it back to the default

 LDA #&88               \ Modify the following instruction at dlin54:
 STA dlin54             \
                        \   DEY -> DEY
                        \
                        \ i.e. set it back to the default

 LDA #&C8               \ Modify the following instruction at dlin37:
 STA dlin55+1           \
                        \   ADC #&C8 -> ADC #&C8
                        \
                        \ i.e. set it back to the default

 LDA #&FE               \ Modify the following instruction at dlin38:
 STA dlin56+1           \
                        \   ADC #&FE -> ADC #&FE
                        \
                        \ i.e. set it back to the default

 LDA #7
 STA J
 BNE dlin43

.dlin42

 LDA #&C8               \ Modify the following instruction at dlin53:
 STA dlin53             \
                        \   TYA -> INY

 LDA #&98               \ Modify the following instruction at dlin54:
 STA dlin54             \
                        \   DEY -> TYA

 LDA #&38               \ Modify the following instruction at dlin37:
 STA dlin55+1           \
                        \   ADC #&C8 -> ADC #&38

 LDA #1                 \ Modify the following instruction at dlin38:
 STA dlin56+1           \
                        \   ADC #&FE -> ADC #1

 LDA #&A0
 STA J

.dlin43

 BIT V                  \ If bit 7 of V is set, jump to dlin44
 BMI dlin44

 LDA #&1D               \ Modify the following instruction at dlin52:
 STA dlin52+1           \
                        \   BCS dlin57 -> BCS dlin57
                        \
                        \ i.e. set it back to the default

 LDA W
 CLC
 ADC #1
 STA I
 JMP dlin45

.dlin44

 LDA #&3F               \ Modify the following instruction at dlin52:
 STA dlin52+1           \
                        \   BCS dlin57 -> BCS dlin61

 LDA W
 SEC
 SBC #1
 STA I

.dlin45

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
 BEQ dlin46

 LDA T
 CMP #2
 BCC dlin46

 LDA #&FF
 STA SS

.dlin46

 LDA R
 AND #3
 TAX

.dlin47

 LDA #8                 \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA #8 when colourLogic = %10000000
                        \
                        \   * LDA #&80 when colourLogic = %01000000

 CPX #0
 BEQ dlin49

.dlin48

 LSR A
 DEX
 BNE dlin48

.dlin49

 STA H
 CLC
 LDX R

.dlin50

 LDA H                  \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA H when colourLogic = %01000000
                        \                           or %10000000
                        \
                        \   * LDA #%00001111 when colourLogic = %00000000
                        \                     and colourCycle = %00001111
                        \
                        \   * LDA #%11110000 when colourLogic = %00000000
                        \                     and colourCycle = %11110000

.dlin51

 ORA (P),Y              \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * ORA (P),Y when colourLogic = %01000000
                        \
                        \   * AND (P),Y when colourLogic = %00000000

 STA (P),Y              \ Update the Y-th byte of (P Q) with the result, which
                        \ sets 4 pixels to the pixel pattern in A

 LDA SS
 ADC T

.dlin52

 BCS dlin57             \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * BCC dlin57 when bit 7 of V is clear
                        \
                        \   * BCC dlin61 when bit 7 of V is set

 STA SS

.dlin53

 TYA                    \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * TYA when bit 6 of V is clear
                        \
                        \   * INY when bit 6 of V is set

.dlin54

 DEY                    \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * DEY when bit 6 of V is clear
                        \
                        \   * TYA when bit 6 of V is set

 AND #7
 BNE dlin50

 LDA P
 CLC

.dlin55

 ADC #&C8               \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * ADC #&C8 when bit 6 of V is clear
                        \
                        \   * ADC #&38 when bit 6 of V is set

 STA P
 LDA Q

.dlin56

 ADC #&FE               \ Gets modified by the DrawCanopyLine routine:
                        \
                        \   * ADC #&FE when bit 6 of V is clear
                        \
                        \   * ADC #1 when bit 6 of V is set

 STA Q
 CPY J
 CLC
 BNE dlin50

 JMP dlin65

.dlin57

 ADC RR
 STA SS
 INX
 LDA H
 LSR A

.dlin58

 CMP #0                 \ Gets modified by the ModifyDrawRoutine routine:
 BNE dlin60             \
                        \   * CMP #0 when colourLogic = %10000000
                        \
                        \   * CMP #8 when colourLogic = %01000000


 LDA P
 CLC
 ADC #8
 STA P

.dlin59

 LDA #8                 \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA #8 when colourLogic = %10000000
                        \
                        \   * LDA #&80 when colourLogic = %01000000

 BCC dlin60

 INC Q

.dlin60

 STA H
 CPX I
 CLC
 BNE dlin53

 BEQ dlin65

.dlin61

 ADC RR
 STA SS
 DEX
 LDA H
 ASL A

.dlin62

 CMP #16                \ Gets modified by the ModifyDrawRoutine routine:
 BNE dlin64             \
                        \   * CMP #16 when colourLogic = %10000000
                        \
                        \   * CMP #0 when colourLogic = %01000000

 LDA P
 SEC
 SBC #8
 STA P

.dlin63

 LDA #1                 \ Gets modified by the ModifyDrawRoutine routine:
                        \
                        \   * LDA #1 when colourLogic = %10000000
                        \
                        \   * LDA #16 when colourLogic = %01000000

 BCS dlin64

 DEC Q

.dlin64

 STA H
 CPX I
 CLC
 BNE dlin53

\ ******************************************************************************
\
\       Name: DrawCanopyLine (Part 4 of 4)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.dlin65

 LDA V
 LSR A
 BCS dlin66

 RTS

.dlin66

 ASL A
 EOR #&C0
 STA V
 LDA xTempLo
 STA R
 LDA yTempLo
 STA S
 LDA #4
 BIT V
 BMI dlin67

 LDA #&9B

.dlin67

 STA W
 LDA #0
 BVS dlin68

 LDA #&97

.dlin68

 STA G

 JMP DrawCanopyLine

\ ******************************************************************************
\
\       Name: ModifyDrawRoutine
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Modify the drawing routines to draw in the correct colour for the
\             current colour cycle
\
\ ------------------------------------------------------------------------------
\
\ This routine modifies the DrawCanopyLine routine, depending on the value of
\ the colourLogic and colourCycle variables. See the DrawCanopyView routine for
\ details of the colour-cycling system that this forms part of.
\
\ This is what the ModifyDrawRoutine routine does:
\
\ If colourLogic = %00000000 (erase lines):
\
\   * Modify the drawing logic in DrawCanopyLine to AND
\
\   * Modify DrawCanopyLine so it fetches bit patterns from:
\       * Lookup2E88 if colourCycle = %00001111
\       * Lookup2E92 if colourCycle = %11110000
\     In other words, the bit pattern it fetches is always the same as the value
\     of colourCycle, as Lookup2E88 contains %00001111 and Lookup2E92 contains
\     %11110000
\
\   * Modify DrawCanopyLine (part 3) so it pokes the value of colourCycle as a
\     bit pattern in the screen-updating routine at dlin50
\
\ If colourLogic = %01000000 (draw lines in colour 2):
\
\   * Modify the drawing logic in DrawCanopyLine to OR (the default)
\
\   * Modify DrawCanopyLine so it fetches bit patterns from Lookup2E74 and
\     Lookup2E7E (colour 2) instead of Lookup2E60 and Lookup2E6A (colour 1)
\
\ If colourLogic = %10000000 (draw lines in colour 1):
\
\   * Modify the drawing logic in DrawCanopyLine to OR (the default)
\
\   * Restore the DrawCanopyLine routine back to its default code, so we draw
\     in colour 1
\
\ ******************************************************************************

.ModifyDrawRoutine

 LDA colourLogic        \ If colourLogic is non-zero, jump to modd3
 BNE modd3

                        \ If we get here then colourLogic is %00000000

 LDA #&31               \ Set A to the opcode for the AND (P),Y instruction

 STA dlin24             \ Modify the following instructions in
 STA dlin29             \ DrawCanopyLine (part 1):
                        \
                        \   ORA (P),Y -> AND (P),Y

 STA dlin34             \ Modify the following instructions in
 STA dlin51             \ DrawCanopyLine (part 2):
                        \
                        \   ORA (P),Y -> AND (P),Y

 LDA colourCycle        \ If bit 7 of colourCycle is set, i.e. %11110000, jump
 BMI modd1              \ jump down to modd1

 LDA #LO(Lookup2E88)    \ Bit 7 of colourCycle is clear, i.e. %00001111, so set
                        \ A to &88 so the DrawCanopyLine (part 1) instructions
                        \ below are modified to the following:
                        \
                        \   LDA #&60 : STA dlin33+1 -> LDA #&88 : STA dlin33+1
                        \   LDA Lookup2E60,X        -> LDA Lookup2E88,X
                        \   LDA #&6A : STA dlin33+1 -> LDA #&88 : STA dlin33+1
                        \   LDA Lookup2E6A,X        -> LDA Lookup2E88,X

 BNE modd2              \ Jump down to modd2 (this BNE is effectively a JMP as
                        \ A is never zero)

.modd1

 LDA #LO(Lookup2E92)    \ Bit 7 of colourCycle is set, i.e. %11110000, so set
                        \ A to &92 so the DrawCanopyLine (part 1) instructions
                        \ below are modified to the following:
                        \
                        \   LDA #&60 : STA dlin33+1 -> LDA #&92 : STA dlin33+1
                        \   LDA Lookup2E60,X        -> LDA Lookup2E92,X
                        \   LDA #&6A : STA dlin33+1 -> LDA #&92 : STA dlin33+1
                        \   LDA Lookup2E6A,X        -> LDA Lookup2E92,X

.modd2

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 1) where aa is the value of A:
                        \
 STA dlin2+1            \   LDA #&60 : STA dlin33+1 -> LDA #&aa : STA dlin33+1
 STA dlin23+1           \   LDA Lookup2E60,X        -> LDA Lookup2Eaa,X
 STA dlin4+1            \   LDA #&6A : STA dlin33+1 -> LDA #&aa : STA dlin33+1
 STA dlin28+1           \   LDA Lookup2E6A,X        -> LDA Lookup2Eaa,X

 LDA colourCycle        \ Modify the following instruction in DrawCanopyLine
 STA dlin50+1           \ (part 2):
 LDA #&A9               \
 STA dlin50             \   LDA H -> LDA #colourCycle
                        \
                        \ as the opcode for the LDA #n instruction is &A9

 RTS                    \ Return from the subroutine

.modd3

                        \ If we get here then colourLogic is non-zero

 LDA #&11               \ Set A to the opcode for the ORA (P),Y instruction

 STA dlin24             \ Modify the screen-poking instructions in
 STA dlin29             \ DrawCanopyLine (part 2):
                        \
                        \   ORA (P),Y -> ORA (P),Y
                        \
                        \ i.e. set them back to the default

 STA dlin34             \ Modify the screen-poking instructions in
 STA dlin51             \ DrawCanopyLine (part 1):
                        \
                        \   ORA (P),Y -> ORA (P),Y
                        \
                        \ i.e. set them back to the default

 LDA colourLogic        \ If bit 7 of colourLogic is set, i.e. %10000000, jump
 BMI modd4              \ to modd4

                        \ If we get here then colourLogic is %01000000

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 1):
 LDA #LO(Lookup2E74)    \
 STA dlin2+1            \   LDA #&60 : STA dlin33+1 -> LDA #&74 : STA dlin33+1
 STA dlin23+1           \   LDA Lookup2E60,X        -> LDA Lookup2E74,X
 LDA #LO(Lookup2E7E)    \
 STA dlin4+1            \   LDA #&6A : STA dlin33+1 -> LDA #&74 : STA dlin33+1
 STA dlin28+1           \   LDA Lookup2E6A,X        -> LDA Lookup2E7E,X

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 2):
 LDA #&80               \
 STA dlin47+1           \   LDA #8 -> LDA #&80
 LDA #8                 \
 STA dlin58+1           \   CMP #0 -> CMP #8
 LDA #&80               \
 STA dlin59+1           \   LDA #8 -> LDA #&80
 LDA #0                 \
 STA dlin62+1           \   CMP #16 -> CMP #0
 LDA #16                \
 STA dlin63+1           \   LDA #1 -> LDA #16

 BNE modd5              \ Jump down to modd5 (this BNE is effectively a JMP as
                        \ A is never zero)

.modd4

                        \ If we get here then colourLogic is %10000000

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 1):
 LDA #LO(Lookup2E60)    \
 STA dlin2+1            \   LDA #&60 : STA dlin33+1 -> LDA #&60 : STA dlin33+1
 STA dlin23+1           \   LDA Lookup2E60,X        -> LDA Lookup2E60,X
 LDA #LO(Lookup2E6A)    \
 STA dlin4+1            \   LDA #&6A : STA dlin33+1 -> LDA #&6A : STA dlin33+1
 STA dlin28+1           \   LDA Lookup2E6A,X        -> LDA Lookup2E6A,X
                        \
                        \ i.e. set them back to the default

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 2):
 LDA #8                 \
 STA dlin47+1           \   LDA #8 -> LDA #8
 LDA #0                 \
 STA dlin58+1           \   CMP #0 -> CMP #0
 LDA #8                 \
 STA dlin59+1           \   LDA #8 -> LDA #8
 LDA #16                \
 STA dlin62+1           \   CMP #16 -> CMP #16
 LDA #1                 \
 STA dlin63+1           \   LDA #1 -> LDA #1
                        \
                        \ i.e. set them back to the default

.modd5

                        \ Modify the following instructions in DrawCanopyLine
                        \ (part 2):
 LDA #&A5               \
 STA dlin50             \   LDA H -> LDA H
 LDA #&79               \
 STA dlin50+1           \ as the opcode for the LDA n instruction is &A5

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ClipBestEndOfLine
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Clip a line at the start or end point, depending on which is best
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (RR R)              The x-coordinate of the line's start point
\
\   (SS S)              The y-coordinate of the line's start point
\
\   TT                  The clipping requirements for the start point
\
\   (QQ W)              The x-coordinate of the line's end point
\
\   (H G)               The y-coordinate of the line's end point
\
\   UU                  The clipping requirements for the end point
\
\ Returns:
\
\   (RR R)              The x-coordinate of the line's new start point, clipped
\                       to fit on-screen
\
\   (SS S)              The y-coordinate of the line's new start point, clipped
\                       to fit on-screen
\
\   T                   Relative magnitude of line's vector |x-delta|
\
\   U                   Relative magnitude of line's vector |y-delta|
\
\   W                   Max/min x-coordinate for the new end of the line
\
\   G                   Max/min y-coordinate for the new end of the line
\
\ Other entry points:
\
\  AbortLine            Abort drawing this line
\
\ ******************************************************************************

.ClipBestEndOfLine

 LDA TT                 \ If TT and UU have a set bit in common, this means that
 AND UU                 \ both points are off-screen in the same direction, so
 BNE AbortLine          \ the line can't possibly cross the visible part of the
                        \ screen at any point, so jump to AbortLine to abort the
                        \ drawing of this line

 LDA SS                 \ If the start point's y-coordinate is positive, jump to
 BPL clen1              \ clen1 to skip the following instruction

 EOR #&FF               \ Flip the start point's y-coordinate so it's positive,
                        \ so:
                        \
                        \   A = |start_y|

.clen1

 STA maxCoord           \ Store the start point's y-coordinate in maxCoord, so:
                        \
                        \   maxCoord = |start_y|

 LDA RR                 \ If the start point's x-coordinate is positive, jump to
 BPL clen2              \ clen2 to skip the following instruction

 EOR #&FF               \ Flip the start point's x-coordinate so it's positive,
                        \ so:
                        \
                        \   A = |start_x|

.clen2

 CMP maxCoord           \ If the start point's x-coordinate is < maxCoord, jump
 BCC clen3              \ to clen3 to skip the following instruction

 STA maxCoord           \ The start point's x-coordinate is >= maxCoord, so
                        \ update maxCoord so it contains the maximum value:
                        \
                        \   maxCoord = max(|start_x|, |start_y|)

.clen3

 LDA QQ                 \ If the end point's x-coordinate is positive, jump to
 BPL clen4              \ clen4 to skip the following instruction

 EOR #&FF               \ Flip the end point's x-coordinate so it's positive,
                        \ so:
                        \
                        \   A = |end_x|

.clen4

 CMP maxCoord           \ If |end_x| >= maxCoord, the start point has a smaller
 BCS ClipStartOfLine    \ x-coordinate magnitude which means it is closer to the
                        \ origin, so jump to ClipStartOfLine to clip the line at
                        \ the start point, as it's a better candidate for
                        \ clipping

 LDA H                  \ If the end point's y-coordinate is positive, jump to
 BPL clen5              \ clen5 to skip the following instruction

 EOR #&FF               \ Flip the end point's y-coordinate so it's positive,
                        \ so:
                        \
                        \   A = |end_y|

.clen5

 CMP maxCoord           \ If |end_y| >= maxCoord, the start point has a smaller
 BCS ClipStartOfLine    \ y-coordinate magnitude which means it is closer to the
                        \ origin, so jump to ClipStartOfLine to clip the line at
                        \ the start point, as it's a better candidate for
                        \ clipping

 JSR SwapLinePoints     \ Otherwise the end point is the better candidate for
                        \ clipping, so copy the end point's coordinates and
                        \ clipping information into the start point

 LDA V                  \ We've just flipped the end point to the start, so flip
 EOR #%11000000         \ bits 6 and 7 in V to reverse the line direction in
 STA V                  \ both axes

 JMP ClipStartOfLine    \ Jump to ClipStartOfLine to clip the line at the new
                        \ start point

.AbortLine

 TSX                    \ Remove two bytes from the top of the stack, which
 INX                    \ removes the return address that was put there by the
 INX                    \ last JSR instruction. This means that the RTS below
 TXS                    \ jumps two levels up the call stack, rather than one,
                        \ so we return to the subroutine that called the
                        \ subroutine that called ClipBestEndOfLine. The only
                        \ call to ClipBestEndOfLine is in the DrawClippedLine
                        \ routine, and the only call to DrawClippedLine is in
                        \ DrawCanopyView, so this ensures that the RTS below
                        \ returns us to to DrawCanopyView without drawing the
                        \ line and without leaving anything on the stack
                        \
                        \ In short, this makes the RTS abort the drawing of this
                        \ line

 RTS                    \ Return to the DrawCanopyView routine

\ ******************************************************************************
\
\       Name: ClipStartOfLine (Part 1 of 5)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Check whether the line is completely off-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (RR R)              The x-coordinate of the line's start point
\
\   (SS S)              The y-coordinate of the line's start point
\
\   (I T)               The line's |x-delta|
\
\   (J U)               The line's |y-delta|
\
\   TT                  The clipping requirements for the start point
\                        
\                                                     Bit 4     Bit 5
\                           Off top of screen           0         1
\                           On-screen                   0         0
\                           Off bottom of screen        1         0
\                        
\                                                     Bit 6     Bit 7
\                           Off right of screen         0         1
\                           On-screen                   0         0
\                           Off left of screen          1         0
\
\   V                   Direction of the line:
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                       Direction is like a clock, so positive (clear) is up and
\                       right
\
\ Returns:
\
\   R                   The x-coordinate of the line's start point, clipped to
\                       fit on-screen
\
\   S                   The y-coordinate of the line's start point, clipped to
\                       fit on-screen
\
\   V                   Bit 0 is set to indicate the line has been clipped
\
\ ******************************************************************************

.ClipStartOfLine

 LDA S                  \ Set (SS S) = (SS S) + 4
 CLC                    \
 ADC #4                 \ starting with the low bytes
 STA S

 BCC clip1              \ If the addition didn't overflow, jump to clip1 to
                        \ skip the following instruction

 INC SS                 \ And then we increment the high byte if the addition
                        \ overflowed
                        \
                        \ So we have now added an extra 4 to the start
                        \ y-coordinate:
                        \
                        \   (SS S) = (SS S) + 4
                        \
                        \ We add this to make the x- and y-coordinate consistent
                        \ in terms of range, as the canopy's x-coordinates start
                        \ at 4, but the y-coordinates start at 0. We remove this
                        \ additional 4 at the end, after clipping the line

.clip1

                        \ We now do some simple checks to weed out lines that
                        \ are entirely off to one side of the screen

 LDA TT                 \ Set A = the clipping requirements for the start point

 BIT V                  \ If bit 7 of V is clear, jump to clip2 as the x-delta
 BPL clip2              \ of the line is positive, or to the right

                        \ Bit 7 of V is set, so the x-delta of the line is
                        \ negative, or to the left

 AND #%01000000         \ If bit 6 of TT is set, then the start point is off the
 BNE AbortLine          \ left of the screen and the line direction is also to
                        \ the left, so jump to AbortLine to stop drawing the
                        \ line as it must be entirely off-screen

 BEQ clip3              \ Jump to clip3 to move on to the next check (this BEQ
                        \ is effectively a JMP, as A is always zero)

.clip2

                        \ If we get here then the x-delta of the line is
                        \ positive, or to the right

 AND #%10000000         \ If bit 7 of TT is set, then the start point is off the
 BNE AbortLine          \ right of the screen and the line direction is also to
                        \ the right, so jump to AbortLine to stop drawing the
                        \ line as it must be entirely off-screen

 BEQ clip3              \ Jump to clip3 to move on to the next check (this BEQ
                        \ is effectively a JMP, as A is always zero)

.clip3

 LDA TT                 \ Set A = the clipping requirements for the start point

 BVC clip4              \ If bit 6 of V is clear, jump to clip4 as the y-delta
                        \ of the line is positive, or up

                        \ Bit 6 of V is set, so the y-delta of the line is
                        \ negative, or down

 AND #%00010000         \ If bit 4 of TT is set, then the start point is off the
 BNE AbortLine          \ bottom of the screen and the line direction is also
                        \ down, so jump to AbortLine to stop drawing the
                        \ line as it must be entirely off-screen

 BEQ clip5              \ Jump to clip5 to move on to the next check (this BEQ
                        \ is effectively a JMP, as A is always zero)

.clip4

                        \ If we get here then the y-delta of the line is
                        \ positive, or up

 AND #%00100000         \ If bit 5 of TT is set, then the start point is off the
 BNE AbortLine          \ top of the screen and the line direction is also up,
                        \ so jump to AbortLine to stop drawing the line as it
                        \ must be entirely off-screen

                        \ If we get here then the line might have an on-screen
                        \ element, so we now move on to the actual clipping

\ ******************************************************************************
\
\       Name: ClipStartOfLine (Part 2 of 5)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ If slope is /
\   (UU TT) = |start_x + start_y - 159|
\   Clear bit 7 of WW
\
\ If slope is \
\   (UU TT) = |start_y - start_x|
\   Set bit 7 of WW
\
\ (Q P) = |x-delta| + |y-delta| + 2
\
\ ******************************************************************************

.clip5

 LDA V                  \ If either bit 7 or bit 6 of V are set, but not both,
 ASL A                  \ then if we EOR them we will get a 1, so this jumps to
 EOR V                  \ clip6 if this is the case
 BMI clip6

                        \ If we get here then bits 6 and 7 of V are the same, so
                        \ the line slope is up-right or down-left, i.e. /

 LDA #0                 \ Set WW = 0, so bit 7 is clear
 STA WW

 LDA R                  \ Set (UU TT) = (RR R) + (SS S)
 CLC                    \
 ADC S                  \ starting with the low bytes
 STA TT

 LDA RR                 \ And then the high bytes
 ADC SS
 STA UU

 LDA TT                 \ Set (UU TT) = (UU TT) - 159
 SEC                    \
 SBC #159               \ starting with the low bytes
 STA TT

 LDA UU                 \ And then the high bytes, so we now have:
 SBC #0                 \
 STA UU                 \   (UU TT) = start_x + start_y - 159

 JMP clip7

.clip6

                        \ If we get here then bits 6 and 7 of V are different,
                        \ so the line slope is up-right or down-left, i.e. \

 LDA #%10000000         \ Set WW = %10000000, so bit 7 is set
 STA WW

 LDA S                  \ Set (UU TT) = (SS S) - (RR R)
 SEC                    \
 SBC R                  \ starting with the low bytes
 STA TT

 LDA SS                 \ And then the high bytes, so now we have:
 SBC RR                 \
 STA UU                 \   (UU TT) = start_y - start_x

.clip7

 BPL clip8              \ If (UU TT) is positive, jump to clip8

 LDA #0                 \ Set (UU TT) = 0 - (UU TT)
 SEC                    \
 SBC TT                 \ starting with the low bytes
 STA TT

 LDA #0                 \ And then the high bytes, so (UU TT) is now positive,
 SBC UU                 \ so:
 STA UU                 \
                        \   (UU TT) = |UU TT|
                        \           = |start_x + start_y - 159| if slope is /
                        \             |start_y - start_x|       if slope is \

.clip8

 LDA T                  \ Set (Q P) = (I T) + (J U)
 CLC                    \
 ADC U                  \ starting with the low bytes
 STA P

 LDA I                  \ And then the high bytes, so:
 ADC J                  \
 STA Q                  \   (Q P) = |x-delta| + |y-delta|

 LDA P                  \ Set (Q P) = (Q P) + 2
 CLC                    \
 ADC #2                 \ starting with the low bytes
 STA P

 BCC clip9              \ If the addition didn't overflow, jump to clip9 to
                        \ skip the following instruction

 INC Q                  \ Increment the high byte in Q

\ ******************************************************************************
\
\       Name: ClipStartOfLine (Part 3 of 5)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Shallow horizontal:
\   Bit 7 of HH = direction of the y-delta
\   (PP N) = |x-delta| + 1
\   Clear bit 6 of WW
\
\ Steep vertical:
\   Bit 7 of HH = direction of the x-delta
\   (PP N) = |y-delta| + 1
\   Set bit 6 of WW
\   Cet (RR R) = (SS S), so start_x is set to start_y
\
\ ******************************************************************************

.clip9

 LDA #0                 \ Set K = 0, though this has no effect as we don't use
 STA K                  \ K in the following

 LDA I                  \ If I < J, then (I T) < (J U), so jump to clip11
 CMP J
 BCC clip11

 BNE clip10             \ If I > J, then (I T) > (J U), so jump to clip10

                        \ If we get here then I = J

 LDA T                  \ If T < U, then (I T) < (J U), so jump to clip11
 CMP U
 BCC clip11

.clip10

                        \ If we get here, then (I T) >= (J U), which is the same
                        \ as |x-delta| >= |y-delta|, so this is a shallow
                        \ horizontal slope

 LDA V                  \ Set HH = V
 STA HH                 \
                        \ so bit 7 of HH is set to bit 7 of V, i.e. the
                        \ direction of the y-delta

 LDA T                  \ Set (PP N) = (I T) + 1
 CLC                    \
 ADC #1                 \ starting with the low bytes
 STA N

 LDA I                  \ And then the high bytes, so:
 ADC #0                 \
 STA PP                 \   (PP N) = |x-delta| + 1

 JMP clip12             \ Jump down to clip12 to move on to the next stage

.clip11

                        \ If we get here, then (I T) < (J U), which is the same
                        \ as |x-delta| < |y-delta|, so this is a steep vertical
                        \ slope

 LDA V                  \ Set HH = V << 1
 ASL A                  \
 STA HH                 \ so bit 7 of HH is set to bit 6 of V, i.e. the
                        \ direction of the x-delta

 LDA U                  \ Set (PP N) = (J U) + 1
 CLC                    \
 ADC #1                 \ starting with the low bytes
 STA N

 LDA J                  \ And then the high bytes, so:
 ADC #0                 \
 STA PP                 \   (PP N) = |y-delta| + 1

 LDA WW                 \ Set bit 6 of WW
 ORA #%01000000
 STA WW

 LDA S                  \ Set (RR R) = (SS S)
 STA R                  \
 LDA SS                 \ so the x-coordinate of the line's start point is now
 STA RR                 \ the y-coordinate of the start point

\ ******************************************************************************
\
\       Name: ClipStartOfLine (Part 4 of 5)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Division algorithm of some kind, I think it's this for a shallow horizontal /
\
\ (QQ G) = (UU TT) * (PP N) / (Q P)
\        =   (start_x + start_y - 159) * (|x-delta| + 1)
\          / (|x-delta| + |y-delta|)
\
\ This calculates the delta to add to the coordinates in the final part, but I
\ haven't got to the bottom of this
\
\ 1. Double (Q P) and (PP N) until Q >= UU
\ If Q = UU and P < TT, repeat until P >= TT
\ i.e. repeat until (Q P) >= (UU TT)
\ 
\ 2. Halve (Q P K) and (PP N VV) until Q < UU
\ i.e. repeat until (Q P K) < (UU TT H)
\
\ 3. If (Q P K) = 0, done
\ Otherwise add 0.5 to (PP N) using a third byte (so add 128)
\           (UU TT H) = (UU TT 0) - (Q P K)
\           Jump back to step 2 while (UU TT H) >= 2
\
\ ******************************************************************************

.clip12

 LDA #128               \ Set W = 128, to use in (QQ G W)
 STA W

 LDA #0                 \ Set VV = 0, to use as the third byte in (PP N VV)
 STA VV

 STA K                  \ Set K = 0, to use as the third byte in (Q P K)

 STA H                  \ Set H = 0, to use as the third byte in (UU TT H)

 STA QQ                 \ Set QQ = 0, to use in (QQ G W)

 STA G                  \ Set G = 0, so now we have:
                        \
                        \   (QQ G W) = 128

 BEQ clip14             \ Jump to clip14 (this BEQ is effectively a JMP as A is
                        \ always zero)

.clip13

 ASL P                  \ Set (Q P) = (Q P) * 2
 ROL Q

 ASL N                  \ Set (PP N) = (PP N) * 2
 ROL PP

.clip14

 LDA Q                  \ If Q < UU, jump up to clip13 to double the values of
 CMP UU                 \ (Q P) and (PP N) until Q >= UU
 BCC clip13

 BNE clip15             \ If Q <> UU, i.e. Q > U, then jump to clip15

 LDA P                  \ If we get here then Q = UU, so if P < TT, jump back to
 CMP TT                 \ clip13 to keep on doubling until P >= TT
 BCC clip13

.clip15

 LSR Q                  \ Set (Q P K) = (Q P K) / 2
 ROR P
 ROR K

 LSR PP                 \ Set (PP N VV) = (PP N VV) / 2
 ROR N
 ROR VV

.clip16

 LDA Q                  \ If Q < UU, jump down to clip17
 CMP UU
 BCC clip17

 BNE clip15             \ If Q <> UU, i.e. Q > U, jump back to clip15 to keep on
                        \ halving until Q < UU or Q = UU

 LDA P                  \ If we get here then Q = UU, so if P < TT, jump down to
 CMP TT                 \ clip17
 BCC clip17

 BNE clip15             \ If P <> TT, i.e. P > TT, jump back to clip15 to keep
                        \ on halving until Q < UU, or Q = UU and P <= TT

 LDA K                  \ If K <= H, jump down to clip17
 CMP H
 BCC clip17
 BEQ clip17

 LDA Q                  \ If (Q P K) <> 0, jump back to clip15
 ORA P
 ORA K
 BNE clip15

 BEQ clip18             \ (Q P K) = 0 so jump to clip18 (this BEQ is effectively
                        \ a JMP as we just passed through a BNE)

.clip17

                        \ The first time we get here, QQ = G = 0 and W = 128, so
                        \ the following sum is (QQ G W) = 128 + (PP N VV)

 LDA W                  \ Set (QQ G W) = (QQ G W) + (PP N VV)
 CLC                    \
 ADC VV                 \ starting with the low bytes
 STA W

 LDA G                  \ Then the middle bytes
 ADC N
 STA G

 LDA QQ                 \ And then the high bytes
 ADC PP
 STA QQ

                        \ The first time we get here, H = 0, so the
                        \ following sum is (UU TT H) = (UU TT 0) - (Q P K)

 LDA H                  \ Set (UU TT H) = (UU TT H) - (Q P K)
 SEC                    \
 SBC K                  \ starting with the low bytes
 STA H

 LDA TT                 \ Then the middle bytes
 SBC P
 STA TT

 LDA UU                 \ And then the high bytes
 SBC Q
 STA UU

                        \ The following comparisons jump back to clip16 if
                        \ (UU TT H) >= 2

 BNE clip16             \ If UU <> 0, jump back to clip16

 LDA TT                 \ If TT <> 0, jump back to clip16
 BNE clip16

 LDA H                  \ If H >= 2, jump back to clip16
 CMP #2
 BCS clip16

                        \ By the time we get here, (UU TT H) is 1 or 0

\ ******************************************************************************
\
\       Name: ClipStartOfLine (Part 5 of 5)
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Move the start point to the clipped position and return it
\
\ ------------------------------------------------------------------------------
\
\ If bit 7 of HH clear, (RR R) and (SS S) = (RR R) + (QQ G)
\ If bit 7 of HH set,   (RR R) and (SS S) = (RR R) - (QQ G)
\
\ If bits 6 and 7 of WW clear,        (SS S)  = 159 - (RR R)
\ If bit 6 of WW is set, bit 7 clear, (RR RR) = 159 - (SS S)
\
\ S = S - 4 to undo the bump in the first part
\
\ Confirm (R, S) is on-screen and return it as the new start point
\
\ ******************************************************************************

.clip18

                        \ By the time we get here, (QQ G W) contains the delta
                        \ that we need to apply to the start point's x- or
                        \ y-coordinate, multiplied by 256 so the lowest byte is
                        \ the fractional part

                        \ If bit 7 of W is set, that means the fractional part
                        \ is at least 0.5, so we add 1 to the integral part in
                        \ (QQ G) to round it up when going from the fractional
                        \ (QQ G W) to the integer (QQ G)

 LDA G                  \ We start with the low byte, rotating bit 7 of W into
 ROL W                  \ the C flag which we then add with ADC #0
 ADC #0
 STA G

 BCC clip19             \ If the addition didn't overflow, jump to clip19 to
                        \ skip the following instruction

 INC QQ                 \ And then we increment the high byte if the addition
                        \ overflowed

.clip19

 LDA HH                 \ If bit 7 of HH is set, jump to clip20 to skip the
 BMI clip20             \ following

                        \ Bit 7 of HH is clear, so we add the delta in (QQ G)
                        \ to both coordinates to move the whole line so the
                        \ start coordinate is on the edge of the screen

 LDA R                  \ Set (RR R) and (S SS) = (RR R) + (QQ G)
 CLC                    \
 ADC G                  \ starting with the low bytes
 STA R
 STA S

 LDA RR                 \ And then the high bytes
 ADC QQ
 STA RR
 STA SS

 JMP clip21             \ Jump to clip21 to skip the following

.clip20

                        \ Bit 7 of HH is set, so we subtract the delta in (QQ G)
                        \ from both coordinates to move the whole line so the
                        \ start coordinate is on the edge of the screen

 LDA R                  \ Set (RR R) and (SS S) = (RR R) - (QQ G)
 SEC                    \
 SBC G                  \  starting with the low bytes
 STA R
 STA S

 LDA RR                 \ And then the high bytes
 SBC QQ
 STA RR
 STA SS

.clip21

 BIT WW                 \ If bit 7 of WW is set, jump to clip23 to skip all of
 BMI clip23             \ the following and return the final coordinates

 BVS clip22             \ If bit 6 of WW is set, jump to clip22 to skip the
                        \ following

                        \ Bits 6 and 7 of WW are both clear, so we update the
                        \ y-coordinate

 LDA #159               \ Set (SS S) = 159 - (RR R)
 SEC                    \
 SBC R                  \ starting with the low bytes
 STA S

 LDA #0                 \ And then the high bytes
 SBC RR
 STA SS

 JMP clip23             \ Jump to clip23 to skip the following

.clip22

                        \ Bit 6 of WW is set, so we update the x-coordinate

 LDA #159               \ Set (RR RR) = 159 - (SS S)
 SEC                    \
 SBC S                  \ starting with the low bytes
 STA R

 LDA #0                 \ And then the high bytes
 SBC SS
 STA RR

.clip23

 LDA RR                 \ If RR is non-zero, jump to clip24 to abort the line as
 BNE clip24             \ the (RR R) x-coordinate is off-screen

 LDA R                  \ If R >= 156, jump to clip24 to abort the line as the
 CMP #156               \ (RR R) x-coordinate is off the right of the screen
 BCS clip24

 CMP #4                 \ If R < 4, jump to clip24 to abort the line as the
 BCC clip24             \ (RR R) x-coordinate is off the left of the screen

 LDA S                  \ Set S = S - 4
 SEC                    \
 SBC #4                 \ which subtracts the 4 that we added at the start of
 STA S                  \ the routine

 BCC clip24             \ If the subtraction just underflowed, jump to clip24 to
                        \ abort the line as the (SS S) y-coordinate is off the
                        \ bottom of the screen

 CMP #152               \ If S > 152, jump to clip24 to abort the line as the
 BCS clip24             \ (SS S) y-coordinate is off the top of the screen

                        \ If we get here then we have successfully clipped the
                        \ start point to the edge of the screen

 LDA #1                 \ Set bit 0 of the line direction in V to indicate that
 ORA V                  \ the line has been clipped
 STA V

 LDA R                  \ Copy the (R, S) pixel coordinate into
 STA xTempLo            \ (xTempLo, yTempLo)
 LDA S
 STA yTempLo

 RTS                    \ Return from the subroutine

.clip24

 JMP AbortLine          \ Jump to AbortLine to abort drawing this line and
                        \ return from the subroutine using a tail call

\ ******************************************************************************
\
\       Name: SwapLinePoints
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Copy an end point into a start point
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (QQ W)              The x-coordinate of the line's end point
\
\   (H G)               The y-coordinate of the line's end point
\
\   UU                  The clipping requirements for the end point
\
\ Returns:
\
\
\   (RR R)              Gets set to the x-coordinate above
\
\   (SS S)              Gets set to the y-coordinate above
\
\   TT                  Gets set to the clipping requirements above
\
\ ******************************************************************************

.SwapLinePoints

 LDA W                  \ Set (RR R) = (QQ W)
 STA R
 LDA QQ
 STA RR

 LDA G                  \ Set (SS S) = (H G)
 STA S
 LDA H
 STA SS

 LDA UU                 \ Set TT = UU
 STA TT

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: EraseCanopyLines
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Draw all the lines from a line buffer to erase them
\
\ ------------------------------------------------------------------------------
\
\ We call this routine from DrawCanopyView, after drawing all the new lines and
\ just before we flip colours. See the DrawCanopyView routine for more details
\ of the colour-cycling system that this forms part of.
\
\ This is what the EraseCanopyLines routine does:
\
\ If colourCycle = %00001111, then colour 1 is white and colour 2 is black:
\
\  *  Draw the lines in line buffer 1, using AND logic and bit pattern %00001111
\  *  Colour 2 on-screen is %11110000, so AND'ing with %00001111 gives 0
\  *  So this erases all the lines in buffer 1, which are on-screen in colour 2
\     i.e. we erase all the lines in line buffer 1 from the hidden screen
\
\ If colourCycle = %11110000, then colour 1 is black and colour 2 is white:
\
\  *  Draw the lines in line buffer 2, using AND logic and bit pattern %11110000
\  *  Colour 1 is %00001111, so AND'ing with %11110000 gives 0
\  *  So this erases all the lines in buffer 2, which are on-screen in colour 1
\     i.e. we erase all the lines in line buffer 2 from the hidden screen
\
\ ******************************************************************************

.EraseCanopyLines

 LDA #%00000000         \ Set colourLogic = %00000000 so when we draw a line, it
 STA colourLogic        \ erases it

 JSR ModifyDrawRoutine  \ Modify the drawing routines to use AND logic and the
                        \ bit patterns that match colourCycle

.ecal1

 LDA colourCycle        \ If bit 7 of colourCycle is clear, i.e. %00001111, jump
 BPL ecal3              \ down to ecal3

                        \ If we get here, colourCycle is %11110000

 LDX lineBuffer2Count   \ If lineBuffer2Count <> 47, line buffer 2 is not
 CPX #47                \ empty, so jump down to ecal2 to draw the next line
 BNE ecal2              \ from the buffer

 RTS                    \ Return from the subroutine

.ecal2

 DEC lineBuffer2Count   \ Decrement the value in lineBuffer2Count as we are
                        \ about to draw the next line from buffer 2

 JMP ecal5              \ Jump down to ecal5 to draw the next line from buffer 2

.ecal3

 LDX lineBuffer1Count   \ If lineBuffer1Count <> -1, line buffer 1 is not
 CPX #255               \ empty, so jump down to ecal4 to draw the next line
 BNE ecal4              \ from the buffer

 RTS                    \ Return from the subroutine

.ecal4

 DEC lineBuffer1Count   \ Decrement the value in lineBuffer1Count as we are
                        \ about to draw the next line from buffer 1

.ecal5

                        \ We now fetch the next line from the line buffer

 LDA lineBufferR,X      \ Set R to the start x-coordinate from lineBufferR
 STA R

 STA xTempLo

 LDA lineBufferW,X      \ Set W to the max/min x-coordinate from lineBufferW
 STA W

 LDA lineBufferS,X      \ Set S to the start y-coordinate from lineBufferS
 STA S

 STA yTempLo

 LDA lineBufferG,X      \ Set G to max/min y-coordinate from lineBufferG
 STA G

 LDA lineBufferT,X      \ Set T to the |x-delta| from lineBufferT
 STA T

 LDA lineBufferU,X      \ Set U to the |y-delta| from lineBufferU
 STA U

 LDA lineBufferV,X      \ Set V to the direction from lineBufferV
 STA V

 JSR DrawCanopyLine     \ Draw the line (to erase it)

 JMP ecal1              \ Loop back to ecal1 to erase the next line

 EQUB &17               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: Multiply16x16Mix
\       Type: Subroutine
\   Category: Maths
\    Summary: Multiply two 16-bit numbers with different sign bits (one in bit 7
\             of the high byte, the other in bit 0 of the low byte)
\
\ ------------------------------------------------------------------------------
\
\ This routine multiplies two 16-bit numbers with different sign bits, where one
\ argument (J I) has the sign in bit 7 of the high byte, and the other argument
\ (S R) has the sign in bit 0 of the low byte. It calculates:
\
\   (H G) = (J I) * (S R) / 256
\
\ The result in (H G) has the sign in bit 7 of the high byte.
\
\ The fractional part of the result is in W, so this is the full result, though
\ in practice W is ignored:
\
\   (H G W) = (J I) * (S R)
\
\ Arguments:
\
\   (J I)               A signed 16-bit number, with the sign in bit 7 of J
\
\   (S R)               A signed 16-bit number, with the sign in bit 0 of R
\
\   K                   Optionally negate (J I):
\
\                         * 0 = calculate (J I) * (S R)
\
\                         * 128 = calculate -(J I) * (S R)
\
\                       In practice, this routine is always called with K = 0
\
\ Returns:
\
\   (H G)               The result of the multiplication, with the sign in bit 7
\                       of H
\
\   K                   The sign of the result (in bit 7)
\
\ ******************************************************************************

.Multiply16x16Mix

 LDA J                  \ If J is positive, jump to mmix1 as (J I) is already a
 BPL mmix1              \ positive 16-bit number

 LDA #0                 \ Negate (J I) so (J I) is now a positive 16-bit number
 SEC
 SBC I
 STA I
 LDA #0
 SBC J
 STA J

 LDA K                  \ Flip bit 7 of K, so when K = 0 we negate the result
 EOR #%10000000         \ below to give the result the correct sign
 STA K

.mmix1

 LDA R                  \ If bit 0 of R is 0, jump to mmix2 as (S R) is positive
 AND #1
 BEQ mmix2

 LDA K                  \ Otherwise (S R) is negative, so flip bit 7 of K, so
 EOR #%10000000         \ when K = 0 we negate the result below to give the
 STA K                  \ result the correct sign

.mmix2

 JSR Multiply16x16      \ Calculate (H A) = (S R) * (J I) / 256
                        \
                        \ and set the C flag if we need to increment H

 STA G                  \ Set (H G) = (H A)
                        \           = (S R) * (J I) / 256

 BCC mmix3              \ Increment the top byte in H if required
 INC H

.mmix3

 LDA K                  \ If K is positive, jump to mmix4 to return from the
 BPL mmix4              \ subroutine as the sign of the result is already
                        \ correct

 SEC                    \ Negate (H G) so the result has the correct sign
 LDA #0
 SBC G
 STA G
 LDA #0
 SBC H
 STA H

.mmix4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Multiply8x8
\       Type: Subroutine
\   Category: Maths
\    Summary: Calculate (A V) = X * Y
\
\ ------------------------------------------------------------------------------
\
\ This routine multiplies two unsigned 8-bit numbers. It uses the following
\ algorithm:
\
\   %XXXXxxxx * %YYYYyyyy = (%XXXX0000 + %0000xxxx) * (%YYYY0000 + %0000yyyy)
\
\                         = (%XXXX0000 * %YYYY0000) + (%XXXX0000 * %0000yyyy)
\                                                   + (%0000xxxx * %YYYY0000)
\                                                   + (%0000xxxx * %0000yyyy)
\
\                         = (%YYYY * %XXXX) << 8    + (%XXXX * %yyyy << 4)
\                                                   + (%xxxx * %YYYY << 4)
\                                                   + (%xxxx * %yyyy)
\
\                         = (%YYYY * %XXXX) << 8    + ((%XXXX * %yyyy)
\                                                   + (%xxxx * %YYYY)) << 4
\                                                   + (%xxxx * %yyyy)
\
\ Arguments:
\
\   X                   An unsigned 8-bit value (0 to 255)
\
\   Y                   An unsigned 8-bit value (0 to 255)
\
\ Returns:
\
\   (A V)               X * Y
\
\ ******************************************************************************

.Multiply8x8

                        \ We start with X = %XXXXxxxx and Y = %YYYYyyyy

 LDA lowNibble,X        \ Set T = (X AND %00001111) OR (Y AND %11110000)
 ORA highNibble,Y       \       = %0000xxxx OR %YYYY0000
 STA T                  \       = %YYYYxxxx

 AND #%11110000         \ Set U = (A AND %11110000) OR (X >> 4)
 ORA shift4Right,X      \       = %YYYY0000 OR %0000XXXX
 STA U                  \       = %YYYYXXXX

 AND #%00001111         \ Set Y = (A AND %00001111) OR (Y << 4)
 ORA shift4Left,Y       \       = %0000XXXX OR %yyyy0000
 TAY                    \       = %yyyyXXXX

 AND #%11110000         \ Set X = (A AND %11110000) OR (X AND %00001111)
 ORA lowNibble,X        \       = %yyyy0000 OR %0000xxxx
 TAX                    \       = %yyyyxxxx

 LDA timesTable,X       \ Set V = %yyyy * %xxxx
 STA V

 LDX T                  \ Set X = T = %YYYYxxxx

 LDA timesTable,X       \ Set A = (%YYYY * %xxxx) + (%yyyy * XXXX)
 CLC                    \
 ADC timesTable,Y       \ Call this %AAAAaaaa with carry C

 ROR A                  \ Set T = A rotated right by 4 places
 ROR A                  \       = %aaaCAAAA
 ROR A                  \
 ROR A                  \ and set the C flag to bit 3 of A
 STA T

 ROR A                  \ Set A = %aaaaCAAA

 AND #%11110000         \ Set A = %aaaa0000

 CLC                    \ Set V = V + A
 ADC V                  \       = V + %aaaa0000
 STA V                  \       = (%yyyy * %xxxx) + %aaaa0000

 LDA T                  \ Set A = T AND %00011111
 AND #%00011111         \       = %aaaCAAAA AND %00011111
                        \       = %000CAAAA

 LDX U                  \ Set A = A + %YYYY * %XXXX
 ADC timesTable,X       \       = %000CAAAA + (%YYYY * %XXXX)

                        \ So we now have:
                        \
                        \   (A V) = A << 8 + V
                        \
                        \         =   (%000CAAAA + (%YYYY * %XXXX)) << 8
                        \           + (%yyyy * %xxxx) + %aaaa0000
                        \
                        \         =   %000CAAAA << 8
                        \           + (%YYYY * %XXXX) << 8
                        \           + (%yyyy * %xxxx)
                        \           + %aaaa0000
                        \
                        \         =   (%YYYY * %XXXX) << 8
                        \           + %000CAAAAaaaa0000
                        \           + (%yyyy * %xxxx)
                        \
                        \ We also have the following:
                        \
                        \   %CAAAAaaaa = (%YYYY * %xxxx) + (%yyyy * XXXX)
                        \
                        \ and:
                        \
                        \   %000CAAAAaaaa0000 = %CAAAAaaaa << 4
                        \
                        \ so combining them all, we get:
                        \
                        \   (A V) =   (%YYYY * %XXXX) << 8
                        \           + %CAAAAaaaa << 4
                        \           + (%yyyy * %xxxx)
                        \
                        \         =   (%YYYY * %XXXX) << 8
                        \             ((%YYYY * %xxxx) + (%yyyy * XXXX)) << 4
                        \           + (%yyyy * %xxxx)
                        \
                        \ which is the result we want

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetMatrix
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   Y                   ???
\
\   matrixAxis          The axis to be processed:
\
\                          * 0 = x-axis
\
\                          * 1 = y-axis
\
\                          * 2 = z-axis
\
\ ******************************************************************************

.SetMatrix

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

 STA Q
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
 LDY matrixAxis
 BIT K
 BVS L18CD

 BMI L18B3

 LDA Q
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

 LDA Q
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
 LDA Q
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
 LDA Q
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
\   Category: 3D geometry
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   
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

 JSR Multiply8x8        \ Set (A V) = X * Y

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
\       Name: Multiply4x16
\       Type: Subroutine
\   Category: Maths
\    Summary: Calculate (G W) = V * (S R)
\
\ ------------------------------------------------------------------------------
\
\ This routine multiplies a 4-bit number by a 16-bit number, using the lookup
\ table at timesTable for fast results.

\ Arguments:
\
\   (S R)               A 16-bit number
\
\   V                   A 4-bit number (0 to 15), can be positive or negative
\                       (i.e. bit 7 contains the sign, bits 0-3 the magnitude)
\
\   K                   Determines whether to multiply the result by 2:
\
\                         * If K = 0, calculate (G W) = V * (S R) / 16
\
\                         * If K = 1, calculate (G W) = V * (S R) / 8
\
\ ******************************************************************************

.Multiply4x16

 LDX S                  \ Set X = S = %SSSSssss

 LDY V                  \ Set Y = V = %VVVVvvvv

 LDA shift4Left,Y       \ Set A = V << 4
                        \       = %vvvv0000
 
 ORA shift4Right,X      \ Set Y = A OR (S >> 4)
 TAY                    \       = %vvvv0000 OR %0000SSSS
                        \       = %vvvvSSSS

 AND #%11110000         \ Set U = (A AND %11110000) OR (X AND %00001111)
 ORA lowNibble,X        \       = (%vvvvSSSS AND %11110000) OR (X AND %00001111)
 STA U                  \       = %vvvv0000 OR (%SSSSssss AND %00001111)
                        \       = %vvvvssss

 LDX R                  \ Set X = R = %RRRRrrrr

 AND #%11110000         \ Set X = (A AND %1111000) OR (X >> 4)
 ORA shift4Right,X      \       = (%vvvvssss AND %11110000) OR (%RRRRrrrr >> 4)
 TAX                    \       = %vvvv0000 OR %0000RRRR
                        \       = %vvvvRRRR

 LDA timesTable,X       \ Set X = %vvvv * %RRRR
 TAX                    \
                        \ Call this %XXXXxxxx

 STX T                  \ Set T = %XXXXxxxx

 LDA timesTable,Y       \ Set Y = %vvvv * %SSSS
 TAY                    \
                        \ Call this %YYYYyyyy

 LDA shift4Right,X      \ Set A = (X >> 4) OR (Y << 4)
 ORA shift4Left,Y       \       = %0000XXXX OR %yyyy0000
                        \       = %yyyyXXXX

 CLC                    \ Set W = A + (%vvvv * %ssss)
 LDX U                  \       = %yyyyXXXX + (%vvvv * %ssss)
 ADC timesTable,X
 STA W

 LDA shift4Right,Y      \ Set G = (Y >> 4) + carry
 ADC #0                 \       = %0000YYYY + carry
 STA G

                        \ So (G W) = %YYYYyyyyXXXX + (%vvvv * %ssss)
                        \          = %YYYYyyyy0000 + %XXXX + (%vvvv * %ssss)
                        \          =   %vvvv * %SSSS << 4
                        \            + %vvvv * %RRRR >> 4
                        \            + %vvvv * %ssss
                        \          = %vvvv * (%SSSS << 4 + %ssss + %RRRR >> 4)
                        \          = %vvvv * (%SSSSssss + %RRRR >> 4)
                        \          = %vvvv * (S R) >> 4
                        \          = V * (S R) >> 4
                        \          = V * (S R) / 16

 BIT K                  \ If bit 7 of K is clear, jump to msrv2 to skip the
 BPL msrv2              \ following and apply the correct sign to the result

 LDX R                  \ Set X = R = %RRRRrrrr

 LDA V                  \ Set Y = (V AND %00001111) OR (X << 3)
 AND #%00001111         \       = %0000vvvv OR %rrrr0000
 ORA shift4Left,X       \       = %rrrrvvvv
 TAY

 LDX T                  \ Set X = T = %XXXXxxxx

 LDA shift4Left,X       \ Set A = (X << 4) + (%rrrr * %vvvv)
 CLC                    \       = %xxxx0000 + (%rrrr * %vvvv)
 ADC timesTable,Y       \       = %vvvv * %RRRR << 4 + %rrrr * %vvvv
                        \       = %vvvv * (%RRRR << 4 + %rrrr)
                        \       = %vvvv * %RRRRrrrr
                        \       = V * R

 BCC msrv1              \ If the addition didn't overflow, i.e. V * R < 256,
                        \ jump to msrv1 to skip the following

 INC W                  \ Set (G W) = (G W) + 1
 BNE msrv1              \
 INC G                  \ to round the result up, as the low bytes of the
                        \ multiplication produced a carry

.msrv1

 ASL A                  \ Set (G W A) = (G W A) * 2
 ROL W                  \
 ROL G                  \ so the result is doubled when bit 7 of K is set

.msrv2

 LDA V                  \ If V is positive, skip the following
 BPL msrv3

 LDA #0                 \ V is negative, so we now negate (G W) by subtracting
 SEC                    \ it from 0, first the low byte and then the high byte
 SBC W
 STA W
 LDA #0
 SBC G
 STA G

.msrv3

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetObjPointCoords (Part 1 of 2)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Calculate the coordinate for a point within an object
\  Deep dive: Rotating and translating multi-point objects in 3D space
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   GG                  The ID of the point to process and update
\
\   matrixNumber        The matrix to use in the calculation:
\
\                         * 0 = matrix 1
\                         * 9 = matrix 2
\                         * 18 = matrix 3
\                         * 27 = matrix 4
\
\   objectAnchorPoint   Point ID of the anchor point to which we add the final
\                       result to
\
\ Returns:
\
\   xPointHi etc.       Point GG is set to the point's coordinate in 3D space
\
\   showLine            If the calculation overflows, then the coordinate does
\                       not fit within the boundaries of Aviator's 3D world, so
\                       bit 6 is set to indicate that the line containing this
\                       point should not be shown
\
\   xTempHi etc.        The rotated vector from the anchor point to the object
\                       point
\
\ ******************************************************************************

.SetObjPointCoords

 LDX GG                 \ Set X to the point ID whose coordinates we want to
                        \ calculate

 LDY xObjectPoint,X     \ Set PP to the point's anchor-relative x-coordinate
 STY PP                 \ from xObjectPoint

 LDY yObjectPoint,X     \ Set QQ to the point's anchor-relative y-coordinate
 STY QQ                 \ from yObjectPoint

 LDY zObjectPoint,X     \ Set RR (and Y) to the point's anchor-relative
 STY RR                 \ z-coordinate from zObjectPoint, which also contains
                        \ the scale factor in bits 4 to 7

 LDA shift4Right,Y      \ Set UU (and A) to Y >> 4, to extract the scale factor
 STA UU                 \ from bits 4 to 7 of the zObjectPoint entry
 
 CMP #9                 \ If the scale factor in A >= 9, set bit 7 of K so the
 ROR K                  \ result of the call to Multiply4x16 below is doubled,
                        \ i.e. (G W) is doubled. This gives us an extra factor
                        \ of 2 on top of the maximum 2^8 factor we would get by
                        \ left-shifting the result (see part 2 for the scaling
                        \ code)

 LDX #5                 \ We now zero the (xTemp, yTemp, zTemp) point, which is
                        \ stored in six bytes to give us three 16-bit coordinate
                        \ values (from xTempLo to zTempHi), so set a counter in
                        \ X to count the bytes

 LDA #0                 \ Set A = 0 to use as our zero

.objp1

 STA xTempLo,X          \ Zero the X-th byte of the six-byte coordinate block
                        \ between xTempLo and zTempHi

 DEX                    \ Decrement the loop counter

 BPL objp1              \ Loop back until we have zeroed all six bytes

                        \ We now do the matrix multiplication:
                        \
                        \   [ xTemp ]     [ m0 m1 m2 ]   [ xObjectPoint ]
                        \   [ yTemp ]  =  [ m3 m4 m5 ] x [ yObjectPoint ]
                        \   [ zTemp ]     [ m6 m7 m8 ]   [ zObjectPoint ]
                        \
                        \ We do this in three loops of three, using an outer and
                        \ inner loop. We set two loop counters, VV and X, for
                        \ the outer and inner loops respectively. They both
                        \ iterate through 2, 1 and 0, with VV iterating through
                        \ zTemp, yTemp and xTemp, and X iterating through
                        \ zObjectPoint, yObjectPoint and xObjectPoint
                        \
                        \ We also iterate a counter in P for the matrix entries,
                        \ which counts down from m8 to m0, decreasing by 1 on
                        \ each iteration
                        \
                        \ All the iterators count backwards, so the calculations
                        \ in order are:
                        \
                        \   * zTemp += zObjectPoint * m8
                        \   * zTemp += yObjectPoint * m7
                        \   * ztemp += xObjectPoint * m6
                        \
                        \   * yTemp += zObjectPoint * m5
                        \   * yTemp += yObjectPoint * m4
                        \   * ytemp += xObjectPoint * m3
                        \
                        \   * xTemp += zObjectPoint * m2
                        \   * xTemp += yObjectPoint * m1
                        \   * xTemp += xObjectPoint * m0
                        \
                        \ Or, to switch it around the othee way and plug in the
                        \ initial value of (xTemp, yTemp, zTemp) = (0, 0, 0),
                        \ we get:
                        \
                        \   * xTemp = m0 * xObjectPoint + m1 * yObjectPoint
                        \                               + m2 * zObjectPoint
                        \
                        \   * yTemp = m3 * xObjectPoint + m4 * yObjectPoint
                        \                               + m5 * zObjectPoint
                        \
                        \   * zTemp = m6 * xObjectPoint + m7 * yObjectPoint
                        \                               + m8 * zObjectPoint
                        \
                        \ which gives us the matrix multiplication that we want
                        \ to calculate

 LDA matrixNumber       \ Set P = matrixNumber + 8
 CLC                    \
 ADC #8                 \ In the following loop, P counts down from m8 to m0,
 STA P                  \ which we implement as an index that counts down from
                        \ matrixNumber + 8 to matrixNumber, so that it iterates
                        \ through the correct matrix table
                        \
                        \ This works because matrixNumber contains 0 for matrix
                        \ 1, 9 for matrix 2 and so on, and each matrix table,
                        \ such as matrix1Lo, contains 9 entries

 LDA #2                 \ Set VV = 2, to act as our outer loop counter that
 STA VV                 \ iterates through zTemp, yTemp and xTemp

.objp2

 LDX #2                 \ Set X = 2, to act as our inner loop counter that
                        \ iterates through zObjectPoint, yObjectPoint and
                        \ xObjectPoint (i.e. RR, QQ and PP)

.objp3

 LDY P                  \ Set Y = P, which is the number of the matrix element
                        \ to multiply next

 LDA PP,X               \ Set A = PP, QQ or RR (when X = 0, 1 or 2), which is
                        \ the correct zObjectPoint, yObjectPoint or xObjectPoint
                        \ to multiply next

 STA I                  \ Store A in I (this doesn't appear to be used)

 AND #%00001111         \ Set V = bits 0-3 of A, which removes the scale factor
 STA V                  \ in the case of zObjectPoint (the other points always
                        \ fit into bits 0 to 3)

 BEQ objp5              \ If V = 0, jump to objp5 to move onto the next loop,
                        \ as we already know the result of V * (S R) will be
                        \ zero

 LDA matrix1Hi,Y        \ Set S = P-th entry of matrix1Hi
 STA S

 LDA matrix1Lo,Y        \ Set R = P-th entry of matrix1Lo
 STA R                  \
                        \ so now (S R) is the 16-bit matrix element that we want
                        \ to multiply

 AND #1                 \ If bit 0 of R is clear, then the matrix entry is
 BEQ objp4              \ positive, skip the following three instructions

 LDA V                  \ Bit 0 of R is set, which means this matrix entry is
 EOR #%10000000         \ negative, so set bit 7 of V to make it negative, to
 STA V                  \ give the result of the multiplication below the
                        \ correct sign

.objp4

 STX Q                  \ Store the loop counter in X, so we can retrieve it
                        \ after the call to Multiply4x16

 JSR Multiply4x16       \ Call Multiply4x16 to calculate:
                        \
                        \   (G W) = V * (S R) / 16      if bit 7 of K = 0
                        \
                        \   (G W) = V * (S R) / 8       if bit 7 of K = 1
                        \
                        \ K is only set to 1 if the scale factor is 9, in which
                        \ case we effectively do one of the factors of 2 at this
                        \ point (and the other 8 in part 2)

 LDX Q                  \ Restore the value of X

 LDY VV                 \ Fetch the outer loop counter from VV, which points to
                        \ the relevant xTemp, yTemp or ztemp coordinate

 LDA W                  \ Add (G W) to the xTemp coordinate, starting with the
 CLC                    \ low bytes
 ADC xTempLo,Y
 STA xTempLo,Y

 LDA G                  \ And then the high bytes, so we have the following (if
 ADC xTempHi,Y          \ we are working with xTemp and m0, for example):
 STA xTempHi,Y          \
                        \   xTemp += (G W)
                        \         += V * (S R)
                        \         += xObjectPoint * m0
                        \
                        \ which is the result we want for this element of the
                        \ matrix multiplication

.objp5

 LDA P                  \ If P = matrixNumber then we have done all nine
 CMP matrixNumber       \ calculations, so jump down to objp6 to apply the
 BEQ objp6              \ correct scale factor

 DEC P                  \ Otherwise we have more calculations to do, so
                        \ decrement P to point to the next matrix entry

 DEX                    \ Decrement the inner loop counter to work our way
                        \ through zObjectPoint, yObjectPoint and xObjectPoint

 BPL objp3              \ Loop back until we have worked through all three
                        \ anchor-relative points

 DEC VV                 \ Decrement the outer loop counter to work our way
                        \ through zTemp, yTemp and xTemp

 JMP objp2              \ Jump back to objp2 to do the next calculation

\ ******************************************************************************
\
\       Name: SetObjPointCoords (Part 2 of 2)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Apply the correct scale factor to the matrix multiplication
\
\ ******************************************************************************

.objp6

                        \ We now want to apply the scale factor that we
                        \ extracted into UU above. The scale factor is given as
                        \ a power of 2, so a scale factor of n means we scale
                        \ the result by 2^n, which we can do by shifting left
                        \ by n places (where n is in the range 0 to 8)
                        \
                        \ Note that n can also be 9, in which case we aleady
                        \ doubled the result in part 1, so by this point we only
                        \ need to shift a maximum of 8 places
                        \
                        \ Note also that we are scaling up 16-bit numbers, so
                        \ in order to capture these scaled-up values, we add a
                        \ third byte to the significant end, giving us a 24-bit
                        \ number to shift, and we take the top two bytes as our
                        \ final result, discarding the least significant byte
                        \
                        \ This means the result we end up with is divided by
                        \ another 256 but fits into two bytes

 LDX #2                 \ Set X = 2 to act as a loop counter, to iterate through
                        \ 2, 1 and 0, which we use to work through zTemp, yTemp
                        \ and xTemp, scaling each one separately
                        \
                        \ The comments below refer to xTemp, for simplicity

.objp7

 LDY UU                 \ Set Y = UU = %0000ZZZZ, which is our scale factor

 BEQ objp10             \ If UU = 0, then the scale factor is 2^0, or 1, so
                        \ there is no scaling to do, so jump to objp10 to drop
                        \ the least significant byte without any shifting

 CPY #8                 \ If Y >= 8 then we can skip doing 8 shifts as the xTemp
 BCS objp9              \ result is already correct. To see this, consider the
                        \ process below, which creates (0 xTempHi xTempLo) and
                        \ shifts it left by the number of places, which would be
                        \ this if Y = 8:
                        \
                        \   (0 xTempHi xTempLo) << 8 = (xTempHi xTempLo 0)
                        \
                        \ from which we would then drop the least significant
                        \ byte to give (xTempHi xTempLo)... which is what we
                        \ already have, so when Y >= 8 we can simply jump to
                        \ objp9 to move on to the next axis
                        \
                        \ (As noted above, if Y = 9 then we already doubled the
                        \ result in part 1, so the above approach works for both
                        \ Y = 8 and 9)

 LDA xTempLo,X          \ Set P to the low byte of xTemp
 STA P

 LDA #0                 \ Set R = 0 to act as the new highest byte in our 24-bit
 STA R                  \ number

 LDA xTempHi,X          \ Set A to the high byte of xTemp, so we now have the
                        \ following 24-bit number:
                        \
                        \   (R A P) = (0 xTempHi xTempLo)

 BPL objp8              \ If the high byte of xTemp is positive, skip the
                        \ following instruction

 DEC R                  \ xTempHi is negative, so decrement R to &FF so (R A P)
                        \ is a correctly signed 24-bit negative number

                        \ We now shift (R A P) left by Y places (where Y is in
                        \ the range 1 to 7)

.objp8

 ASL P                  \ Set (R A P) = (R A P) << 1
 ROL A
 ROL R

 DEY                    \ Decrement the shift counter in Y

 BNE objp8              \ Loop back to objp8 until we have shifted (R A P) left
                        \ by Y places

 STA xTempLo,X          \ Set xTemp = (R A)
 LDA R                  \
 STA xTempHi,X          \ so we drop the least significant byte, as discussed
                        \ above

.objp9

 DEX                    \ Decrement the counter in X so we work through zTemp,
                        \ yTemp and xTemp

 BPL objp7              \ Loop back to objp7 until we have processed all three
                        \ axes

 BMI objp12             \ Jump to objp12 to finish off (this BMI is effectively
                        \ a JMP as X is now negative)

.objp10

                        \ If we get here then the scale factor is 0, so we can
                        \ simply drop the least significant byte without any
                        \ shifting, as discussed above

 LDA #0                 \ Set (R A) = (0 xTempHi)
 STA R
 LDA xTempHi,X

 BPL objp11             \ If xTempHi is positive, skip the following instruction

 DEC R                  \ xTempHi is negative, so decrement R to &FF so (R A)
                        \ is a 16-bit negative number

.objp11

 STA xTempLo,X          \ Set xTemp = (R A)
 LDA R
 STA xTempHi,X

 JMP objp9              \ Jump back to objp9 to move onto the next axis (i.e.
                        \ yTemp or zTemp)

.objp12

                        \ Our vector in (xTemp, yTemp, zTemp) is now scaled
                        \ properly, so it's time for the addition:
                        \
                        \   [ xPoint ]   [ xAnchor ]   [ xTemp ]
                        \   [ yPoint ] = [ yAnchor ] + [ yTemp ]
                        \   [ zPoint ]   [ zAnchor ]   [ zTemp ]

 LDX GG                 \ Set X to the point ID whose coordinates we want to
                        \ calculate, so the original point is updated with the
                        \ final result

 LDY objectAnchorPoint  \ Set Y to the point ID of the object's anchor point

                        \ Fall through into AddTempToPoint to add the anchor
                        \ point to the (xTemp, yTemp, zTemp) vector and store
                        \ the result in (xPoint, yPoint, zPoint)

\ ******************************************************************************
\
\       Name: AddTempToPoint (Part 1 of 2)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Add the xTemp vector to a point, store the result in another
\             point, and set the result to hidden if it overflows
\
\ ------------------------------------------------------------------------------
\
\ Set point X to the sum of the xTemp vector and point Y. In other words, add
\ the following:
\
\   (xTemp yTemp zTemp) + point Y's coordinate in (xPoint, yPoint, zPoint)
\
\ and store the results in point X's coordinate in (xPoint, yPoint, zPoint).
\
\ We also set showLine to "hidden" if the addition overflows in any of the axes.
\
\ Arguments:
\
\   X                   The ID of the point in which to store the result
\
\   Y                   The ID of the point to add to the xTemp vector
\
\ Returns:
\
\   showLine            If the calculation overflows, then the coordinate does
\                       not fit within the boundaries of Aviator's 3D world, so
\                       bit 6 is set to indicate that the line containing this
\                       point should not be shown
\
\ ******************************************************************************

.AddTempToPoint

 LDA xTempLo            \ Set point X's x-coordinate to the following:
 CLC                    \
 ADC xPointLo,Y         \  (xTempHi xTempLo) + (xPointHi+Y xPointLo+Y)
 STA xPointLo,X         \
 LDA xTempHi            \ i.e. we add xTemp and point Y's x-coordinate
 ADC xPointHi,Y
 STA xPointHi,X

 PHP                    \ Store the flags for the x-axis addition on the stack,
                        \ so we can check them in part 2

 CLC                    \ Set point X's y-coordinate to the following:
 LDA yTempLo            \
 ADC yPointLo,Y         \  (yTempHi yTempLo) + (yPointHi+Y yPointLo+Y)
 STA yPointLo,X         \
 LDA yTempHi            \ i.e. we add yTemp and point Y's y-coordinate
 ADC yPointHi,Y
 STA yPointHi,X

 PHP                    \ Store the flags for the y-axis addition on the stack,
                        \ so we can check them in part 2

 CLC                    \ Set point X's z-coordinate to the following:
 LDA zTempLo            \
 ADC zPointLo,Y         \  (zTempHi zTempLo) + (zPointHi+Y zPointLo+Y)
 STA zPointLo,X         \
 LDA zTempHi            \ i.e. we add zTemp and point Y's z-coordinate
 ADC zPointHi,Y
 STA zPointHi,X

 JMP addv1              \ Jump to part 2 to set showLine according to the
                        \ overflow flag from each of the results (so if any axes
                        \ overflow, we hide the line containing the point)

 NOP                    \ This instruction is not used; perhaps at one point the
                        \ JMP above was a JSR instruction, and this was an RTS?

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
\       Name: SetMatrices
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.SetMatrices

 LDX matrixAxis
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

 LDX matrixAxis
 LDY matrixNumber
 LDA L0162,X
 STA matrix3Lo,Y
 STA matrix3Lo+4,Y
 STA matrix4Lo,Y
 LDA L0172,X
 STA matrix3Hi,Y
 STA matrix3Hi+4,Y
 STA matrix4Hi,Y
 LDA L0165,X
 STA matrix3Lo+3,Y
 STA matrix4Lo+3,Y
 EOR #1
 STA matrix3Lo+1,Y
 LDA L0175,X
 STA matrix3Hi+1,Y
 STA matrix3Hi+3,Y
 STA matrix4Hi+3,Y
 LDA L0160,X
 STA matrix4Lo+8,Y
 LDA L0170,X
 STA matrix4Hi+8,Y
 LDA L0163,X
 STA matrix4Lo+7,Y
 LDA L0173,X
 STA matrix4Hi+7,Y
 LDY #5

.L1B95

 CPY #3
 BEQ L1BA5

 LDA matrix1Lo,Y
 STA matrix4Lo,Y
 LDA matrix1Hi,Y
 STA matrix4Hi,Y

.L1BA5

 DEY
 BNE L1B95

 LDA G
 STA I
 LDA H
 STA J
 LDX matrixAxis
 LDA L0164,X
 STA R
 LDA L0174,X
 STA S
 JSR Multiply16x16Bit0

 LDY matrixNumber
 LDA matrix1Lo+3,Y
 STA I
 LDA matrix1Hi+3,Y
 STA J
 JSR L1AA6

 LDA R
 STA matrix1Lo+3,Y
 LDA S
 STA matrix1Hi+3,Y
 LDA matrix1Lo+5,Y
 STA I
 LDA matrix1Hi+5,Y
 STA J
 LDX matrixAxis
 LDA L0161,X
 STA R
 LDA L0171,X
 STA S
 JSR Multiply16x16Bit0

 LDY matrixNumber
 LDA matrix1Lo,Y
 EOR #1
 STA I
 LDA matrix1Hi,Y
 STA J
 JSR L1AA6

 LDA R
 STA matrix1Lo+5,Y
 LDA S
 STA matrix1Hi+5,Y
 LDX matrixAxis
 LDA L0161,X
 STA R
 LDA L0171,X
 STA S
 LDX #2
 LDY #0
 JSR L1D13

 LDX matrixAxis
 LDA L0164,X
 EOR #1
 STA R
 LDA L0174,X
 STA S
 JSR Multiply16x16Bit0

 LDY matrixNumber
 LDA matrix1Lo+2,Y
 STA I
 STA xTempLo
 LDA matrix1Hi+2,Y
 STA J
 STA xTempHi
 LDA G
 STA matrix1Lo+2,Y
 LDA H
 STA matrix1Hi+2,Y
 LDA R
 EOR #1
 STA R
 JSR Multiply16x16Bit0

 LDY matrixNumber
 LDA matrix1Lo,Y
 STA I
 LDA matrix1Hi,Y
 STA J
 JSR L1AA6

 LDA R
 STA matrix1Lo,Y
 LDA S
 STA matrix1Hi,Y
 LDA xTempLo
 STA R
 LDA xTempHi
 STA S
 LDX matrixAxis
 LDA L0161,X
 STA I
 LDA L0171,X
 STA J
 JSR Multiply16x16Bit0

 LDY matrixNumber
 LDA matrix1Lo+2,Y
 STA I
 LDA matrix1Hi+2,Y
 STA J
 JSR L1AA6

 LDA R
 STA matrix1Lo+2,Y
 LDA S
 STA matrix1Hi+2,Y
 LDX matrixAxis
 LDA L0163,X
 STA matrix1Lo+7,Y
 LDA L0173,X
 STA matrix1Hi+7,X
 LDA #2
 STA T
 LDY matrixNumber
 LDX matrixNumber

.L1CC3

 LDA matrix1Lo,Y
 STA matrix2Lo,X
 LDA matrix1Hi,Y
 STA matrix2Hi,X
 LDA matrix1Lo+1,Y
 STA matrix2Lo+3,X
 LDA matrix1Hi+1,Y
 STA matrix2Hi+3,X
 LDA matrix1Lo+2,Y
 STA matrix2Lo+6,X
 LDA matrix1Hi+2,Y
 STA matrix2Hi+6,X
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
\   Category: 3D geometry
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
 ADC matrixAxis
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
 ADC matrixAxis
 TAX
 LDA L0160,X
 EOR #1
 STA R
 JMP L1CFB

\ ******************************************************************************
\
\       Name: L1D13
\       Type: Subroutine
\   Category: 3D geometry
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
 ADC matrixAxis
 TAX
 LDA L0160,X
 STA I
 LDA L0170,X
 STA J

.L1D23

 TYA
 CLC
 ADC matrixNumber
 STA N
 JSR Multiply16x16Bit0

 LDY N
 LDA G
 STA matrix1Lo,Y
 LDA H
 STA matrix1Hi,Y
 RTS

\ ******************************************************************************
\
\       Name: Multiply16x16
\       Type: Subroutine
\   Category: Maths
\    Summary: Multiply two positive 16-bit numbers
\
\ ------------------------------------------------------------------------------
\
\ This routine multiplies two positive 16-bit numbers (i.e. bit 7 of the high
\ byte is 0 in both arguments):
\
\   (H A) = (J I) * (S R) / 256
\
\ The fractional part of the result is in W, so this is the full result, though
\ in practice W is ignored:
\
\   (H A W) = (J I) * (S R)
\
\ The fractional part is rounded up or down, to the nearest integer, by adding
\ 128 at mult1. This part of the code is modified by the L5295 routine to toggle
\ this rounding behaviour.
\
\ The multiplication is done using the following algorithm:
\
\  (J I) * (S R) = (J << 8 + I) * (S << 8 + R)
\                = (J << 8 * S << 8) + (J << 8 * R)
\                                    + (I * S << 8)
\                                    + (I * R)
\                = (J * S) << 16 + (J * R) << 8
\                                + (I * S) << 8
\                                + (I * R)
\
\ This returns a fractional result with the lowest byte containing the fraction.
\ The routine doesn't care about the very lowest byte, so it actually calculates
\ the following, effectively shifting the above to the right by 8 places and
\ dropping the (I * R) part:
\
\  (J I) * (S R) = (J * S) << 8 + (J * R) + (I * S)
\
\ before adding 128 to round the result up or down.
\
\ Arguments:
\
\   (S R)               A positive 16-bit number
\
\   (J I)               A positive 16-bit number
\
\ Returns:
\
\   (H A)               The result of the multiplication
\
\   C flag              If set, H should be incremented by the caller to get the
\                       correct result
\
\ ******************************************************************************

.Multiply16x16

 LDX J                  \ Set (A V) = X * Y
 LDY R                  \           = J * R
 JSR Multiply8x8

 STA G                  \ Set (G A) = (A V)
 LDA V                  \           = J * R

 CLC                    \ Clear the C flag for the following addition

.mult1

 ADC #128               \ Set (G W) = (G A) + 128
 STA W                  \
                        \ starting with the low bytes
                        \
                        \ The ADC #128 instruction gets modified by the L5295
                        \ routine as follows:
                        \
                        \   * ADC #0 disables the rounding
                        \
                        \   * ADC #128 enables the rounding

 BCC mult2              \ And then the high bytes, so we now have:
 INC G                  \
                        \   (G W) = (J * R) + 128

.mult2

 LDX S                  \ Set (A V) = X * Y
 LDY J                  \           = S * J
 JSR Multiply8x8

 STA H                  \ Set (H A) = (A V)
 LDA V                  \           = S * J

                        \ We now do the following addition:
                        \
                        \   (H G W) = (H A) << 8 + (G W)
                        \           = (H A 0) + (G W)
                        \
                        \ We don't need to do the lowest byte, as W + 0 is just
                        \ W again, so we can just do the following:
                        \
                        \   (H G) = (H A) + G
                        \
                        \ and then keep W as the lowest significant byte of the
                        \ result

 CLC                    \ Set (H G) = (H A) + G
 ADC G                  \
 STA G                  \ starting with the low bytes

 BCC mult3              \ And then the high bytes, so we now have:
 INC H                  \
                        \   (H G) = (H A) + G
                        \
                        \ which is the same as:
                        \
                        \   (H G W) = (H A) << 8 + (G W)
                        \           = (S * J) << 8 + (J * R) + 128

.mult3

 LDX S                  \ Set (A V) = X * Y
 LDY I                  \           = S * I
 JSR Multiply8x8

 STA T                  \ Set (T A) = (A V)
 LDA V                  \           = S * I

                        \ We now do the following addition:
                        \
                        \   (H A W) = (T A) + (H G W)
                        \
                        \ though we don't actually do the highest byte, but
                        \ instead return the C flag depending on whether the
                        \ addition of the middle bytes overflowed (in which case
                        \ the highest byte in H needs incrementing, a task we
                        \ leave to the caller)

 CLC                    \ Set (A W) = (T A) + (G W)
 ADC W                  \
 STA W                  \ starting with the low bytes

 LDA T                  \ And then the high bytes, so we now have:
 ADC G                  \
                        \   (H A W) = (T A) + (H G W)
                        \           = (S * I) + (S * J) << 8 + (J * R) + 128
                        \
                        \ which is the result we need. The C flag is set if the
                        \ last addition overflowed, in which case H needs to be
                        \ incremented by the caller to get the final result

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Multiply16x16Bit0
\       Type: Subroutine
\   Category: Maths
\    Summary: Multiply two 16-bit numbers that have their signs in bit 0
\
\ ------------------------------------------------------------------------------
\
\ This routine multiplies two 16-bit numbers, both of which have their signs in
\ bit 0 of the low byte. It calculates:
\
\   (H G) = (J I) * (S R) / 256
\
\ The result in (H G) has the sign in bit 0 of the low byte.
\
\ Arguments:
\
\   (J I)               A signed 16-bit number, with the sign in bit 0 of I
\
\   (S R)               A signed 16-bit number, with the sign in bit 0 of R
\
\ Returns:
\
\   (H G)               The result of the multiplication, with the sign in bit 0
\                       of G
\
\   K                   The sign of the result (in bit 0)
\
\ ******************************************************************************

.Multiply16x16Bit0

 LDA R                  \ Extract the sign of (J I) * (S R) from bit 0 of I and
 EOR I                  \ bit 0 of R, and store the result in K
 AND #%00000001
 STA K

 JSR Multiply16x16      \ Calculate (H A) = (S R) * (J I) / 256
                        \
                        \ and set the C flag if we need to increment H

 AND #%11111110         \ Set bit 0 of A to the sign we stored in K above, so
 ORA K                  \ (H A) has the correct sign of the multiplication

 STA G                  \ Set (H G) = (H A)
                        \           = (S R) * (J I) / 256

 BCC mbit1              \ Increment the top byte in H if required
 INC H

.mbit1

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetPointCoords
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Calculate the coordinates for a point
\  Deep dive: Rotating points in 3D space
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   GG                  The ID of the point to process
\
\   matrixNumber        The matrix to use in the calculation:
\
\                         * 0 = matrix 1
\                         * 9 = matrix 2
\                         * 18 = matrix 3
\                         * 27 = matrix 4
\
\   xPointHi etc.       The point's coordinates before rotation
\
\ Returns:
\
\   xPointHi etc.       The point's coordinates after rotation
\
\ ******************************************************************************

.SetPointCoords

 LDX GG                 \ Set X to the point ID whose coordinates we want to
                        \ calculate

 LDA xPointLo,X         \ Set (SS PP) to the point's x-coordinate
 STA PP
 LDA xPointHi,X
 STA SS

 LDA yPointLo,X         \ Set (TT QQ) to the point's y-coordinate
 STA QQ
 LDA yPointHi,X
 STA TT

 LDA zPointLo,X         \ Set (UU RR) to the point's z-coordinate
 STA RR
 LDA zPointHi,X
 STA UU

 LDX #5                 \ We now zero the (xTemp, yTemp, zTemp) vector, which is
                        \ stored in six bytes to give us three 16-bit coordinate
                        \ values (from xTempLo to zTempHi), so set a counter in
                        \ X to count the bytes

 LDA #0                 \ Set A = 0 to use as our zero

.pcrd1

 STA xTempLo,X          \ Zero the X-th byte of the six-byte coordinate block
                        \ between xTempLo and zTempHi

 DEX                    \ Decrement the loop counter

 BPL pcrd1              \ Loop back until we have zeroed all six bytes

                        \ We now do the matrix multiplication:
                        \
                        \   [ xTemp ]     [ m0 m1 m2 ]   [ xPoint ]
                        \   [ yTemp ]  =  [ m3 m4 m5 ] x [ yPoint ]
                        \   [ zTemp ]     [ m6 m7 m8 ]   [ zPoint ]
                        \
                        \ We do this in three loops of three, using an outer and
                        \ inner loop. We set two loop counters, VV and X, for
                        \ the outer and inner loops respectively. They both
                        \ iterate through 2, 1 and 0, with VV iterating through
                        \ zTemp, yTemp and xTemp, and X iterating through
                        \ zPoint, yPoint and xPoint
                        \
                        \ We also iterate a counter in P for the matrix entries,
                        \ which counts down from m8 to m0, decreasing by 1 on
                        \ each iteration
                        \
                        \ All the iterators count backwards, so the calculations
                        \ in order are:
                        \
                        \   * zTemp += zPoint * m8
                        \   * zTemp += yPoint * m7
                        \   * ztemp += xPoint * m6
                        \
                        \   * yTemp += zPoint * m5
                        \   * yTemp += yPoint * m4
                        \   * ytemp += xPoint * m3
                        \
                        \   * xTemp += zPoint * m2
                        \   * xTemp += yPoint * m1
                        \   * xTemp += xPoint * m0
                        \
                        \ Or, to switch it around the othee way and plug in the
                        \ initial value of (xTemp, yTemp, zTemp) = (0, 0, 0),
                        \ we get:
                        \
                        \   * xTemp = m0 * xPoint + m1 * yPoint + m2 * zPoint
                        \
                        \   * yTemp = m3 * xPoint + m4 * yPoint + m5 * zPoint
                        \
                        \   * zTemp = m6 * xPoint + m7 * yPoint + m8 * zPoint
                        \
                        \ which gives us the matrix multiplication that we want
                        \ to calculate

 LDA matrixNumber       \ Set P = matrixNumber + 8
 CLC                    \
 ADC #8                 \ In the following loop, P counts down from m8 to m0,
 STA P                  \ which we implement as an index that counts down from
                        \ matrixNumber + 8 to matrixNumber, so that it iterates
                        \ through the correct matrix table
                        \
                        \ This works because matrixNumber contains 0 for matrix
                        \ 1, 9 for matrix 2 and so on, and each matrix table,
                        \ such as matrix1Lo, contains 9 entries

 LDA #2                 \ Set VV = 2, to act as our outer loop counter that
 STA VV                 \ iterates through zTemp, yTemp and xTemp

.pcrd2

 LDX #2                 \ Set X = 2, to act as our inner loop counter that
                        \ iterates through zPoint, yPoint and xPoint

.pcrd3

 LDY P                  \ Set Y = P, which is the number of the matrix element
                        \ to multiply next

 LDA matrix1Hi,Y        \ Set S = P-th entry of matrix1Hi
 STA S

 BNE pcrd4              

 LDA matrix1Lo,Y        \ If the P-th entry of matrix1Lo is < 5, jump to pcrd5
 CMP #5                 \ to move on to the next loop
 BCC pcrd5

.pcrd4

 LDA matrix1Lo,Y        \ Set R = P-th entry of matrix1Lo
 STA R                  \
                        \ so now (S R) is the 16-bit matrix element that we want
                        \ to multiply

 LDA PP,X               \ Set I = PP, QQ or RR (when X = 0, 1 or 2), which is
 STA I                  \ the correct zPointLo, yPointLo or xPointLo to multiply
                        \ next

 LDA SS,X               \ Set J = SS, TT or UU (when X = 0, 1 or 2), which is
 STA J                  \ the correct zPointHi, yPointHi or xPointHi to multiply
                        \ next so now (J I) is the 16-bit point coordinate that
                        \ we want to multiply

 LDA #0                 \ Set K = 0, so Multiply16x16Mix doesn't negate the
 STA K                  \ result

 STX Q                  \ Store the loop counter in X, so we can retrieve it
                        \ after the call to Multiply16x16Mix

 JSR Multiply16x16Mix   \ Call Multiply16x16Mix to calculate:
                        \
                        \   (H G) = (J I) * (S R) / 256

 LDX Q                  \ Restore the value of X

 LDY VV                 \ Fetch the outer loop counter from VV, which points to
                        \ the relevant xTemp, yTemp or ztemp coordinate

 LDA G                  \ Add (H G) to the xTemp coordinate, starting with the
 CLC                    \ low bytes
 ADC xTempLo,Y
 STA xTempLo,Y

 LDA H                  \ And then the high bytes, so we have the following (if
 ADC xTempHi,Y          \ we are working with xTemp and m0, for example):
 STA xTempHi,Y          \
                        \   xTemp += (H G)
                        \         += (J I) * (S R)
                        \         += xPoint * m0
                        \
                        \ which is the result we want for this element of the
                        \ matrix multiplication

 BVC pcrd5

 LDA #%01000000         \ The addition overflowed for this axis, so set bit 6 of
 STA showLine           \ showLine so the line containing this point is marked
                        \ as being hidden

.pcrd5

 LDY P                  \ If P = matrixNumber then we have done all nine
 CPY matrixNumber       \ calculations, so jump down to objp6 to update the
 BEQ pcrd6              \ point's coordinates with the result

 DEC P                  \ Otherwise we have more calculations to do, so
                        \ decrement P to point to the next matrix entry

 DEX                    \ Decrement the inner loop counter to work our way
                        \ through zPoint, yPoint and xPoint

 BPL pcrd3              \ Loop back until we have worked through all three
                        \ anchor-relative points

 DEC VV                 \ Decrement the outer loop counter to work our way
                        \ through zTemp, yTemp and xTemp

 JMP pcrd2              \ Jump back to objp2 to do the next calculation

.pcrd6

 LDX GG                 \ Set X to the point ID whose coordinates we want to
                        \ calculate, so the original point is updated with the
                        \ final result

                        \ Fall through into CopyTempToPoint to copy the result
                        \ from (xTemp, yTemp, zTemp) to (xPoint, yPoint, zPoint)

\ ******************************************************************************
\
\       Name: CopyTempToPoint
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Set a specified point to (xTemp, yTemp, zTemp)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The ID of the point to set to (xTemp, yTemp, zTemp)
\
\ ******************************************************************************

.CopyTempToPoint

 LDA xTempLo            \ Set point X's x-coordinate to (xTempHi xTempLo)
 STA xPointLo,X
 LDA xTempHi
 STA xPointHi,X

 LDA yTempLo            \ Set point X's y-coordinate to (yTempHi yTempLo)
 STA yPointLo,X
 LDA yTempHi
 STA yPointHi,X

 LDA zTempLo            \ Set point X's z-coordinate to (zTempHi zTempLo)
 STA zPointLo,X
 LDA zTempHi
 STA zPointHi,X

 RTS                    \ Return from the subroutine

 EQUB &00, &49, &60     \ These bytes appear to be unused

\ ******************************************************************************
\
\       Name: UpdateIndicator (Part 1 of 15)
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update a single indicator on the dashboard
\  Deep dive: Hard-coded division in the dashboard routines
\
\ ------------------------------------------------------------------------------
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
\ This section takes the compass heading from compassHeading and reduces it to
\ the range 0 to 73, before passing it to the DrawIndicatorHand to update the
\ on-screen compass.
\
\ ******************************************************************************

.uind1

                        \ If we get here then the indicator number in X is 0

 LDA compassHeading     \ Set T = compassHeading
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
\ This section takes the airspeed from (airspeedHi airspeedLo) and reduces it to
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

 LDA airspeedHi         \ If the high byte of the airspeed in airspeedHi is
 BPL uind3              \ positive, jump down to uind3 to skip the following

 LDA #0                 \ The airspeed is negative, so set A to 0 and jump to
 JMP DrawIndicatorHand  \ DrawIndicatorHand to zero the indicator on-screen,
                        \ returning from the subroutine using a tail call

.uind3

 LDA airspeedLo         \ Set A = (airspeedHi airspeedLo) * 2 / 256
 ASL A                  \
 LDA airspeedHi
 ROL A

                        \ So by now, A matches the range of the airspeed
                        \ indicator - here's why:
                        \
                        \ The indicatorBase for this indicator is 48 and the
                        \ indicatorMin/Max range shown on the dial is 57 to 122,
                        \ which represents 50 to 400 mph (according to the game
                        \ manual)
                        \
                        \ So after this scaling, a result in A of 9 represents
                        \ 50 mph (as 48 + 9 = 57), and a result in A of 74
                        \ represents 400 mph (as 48 + 74 = 122), for example
                        \
                        \ These values correspond to the following 16-bit values
                        \ of (airspeedHi airspeedLo):
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
\ This section takes the altitude from (yPlaneHi yPlaneLo) and reduces it to
\ the range 0 to 254, before passing it to the DrawIndicatorHand to update the
\ small hand of the on-screen altimeter.
\
\ It also sets altitudeMinutes to the low byte of the altitude, reduced to the
\ range 0 to 104, so it can be used in part 5 to update the large hand of the
\ on-screen altimeter.
\
\ ******************************************************************************

.uind4

                        \ If we get here then the indicator number in X is 2

 LDA yPlaneLo           \ Set (A R) = (yPlaneHi yPlaneLo)
 STA R
 LDA yPlaneHi

 LSR A                  \ Set (S R) = (A R) / 4
 ROR R                  \           = (yPlaneHi yPlaneLo) / 4
 LSR A                  \           = altitude
 ROR R                  \
 STA S                  \ so (S R) is the altitude in feet, as the value stored
                        \ in (yPlaneHi yPlaneLo) is the actual altitude x 4

 LDA #0                 \ Set T = 0
 STA T

                        \ We now calculate A = R * n / 256 with a hardcoded n,
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

 STA altitudeMinutes    \ Store the result in altitudeMinutes, so we can draw
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

 LDA T                  \ Set (U A) = (U altitudeMinutes) + (0 T)
 CLC                    \
 ADC altitudeMinutes    \ by adding the low bytes

 BCC uind5              \ And, if the addition overflowed, incrementing the high
 INC U                  \ byte in U

                        \ So we have just calculated:
                        \
                        \   (U A) = (U altitudeMinutes) + (0 T)
                        \
                        \ and we already know that:
                        \
                        \   U = S * 104 / 256
                        \
                        \   altitudeMinutes = R * 104 / 256
                        \
                        \ so plugging these into the above, we get:
                        \
                        \   (U A) = (U altitudeMinutes) + (0 T)
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

 LDA altitudeMinutes    \ Fetch the value of the altimeter's minute hand that we
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
\ This section takes the vertical speed from (verticalSpeedHi verticalSpeedLo)
\ and reduces it to the range -40 to +40, before passing it to the
\ DrawIndicatorHand to update the on-screen vertical speed indicator.
\
\ ******************************************************************************

.uind8

                        \ If we get here then the indicator number in X is 4

 LDA verticalSpeedLo    \ Set (A T) = (verticalSpeedHi verticalSpeedLo)
 STA T                  \           = VerticalSpeed
 LDA verticalSpeedHi

 BPL uind9              \ If the vertical speed is positive, jump down to uind9

 LDA #0                 \ The vertical speed is negative, so we make it positive
 SEC                    \ by calculating:
 SBC T                  \
 STA T                  \   (A T) = (0 0) - (A T)
                        \
                        \ starting with the low bytes

 LDA #0                 \ And then the high bytes
 SBC verticalSpeedHi

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

 BIT verticalSpeedHi    \ If the high byte in verticalSpeedHi is positive (and
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
\ This section takes the turn rate from (turnHi turnLo) and reduces it to the
\ range -19 to +19, before passing it to the DrawIndicatorHand to update the
\ bottom part of the on-screen slip-and-turn indicator.
\
\ ******************************************************************************

.uind14

                        \ If we get here then the indicator number in X is 5

 LDA turnLo             \ Set (A T) = (turnHi turnLo)
 STA T                  \           = Turn
 LDA turnHi

 BPL uind15             \ If the turn rate is positive, jump down to uind9

 LDA #0                 \ The turn rate is negative, so we make it positive
 SEC                    \ by calculating:
 SBC T                  \
 STA T                  \   (A T) = (0 0) - (A T)
                        \
                        \ starting with the low bytes

 LDA #0                 \ And then the high bytes
 SBC turnHi

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

 BIT turnHi             \ If the high byte in turnHi is negative (and therefore
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

 LDA slipRate           \ Set A = slipRate

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
\ This section takes the rudder position from rudderPosition and reduces it to
\ the range -8 to +8, before passing it to DrawIndicatorBar to update the rudder
\ indicator.
\
\ ******************************************************************************

.uind24

                        \ If we get here then the indicator number in X is 9

 LDX #1                 \ Set X = 1 so the current value of the indicator gets
                        \ stored in joyYCoord+1 in DrawIndicatorBar

 LDA #128               \ Set S = 128, to denote that when we fall through into
 STA S                  \ DrawIndicatorBar below, JC is the y-coordinate, so
                        \ we draw the indicator's vertical bar from point
                        \ (H + W, JC)

 LDA #80                \ Set W = 80 to use as the centre y-coordinate for the
 STA W                  \ rudder indicator (i.e. the centre bar)

 LDA rudderPosition     \ Set A = rudderPosition

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
\ This section takes the joystick position from aileronPosition and
\ elevatorPosition and reduces it to -8 to +8 (for the x-position in
\ aileronPosition) and to -32 to +32 (for the y-position in elevatorPosition),
\ before passing it to the DrawJoystickCross to update the cross in the joystick
\ position display. The x-position is reduced more because the joystick position
\ display is taller than it is wide.
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
 STA row24_block18_7    \ the old cross was overwriting the axis
 STA row24_block21_7
 LDA #%01000100
 STA row24_block19_7

 LDA #%10011001         \ Redraw the joystick position display's y-axis, in case
 STA row24_block20_7    \ the old cross was overwriting the axis
 LDA #%10001000
 STA row21_block20_7
 STA row22_block20_7
 STA row23_block20_7
 STA row25_block20_7
 STA row26_block20_7
 STA row27_block20_7

 LDA aileronPosition    \ Set A = aileronPosition, the x-position of the
                        \ joystick

 SEC                    \ Set the C flag so the following call to ScaleSigned
                        \ divides the joystick x-position by 16 

 JSR ScaleSigned        \ Scale the value in A down by a factor of 16, retaining
                        \ the sign and being sensitive to small values
 
 STA joyXCoord          \ Store the scaled value of A in joyXCoord, so we can
                        \ pass it to DrawJoystickCross below to draw the new
                        \ cross, but also so we can erase this cross when we
                        \ need to update the indicator in the future

 LDA elevatorPosition   \ Set A = elevatorPosition, the y-position of the
                        \ joystick

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

 STA joyYCoord          \ Store the scaled value of A in joyYCoord, so we can
                        \ pass it to DrawJoystickCross below to draw the new
                        \ cross, but also so we can erase this cross when we
                        \ need to update the indicator in the future

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
\ This section takes the thrust from (thrustHi thrustLo) and reduces it to the
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

 LDA thrustHi           \ Set (R A) = (thrustHi thrustLo)
 STA R                  \           = Thrust
 LDA thrustLo

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
                        \ stored in joyYCoord+3 in DrawIndicatorBar

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
\   Category: Drawing lines
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
\   X                   The offset from joyYCoord where we store the indicator
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

 LDA joyYCoord,X        \ Set G = the X-th byte of joyYCoord, which contains the
 STA G                  \ x-coordinate of the current bar, so we can erase it

 LDA H                  \ Store H in the X-th byte of joyYCoord, so the next
 STA joyYCoord,X        \ time we call this routine, we can use this to erase
                        \ the bar we are about to draw

 JSR EraseOrthoLine     \ Erase the current vertical bar at x-coordinate G

 LDA #0                 \ Set N = 0 to switch the drawing mode to OR logic, so
 STA N                  \ the bar gets drawn on-screen

 JSR DrawOrthoLine      \ Draw a new vertical bar at x-coordinate H

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawIndicatorHand
\       Type: Subroutine
\   Category: Drawing lines
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

 CLC                    \ Set A = A + the X-th byte of indicatorBase
 ADC indicatorBase,X    \
                        \ This adds the relevant indicator's base value from the
                        \ indicatorBase table to give the following:
                        \
                        \   * Compass                 +0    A =  0 to  73
                        \   * Airspeed               +48    A = 57 to 122
                        \   * Altimeter small hand    +0    A =  0 to 254
                        \   * Altimeter large hand    +0    A =  0 to 104
                        \   * Vertical speed         +67    A = 27 to 107
                        \   * Turn                   +53    A = 34 to  72
                        \   * Slip                  +106    A = ?? to  ??

 CMP indicatorMin,X     \ If A >= the X-th byte of indicatorMin, jump to dinh1
 BCS dinh1              \ to skip the following

 LDA indicatorMin,X     \ Set A to the X-th byte of indicatorMin, so A is at
                        \ least the relevant value in indicatorMin

 BCC dinh2              \ Jump to dinh2 to skip the following, as we don't need
                        \ to check the maximum limit (this BCC is effectively a
                        \ JMP as we passed through the BCS above)

.dinh1

                        \ If we get here then A >= the X-th byte of indicatorMin

 CMP indicatorMax,X     \ If A >= the X-th byte of indicatorMax, jump to dinh2
 BCC dinh2              \ to skip the following

 LDA indicatorMax,X     \ Set A to the X-th byte of indicatorMax, so A is no
                        \ more than the relevant value in indicatorMax

.dinh2

                        \ A is now clipped to this indicator's range as given in
                        \ the indicatorMin and indicatorMax tables, so the final
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

 JSR GetHandVector      \ Calculate the vector for drawing the new dial hand
                        \ with value A, returning the result in W, G and R

                        \ Fall through into DrawIndicatorLine to draw the new
                        \ hand on the indicator

\ ******************************************************************************
\
\       Name: DrawIndicatorLine
\       Type: Subroutine
\   Category: Drawing lines
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
\                       Direction is like a clock, so positive (clear) is up and
\                       right
\
\   X                   The indicator number (0-7)
\
\   WW                  The indicator number (0-7)
\
\ ******************************************************************************

.DrawIndicatorLine

 LDA indicatorLineI,X   \ Set I = x-coordinate of the starting point of the
 STA I                  \ current line

 LDA indicatorLineJ,X   \ Set J = y-coordinate of the starting point of the
 STA J                  \ current line

 LDA indicatorLineT,X   \ Set T = x-delta of the current line
 STA T

 LDA indicatorLineU,X   \ Set U = y-delta of the current line
 STA U

 LDA indicatorLineV,X   \ Set V = direction of the current line
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

 STA row23_block13_2,Y  \ Redraw the Y-th pixel row in the centre block

 LDA #%01000100         \ The top two pixel rows of the centre block contain the
                        \ vertical mark at the centre of the indicator, so set A
                        \ to the appropriate single-pixel byte

 DEY                    \ Decrement the counter to move up to the next pixel row

 BPL dinl1              \ Loop back until we have redrawn all three pixel rows
                        \ in the centre block

 LDA #%00110011         \ Redraw the two-pixels at the left end of the
 STA row23_block12_4    \ artificial horizon's centre line

 LDA #%10001000         \ Redraw the single pixel at the right end of the
 STA row23_block14_4    \ artificial horizon's centre line

 LDA S                  \ Fetch the x-coordinate of the the starting point of
                        \ the new line from S

 STA I                  \ Set I = the x-coordinate of the starting point of the
                        \ new line to draw

 STA indicatorLineI,X   \ Store the x-coordinate in indicatorLineI, so we can
                        \ use it to erase the line later

 LDA H                  \ Set A = the y-coordinate of the starting point of the
                        \ new line to draw

 STA indicatorLineJ,X   \ Store the y-coordinate in indicatorLineJ, so we can
                        \ use it to erase the line later

 BNE dinl3              \ Jump to dinl3 to draw the new line (this BNE is
                        \ effectively a JMP as A is never zero)

.dinl2

                        \ If we get here then this is indicator 0-6, so it's a
                        \ hand-based dial

 LDA indicatorLineI,X   \ Set I = x-coordinate of starting point of hand, which
 STA I                  \ is a fixed value for hand-based dials

 LDA indicatorLineJ,X   \ Set J = y-coordinate of starting point of hand, which
                        \ is a fixed value for hand-based dials

.dinl3

 STA J                  \ Store A in J as the y-coordinate of the starting
                        \ point of the new line to draw

 LDA W                  \ Fetch the x-delta of the new line from W

 STA T                  \ Set T = the x-delta of the new line

 STA indicatorLineT,X   \ Store the x-delta in indicatorLineT, so we can use it
                        \ to erase the line later

 LDA G                  \ Fetch the y-delta of the new line from G

 STA U                  \ Set U = the y-delta of the new line

 STA indicatorLineU,X   \ Store the y-delta in indicatorLineU, so we can use it
                        \ to erase the line later

 LDA R                  \ Fetch the direction of the new line from R

 STA V                  \ Set V = the direction of the new line

 STA indicatorLineV,X   \ Store the direction in indicatorLineV, so we can use
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
\   Category: Drawing lines
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
\   joyXCoord           The current joystick x-coordinate
\
\   joyYCoord           The current joystick y-coordinate
\
\ ******************************************************************************

.DrawJoystickCross

 STA N                  \ Store the drawing mode in N

                        \ First we draw the 3-pixel horizontal line right from
                        \ (79 + x, 216 + y)

 LDA joyYCoord          \ Set H = joyYCoord
 STA H

 LDA joyXCoord          \ Set JC = joyXCoord + 79
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

 LDA joyXCoord          \ Set H = joyXCoord
 STA H

 LDA joyYCoord          \ Set JC = joyYCoord + 214
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
\       Name: GetHandVector
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Vector line calculation for a hand on indicators 0 to 6
\  Deep dive: Clock hands and dial indicators
\
\ ------------------------------------------------------------------------------
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
\                       Direction is like a clock, so positive (clear) is up and
\                       right, so this means the following:
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

.GetHandVector

 LDY #0                 \ Set R = 0, to use as the first guess for the direction
 STY R                  \ of the hand on the dial (we will change it below if
                        \ required)

 LDY dialQuadrant,X     \ Set Y = the dialQuadrant value for this indicator,
                        \ which is the size of a quarter of the dial in terms of
                        \ the value in A

 INY                    \ Set K = Y + 1
 STY K                  \       = dialQuadrant + 1
                        \
                        \ Doing this enables us to subtract this value below,
                        \ leaving the result in a suitable state for negating
                        \ using two's complement (see dhvc2)

 SEC                    \ Set the C flag for the subtraction we are about to do

.dhvc1

 SBC K                  \ Set A = A - K
                        \       = A - (dialQuadrant + 1)
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

 SBC dialQuadrant,X     \ Subtract a second quadrant's worth, so:
                        \
                        \   A = A - (dialQuadrant + 1) - dialQuadrant
                        \     = A - 2 * dialQuadrant - 1
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

 SBC dialQuadrant,X     \ Subtract a fourth quadrant's worth

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

 LDA dialQuadrant,X     \ Set A = the dialQuadrant value for this indicator,
                        \ which is the size of a quarter of the dial in terms of
                        \ the value in A. This is what we use for w in the above

 SEC                    \ Set A = A - S
 SBC S                  \       = w - x
                        \
                        \ so A contains our y-delta

                        \ We now cap the y-delta, which has the effect of
                        \ blunting the points of our diamond
                        
 CMP yDeltaMax,X        \ If A < yDeltaMax for this indicator, jump to dhvc7 to
 BCC dhvc7              \ skip the following instruction

 LDA yDeltaMax,X        \ Set A = yDeltaMax, so A is never greater than the
                        \ yDeltaMax value for this indicator

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

 CMP xDeltaMax,X        \ If A < xDeltaMax for this indicator, jump to dhvc8 to
 BCC dhvc8              \ skip the following instruction

 LDA xDeltaMax,X        \ Set A = xDeltaMax, so A is never greater than the
                        \ xDeltaMax value for this indicator

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
\                       Direction is like a clock, so positive (clear) is up and
\                       right
\
\ ******************************************************************************

.DrawVectorLine

 LDY #3                 \ Set Y = 3 to use as a byte counter in the following
                        \ loop, so it writes four bytes

 LDA #%00010001         \ Set A = %00010001, the pixel pattern for pixel 0 in
                        \ white

.dvec1

 STA RR,Y               \ Set the Y-th byte of RR to A

 ASL A                  \ Set A = A * 2

 DEY                    \ Decrement the byte counter

 BPL dvec1              \ Loop back until we have updated RR to RR+3 as
                        \ follows:
                        \
                        \   RR   = %10001000 = pixel 3 in white
                        \   RR+1 = %01000100 = pixel 2 in white
                        \   RR+2 = %00100010 = pixel 1 in white
                        \   RR+3 = %00010001 = pixel 0 in white

 LDA #0                 \ Set QQ = 0
 STA QQ

 STA PP                 \ Set PP = 0

 LDA T                  \ If T < U, jump down to dvec2 to skip the following
 CMP U                  \ two instructions
 BCC dvec2

                        \ If we get here then T >= U, so the line is a shallow
                        \ horizontal slope

 STA VV                 \ Set VV = T, the length of the longer axis

 BCS dvec11             \ Jump down to dvec11 to start drawing the line (this
                        \ BCS is effectively a JMP as we just passed through a
                        \ BCC)

.dvec2

                        \ If we get here then T < U, so the line is a steep
                        \ vertical slope

 LDA U                  \ Set VV = U, the length of the longer axis
 STA VV

 STA PP                 \ Set PP = U

 BCC dvec11             \ Jump down to dvec11 to start drawing the line (this
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

.dvec3

                        \ If we get here then we need to step along the x-axis

 LDA QQ                 \ Set A = QQ + U
 CLC                    \
 ADC U                  \ so A contains the cumulative step along the y-axis
                        \ (the shorter axis)

 CMP T                  \ If A < T, then we haven't yet reached a full step of
 BCC dvec5              \ length T along the y-axis, so we don't change the
                        \ y-coordinate and instead jump to dvec5 to do the step
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

 BIT V                  \ If bit 6 of V is clear, jump to dvec4 to step along
 BVC dvec4              \ the y-axis in a positive direction

 DEC J                  \ Bit 6 of V is set, so decrement the y-coordinate in
                        \ J so we move along the y-axis in a negative dirction

 BVS dvec5              \ Jump to dvec5 to do the step along the x-axis by one
                        \ pixel (this BVS is effectively a JMP as we know the V
                        \ flag is set)

.dvec4

 INC J                  \ Bit 6 of V is clear, so increment the y-coordinate in
                        \ J so we move along the y-axis in a positive direction

.dvec5

 STA QQ                 \ Store the updated fractional value in QQ

                        \ We now move one pixel along the x-axis in the
                        \ direction given in V

 BIT V                  \ If bit 7 of V is clear, jump to dvec6 to step along
 BPL dvec6              \ the x-axis in a positive direction

 DEC I                  \ Bit 7 of V is set, so decrement the x-coordinate in
                        \ I so we move along the x-axis in a negative dirction

 JMP dvec11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dvec11 to plot the next pixel

.dvec6

 INC I                  \ Bit 7 of V is clear, so increment the x-coordinate in
                        \ I so we move along the x-axis in a positive direction

 JMP dvec11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dvec11 to plot the next pixel

.dvec7

                        \ We jump here when we need to calculate the coordinates
                        \ of the next pixel in the line when stepping along the
                        \ longer delta axis one pixel at a time

 LDA PP                 \ If PP = 0 then this is a shallow horizontal slope, so
 BEQ dvec3              \ jump up to dvec3 step along the x-axis

                        \ If we get here then this is a steep vertical line, so
                        \ we need to step along the y-axis

 LDA QQ                 \ Set A = QQ + T
 CLC                    \
 ADC T                  \ so A contains the cumulative step along the x-axis
                        \ (the shorter axis)

 CMP U                  \ If A < U, then we haven't yet reached a full step of
 BCC dvec9              \ length U along the x-axis, so we don't change the
                        \ x-coordinate and instead jump to dvec9 to do the step
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

 BIT V                  \ If bit 7 of V is clear, jump to dvec8 to step along
 BPL dvec8              \ the x-axis in a positive direction

 DEC I                  \ Bit 7 of V is set, so decrement the x-coordinate in
                        \ I so we move along the x-axis in a negative direction,
                        \ i.e. to the left

 JMP dvec9              \ Jump to dvec9 to do the step along the y-axis by one
                        \ pixel

.dvec8

 INC I                  \ Bit 7 of V is clear, so increment the x-coordinate in
                        \ I so we move along the x-axis in a positive direction,
                        \ i.e. to the right

.dvec9

 STA QQ                 \ Store the updated fractional value in QQ

                        \ We now move one pixel along the y-axis in the
                        \ direction given in V

 BIT V                  \ If bit 6 of V is clear, jump to dvec10 to step along
 BVC dvec10             \ the y-axis in a positive direction, i.e up the screen

 DEC J                  \ Bit 6 of V is set, so decrement the y-coordinate in
                        \ J so we move along the y-axis in a negative direction,
                        \ i.e. down the screen

 BVS dvec11             \ Now that we have moved (I, J) to the next pixel in the
                        \ line, jump to dvec11 to plot the next pixel (this BVS
                        \ is effectively a JMP as we know the V flag is set)

.dvec10

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

.dvec11

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

 LDA yLookupLo,Y        \ Set P = Y-th byte of yLookupLo
 CLC                    \         + X-th byte of xLookupLo
 ADC xLookupLo,X        \       = LO(screen address) + LO(X * 8)
 STA P

 LDA yLookupHi,Y        \ Set Q = Y-th byte of yLookupHi
 ADC xLookupHi,X        \         + X-th byte of xLookupHi
 STA Q                  \       = HI(screen address) + HI(X * 8)

                        \ So (P Q) is the screen address of the pixel row
                        \ containing pixel (I, J), out by 8 bytes for each row
                        \ above or below the top of the dashboard

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

 BIT N                  \ If bit 7 of N is set, jump to dvec12 to erase the line
 BMI dvec12             \ with EOR logic instead of drawing it with OR logic

 LDA RR,X               \ Fetch the X-th byte of RR, which is a pixel byte with
                        \ the X-th pixel set to white

 ORA (P),Y              \ OR it with (P Q) + Y, which is the screen address of
                        \ the pixel row containing (I, J)
                        \
                        \ This will keep all pixels the same except the X-th
                        \ pixel, which is set to white, so this will plot a
                        \ pixel at (I, J) when stored in screen memory

 JMP dvec13             \ Jump to dvec13 to skip the following three
                        \ instructions

.dvec12

 LDA RR,X               \ Fetch the X-th byte of RR, which is a pixel byte with
                        \ the X-th pixel set to white

 EOR #%11111111         \ Invert all the bits, so A is now a pixel byte that is
                        \ all white except for the X-th pixel, which is black

 AND (P),Y              \ AND it with (P Q) + Y, which is the screen address of
                        \ pixel (I, J)
                        \
                        \ This will keep all pixels the same except the X-th
                        \ pixel, which is set to black, so this will erase the
                        \ pixel at (I, J) when stored in screen memory

.dvec13

 STA (P),Y              \ Store the byte in A in sceen memory at (P Q) + Y,
                        \ which sets all four pixels to the pixel pattern in A,
                        \ which either draws or erases the pixel at (I, J)

 DEC VV                 \ Decrement VV to step one pixel along the longer axis

 BNE dvec7              \ If VV is non-zero, jump up to dvec7 to calculate the
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
\ matrix4Lo, matrix4Lo+2, matrix4Lo+3, matrix4Lo+4 are only used to provide
\ signs in bit 0:
\   Negative if bit 0 is set, positive if clear
\
\ matrix4Hi, matrix4Hi+3 provide values for T calculations
\ matrix4Hi+2, matrix4Hi+4 provide values for U calculations
\
\ matrix4Hi+3 = current roll orientation, 0-&FF for 0 to 45 degrees
\ matrix4Lo+3 = direction of roll
\
\ Y = 0, K = 0:
\   T = (matrix4Lo matrix4Hi) / 4
\   U = -(matrix4Lo+2 matrix4Hi+2) / 4
\   Return (T + U) / 8 with the sign bits retained = x-coord of start
\
\ Y = 0, K = 1:
\   T = -(matrix4Lo matrix4Hi) / 4
\   U = -(matrix4Lo+2 matrix4Hi+2) / 4
\   Return (T + U) / 8 with the sign bits retained = y-coord of start
\
\ Y = 3, K = 0:
\   T = (matrix4Lo+3 matrix4Hi+3) / 4
\   U = -(matrix4Lo+4 matrix4Hi+4) / 4
\   Return (T + U) / 8 with the sign bits retained = x-delta
\
\ Y = 3, K = 1:
\   T = -(matrix4Lo+3 matrix4Hi+3) / 4
\   U = -(matrix4Lo+4 matrix4Hi+4) / 4
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

 LDA matrix4Hi,Y        \ Set A = matrix4Hi (Y = 0) or matrix4Hi+3 (Y = 3)

 LSR A                  \ Set A = A / 4
 LSR A

 CPY #0                 \ If Y = 3, halve A again, so A = A / 8
 BNE arhi1
 LSR A

.arhi1

 STA T                  \ Set T = A, so T = A / 4 or A / 8

 LDA matrix4Lo,Y        \ Set A = matrix4Lo (Y = 0) or matrix4Lo+3 (Y = 3)

 EOR K                  \ If K = 1, flip bit 0 of A

 AND #1                 \ If bit 0 of A is zero, jump to arhi2 to skip the
 BEQ arhi2              \ following

 LDA #0                 \ Set T = 0 - T
 SEC
 SBC T
 STA T

.arhi2

 LDA matrix4Hi+2,Y      \ Set A = matrix4Hi+2 (Y = 0) or matrix4Hi+4 (Y = 3)

 LSR A                  \ Set A = A / 4
 LSR A

 CPY #0                 \ If Y = 3, halve A again, so A = A / 8
 BNE arhi3
 LSR A

.arhi3

 STA U                  \ Set U = A, so U = A / 4 or A / 8

 LDA matrix4Lo+2,Y      \ Set A = matrix4Lo+2 (Y = 0) or matrix4Lo+4 (Y = 3)

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
\   Category: Maths
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

 LDX indicator0To6      \ Increment the indicator number to point to the next
 INX                    \ indicator within the range 0 to 6

 CPX #7                 \ If X < 7, skip the following instruction
 BCC udas1

 LDX #0                 \ Set X = 0, so X steps through the range 0 to 6 with
                        \ each subsequent call to UpdateDashboard

.udas1

 STX indicator0To6      \ Store the updated indicator number

 JSR UpdateIndicator    \ Update indicator X (0 to 6)

.UpdateDash7To11

 LDX indicator7To11     \ Increment the indicator number to point to the next
 INX                    \ indicator within the range 7 to 11

 CPX #11                \ If X < 11, skip the following instruction
 BCC udas2

 LDX #7                 \ Set X = 7, so X steps through the range 7 to 11 with
                        \ each subsequent call to UpdateDashboard

.udas2

 STX indicator7To11     \ Store the updated indicator number

 JSR UpdateIndicator    \ Update indicator X (7 to 11)

 LDA #%01110111         \ Redraw the small horizontal line in the centre of the
 STA row28_block26_5    \ slip-and-turn indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateFlightModel (Part 1 of 4)
\       Type: Subroutine
\   Category: Flight model
\    Summary: Apply any axis control key presses to the current axis values
\
\ ******************************************************************************

.UpdateFlightModel

 LDX #2                 \ We start with the aileron, rudder and elevator key
                        \ pairs, whose values are stored in these key logger
                        \ offsets in keyLoggerLow and keyLoggerHigh:
                        \
                        \   * 2 = aileron
                        \   * 1 = rudder
                        \   * 0 = elevator
                        \
                        \ So we set a counter in X to count down through these
                        \ index values, from 2 to 1 to 0

.pkey1

 CLC                    \ Clear the C flag for the addition below

 LDA keyLoggerLow,X     \ Fetch the low value for this key pair, which will be 1
                        \ if a key is being pressed, or 0 if no key is pressed

 BEQ pkey4              \ If A = 0 then neither key in this key pair is being
                        \ pressed, so jump down to pkey4

 ADC axisKeyUsage,X     \ Add the low value to the corresponding variable for
 STA axisKeyUsage,X     \ this key pair in axisKeyUsage, so we increment the
                        \ value every time a key from this pair is used

 LDA keyLoggerHigh,X    \ Fetch the high value for this key pair, which will be
                        \ +1 or -1 if a key is being pressed, or 0 if no key is
                        \ pressed

 STA P                  \ Store the value in P so we can check its sign below

 ADC elevatorPosition,X \ Set A = A + one of the following axis values:
                        \
                        \   * aileronPosition if this is the aileron key pair
                        \   * rudderPosition if this is the rudder key pair
                        \   * elevatorPosition if this is the elevator key pair
                        \
                        \ so the relevant value is increased or decreased by 1
                        \ according to the key press

 LDY axisChangeRate,X   \ If this key pair's axisChangeRate value is already
 BEQ pkey2              \ zero, skip the following instruction

 DEC axisChangeRate,X   \ Decrement this key pair's axisChangeRate value

.pkey2

 BNE pkey3              \ If this key pair's axisChangeRate value is non-zero,
                        \ skip the following

                        \ If we get here, then this key pair's axisChangeRate
                        \ value has been reduced down to zero by repeated calls
                        \ to UpdateFlightModel with the key being held down, so
                        \ the relavant control is now fully engaged and we bump
                        \ up the rate of change by another 3 in the relevant
                        \ direction

 CLC                    \ Set A = A + 3
 ADC #3

 BIT P                  \ If P is positive (so we are increasing the relevant
 BPL pkey3              \ axis value), skip the following instruction

 ADC #250               \ P is negative (so we are decreasing the relevant
                        \ axis value), so set A = A - 6, giving a net change of
                        \ setting A = A - 3

.pkey3

 TAY                    \ If the adjusted axis value is positive, jump down to
 BPL pkey5              \ pkey5 to check the maximum allowed value

                        \ If we get here then the adjusted axis value is
                        \ negative, so now we check against the minimum allowed
                        \ value

 CMP #140               \ If A >= -116, the value is within limits, so jump to
 BCS pkey6              \ pkey6 to store it

 LDA #140               \ Set A = -116 as the minimum allowed value for the axis
 BNE pkey6              \ value and jump to pkey6 to store it

.pkey4

                        \ If we get here then neither key was pressed from this
                        \ key pair

 LDA #6                 \ Set the axisChangeRate value for this key pair to 6,
 STA axisChangeRate,X   \ so the rate of change goes back to 1 until we fully
                        \ engage the control once again

 BNE pkey7              \ Jump down to pkey7 to move on to the next key pair
                        \ (this BNE is effectively a JMP as A is never zero)

.pkey5

                        \ If we get here then the adjusted axis value is
                        \ positive, so now we check against the maximum allowed
                        \ value

 CMP #119               \ If A < 119, the value is within limits, so jump to
 BCC pkey6              \ pkey6 to store it

 LDA #118               \ Set A = 118 as the maximum allowed value for the axis
                        \ value

.pkey6

 STA elevatorPosition,X \ Store the adjusted axis value in the relevant axis
                        \ variable:
                        \
                        \   * aileronPosition if this is the aileron key pair
                        \   * rudderPosition if this is the rudder key pair
                        \   * elevatorPosition if this is the elevator key pair

.pkey7

 DEX                    \ Decrement the key pair index

 BPL pkey1              \ Loop back to process the next key pair until we have
                        \ done all three axes of movement (aileron roll, rudder
                        \ yaw and elevator pitch)

 JSR ReadJoystick       \ Read the joystick axes and fire button and update the
                        \ aileron, elevator and fire key values accordingly

\ ******************************************************************************
\
\       Name: UpdateFlightModel (Part 2 of 4)
\       Type: Subroutine
\   Category: Flight model
\    Summary: Apply any throttle key presses to the current thrust value
\
\ ******************************************************************************

                        \ Now we process the thrust keys

 CLC                    \ Clear the C flag for the addition below

 LDA keyLoggerLow+3     \ Fetch the low value for the throttle key

 BEQ pkey11             \ If A = 0 then neither key in this key pair is being
                        \ pressed, so jump down to pkey11 to skip the throttle
                        \ calculations below

                        \ We now want to add the key logger value to the current
                        \ thrust value, which we do like this:
                        \
                        \   (Y X) = (keyLoggerHigh+3 keyLoggerLow+3)
                        \           +  (thrustHi thrustLo)

 ADC thrustLo           \ We start by adding the low bytes
 TAX


 LDA keyLoggerHigh+3    \ And then add the high bytes, so now (Y X) contains the
 ADC thrustHi           \ updated thrust value
 TAY

 BMI pkey8              \ If the result is negative, jump to pkey8 to set both X
                        \ and Y to zero, so the minimum thrust value is zero

 CPY #5                 \ If the high byte in Y < 5, then the result is within
 BCC pkey10             \ bounds, so jump to pkey10 to store the new thrust
                        \ value

 LDY #5                 \ Set Y = 5 and jump to pkey9 to set X to 0, so the
 BNE pkey9              \ maximum thrust value is (5 0), or 1280 (this BNE is
                        \ effectively a JMP, as Y is never zero)

.pkey8

 LDY #0                 \ If we get here then the new thrust in (Y X) turned out
                        \ to be negative, so we set Y = 0 and then X = 0 to zero
                        \ the thrust

.pkey9

 LDX #0                 \ Zero the low byte of the new thrust as we are either
                        \ at the maxiumum value of (5 0) or the minimum value of
                        \ (0 0)

.pkey10

 STX thrustLo           \ Store the thrust value in (thrustHi thrustLo) to the
 STY thrustHi           \ updated thrust value in (Y X)

 LDX #11                \ Update the thrust indicator
 JSR UpdateIndicator

\ ******************************************************************************
\
\       Name: UpdateFlightModel (Part 3 of 4)
\       Type: Subroutine
\   Category: Flight model
\    Summary: Process the undercarriage, brake, flaps and fire keys
\
\ ******************************************************************************

.pkey11

 LDX #4                 \ Process the undercarriage or brake keys, if pressed
 JSR ProcessOtherKeys

 BEQ pkey13             \ If neither are being pressed, jump to pkey13 to check
                        \ for the next set of key presses

 BMI pkey12             \ If the brake key is being pressed, then the returned
                        \ value is 128, so jump to pkey12

 JSR IndicatorU         \ The undercarriage key is being pressed, so update the
                        \ undercarriage indicator

 JMP pkey13             \ Jump to pkey13 to check for the next set of key
                        \ presses

.pkey12

 JSR IndicatorB         \ The brake key is being pressed, so update the brakes
                        \ indicator

.pkey13

 LDX #5                 \ Process the flaps or fire keys, if pressed
 JSR ProcessOtherKeys

 BEQ pkey15             \ If neither are being pressed, jump to pkey15 to check
                        \ for the next set of key presses


 BMI pkey14             \ If the fire key is being pressed, then the returned
                        \ value is 128, so jump to pkey14

 JSR IndicatorF         \ The flaps key is being pressed, so update the flaps
                        \ indicator

 JMP pkey15             \ Jump to pkey15 to check for the next set of key
                        \ presses

.pkey14

 JSR FireGuns           \ The fire key is being pressed, so call FireGuns

\ ******************************************************************************
\
\       Name: UpdateFlightModel (Part 4 of 4)
\       Type: Subroutine
\   Category: Flight model
\    Summary: Set up matrices, apply the flight model and update the dashboard
\
\ ******************************************************************************

.pkey15

 LDY #2                 \ We now set up the matrices, starting with the matrix
                        \ in page 1, which we populate one axis at a time, so
                        \ set a counter in Y to denote the current axis

.pkey16

 STY matrixAxis         \ Set matrixAxis to the current axis in Y, to pass to
                        \ SetMatrix

 JSR SetMatrix          \ Set up the matrix values in page 1

 LDY matrixAxis         \ Restore the axis counter that we stored above

 DEY                    \ Decrement the axis counter in Y

 BPL pkey16             \ Loop back until we have processed all three axes

 LDA #0                 \ Set matrixNumber = 0 to pass to SetMatrices
 STA matrixNumber

 STA matrixAxis         \ Set matrixAxis = 0 to pass to SetMatrices

 JSR SetMatrices        \ Set up the rotation matrices

 JSR ApplyFlightModel   \ Apply the flight model to our plane

 JSR UpdateDashboard    \ Update the next two indicators in the ranges 0 to 6
                        \ and 7 to 11

 JSR UpdateDash7To11    \ Update the next indicator in the range 7 to 11

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessOtherKeys
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Apply the undercarriage, brakes, flaps and fire keys
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The offset within the key logger for the keys to check:
\
\                         * 4 = "U" or "B" (undercarriage, brakes)
\
\                         * 5 = "F" or SHIFT (flaps, fire)
\
\ Returns:
\
\   A                   Returns the status of the relevant key presses:
\
\                         * 0 = neither key in the pair is being pressed, or a
\                               key is still being held down from a previous
\                               call to the routine, so it has already been
\                               processed
\
\                         * 1 = One of "U" and "F" (undercarriage, flaps) is
\                               being pressed
\
\                         * 128 = One of "B" and SHIFT (brakes, fire) is being
\                               pressed
\
\ ******************************************************************************

.ProcessOtherKeys

 LDA keyLoggerLow,X     \ Fetch the low value for this key pair

 BNE poth2              \ If A is non-zero then a key from this key pair is
                        \ being pressed, so jump down to poth2 to process the
                        \ key press

 STA pressingUFBS-4,X   \ Zero the relevant value in pressingUFBS (for U) or
                        \ pressingUFBS+1 (for F) to indicate that the first key
                        \ from this pair is not being held down

 STA pressingUFBS-4+3,X \ Zero the relevant value in pressingUFBS+3 (for B) or
                        \ pressingUFBS+4 (for SHIFT) to indicate that the second
                        \ key from this pair is not being held down

.poth1

 LDA #0                 \ Set A = 0 as the return value

 RTS                    \ Return from the subroutine

.poth2

 TAY                    \ Copy the low value into Y, so we have:
                        \
                        \   * Y = 4 if "U" is being pressed (undercarriage)
                        \   * Y = 5 if "F" is being pressed (flaps)
                        \   * Y = 7 if "B" is being pressed (brakes)
                        \   * Y = 8 if SHIFT is being pressed (fire)

 LDA pressingUFBS-4,Y   \ Fetch the relevant value from pressingUFBS to see if
 BNE poth1              \ the key press has already been processed, and if it is
                        \ non-zero, this indicates that it is still being held
                        \ down from a previous visit to this routine, so jump to
                        \ poth1 to return a value of 0, so we can ignore the key
                        \ press

 LDA ucStatus-4,Y       \ Flip the value of the relevant status byte, as
 EOR #1                 \ follows:
 STA ucStatus-4,Y       \
                        \   * Flip ucStatus if "U" is being pressed
                        \   * Flip flapsStatus if "F" is being pressed
                        \   * Flip brakesStatus if "B" is being pressed
                        \   * Flip brakesStatus+1 if SHIFT is being pressed
                        \      (which has no effect)

 LDA #1                 \ Set the relevant value in pressingUFBS to denote that
 STA pressingUFBS-4,Y   \ this key is being pressed, so if we revisit this
                        \ routine before the key is released, we don't keep on
                        \ flipping the status byte

 CPY #7                 \ If Y < 7, i.e. U or F are being pressed, jump to poth3
 BCC poth3              \ to return a result of 1

 LDA #128               \ Y >= 7, i.e. B or SHIFT are being pressed, so set
                        \ A = 128 as the return value

 RTS                    \ Return from the subroutine

.poth3

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

 LDY ucStatus           \ If ucStatus is non-zero then the undercarriage is
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

 LDY onGround           \ If onGround is non-zero, then we are on the ground, so
 BNE indu4              \ jump to indu4 to set the undercarriage to up and
                        \ return from the subroutine

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

 STA row30_block32_2,X  \ Update pixel row X of the undercarriage indicator to
                        \ the pixel pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indu3              \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

.indu4

 LDA #0                 \ Set ucStatus = 0 to set the undercarriage to up
 STA ucStatus

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: IndicatorF
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the flaps indicator ("F") and and related variables
\
\ ******************************************************************************

.IndicatorF

 LDA L4F85              \ Set A = L4F85
 
 LDY flapsStatus        \ If flapsStatus is non-zero then the flaps are on, so
 BNE indf1              \ jump to indf1

                        \ If we get here then the flaps are off

 SEC                    \ Set A = A - 200
 SBC #200

 LDX #0                 \ Set X = 0 to store in L4F87 below

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

 STX L4F87              \ Store X in L4F87 (0 if flaps are off, 152 if they are
                        \ on) ???

 TYA                    \ Set A to the pixel pattern in Y

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the flaps indicator

.indf3

 STA row30_block35_2,X  \ Update pixel row X of the flaps indicator to the pixel
                        \ pattern in A

 DEX                    \ Decrement the byte counter to the pixel row above

 BPL indf3              \ Loop back to update the next row of the indicator

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: FireGuns
\       Type: Subroutine
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Other entry points:
\
\   FireGuns-1          Contains an RTS
\
\ ******************************************************************************

.FireGuns

 LDA firingStatus       \ If either firingStatus or L368F are non-zero, return
 ORA L368F              \ from the subroutine (as FireGuns-1 contains an RTS)
 BNE FireGuns-1

 LDX #228               \ Set the point with ID 228 to (0, 0, 0)
 JSR SetPointToOrigin

 LDA airspeedHi
 CLC
 ADC #&C8
 STA zPointLo+228

 LDA #&FF               \ Set the point with ID 95 to (-1, -1, -1)
 LDX #95
 JSR SetPoint

 LDA #&14
 STA zPointLo+95
 LDA #&F6
 STA xPointLo+95
 LDA #&FC
 STA yPointLo+95

 LDA #228               \ Set GG to point ID 228, to pass to the call to 
 STA GG                 \ SetPointCoords

 LDA #9                 \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 2 in the calculation

 STA firingStatus       \ Set firingStatus = 9, which is a non-zero value, to
                        \ indicate that there are bullets are in the air

 JSR SetPointCoords     \ Calculate the coordinates for point 228

 LDX #&E5

.fire1

 JSR CopyTempToPoint

 INX
 CPX #&E8
 BNE fire1

 LDA #95                \ Set GG to point ID 95, to pass to the call to 
 STA GG                 \ SetPointCoords

 JSR SetPointCoords     \ Calculate the coordinates for point 95

 LDX #LO(xPlaneLo)      \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (xTemp2, yTemp2, zTemp2)

 LDY #96                \ Set Y so the call to CopyPointToWork copies the
                        \ coordinates to point 96

 JSR CopyWorkToPoint    \ Copy the coordinates from (xTemp2, yTemp2, zTemp2)
                        \ to point 96

 LDY #12
 LDX #96

.fire2

 JSR ResetObjectCoords  \ Move object 12-15 to the origin

 JSR AddPointToObject   \ Move object 12-15 by the vector in point 96, so this
                        \ sets the location of the object to that of point 96

 INY
 CPY #16
 BNE fire2

 LDY #12                \ Move object 12 by the vector in point 95
 LDX #95
 JSR AddPointToObject

 STX objectAnchorPoint
 LDA #&60
 STA GG
 JSR SetObjPointCoords

 LDA #&61
 STA GG
 JSR SetObjPointCoords

 LDX #&62
 LDY #&60
 JSR AddTempToPoint

 LDY #15
 LDX #98

.fire3

 JSR AddPointToObject   \ Move object 13-15 by the vector in point 96-98

 DEX
 DEY
 CPY #12
 BNE fire3

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

 LDX brakesStatus       \ If brakesStatus is non-zero then the brakes are on, so
 BNE indb1              \ jump to indb1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the brakes indicator
                        \ when turned off

.indb1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the brakes indicator

.indb2

 STA row30_block37_2,X  \ Update pixel row X of the brakes indicator to the
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

 LDX themeStatus        \ If themeStatus is positive then the Theme is enabled,
 BPL indt1              \ so jump to indt1

 LDA #%01010101         \ Set A to a four-pixel block with pixels 0 and 2 in
                        \ white, to act as the centre of the Theme indicator
                        \ when turned off

.indt1

 LDX #2                 \ Set X = 2 to use as a pixel row counter for the three
                        \ pixel rows in the Theme indicator

.indt2

 STA row30_block0_2,X   \ Update pixel row X of the Theme indicator to the pixel
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
\       Name: UpdateKeyLogger
\       Type: Subroutine
\   Category: Keyboard
\    Summary: Scan the keyboard for keys in the two key tables and update the
\             key logger
\
\ ------------------------------------------------------------------------------
\
\ This routine updates the key logger, which is stored in keyLoggerHigh and
\ keyLoggerLow. If a key is pressed, then the corresponding 16-bit value in the
\ key logger is set to the corresponding value from the KeyTable tables, which
\ are stored in keyTable1Lo/keyTable1Hi and keyTable2Lo/keyTable2Hi.
\
\ ******************************************************************************

.UpdateKeyLogger

 LDA #5                 \ Set V = 5 to act as an offset as we work our way
 STA V                  \ through the six keys in keyTable1

.sckt1

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX keyTable1,Y        \ Scan the keyboard to see if the Y-th key in keyTable1
 JSR ScanKeyboard       \ is being pressed

 BNE sckt2              \ If the key is not being pressed, jump down to sckt2 to
                        \ check the Y-th key in keyTable1

 LDX V                  \ Set X = the offset of the key we are processing
 
 LDY keyTable1Lo,X      \ Fetch the key logger value for this key press into
 LDA keyTable1Hi,X      \ (A Y)
 
 JMP sckt4              \ Jump down to sckt4 to store (A Y) in the key logger

.sckt2

 LDY V                  \ Set Y = the offset of the key we are processing

 LDX keyTable2,Y        \ Scan the keyboard to see if the Y-th key in keyTable2
 JSR ScanKeyboard       \ is being pressed

 BNE sckt3              \ If the key is not being pressed, jump down to sckt3 to
                        \ store 0 in the key logger

 LDX V                  \ Set X = the offset of the key we are processing

 LDY keyTable2Lo,X      \ Fetch the key logger value for this key press into
 LDA keyTable2Hi,X      \ (A Y)

 JMP sckt4              \ Jump down to sckt4 to store (A Y) in the key logger

.sckt3

 LDA #0                 \ Set A = 0

 LDX V                  \ Set X = the offset of the key we are processing

 TAY                    \ Set Y = 0, so the key logger value in (A Y) is 0

.sckt4

 STA keyLoggerHigh,X    \ Store the high byte of the key logger value in (A Y)
                        \ in the X-th byte of keyLoggerHigh

 TYA                    \ Store the low byte of the key logger value in (A Y)
 STA keyLoggerLow,X     \ in the X-th byte of keyLoggerLow

 DEC V                  \ Decrement the offset to point to the next key to
                        \ process

 BPL sckt1              \ Loop back until we have processed all six key pairs

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: AddPointToObject
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Add a point vector to an object's coordinates
\
\ ------------------------------------------------------------------------------
\
\ This routine adds a point vector in (xPoint, yPoint, zPoint) to the object
\ coordinates in (xObject, yObject, zObject), storing the result in the object
\ coordinates. In other words, this moves an object by the xPoint vector.
\
\ This is called MOBJ or UOBJ in the original source code.
\
\ Arguments:
\
\   X                   The ID of the point vector to add to the object
\
\   Y                   The ID of the object to update
\
\ ******************************************************************************

.AddPointToObject

 LDA xObjectLo,Y        \ Set object Y's x-coordinate to the following:
 CLC                    \
 ADC xPointLo,X         \  (xObjectHi+Y xObjectLo+Y) + (xPointHi+X xPointLo+X)
 STA xObjectLo,Y        \
 LDA xObjectHi,Y        \ i.e. we add object Y's x-coordinate and point X's
 ADC xPointHi,X         \ x-coordinate
 STA xObjectHi,Y

 LDA yObjectLo,Y        \ Set object Y's y-coordinate to the following:
 CLC                    \
 ADC yPointLo,X         \  (yObjectHi+Y yObjectLo+Y) + (yPointHi+X yPointLo+X)
 STA yObjectLo,Y        \
 LDA yObjectHi,Y        \ i.e. we add object Y's y-coordinate and point X's
 ADC yPointHi,X         \ y-coordinate
 STA yObjectHi,Y

 LDA zObjectLo,Y        \ Set object Y's z-coordinate to the following:
 CLC                    \
 ADC zPointLo,X         \  (zObjectHi+Y zObjectLo+Y) + (zPointHi+X zPointLo+X)
 STA zObjectLo,Y        \
 LDA zObjectHi,Y        \ i.e. we add object Y's z-coordinate and point X's
 ADC zPointHi,X         \ z-coordinate
 STA zObjectHi,Y

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ResetObjectCoords
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Set an object's coordinates to (0, 0, 0)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   Y                   The ID of the object to set to (0, 0, 0)
\
\ ******************************************************************************

.ResetObjectCoords

 LDA #0                 \ Zero the object's x-coordinate
 STA xObjectLo,Y
 STA xObjectHi,Y

 STA yObjectLo,Y        \ Zero the object's y-coordinate
 STA yObjectHi,Y

 STA zObjectLo,Y        \ Zero the object's z-coordinate
 STA zObjectHi,Y

 RTS                    \ Return from the subroutine

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
\       Name: ResetVariables
\       Type: Subroutine
\   Category: Setup
\    Summary: Reset most variables to prepare for a new flight
\
\ ******************************************************************************

.ResetVariables

 LDX #0                 \ Set A = 0 to use as our zero value

 TXA                    \ Set X = 0 to use as a counter for zeroing 256 bytes in
                        \ the rset1 loop

 STA alienCounter       \ Set alienCounter = 0

 STA L4F87              \ Set L4F87 = 0

 STA L368F              \ Set L368F = 0

 STA randomNumbers      \ Set randomNumbers = 0 to reset the pointer for the
                        \ list of random numbers

 STA scoreLo            \ Set scoreLo = 0

 STA scoreHi            \ Set scoreHi = 0

.rset1

                        \ This loop zeroes the whole page at pointStatus, which
                        \ also zeroes objectStatus

 STA pointStatus,X      \ Zero the X-th byte of pointStatus

 DEX                    \ Decrement the byte counter

 BNE rset1              \ Loop back until we have zeroed the whole page

 LDX #255               \ Set X = 255 to use as a counter for zeroing 255 bytes
                        \ in the rset2 loop

 STA relatedPoints      \ Set relatedPoints = 0 to reset the relatedPoints list

 STA mainLoopCounter    \ Set mainLoopCounter = 0

.rset2

                        \ This loop zeroes &0C00 to &0CFE, which resets all of
                        \ the variables in the &0C00 workspace

 STA &0C00-1,X          \ Zero the X-1-th byte of page &C

 DEX                    \ Decrement the byte counter

 BNE rset2              \ Loop back until we have zeroed &0C00 to &0CFE

 LDX #7                 \ Set X = 7 to use as a counter for zeroing 8 bytes in
                        \ the rset3 loop

.rset3

                        \ This loop zeroes 8 bytes at alienState to reset the
                        \ state of the aliens

 STA alienState,X       \ Zero the X-th byte of alienState

 DEX                    \ Decrement the byte counter

 BPL rset3              \ Loop back until we have zeroed alienState to
                        \ alienState+7

 LDA #&48               \ Set zPlaneHi = &48
 STA zPlaneHi

 LDA #&5C               \ Set zPlaneLo = &5C, so (zPlaneHi zPlaneLo) = &485C
 STA zPlaneLo

 LDA #&C6               \ Set xPlaneHi = &C6
 STA xPlaneHi

 LDA #&E5               \ Set xPlaneLo = &E5, so (xPlaneHi xPlaneLo) = &C6E5
 STA xPlaneLo

 LDA #10                \ Set yPlaneLo = 10, so (yPlaneHi yPlaneLo) = 10
 STA yPlaneLo

 STA L0CF8              \ Set L0CF8 = 10

 LDA #242               \ Set L4F85 = 242
 STA L4F85

 LDA #1                 \ Set ucStatus = 1 (undercarriage is down)
 STA ucStatus

 STA brakesStatus       \ Set brakesStatus = 1 (brakes on)

 STA landingStatus      \ Set landingStatus = 1 (do all landing tasks)

 JSR IndicatorU         \ Update the undercarriage indicator

 LDA #1                 \ Set onGround = 1 (on the ground)
 STA onGround

 LDA #47                \ Set lineBuffer2Count = 47
 STA lineBuffer2Count

 LDA #255               \ Set themeStatus = 255
 STA themeStatus

 STA lineBuffer1Count   \ Set lineBuffer1Count = 255

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

                        \ This loop zeroes alienCounter+1 to alienCounter+3

 STA alienCounter+1,X   \ Zero the X-th byte of alienCounter+1

 DEX                    \ Decrement the byte counter

 BPL rset5              \ Loop back until we have zeroed all three bytes

 JSR IndicatorT         \ Update the Theme indicator

 LDX #11                \ Update the thrust indicator
 JSR UpdateIndicator

 LDA #65                \ Set fuelLevel = 65, which indicates a full tank
 STA fuelLevel

                        \ We now drain the fuel tank one point at a time,
                        \ updating the fuel gauge as we go so the fuel gauge
                        \ gets cleared down to empty at the same time as
                        \ the value in fuelLevel

.rset6

 DEC fuelLevel          \ Decrement the counter in fuelLevel

 JSR UpdateFuelGauge    \ Update the fuel gauge

 LDA fuelLevel          \ Loop back until fuelLevel = 0, by which point we have
 BNE rset6              \ reset the fuel tanks and cleared the fuel gauge

                        \ Fall through into ResetRadar to reset the radar
                        \ display

\ ******************************************************************************
\
\       Name: ResetRadar
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update the radar display
\
\ ******************************************************************************

.ResetRadar

 LDA #80                \ Set xPointLo = 80, so we don't draw a new alien on the
 STA xPointLo           \ radar (as this coordinate is off the radar)

 LDA #1                 \ Set TC = 1, so we remove the alien from the radar
 STA TC                 \ rather than the runway when we call DrawRadarBlip

 STA xPointHi           \ Set xPointHi = 1, so the value in xPointLo is treated
                        \ as positive

 JSR DrawRadarBlip      \ Remove the current dot from the radar, but don't draw
                        \ a new one, as xPointLo is off-radar

 LDY #33                \ Reset object 33's coordinates (the flying alien) to
 JSR ResetObjectCoords  \ (0, 0, 0)

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

 LDA #0                 \ Set the high score in (highScoreHi highScoreLo) to 0
 STA highScoreHi
 STA highScoreLo

 LDA #14                \ Call DefineEnvelope with A = 14 to set up the second
 JSR DefineEnvelope     \ sound envelope

                        \ Fall through into NewGame to start a new game

\ ******************************************************************************
\
\       Name: NewGame
\       Type: Subroutine
\   Category: Setup
\    Summary: Start a new game
\
\ ******************************************************************************

.NewGame

 JSR ClearCanopy        \ Clear the canopy to black, leaving the canopy edges
                        \ alone

 JSR ResetVariables     \ Reset most variables to prepare for a new flight

 JSR UpdateKeyLogger    \ Scan for key presses and update the key logger

 JSR UpdateFlightModel  \ Process any key presses in the key logger and update
                        \ the matrices and flight model

 JSR ResetLineLists     \ Reset the line lists at linesToShow and linesToHide,
                        \ which will populate them with the correct lines to
                        \ show for the starting point on the runway

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
\       Name: MainLoop (Part 1 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Start the main loop by processing gunfire and bullets
\
\ ******************************************************************************

.MainLoop

 LDA linesToHideEnd     \ Store the index of the end of the linesToHide list in
 STA previousListEnd    \ previousListEnd so we can check it at the end of the
                        \ main loop

 JSR UpdateThemeStatus  \ Update the status of the Theme, if enabled

 JSR UpdateKeyLogger    \ Scan for key presses and update the key logger

 LDA firingStatus       \ If firingStatus is non-zero, then we have already
 BNE main2              \ fired our gun and the bullets are still in the air, so
                        \ jump to main2 to skip firing bullets, as we can't fire
                        \ any more bullets until the current ones expire

 JSR UpdateFlightModel  \ Process any key presses in the key logger and update
                        \ the matrices and flight model

 LDA firingStatus       \ If the call to UpdateFlightModel has left firingStatus
 BEQ main3              \ set to zero, then the fire key is not being pressed,
                        \ so jump to main3 to skip firing bullets

                        \ The call to UpdateFlightModel had changed firingStatus
                        \ from zero to non-zero, which means the fire key is
                        \ being pressed, so we now need to add two bullets to
                        \ the scene

 LDA #2                 \ Set gunSoundCounter = 2, so we make two firing sounds
 STA gunSoundCounter    \ below, one for each bullet

 LDY #33                \ We now copy the status bytes for objects 30 to 33 (the
                        \ four alien objects), copying the four bytes between
                        \ objectStatus+30 and objectStatus+33 into the four
                        \ bytes at alienStatus, so set up a counter in Y that
                        \ can also act as the offset

.main1

 LDA objectStatus,Y     \ Copy the Y-th byte of objectStatus to alienStatus-30,
 STA alienStatus-30,Y   \ to give this:
                        \
                        \   objectStatus+30 -> alienStatus
                        \   objectStatus+31 -> alienStatus+1
                        \   objectStatus+32 -> alienStatus+2
                        \   objectStatus+33 -> alienStatus+3

 DEY                    \ Decrement the loop counter

 CPY #30                \ Loop back until we have copied all four bytes
 BCS main1

                        \ We now add the bullet lines (line IDs 60 and 61) to
                        \ the linesToShow list, so they get displayed

 LDY linesToShowEnd     \ Set Y to the first free entry at the end of the
                        \ linesToShow list

 LDA #60                \ Append line 60 to the end of the linesToShow list
 STA linesToShow,Y

 INY                    \ Increment Y to point to the next free entry in the
                        \ list

 LDA #61                \ Append line 61 to the end of the linesToShow list
 STA linesToShow,Y

 INY                    \ Increment Y to point to the next free entry in the
                        \ list

 STY linesToShowEnd     \ Update linesToShowEnd with the updated index of the
                        \ next free entry, which is two more than it was before
                        \ we added the bullet lines

 JMP main3              \ Skip the following instruction, as we have already
                        \ processed the key logger

.main2

 JSR UpdateFlightModel  \ Process any key presses in the key logger and update
                        \ the matrices and flight model

\ ******************************************************************************
\
\       Name: MainLoop (Part 2 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Reset object statuses and related points
\
\ ******************************************************************************

.main3

                        \ We now want to zero the 40 bytes in objectStatus, so
                        \ that all objects are marked as unprocessed, and are
                        \ ready to be processed in this iteration of the main
                        \ loop

 LDX #19                \ We do this as two blocks of 20 bytes, so set a counter
                        \ in X to use in the loop below

 LDA #0                 \ Set showRunwayDashes = 0 to reset the dashes down the
 STA showRunwayDashes   \ middle of the runway to be visible

 STA relatedPoints      \ Set relatedPoints = 0 to reset the relatedPoints list,
                        \ so we can build a new list of related object points
                        \ in this iteration of the main loop

.main4

 STA objectStatus,X     \ Zero the X-th byte of objectStatus

 STA objectStatus+20,X  \ Zero the X-th byte of objectStatus+20

 DEX                    \ Decrement the loop counter

 BPL main4              \ Loop back until we have zeroed all 40 bytes

\ ******************************************************************************
\
\       Name: MainLoop (Part 3 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Make the sound of firing, if appropriate
\
\ ******************************************************************************

 LDA firingStatus       \ If firingStatus is zero then there are no bullets in
 BEQ main5              \ the air, so jump to main5 to skip updating the bullet
                        \ positions

 JSR UpdateBullets      \ Update the bullet positions

 LDA gunSoundCounter    \ If gunSoundCounter = 0 then we don't have any gun
 BEQ main5              \ firing sounds to make, so jump to main5 to skip the
                        \ gun sounds code

 DEC gunSoundCounter    \ Decrement the sound counter in gunSoundCounter

 LDA #6                 \ Make sound #6, the sound of our guns firing
 JSR MakeSound

\ ******************************************************************************
\
\       Name: MainLoop (Part 4 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Call the Theme main loop
\
\ ******************************************************************************

.main5

 LDA themeStatus        \ If bit 7 of themeStatus is set, then the Theme is not
 BMI main6              \ enabled, so jump to main6

 JSR AlienInAcornsville \ Check to see whether an alien has reached Acornsville
                        \ and terminate the main loop if it has

\ ******************************************************************************
\
\       Name: MainLoop (Part 5 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Update lines, check flying skills, increment main loop counter,
\             move aliens
\
\ ******************************************************************************

.main6

 JSR UpdateLinesToShow  \ Update the linesToShow list, moving any lines that
                        \ aren't visible into the linesToHide list

 JSR CheckAlienHit      \ Check to see if we have hit an alien with our bullets

 LDY #2                 \ Check to see if we are flying under the suspension
 JSR CheckFlyingSkills  \ bridge

 LDY #34                \ Check to see if we are flying down the main street of
 JSR CheckFlyingSkills  \ Acornsville

 INC mainLoopCounter    \ Increment the main loop counter

 LDA mainLoopCounter    \ If (loop counter + 4) mod 8 <> 0, jump to main7, so
 CLC                    \ we only do the following once every 8 iterations of
 ADC #4                 \ the main loop, when the loop counter is 4, 12, 20 and
 AND #7                 \ so on
 BNE main7

 LDY #1                 \ Update the runway on the radar
 JSR UpdateRadarBlip

 LDX alienToMove        \ Set X to the number of the alien whose turn it is to
                        \ move towards Acornsville in this iteration of the main
                        \ loop, which we set in UpdateAliens

 BMI main7              \ If X is negative, then there is no alien to move, so
                        \ jump to main7 to skip the following

 LDY #33                \ Set Y = 33 so the call to UpdateRadarBlip updates the
                        \ alien on the radar

 LDA alienState,X       \ If the moving alien's state is < 27, skip the
 CMP #27                \ following instruction
 BCC main7

 JSR UpdateRadarBlip    \ The moving alien's state is >= 27, so update the alien
                        \ on the radar

\ ******************************************************************************
\
\       Name: MainLoop (Part 6 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.main7

 LDA themeStatus        \ If themeStatus is non-zero then either the Theme is
 BNE main12             \ not enabled, or ??? so jump to main12

 LDA firingStatus       \ If firingStatus is zero then there are no bullets in
 BEQ main11             \ the air, so jump to main11

 LDA #33                \ We now loop through objects 33 down to 30, which are
 STA objectId           \ all the aliens, so set a loop counter in objectId

.main8

 LDY objectId           \ Set Y to the alien to check

 LDA alienStatus-30,Y   \ We copied the status bytes for all four alien objects
 BPL main9              \ into alienStatus in part 1, so this checks whether bit
                        \ 7 of the alien's status byte is clear. If it is clear,
                        \ then this object is not visible, so we skip the
                        \ following three instructions and move on to the next
                        \ alien

 JSR MoveAliens         \ This alien is visible, so move it

 LDA L368F              \ If L368F is non-zero, jump to main10
 BNE main10

.main9

 DEC objectId           \ Decrement the loop counter to the next alien

 LDA objectId           \ Loop back to process the next alien, until we have
 CMP #30                \ done the last one (object 30)
 BCS main8

 BCC main11             \ Jump to main11 (this BCC is effectively a JMP as we
                        \ just passed through a BCS)

.main10

 STA L368C              \ Store the value of L368F in L368C

 LDA #0                 \ Set firingStatus = 0 to indicate that there are no
 STA firingStatus       \ bullets are in the air

.main11

 JSR UpdateAliens       \ Update the aliens' statuses

\ ******************************************************************************
\
\       Name: MainLoop (Part 7 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Process the terminate key
\
\ ******************************************************************************

.main12

 LDA onGround           \ If onGround is zero, we are in the air and can't
 BEQ main13             \ terminate the game with the right arrow key, so jump
                        \ to main13 to skip the following

 LDX #&86               \ Scan the keyboard to see if the right arrow is being
 JSR ScanKeyboard       \ pressed

 BNE main13             \ If the right arrow is not being pressed, jump to
                        \ main13

 JSR TerminateGame      \ The right arrow is being pressed, which is the key to
                        \ terminate the game, so call TerminateGame to do
                        \ exactly that

 JMP NewGame            \ Jump to NewGame to start a new game

\ ******************************************************************************
\
\       Name: MainLoop (Part 8 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: If we fire the guns on the runway, enable the Theme
\
\ ******************************************************************************

.main13

 LDA landingStatus      \ If landingStatus = 0, jump to main17 to skip the
 BEQ main17             \ following (enabling the Theme, filling up with fuel,
                        \ awarding points for landing)

 BMI main16             \ If bit 7 of landingStatus is set, jump to main16 to
                        \ skip the following (enabling the Theme, filling up
                        \ with fuel)

 LDA firingStatus       \ If firingStatus is zero then there are no bullets in
 BEQ main14             \ the air, so jump to main14

 LDA themeStatus        \ If themeStatus is positive then the Theme is already
 BPL main14             \ enabled, so jump to main14

                        \ If we get here then there are bullets in the air and
                        \ the Theme is not enabled, so we now need to enable the
                        \ Theme (as it is triggered by us firing bullets when
                        \ we are stationary and on the runway with the brakes
                        \ on)

 LDA #8                 \ Set themeStatus = 8 to enable the Theme
 STA themeStatus

 JSR IndicatorT         \ Update the Theme indicator

\ ******************************************************************************
\
\       Name: MainLoop (Part 9 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Fill up the tank if the engine is switched off, and process the
\             volume keys
\
\ ******************************************************************************

.main14

 LDA engineStatus       \ If the engine is on, jump to main15 to skip the
 BNE main15             \ following instruction

 JSR FillUpFuelTank     \ Fill up the fuel tank by one unit

.main15

 JSR ProcessVolumeKeys  \ Check the volume keys and adjust the sound volume
                        \ accordingly

\ ******************************************************************************
\
\       Name: MainLoop (Part 10 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Award points for a successful landing
\
\ ******************************************************************************

.main16

 LDA reached512ft       \ If we have not yet reached an altitude of 512 feet
 BEQ main17             \ since taking off, reached512ft will be zero, so jump
                        \ to main17 to skip the following, as we are not
                        \ eligible for the landing points

 LDX #0                 \ Set reached512ft = 0 to reset the 512 feet counter,
 STX reached512ft       \ ready for the next landing attempt

 LDA #&15               \ We have successfully landed the plane without
 JSR ScorePoints        \ crashing, so add 150 points to the score and make a
                        \ beep by calling ScorePoints with (X A) = &0015

\ ******************************************************************************
\
\       Name: MainLoop (Part 11 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Process engine start and stop
\
\ ******************************************************************************

.main17

 JSR UpdateFuelGauge    \ Update the fuel gauge

 LDX #&DC               \ Scan the keyboard to see if "T" is being pressed
 JSR ScanKeyboard

 BNE main18             \ If "T" is not being pressed, jump to main18

 LDA pressingT          \ If pressingT is non-zero, then we are still pressing
 BNE main19             \ "T" having already toggled the engine, so jump down
                        \ to main19 so we don't keep switching the engine on and
                        \ off by accident

 LDA propellorStatus    \ If propellorStatus is non-zero, then the propellor is
 BNE main20             \ broken and we can't turn on the engine, so jump to
                        \ main20 to skip the following

                        \ At this point, we know that "T" is being pressed,
                        \ pressingT is zero (so we haven't yet acted on the key
                        \ press), and propellorStatus is zero (so the propellor
                        \ is working), so now we toggle the engine status to
                        \ switch it on or off

 LDA engineStatus       \ Fetch the value of engineStatus and invert bit 0 so it
 EOR #1                 \ changes to the opposite state

 JSR SetEngine          \ Set the engine status to the value in A

 LDA #1                 \ Set A = 1 to use as the new value of pressingT below,
 BNE main19             \ so that holding down "T" won't keep toggling the
                        \ engine status

.main18

 LDA #0                 \ "T" is not being pressed, so set A = 0 to use as the
                        \ new value of pressingT

.main19

 STA pressingT          \ Set pressingT = A, so we don't try toggling the engine
                        \ again until we release the "T" key

\ ******************************************************************************
\
\       Name: MainLoop (Part 12 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Spend at least 9 centiseconds processing lines from the
\             linesToHide list
\
\ ******************************************************************************

.main20

 LDA relatedPoints      \ If the relatedPoints list contains 35 or more entries,
 CMP #35                \ jump to main21 to skip the following three
 BCS main21             \ instructions

 JSR ProcessLinesToHide \ Process three lines from the linesToHide list, if
 JSR ProcessLinesToHide \ there are any unprocessed lines there
 JSR ProcessLinesToHide

.main21

 LDX #&70               \ Call OSWORD with A = 1 and (Y X) = &0070, which reads
 LDY #&00               \ the system clock and writes the result into the five
 LDA #1                 \ bytes from &0070 to &0074 (P, Q, R, S and T). For the
 JSR OSWORD             \ purposes of the call to CheckTimePassed, P is set to
                        \ the least significant byte of the time, which
                        \ increments 100 times a second

 JSR CheckTimePassed    \ If fewer than 9 centiseconds have passed since the
 BCC main20             \ first time we were here on this iteration of the main
                        \ loop, then we haven't yet spent enough time processing
                        \ lines from the linesToHide list, so jump back to
                        \ main20 to do a few more

\ ******************************************************************************
\
\       Name: MainLoop (Part 13 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Process more lines and update the view out of the canopy
\
\ ******************************************************************************

 JSR ProcessLinesToShow \ Process a line from the linesToShow list

 JSR DrawCanopyView     \ Update the main view out of the canopy

 JSR SetRandomNumber    \ Add a new random number to the end of the
                        \ randomNumbers list

\ ******************************************************************************
\
\       Name: MainLoop (Part 14 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Handle the score display
\
\ ******************************************************************************

 LDA scoreDisplayTimer  \ If scoreDisplayTimer = 0, jump to main22 to skip the
 BEQ main22             \ following three instructions, as we are not currently
                        \ displaying the score

 CMP #220               \ If scoreDisplayTimer <> 220, jump down to main23 to
 BNE main23             \ decrement the timer and keep displaying the score

 BEQ main24             \ If scoreDisplayTimer = 220, it's time to remove the
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

 DEC scoreDisplayTimer  \ Decrement the score timer

 JSR DisplayScore       \ Display the score, so we show it for the first time if
                        \ we just pressed "P", or update it if it changes while
                        \ being displayed

 JMP main25             \ Jump down to main25 to continue with the main loop

.main24

 JSR RemoveScore        \ Remove the score from the screen

 LDA #0                 \ Set scoreDisplayTimer = 0 as we are no longer showing
 STA scoreDisplayTimer  \ the score on-screeen

\ ******************************************************************************
\
\       Name: MainLoop (Part 15 of 15)
\       Type: Subroutine
\   Category: Main loop
\    Summary: Update the status of any new line points
\
\ ------------------------------------------------------------------------------
\
\ If we have added any lines to the linesToHide list during the main loop (and
\ therefore incremented linesToHideEnd), we reset the point status bytes for the
\ line's start and end points, so they are no longer flagged as having had their
\ visibility checked already.
\
\ ******************************************************************************

.main25

 LDX previousListEnd    \ If the value of linesToHideEnd has changed since the
 CPX linesToHideEnd     \ start of the main loop - in other words, it is not the
 BNE main26             \ same as the value we stored in previousListEnd - then
                        \ this means the value of linesToHideEnd has changed
                        \ during this iteration of the main loop, so jump down
                        \ to main26 to process the new additions to the
                        \ linesToHide list

 JMP MainLoop           \ Otherwise we are done, so jump back up to the top of
                        \ the main loop for the next iteration

.main26

                        \ The first time we get here, X contains the size of the
                        \ linesToHide list as it was when we started this
                        \ iteration of the main loop, and we have added new
                        \ lines to the list, so now we need to process those
                        \ new lines

 INX                    \ Increment X to point to the next line, which will be
                        \ the first new one to process

 LDY linesToHide,X      \ Set Y to this line's ID from linesToHide

 STX previousListEnd    \ Update the value of previousListEnd, so if we revisit
                        \ the main26 loop, we will move on to the next line

                        \ Now to process the line

 LDX lineStartPointId,Y \ Set X to the ID of this line's start point

 LDA #0                 \ Zero the start point's status byte, so it is no longer
 STA pointStatus,X      \ marked as having had its coordinates and visibility
                        \ calculated

 LDX lineEndPointId,Y   \ Set X to the ID of this line's end point

 STA pointStatus,X      \ Zero the end point's status byte, so it is no longer
                        \ marked as having had its coordinates and visibility
                        \ calculated

 JMP main25             \ Jump back to main25 to repeat this process until we
                        \ have zeroed all the new additions to linesToHide

\ ******************************************************************************
\
\       Name: UpdateLinesToShow
\       Type: Subroutine
\   Category: Visibility
\    Summary: Update the linesToShow list, moving any lines that aren't visible
\             into the linesToHide list
\
\ ******************************************************************************

.UpdateLinesToShow

 LDX linesToShowEnd     \ If the linesToShow list is empty, jump to upll5 to
 BEQ upll5              \ return from the subroutine, as there is nothing to
                        \ process

 LDA #255               \ Set linesToShowPointer = 255, to use as a pointer
 STA linesToShowPointer \ to the end of the new linesToShow list as we build it
                        \ up in-situ

 LDA #0                 \ Set lineCounter = 0, to use as a line counter as we
 STA lineCounter        \ loop through the linesToShow list

.upll1

 LDX lineCounter        \ Set lineId to the ID of the next line in the
 LDA linesToShow,X      \ linesToShow list
 STA lineId

 LDA #1                 \ Set HH = 1, so in the following call to ProcessLine
 STA HH                 \ we do not check the line's distance against
                        \ maxLineDistance in the visibility checks

 JSR ProcessLine        \ Check whether this line is visible, returning the
                        \ result in showLine

 LDA lineId             \ If lineId = 0, then this is the runway, so skip the
 BEQ upll2              \ following instruction to keep the line in the list

 LDX showLine           \ If showLine is non-zero then this line is not visible,
 BNE upll3              \ so jump to upll3

.upll2

                        \ If we get here then we want to keep this line in the
                        \ linesToShow list

 INC linesToShowPointer \ Increment the linesToShowPointer pointer to point to
                        \ the next free slot in the new list we are creating

 LDX linesToShowPointer \ Store the line ID at the end of the new list we are
 STA linesToShow,X      \ creating

 JMP upll4              \ Jump down to upll4 to move on to the next line in the
                        \ list

.upll3

                        \ If we get here then we do not want to keep this line
                        \ in the linesToShow list, so we need to move it to the
                        \ linesToHide list

 INC linesToHideEnd     \ Increment linesToHideEnd to point to the next free
                        \ entry at the end of the linesToHide list

 LDX linesToHideEnd     \ Add the line ID to the end of the linesToHide list
 STA linesToHide,X

.upll4

 INC lineCounter        \ Increment the loop counter to point to the next line
                        \ in the linesToShow list

 LDA lineCounter        \ Loop back to process the next line from linesToShow
 CMP linesToShowEnd     \ until we have worked our way to the end
 BCC upll1

 LDA linesToShowPointer \ Set linesToShowEnd = linesToShowPointer + 1
 ADC #0                 \
 STA linesToShowEnd     \ so it points to the index of the first empty entry in
                        \ the newly processed linesToShow list

.upll5

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessLinesToShow
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process the linesToShow list, projecting all the lines onto the
\             screen and moving any that aren't visible to the linesToHide list
\
\ ******************************************************************************

.ProcessLinesToShow

 LDA linesToShowEnd     \ If the linesToShow list is empty, jump to plns5 to
 BEQ plns5              \ clear down the relatedPoints list, as there are no
                        \ visible lines at all

 LDA #255               \ Set linesToShowPointer = 255, to use as a pointer
 STA linesToShowPointer \ to the end of the new linesToShow list as we build it
                        \ up in-situ

 LDA #0                 \ Set lineCounter = 0, to use as a line counter as we
 STA lineCounter        \ loop through the linesToShow list

.plns1

 LDX lineCounter        \ Set lineId to the ID of the next line in the
 LDY linesToShow,X      \ linesToShow list
 STY lineId

 LDX lineStartPointId,Y \ Set GG to the point ID of the line's start point, to
 STX GG                 \ pass to the ProjectPoint routine

 STX L                  \ Set L to the point ID of the line's start point

 LDX lineEndPointId,Y   \ Set M to the point ID of the line's end point
 STX M

 JSR ProjectPoint       \ Project the line's end point onto the screen, putting
                        \ the screen coordinates into (xPoint, yPoint) and
                        \ setting the point's status byte accordingly

 LDA M                  \ Set GG to the point ID of the line's start point, to
 STA GG                 \ pass to the ProjectPoint routine

 JSR ProjectPoint       \ Project the line's start point onto the screen,
                        \ putting the screen coordinates into (xPoint, yPoint)
                        \ and setting the point's status byte accordingly

 LDX L                  \ Set startStatus to the status byte of the line's start
 LDA pointStatus,X      \ point
 STA startStatus

 LDX M                  \ Set N to the status byte of the line's end point
 LDA pointStatus,X
 STA N

 AND startStatus        \ Set A as follows:
 AND #%00110000         \
                        \   * Bit 4 is set in A if bit 4 is set in both points,
                        \     so both the start and end points (in 3D space)
                        \     have |yPoint| * 2 >= |zPoint|
                        \
                        \   * Bit 5 is set in A if bit 5 is set in both points,
                        \     so both the start and end points (in 3D space)
                        \     have |xPoint| >= |zPoint|
                        \
                        \ so A is in the form %00xx0000

 BEQ plns2              \ If both bits 4 and 5 are clear in the above, jump to
                        \ plns2 to keep the line in the linesToShow list

 LSR A                  \ Shift bits 4 and 5 down into bits 2 and 3 and store
 LSR A                  \ the result in T, so:
 STA T                  \
                        \   * Bit 2 is set in T if bit 4 is set in both points
                        \   * Bit 3 is set in T if bit 5 is set in both points
                        \
                        \ and the rest of the bits will be 0, so T is in the
                        \ form %0000xx00

 LDA N                  \ Set A =     end point status
 EOR startStatus        \         EOR start point status
 EOR #&FF               \         EOR %11111111
 AND T                  \         AND T
                        \
                        \ Because T is in the form %0000xx00, we are only
                        \ interested in the calculation for bits 2 and 3, as all
                        \ other bits will be zeroed by the AND T. Just taking
                        \ bit 2 we get the following (the numbers on the right
                        \ show the calculation in progress):
                        \
                        \   A =     bit 2 of end point     
                        \       EOR bit 2 of start point   <- 0 if bits are same
                        \       EOR 1                      <- 1 if bits are same
                        \       AND bit 2 of T             <- 1 if set
                        \
                        \ So bit 2 of A will be set only when both of the
                        \ following are true:
                        \
                        \   * Bit 2 is the same in both points
                        \   * Bit 2 of T is set
                        \
                        \ which expands to the following:
                        \
                        \   * Bit 2 is the same in both points
                        \   * Bit 4 is set in both points
                        \
                        \ and means:
                        \
                        \   * yPoint in both points has the same sign
                        \   * |yPoint| * 2 >= |zPoint| for both points
                        \
                        \ Similarly, bit 3 of A will be set only when both of
                        \ the following are true:
                        \
                        \   * Bit 3 is the same in both points
                        \   * Bit 5 is set in both points
                        \
                        \ which means:
                        \
                        \   * xPoint in both points has the same sign
                        \   * |xPoint| >= |zPoint| for both points

 BNE plns3              \ If A is non-zero, then this means that at least one of
                        \ the above is true for this line. Let's see what that
                        \ means. If both of the following are true:
                        \
                        \   * yPoint in both points has the same sign
                        \   * |yPoint| * 2 >= |zPoint| for both points
                        \
                        \ then:
                        \
                        \   * The first one means that either both ends of the
                        \     line are above us, or both are below us, so the
                        \     line isn't crossing our field of view from top to
                        \     bottom
                        \
                        \   * The second one means that both points are above or
                        \     both points are below the 2y = z line (or, more
                        \     accurately, the 2y = z plane). In terms of 3D
                        \     space, this means that for us to look at these
                        \     points from our plane seat, we would need to raise
                        \     or lower our gaze by more than 22.5 degrees
                        \
                        \ If both of these are true, then the line isn't
                        \ crossing our field of view, and it's too far above or
                        \ below us to be seen... or in other words, it isn't
                        \ visible
                        \
                        \ The xPoint rules are similar. If both of these are
                        \ true:
                        \
                        \   * xPoint in both points has the same sign
                        \   * |xPoint| >= |zPoint| for both points
                        \
                        \ then:
                        \
                        \   * The first one means that either both ends of the
                        \     line are to the left of us, or both are to the
                        \     right of us, so the line isn't crossing our field
                        \     of view from left to right
                        \
                        \   * The second one means that both points are to the
                        \     left of or both points are to the right of the
                        \     x = z line (or, more accurately, the x = z plane).
                        \     In terms of 3D space, this means that for us to
                        \     look at these points from our plane seat, we would
                        \     need to look left or right by more than 45 degrees
                        \
                        \ If both of these are true, then the line isn't
                        \ crossing our field of view, and it's too far to the
                        \ left or right of us to be seen... or in other words,
                        \ it isn't visible
                        \
                        \ So if A is non-zero, this means that the line is not
                        \ visible so we jump to plns3 to add this line to the
                        \ linesToHide list

.plns2

                        \ If we get here then we want to keep this line in the
                        \ linesToShow list

 INC linesToShowPointer \ Increment the linesToShowPointer pointer to point to
                        \ the next free slot in the new list we are creating

 LDX linesToShowPointer \ Store the line ID at the end of the new list we are
 LDA lineId             \ creating
 STA linesToShow,X

 JMP plns4              \ Jump to plns4 to move onto the next line

.plns3

 LDA lineId             \ If the line Id is 0 then it's the horizon, so jump up
 BEQ plns2              \ to plns2 add it to the linesToShow list, as we don't
                        \ want to hide the horizon

 INC linesToHideEnd     \ Increment linesToHideEnd to point to the next free
                        \ entry at the end of the linesToHide list

 LDX linesToHideEnd     \ Add the line ID in A to the end of the linesToHide
 STA linesToHide,X      \ list

.plns4

 INC lineCounter        \ Increment the loop counter to point to the next line
                        \ in the linesToShow list

 LDA lineCounter        \ Loop back to process the next line from linesToShow
 CMP linesToShowEnd     \ until we have worked our way to the end
 BCC plns1

 LDA linesToShowPointer \ Set linesToShowEnd = linesToShowPointer + 1
 ADC #0                 \
 STA linesToShowEnd     \ so it points to the index of the first empty entry in
                        \ the newly processed linesToShow list

.plns5

 LDX relatedPoints      \ If the relatedPoints list is empty, jump to plns7 to
 BEQ plns7              \ return from the subroutine

                        \ Otherwise we now reset the point status bytes for all
                        \ the points mentioned in the relatedPoints list, so
                        \ they are no longer marked as having their coordinates
                        \ and visibility calculated

 LDA #0                 \ Set A = 0 to use for resetting the status bytes

.plns6

 LDY relatedPoints,X    \ Zero the status byte for the X-th entry in the list
 STA pointStatus,Y

 DEX                    \ Decrement the loop counter

 BNE plns6              \ Loop back until we have reset all the 

.plns7

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessLinesToHide
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process an unprocessed line from the linesToHide list
\
\ ******************************************************************************

.ProcessLinesToHide

 LDA linesToHidePointer \ Set A to the position within the linesToHide list up
                        \ to which we have processed lines

 CMP linesToHideEnd     \ If we have processed all the way to the end of the
 BEQ ProcessLine-1      \ list, then linesToHidePointer = linesToHideEnd, so
                        \ return from the subroutine (as ProcessLine-1
                        \ contains an RTS)

 CLC                    \ Otherwise we have lines on the end of the linesToHide
 ADC #1                 \ list that we have not yet processed, so increment
 STA linesToHidePointer \ the linesToHidePointer, as we are about to process a
                        \ line

 TAX                    \ Set lineId to the line's ID from the linesToHide list
 LDA linesToHide,X
 STA lineId

 CMP #60                \ If lineId = 60, jump back to ProcessLinesToHide to
 BEQ ProcessLinesToHide \ pick another line

 CMP #61                \ If lineId = 61, jump back to ProcessLinesToHide to
 BEQ ProcessLinesToHide \ pick another line

                        \ Fall through into ShowOrHideLine to process the line
                        \ and add it to the linesToShow or linesToHide list

\ ******************************************************************************
\
\       Name: ShowOrHideLine
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process a line, working out its visibility and adding it to the
\             linesToShow or linesToHide list
\
\ ------------------------------------------------------------------------------
\
\ Check the visibility of a line and either add it to the linesToShow list
\ or the linesToHide list, depending on whether it is visible.
\
\ Arguments:
\
\   lineId              The line ID to process
\
\ ******************************************************************************

.ShowOrHideLine

 LDA #0                 \ Set HH = 0, so in the following call to ProcessLine
 STA HH                 \ we check the line's distance against maxLineDistance
                        \ in the visibility checks

 JSR ProcessLine        \ Check whether this line is visible, returning the
                        \ result in showLine

 LDA lineId             \ Fetch the line ID into A

 LDX showLine           \ If showLine = 0 then the line is visible, so jump down
 BEQ shli1              \ to shli1 to add the line to the linesToShow list

                        \ The value of showLine is non-zero, so the line is not
                        \ visible and we now add it to the linesToHide list

 INC linesToHideEnd     \ Increment linesToHideEnd to point to the next free
                        \ entry at the end of the linesToHide list

 LDX linesToHideEnd     \ Add the line's ID to the end of the linesToHide list
 STA linesToHide,X

 RTS                    \ Return from the subroutine

.shli1

                        \ The value of showLine is zero, so the line is visible
                        \ and we now add it to the linesToShow list

 INC linesToShowEnd     \ Increment linesToShowEnd so it still points to the
                        \ first empty entry in the linesToShow list after we
                        \ add this line

 INC linesToShowPointer \ Increment linesToShowPointer as we have already
                        \ processed the line, so we set the progress pointer to
                        \ be after this line

 LDX linesToShowPointer \ Add the line's ID to the end of the linesToShow list
 STA linesToShow,X

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessLine (Part 1 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process a line, rotating and transforming it to the correct
\             coordinates and calculating its visibility
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   lineId              The line ID of the line to process
\
\   HH                  Determines whether we check against the line's maximum
\                       visible distance during the visibility checks:
\
\                         * 0 = check the line's distance against the maximum
\                               visible distance in maxLineDistance
\
\                         * Non-zero = skip the distance check
\
\ Returns:
\
\   showLine            Whether this line is visible:
\
\                         * 0 = line is visible
\
\                         * Non-zero = line is not visible
\
\ Other entry points:
\
\   ProcessLine-1       Contains an RTS
\
\ ******************************************************************************

.ProcessLine

 LDA #0                 \ Set showLine = 0 as a starting point for the return
 STA showLine           \ value (so we start out by assuming the line is
                        \ visible, and change this if we find that it isn't)

 STA isObject           \ Set isObject = 0, which we will set to a non-zero
                        \ object ID below if we end up processing an object

 LDX lineId             \ Set X = lineId, so X contains the ID of the line we
                        \ want to check for visibility

 LDY lineEndPointId,X   \ Set M to the point ID of the line's end point
 STY M

 LDY lineStartPointId,X \ Set L to the point ID for the line's start point
 STY L

 CPX #12                \ If lineId >= 12, then this is not the horizon or a
 BCS plin2              \ runway line, so jump to plin2 to process the line

 CPX #0                 \ If lineId is not zero, then this is not the horizon,
 BNE plin1              \ so it must be a runway line, so jump to plin1 to
                        \ process it

                        \ If we get here then lineId is 0, so this is the
                        \ horizon

 JSR ProcessHorizonLine \ Process the horizon and set showLine accordingly

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessLine (Part 2 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process runway lines
\
\ ******************************************************************************

.plin1

                        \ If we get here then lineId is in the range 1 to 11,
                        \ so this is a runway line

 JSR ProcessRunwayLine  \ Process the runway line and set showLine accordingly

 JMP plin19             \ Jump down to plin19 to check the line's z-coordinates
                        \ and return the final visibility result

\ ******************************************************************************
\
\       Name: ProcessLine (Part 3 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: If a line is part of a multi-point object, extract the other
\             points in the line so we can check them all
\
\ ******************************************************************************

.plin2

                        \ If we get here, lineId >= 12 and Y contains the point
                        \ ID for the line's start point
                        \
                        \ We now run through the following process twice, first
                        \ for the line's start point, and then for the line's
                        \ end point

 LDA #2                 \ Set pointCount = 2 to act as a counter so we can check
 STA pointCount         \ the start point first, and then the end point

.plin3

 LDA pointStatus,Y      \ If bit 7 of the point's status byte is clear, then the
 BPL plin4              \ point has not yet had its coordinates and visibility
                        \ calculated, so skip the following instruction to move
                        \ on to those calculations

 JMP plin17             \ Bit 7 of the point's status byte is set, which means
                        \ we have already calculated this point's coordinates
                        \ and visibility, so jump to plin17 to do the final
                        \ distance and z-coordinate tests

.plin4

                        \ We get here if we haven't already calculated the
                        \ coordinates and visibility for the point whose ID is
                        \ in Y, so that's what we do now

 TYA                    \ Store the point ID of this point on the stack and in
 PHA                    \ pointId. We are about to check whether this point is
 STA pointId            \ part of a multi-point object, and if so we're going to
                        \ add the IDs of all the other points in the object to
                        \ the stack and then work our way through the stacked
                        \ values, processing each of them in turn
                        \
                        \ Adding the starting point ID to the stack and to
                        \ pointId at the same time lets us use this ID as a
                        \ backstop - in other words, we'll know we have
                        \ processed all the other point that we added to the
                        \ stack when we pull a value off the stack that matches
                        \ the value of pointId (see parts 5 and 6 to see this in
                        \ action)

.plin5

 LDA objectPoints,Y     \ Fetch this point's entry from objectPoints, which
                        \ will tell us if this point is related to any other
                        \ points as part of a multi-point object

 CMP #40                \ If object ID < 40 then this point does not link to
 BCC plin8              \ another point, so it's the last point in a linked
                        \ object - i.e. the ID of the object itself - so jump to
                        \ plin8 to process the point and any others we already
                        \ put on the stack

                        \ If we get here then this point links to another point
                        \ in objectPoints, so we now follow the links and add
                        \ all of the point IDs to the stack and to the
                        \ relatedPoints list, looping back until we reach the
                        \ last point, at which point we jump to plin8 with a
                        \ stack full of points

 SEC                    \ Subtract 40 from A to get the point ID of the new
 SBC #40                \ point to check

 STA objectAnchorPoint  \ Store the new point's ID as the object's anchor point,
                        \ so it contains the ID of the last point before the
                        \ object ID at the end of the linked list of points
 
 TAY                    \ Copy the new point's ID into Y so we can use it as an
                        \ an index into pointStatus

 LDA pointStatus,Y      \ If bit 7 of the new point's status byte is set, then
 BMI plin14             \ we have already calculated the coordinates and
                        \ visibility for this new point, which means we have
                        \ also done the rest of the points in the linked object,
                        \ so jump down to plin14 to check the new points we
                        \ added to the stack

 TYA                    \ Set A = the new point's ID

 PHA                    \ Store the new point's ID on the stack

 LDX relatedPoints      \ If relatedPoints >= 49, then the relatedPoints list is
 CPX #49                \ full, so jump to plin11 to set this line as not being
 BCS plin11             \ visible

 INC relatedPoints      \ Increment the value in relatedPoints, which contains
                        \ the size of the list, as we are about to add a new
                        \ entry to the end of the list

 LDX relatedPoints      \ Add A, the new point's ID, to the end of the
 STA relatedPoints,X    \ relatedPoints list

 BNE plin5              \ Jump back to plin5 to recurse through the new point
                        \ (this BNE is effectively a JMP as A is is never zero,
                        \ because objectPoints does not contain a value of 40)

\ ******************************************************************************
\
\       Name: ProcessLine (Part 4 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Process bullet lines
\
\ ******************************************************************************

.plin6

                        \ If we get here then the point is not part of a linked
                        \ object, and object ID is in the range 12 to 15, so
                        \ this is a bullet line

 PLA                    \ Pull the point ID from the stack and store it in GG
 STA GG

 LDA objectStatus,Y     \ If bit 7 of the object's status byte is set, jump to
 BMI plin7              \ plin16 via plin7

                        \ If we get here then bit 7 of the object's status byte
                        \ is clear

 LDA #%10000000         \ Set showLine to say that the line is not in view
 STA showLine

 RTS                    \ Return from the subroutine

.plin7

 JMP plin16             \ Jump down to plin16 with the bullet point ID in GG, to
                        \ check distance and z-coordinates and return the final
                        \ result

\ ******************************************************************************
\
\       Name: ProcessLine (Part 5 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Calculate the object's coordinates and visibility
\
\ ******************************************************************************

.plin8

                        \ By the time we get here, Y contains the last entry
                        \ from objectPoints for this multi-point object (so it
                        \ contains the object ID), and any previous points from
                        \ the objectPoints entry are on the stack

 TAY                    \ Store the object ID in objectId
 STY objectId

 CMP #16                \ If the object ID >= 16, jump to plin9 to skip the
 BCS plin9              \ following

 CMP #12                \ If the object ID >= 12, then the object ID is in the
 BCS plin6              \ range 12 to 15, which means it's a bullet line, so
                        \ jump up to plin6 to work out its visibility

.plin9

 LDA objectStatus,Y     \ Fetch the object's status byte

 AND #%01000000         \ If bit 6 of the object's status byte is set then we
 BNE plin10             \ have already set this object's coordinates in this
                        \ iteration of the main loop, so skip the following

 JSR SetObjectCoords    \ Calculate the object's coordinates and visibilty,
                        \ updating the object's status byte with the results
                        \ and setting isObject to the object ID

.plin10

 LDY objectId           \ Fetch the object ID from objectId

 LDA objectStatus,Y     \ If bit 7 of the object's status byte is set, then the
 BMI plin13             \ object is visible, so jump to plin13 to set the anchor
                        \ point and work our way through the points on the stack

.plin11

 LDA #%10000000         \ Set showLine to say that the line is not in view
 STA showLine

.plin12

 PLA                    \ Pull numbers off the stack until we reach the first
 CMP pointId            \ number that we put on, which will match pointId, so
 BNE plin12             \ by the time we are done we have removed all the IDs
                        \ we added to the stack during the routine

 RTS                    \ Return from the subroutine

.plin13

 TYA                    \ Set objectAnchorPoint = object ID + 216
 CLC                    \
 ADC #216               \ so it contains the point ID associated with the anchor
 STA objectAnchorPoint  \ point of this object

\ ******************************************************************************
\
\       Name: ProcessLine (Part 6 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Check the visibility of all the object's points on the stack
\
\ ******************************************************************************

.plin14

                        \ We jump straight here if we are working through a
                        \ linked object and come across a point with bit 7 set
                        \ in the point's status byte (which means we have
                        \ already processed the rest of the points in the
                        \ linked object), otherwise we got here after processing
                        \ the object in the previous part

                        \ We now loop through any points we have added to the
                        \ stack and process them all. If we find any that are
                        \ not visible, then we return the result that the whole
                        \ line is not visible

 PLA                    \ Pull the next point ID from the stack

 CMP pointId            \ If the point ID matches pointId, then we have no other
 BEQ plin15             \ points on the stack to process, so jump down to plin15
                        \ to calculate its visibility

 STA GG                 \ Store the point ID in GG so its coordinates get
                        \ calculated in the call to SetObjPointCoords

 LDA #0                 \ Set matrixAxis = 0
 STA matrixAxis

 STA matrixNumber       \ Set matrixNumber = 0 so matrix 1 is applied to the
                        \ object points in the call toSetObjPointCoords

 JSR SetObjPointCoords  \ Calculate the coordinates for this object point

 LDA showLine           \ If showLine is non-zero, then the point is not
 BNE plin12             \ visible, so jump to plin12 to clear down the stack and
                        \ return from the subroutine

 LDY GG                 \ Set objectAnchorPoint = the point ID in GG, so it
 STY objectAnchorPoint  \ contains the ID of the last point before the object ID
                        \ at the end of the linked list of points (as the last
                        \ ID, the object ID, is processed by plin15 below)

 LDA #%10000000         \ Set bit 7 of the point's status byte, to indicate that
 ORA pointStatus,Y      \ the point has now had its coordinates and visibility
 STA pointStatus,Y      \ calculated

 BNE plin14             \ Jump to plin14 (this BNE is effectively a JMP as A is
                        \ never zero)

.plin15

 STA GG                 \ Store the point ID in GG

 LDA #0                 \ Set matrixAxis = 0
 STA matrixAxis

 STA matrixNumber       \ Set matrixNumber = 0 so matrix 1 is applied to the
                        \ object points in the call toSetObjPointCoords

 JSR SetObjPointCoords  \ Calculate the coordinates for this object point

 LDA showLine           \ If showLine is non-zero, then the line is not visible,
 BNE plin20             \ so jump to plin20 to return from the subroutine (as
                        \ plin20 contains an RTS)

\ ******************************************************************************
\
\       Name: ProcessLine (Part 7 of 7)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Check distance and z-coordinates and return the final result
\
\ ******************************************************************************

.plin16

 LDY GG                 \ Set Y to the point ID, which we stored in GG before
                        \ jumping here or falling through from above

.plin17

                        \ We jump straight here if line ID >= 12 and bit 7 of
                        \ the point's status byte is set (which means we have
                        \ already processed this point)

 LDA HH                 \ If HH is non-zero, jump to plin18 to move on to the
 BNE plin18             \ end point and then check the z-coordinates

 LDX lineId             \ Check whether this line ID is close enough to be
 JSR CheckLineDistance  \ visible (so it gets hidden if it is further away than
                        \ the visibility distance for this line)

 STA showLine           \ The above call returns 1 if the line is too far away,
                        \ or the previous value of showLine if it is close
                        \ enough to be shown, so store the updated response in
                        \ showLine

 BNE plin20             \ If the response is non-zero then the line is not
                        \ visible and showLine contains a non-zero response, so
                        \ jump to plin20 to return from the subroutine

                        \ Otherwise the line is close enough to be visible and
                        \ has passed all the other visibility checks so far, so
                        \ now we check the z-coordinates

.plin18

 LDA #%10000000         \ Set bit 7 of the point's status byte, to indicate that
 ORA pointStatus,Y      \ the point has now had its coordinates and visibility
 STA pointStatus,Y      \ calculated

 DEC pointCount         \ Decrement pointCount so we check the end point next

 BEQ plin19             \ If pointCount = 0 then we have checked both the start
                        \ and end point, so jump to plin19 to check the line's
                        \ z-coordinates

                        \ If we get here then we have checked the start point,
                        \ so we now loop back to check the end point

 LDY M                  \ Set M to the point ID for the line's end point, so
                        \ when we run through the process above, we do it for
                        \ the end point instead of the start point

 JMP plin3              \ Jump back to plin3 to check the visibility of the end
                        \ point

.plin19

 LDY M                  \ If the end point's z-coordinate is positive, jump to
 LDA zPointHi,Y         \ plin20 to return from the subroutine
 BPL plin20

 LDY L                  \ If the start point's z-coordinate is positive, jump to
 LDA zPointHi,Y         \ plin20 to return from the subroutine
 BPL plin20

                        \ If we get here then both the start and end point have
                        \ negative z-coordinates, so they are both behind us and
                        \ the line is therefore not visible

 LDA showLine           \ Set bit 7 of showLine to indicate that the line is not
 ORA #%10000000         \ visible
 STA showLine

 LDY isObject           \ If we processed an object above, then its ID will be
                        \ in isObject, so fetch this into Y for the following
                        \ call

 JSR NextObjectGroup    \ If we just processed an object in an object group,
                        \ i.e. isObject is 6, 7, 8 or 9, then increment the
                        \ object's group number

.plin20

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 1 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Calculate the coordinates for an object's points
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   objectId            The ID of the object to process (1 to 39)
\
\   GG                  For bullets only (12, 13, 14 or 15), the point ID for
\                       the bullet anchor point
\                       
\ Returns:
\
\   objectStatus        The object's status byte: bits 6 and 7 affected
\
\   Flags               Set according to the object's updated status byte
\
\   isObject            The object ID, i.e. a non-zero value so callers of this
\                       routine will know we just processed an object
\
\   xObjectHi etc.      Set to the object's coordinates, relative to the plane
\
\   xPointHi etc.       The object's anchor point:
\
\                         * For bullets, point GG is updated with the bullet's
\                           anchor point
\
\                         * For other objects, point objectId+216 is updated
\                           with the object's anchor point
\
\ ******************************************************************************

.SetObjectCoords

 LDY objectId           \ Set Y to the object ID

 STY isObject           \ Store the object ID in isObject, so callers of this
                        \ routine will know we just processed an object

 TYA                    \ Set N = 216 + object ID
 CLC                    \
 ADC #216               \ so N is in the range 217 to 255 and is the point ID
 STA N                  \ that we use for storing the object's anchor point

 LDA #1                 \ Set K = 1, so the CheckObjDistance routine returns
 STA K                  \ the correct 0 or 1 value when checking an object's
                        \ distance, which is the default behaviour (we set K to
                        \ 0 below for bullets only, as we always want them to
                        \ remain visible at distance)

                        \ We now check for some specific objects:
                        \
                        \   * Object groups, e.g. trees (6, 7, 8 or 9)
                        \   * Bullets (12, 13, 14 or 15)
                        \   * Feeding aliens (object group 30)
                        \   * Flying aliens (31, 32 or 33)
                        \
                        \ so we can pre-process them before moving on to the
                        \ main processing routine in part 8

 CPY #12                \ If the object ID < 12, jump to objc1 to check the next
 BCC objc1              \ range

 CPY #16                \ If the object ID >= 16, jump to objc1 to check the
 BCS objc1              \ next range

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 2 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Pre-process the bullets (objects 12, 13, 14 or 15)
\
\ ******************************************************************************

                        \ If we get here then the object ID is 12, 13, 14 or 15,
                        \ so this is a bullet

 LDA #0                 \ Set K = 0, so the CheckObjDistance routine always
 STA K                  \ returns 0, which means the bullet trails never get
                        \ too far away to be hidden

 LDA yObjectHi,Y        \ If the object's y-coordinate is positive, then the
 BPL objc3              \ bullet is above ground, so jump to objc3 to check the
                        \ next range and then process the bullet

 TYA                    \ If bit 0 of the object ID is set, i.e. the object ID
 AND #1                 \ is 13 or 15, jump to objc3 to check the next range
 BNE objc3              \ and then process the bullet

 JMP objc10             \ The object ID is 12 or 14 and the bullet is below
                        \ ground level, so jump to objc10 to tidy up and return
                        \ from the subroutine

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 3 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Logic for checking which objects to pre-process
\
\ ******************************************************************************

.objc1

                        \ If we get here then this is not a bullet

 LDA N                  \ Set GG = N
 STA GG                 \        = 216 + object ID
                        \
                        \ so GG contains the point ID that we use for storing
                        \ the object's anchor point

 CPY #6                 \ If the object ID < 6, jump to objc3 to check the next
 BCC objc3              \ range

 CPY #10                \ If the object ID >= 10, jump to objc3 to check the
 BCS objc3              \ next range

                        \ Otherwise the object ID is 6, 7, 8 or 9, so fall
                        \ through into part 4 to pre-process the object

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 4 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Pre-process the object groups (objects 6, 7, 8 or 9)
\
\ ******************************************************************************

                        \ If we get here then the object ID is 6, 7, 8 or 9, so
                        \ this is an object group (e.g. a tree)

 LDA #8                 \ Set TC = 8 to act as a counter in the loop below, so
 STA TC                 \ we work through all 8 objects in this object group

.objc2

 LDX objectGroup-6,Y    \ Set X = 0, 8, 16 or 24, for Y = 6, 7, 8 or 9
                        \
                        \ (or 1, 9, 17, 25 etc., depending on the current group)

 LDA xGroupHi,X         \ Set the object's x-coordinate to the X-th entry in
 STA xObjectHi,Y        \ xGroupHi

 LDA zGroupHi,X         \ Set the object's z-coordinate to the X-th entry in
 STA zObjectHi,Y        \ zGroupHi

 JMP objc9              \ Jump to objc9 to process this object

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 5 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Logic for checking which objects to pre-process
\
\ ******************************************************************************

.objc3

 CPY #34                \ If the object ID >= 34, jump to objc9 to process the
 BCS objc9              \ object

 CPY #30                \ If the object ID < 30, jump to objc9 to process the
 BCC objc9              \ object

 BNE objc6              \ If the object ID <> 30, i.e. 31, 32 or 33, jump to
                        \ objc6 to pre-process the object

                        \ Otherwise the object ID is 30, so fall through into
                        \ part 6 to pre-process object 30

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 6 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Pre-process feeding aliens (object group 30)
\
\ ******************************************************************************

                        \ If we get here then the object ID is 30

 LDA themeStatus        \ If themeStatus is non-zero then either the Theme is
 BNE objc8              \ not enabled, or ??? so jump to objc8 to return from
                        \ the subroutine

 LDA #8                 \ Set TC = 8 to act as a counter in the loop below, so
 STA TC                 \ we work through all 8 items in this group

.objc4

 LDX alienCounter       \ Fetch the current value of alienCounter, which
                        \ contains the number of the alien to process, 0 to 7

 LDA alienState,X       \ If the alien's state is non-zero, jump to objc11 via
 BNE objc7              \ objc7 to move onto the next alien in the group

 LDA L4208,X            \ Set A = the alien's L4208 entry, which gives the
                        \ object ID for alien number alienCounter

 BPL objc5              \ If A is positive, jump to objc5... which has no
                        \ effect, as that's the next instruction anyway

.objc5

 TAX                    \ Copy the alien's x-coordinate to the current object's
 LDA xObjectHi,X        \ x-coordinate
 STA xObjectHi,Y

 LDA zObjectHi,X        \ Copy the alien's z-coordinate to the current object's
 STA zObjectHi,Y        \ x-coordinate

 JMP objc9              \ Jump to objc9 to process this object

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 7 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Pre-process flying aliens (objects 31, 32 and 33)
\
\ ******************************************************************************

.objc6

                        \ If we get here then the object ID is 31, 32 or 33

 LDX alienCounter-30,Y  \ If the alien's alienCounter is negative, jump to
 BMI objc7              \ objc11 via objc7 to move onto the next alien in the
                        \ group

 LDA alienState,X       \ If the alien's state is >= 27, then it is heading for
 CMP #27                \ Acornsville, so jump to objc9 to process this object
 BCS objc9

 LDA L4208,X            \ Set A = the alien's L4208 entry, which gives the
                        \ object ID for alien number alienCounter

 BPL objc5              \ If A is positive, jump to objc5 to set the object
                        \ coordinates and process this object

.objc7

 JMP objc11             \ Jump to objc11 to move onto the next alien in the
                        \ group

.objc8

 JMP objc12             \ Jump to objc12 to return from the subroutine

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 8 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Process the object
\
\ ******************************************************************************

.objc9

                        \ By this point we have pre-processed any special
                        \ objects, so now to process it

                        \ We now translate the base location of the object,
                        \ in (xObject, yObject, zObject), by subtracting the
                        \ current plane coordinates (xPlane, altitude, zPlane)
                        \ to give the vector from the plane's location to the
                        \ object's location

 LDX GG                 \ Set X to the value of GG:
                        \
                        \   * For bullets, this is the value of GG that is
                        \     passed to the routine, i.e. 98
                        \
                        \   * For other objects, this is 216 + object ID, so
                        \     points 216 to 255 contain the calculated
                        \     coordinates for objects 0 to 39
                        \
                        \ So in the the following, we set the coordinates of
                        \ the point whose ID is in GG, i.e. point GG

                        \ We do the following calculation with 24-bit values,
                        \ so we can do the visibility checks. This means we
                        \ calculate:
                        \
                        \   xPoint = xObject - xPlane
                        \   yPoint = yObject - yPlane
                        \   zPoint = zObject - zPlane
                        \
                        \ but in each case, the values have three bytes. To take
                        \ the x-axis calculation:
                        \
                        \   xPoint  is (A xPointHi xPointLo)
                        \   xObject is (0 xObjectHi xObjectLo)
                        \   xPlane  is (xPlaneTop xPlaneHi xPlaneLo)
                        \
                        \ and we pass the top byte of the result, in A, to the
                        \ CheckObjDistance routine, so it can be used in the
                        \ visibility check (a high value in A means the object
                        \ is a very long way away)

 SEC                    \ Set the x-coordinate of point GG:
 LDA xObjectLo,Y        \
 SBC xPlaneLo           \   xPoint = xObject - xPlane
 STA xPointLo,X         \
                        \ starting with the low bytes

 LDA xObjectHi,Y        \ And then the high bytes
 SBC xPlaneHi
 STA xPointHi,X

 STA T                  \ Set T = xPointHi to pass to CheckObjDistance

 LDA #0                 \ And then the top bytes
 SBC xPlaneTop

 JSR CheckObjDistance   \ Check whether the object is close enough to be visible
                        \ in the direction of the x-axis

 BNE objc10             \ If it is too far away to be visible, jump to objc10 to
                        \ either move on to the next object in the group, or
                        \ tidy up and return from the subroutine

 SEC                    \ Set the y-coordinate of point GG:
 LDA yObjectLo,Y        \
 SBC yPlaneLo           \   yPoint = yObject - yPlane
 STA yPointLo,X         \
                        \ starting with the low bytes

 LDA yObjectHi,Y        \ And then the high bytes
 SBC yPlaneHi
 STA yPointHi,X

 STA T                  \ Set T = yPointHi to pass to CheckObjDistance

 LDA #0                 \ And then the top bytes
 SBC yPlaneTop

 JSR CheckObjDistance   \ Check whether the object is close enough to be visible
                        \ in the direction of the y-axis

 BNE objc10             \ If it is too far away to be visible, jump to objc10 to
                        \ either move on to the next object in the group, or
                        \ tidy up and return from the subroutine

 SEC                    \ Set the z-coordinate of point GG:
 LDA zObjectLo,Y        \
 SBC zPlaneLo           \   zPoint = zObject - zPlane
 STA zPointLo,X         \
                        \ starting with the low bytes

 LDA zObjectHi,Y        \ And then the high bytes
 SBC zPlaneHi
 STA zPointHi,X

 STA T                  \ Set T = zPointHi to pass to CheckObjDistance

 LDA #0                 \ And then the top bytes
 SBC zPlaneTop

 JSR CheckObjDistance   \ Check whether the object is close enough to be visible
                        \ in the direction of the z-axis

 BNE objc10             \ If it is too far away to be visible, jump to objc10 to
                        \ either move on to the next object in the group, or
                        \ tidy up and return from the subroutine

 LDA #0                 \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 1 in the calculation

 JSR SetPointCoords     \ Rotate the coordinates for point GG:
                        \
                        \   * For bullets, this is point 98
                        \
                        \   * For other objects, this is 216 + object ID, so
                        \     points 216 to 255 will contain the calculated
                        \     coordinates for objects 0 to 39
                        \
                        \ and update the coordinates in (xPoint, yPoint, zPoint)

 LDY objectId           \ Fetch the object ID into Y

 LDA showLine           \ If showLine is non-zero, which means the line is not
 BNE objc12             \ visible, jump to objc12 to return from the subroutine
                        \ without setting bit 7 of the object's status byte

 LDA #%11000000         \ Set A = %11000000 to set bits 6 and 7 of the object's
                        \ status byte, to denote that the object has had its
                        \ coordinates calculated, and that it is visible

 BNE objc13             \ Jump to objc13 to set the object's status byte and
                        \ return from the subroutine (this BNE is effectively a
                        \ JMP as A is never zero)

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 9 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Process the next object in the group, if applicable, or return
\             from the subroutine if not
\
\ ******************************************************************************

.objc10

                        \ If we get here then we are done processing this
                        \ object, so now we check whether there are other
                        \ objects to process:
                        \
                        \   * If the object is in a group (i.e. the object ID
                        \     is 6, 7, 8 or 9) and there are other objects to
                        \     process in the group, we loop back to process them
                        \
                        \   * If this is object 30, then we check whether we
                        \     have processed all 8 items in its group, and if
                        \     not, we loop back to process the next one (see
                        \     part 10)
                        \
                        \   * If this object is not caught by the above, then
                        \     we finally return from the subroutine (see part
                        \     11)

 JSR NextObjectGroup    \ If this object is in an object group, i.e. Y is 6, 7,
                        \ 8 or 9, then increment the object's group number

 BCC objc11             \ If the C flag is clear then this object is not part of
                        \ an object group, so jump to objc11 to skip the
                        \ following

                        \ This object is part of an object group, so now we move
                        \ onto the next object in the group

 DEC TC                 \ Decrement the loop counter

 BEQ objc12             \ If we have processed all 8 items in the group, jump
                        \ to objc12 to return from the subroutine

 JMP objc2              \ Otherwise loop back to objc2 to process the next item
                        \ in the group

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 10 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Process the next item for object ID 30, which is a group of 8
\             items
\
\ ******************************************************************************

.objc11

 CPY #30                \ If the object ID <> 30, jump to objc12 to return from
 BNE objc12             \ the subroutine

 LDA alienCounter       \ Increment alienCounter to iterate through values
 CLC                    \ 0 to 7 and round again
 ADC #1
 AND #7
 STA alienCounter

 DEC TC                 \ Decrement the loop counter

 BEQ objc12             \ If we have processed all 8 items in the group, jump
                        \ to objc12 to return from the subroutine

 JMP objc4              \ Otherwise loop back to objc4 to process the next item
                        \ in the group

\ ******************************************************************************
\
\       Name: SetObjectCoords (Part 11 of 11)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Update the object status and return from the subroutine
\
\ ******************************************************************************

.objc12

 LDA #%01000000         \ Set A = %01000000 to set bit 6 of the object's status
                        \ byte, to denote that the object has had its
                        \ coordinates calculated

.objc13

 ORA objectStatus,Y     \ Set the bits of the object's status byte as per the
 STA objectStatus,Y     \ value in A

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: CheckObjDistance
\       Type: Subroutine
\   Category: Visibility
\    Summary: Check whether an object is within the visible distance for that
\             object, along just one axis
\
\ ------------------------------------------------------------------------------
\
\ We call this routine by passing in the distance from the plane to the object,
\ along the axis we are checking. We pass it as the top two bytes of a 24-bit
\ number, (A T x), containing the object's coordinate in the relevant axis. We
\ can ignore the low byte as it doesn't affect object visibility.
\
\ First we check the top byte in A to make sure it is either 0 or -1, as
\ otherwise the distance is definitely too far for the object to be visible.
\
\ Assuming the top byte is within range, we then check the high byte in T
\ against the maximum visible distance for the object in question. The object
\ is visible only if |T| < the object's maxObjDistance value, otherwise it is
\ too far away to be seen.
\
\ When called with K = 0, this routine will always return 0 to indicate that the
\ object is visible. This is used by the bullets, to ensure that they remain
\ visible, whatever their distance from the plane.
\
\ Arguments:
\
\   Y                   The object ID of the object to check
\
\   A                   The top byte of the object's coordinates in the axis we
\                       want to check (i.e. the byte above xPointHi, yPointHi or
\                       zPointHi)
\
\   T                   The high byte the object's coordinates in the axis we
\                       want to check (i.e. xPointHi, yPointHi or zPointHi)
\
\   K                   The non-zero return value (see below), so setting this
\                       to 0 will ensure that the object is always reported as
\                       being visible
\
\
\ Returns:
\
\   A                   Contains the result as follows:
\
\                         * 0 if the object is close enough to be visible
\
\                         * K if the object is too far away to be visible
\
\ ******************************************************************************

.CheckObjDistance

 BPL objd1              \ If A is positive, jump to objd1

 CMP #&FF               \ If A <> -1, jump to objd3 as the object is too far
 BNE objd3              \ away to be visible

                        \ If we get here, then A = -1, so now we need to check
                        \ the middle byte against the object's maximum visible
                        \ distance, though we need to negate the middle byte
                        \ first, as the coordinate is negative and the values in
                        \ maxObjDistance are positive

 LDA T                  \ Set A = ~T to negate it
 EOR #&FF

 JMP objd2              \ Jump to objd2 to check against the object's maximum
                        \ visible distance

.objd1

                        \ If we get here, then A is positive

 BNE objd3              \ If A is non-zero, jump to objd3 as the object is too
                        \ far away to be visible

                        \ If we get here then A = 0, so now we need to check the
                        \ middle byte against the object's maximum visible
                        \ distance

 LDA T                  \ Set A = T so we check the middle byte in the following

.objd2

 CMP maxObjDistance,Y   \ If A >= the object's maximum visible distance, then
 BCS objd3              \ the object is too far away to be visible, so jump to
                        \ objd3

                        \ If we get here then we want to return a "visible"
                        \ result

 LDA #0                 \ Set A = 0 as the return value

 RTS                    \ Return from the subroutine

.objd3

                        \ If we get here then we want to return a "not visible"
                        \ result

 LDA K                  \ Set A = K as the return value

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ResetLineLists
\       Type: Subroutine
\   Category: Visibility
\    Summary: Reset the line lists at linesToShow and linesToHide
\
\ ******************************************************************************

.ResetLineLists

 LDA #%10000000         \ Set colourLogic = %10000000
 STA colourLogic

 LDA #%00001111         \ Set colourCycle = %00001111, so we show colour 1 and
 STA colourCycle        \ hide colour 2 in the canopy view

 JSR ModifyDrawRoutine  \ Modify the drawing routines so we draw canopy lines in
                        \ colour 1 (as colourLogic = %10000000)

 LDA #0                 \ Set lineId = 0 to act as a loop counter below
 STA lineId

 STA linesToShowEnd     \ Set linesToShowEnd = 0 to reset the linesToShow list

 LDA #255               \ Set linesToHideEnd = 255 to reset the linesToHide list
 STA linesToHideEnd

 STA linesToShowPointer \ Set linesToShowPointer = 255 to reset the progress
                        \ pointer for the linesToShow list

 STA linesToHidePointer \ Set linesToHidePointer = 255 to reset the progress
                        \ pointer for the linesToHide list

.rell1

 JSR ShowOrHideLine     \ Process the line with ID lineId, adding it to either
                        \ the linesToShow or the linesToHide list

 INC lineId             \ Increment lineId to move on to the next line

 LDA lineId             \ Loop back until we have processed all the lines
 CMP numberOfLines
 BCC rell1

 LDX #3                 \ Set logical colour 3 to white so the dashboard display
 JSR SetColourToWhite   \ shows up in white

                        \ Fall through into FlipColours to flip the values of
                        \ colourCycle and colourLogic to cycle to the next
                        \ colour state, so we end up with drawing routines that
                        \ draw in colour 1, while colourLogic = %01000000 and
                        \ colourCycle = %11110000

\ ******************************************************************************
\
\       Name: FlipColours
\       Type: Subroutine
\   Category: Graphics
\    Summary: Flip the values of colourCycle and colourLogic to cycle to the
\             next colour state
\
\ ------------------------------------------------------------------------------
\
\ This routine flips the colourCycle and colourLogic variables between these two
\ states:
\
\   * colourLogic = %10000000
\     colourCycle = %00001111 = show colour 1, hide colour 2
\
\   * colourLogic = %01000000
\     colourCycle = %11110000 = show colour 2, hide colour 1
\
\ The routine only checks the value of colourCycle, so if colourLogic is
\ %00000000 on entry, it will be set to one of %10000000 and %01000000, so we
\ can use this routine to set the correct state after erasing lines during the
\ colourLogic %00000000 phase.
\
\ ******************************************************************************

.FlipColours

 LDX #%00001111         \ Set the values of X and Y to use if bit 7 of
 LDY #%10000000         \ colourCycle is set, i.e. %11110000

 LDA colourCycle        \ If bit 7 of colourCycle is set, i.e. %11110000, jump
 BMI flip1              \ down to flip1

 LDX #%11110000         \ Set X and Y for when bit 7 of colourCycle is clear,
 LDY #%01000000         \ i.e. %00001111

.flip1

 STX colourCycle        \ Store X in colourCycle, so colourCycle is now:
                        \
                        \   * %11110000 if the old colourCycle was %00001111
                        \   * %00001111 if the old colourCycle was %11110000

 STY colourLogic        \ Store Y in colourLogic, so colourLogic is now:
                        \
                        \   * %01000000 if the old colourCycle was %00001111
                        \   * %10000000 if the old colourCycle was %11110000

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetColourToWhite
\       Type: Subroutine
\   Category: Graphics
\    Summary: Set a logical colour to white
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The logical colour to set to white
\
\ ******************************************************************************

.SetColourToWhite

 LDY #7                 \ Set Y = 7 so we set the logical colour to physical
                        \ colour 7 (white)

 BNE SetLogicalColour   \ Jump to SetLogicalColour to set the logical colour in
                        \ X to white (this BNE is effectively a JMP as Y is
                        \ never zero

\ ******************************************************************************
\
\       Name: SetColourToBlack
\       Type: Subroutine
\   Category: Graphics
\    Summary: Set a logical colour to black
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The logical colour to set to black
\
\ ******************************************************************************

.SetColourToBlack

 LDY #0                 \ Set Y = 0 so we set the logical colour to physical
                        \ colour 7 (black)

                        \ Fall through into SetLogicalColour to set the logical
                        \ colour in X to black

\ ******************************************************************************
\
\       Name: SetLogicalColour
\       Type: Subroutine
\   Category: Graphics
\    Summary: Set a logical colour to a physical colour
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The logical colour to set
\
\   Y                   The physical colour to map to the logical colour
\
\ ******************************************************************************

.SetLogicalColour

 LDA #19                \ Start a VDU 19 command, which sets a logical colour to
 JSR OSWRCH             \ a physical colour using the following format:
                        \
                        \   VDU 19, logical, physical, 0, 0, 0

 TXA                    \ Write the value in X, which is the logical colour
 JSR OSWRCH

 TYA                    \ Copy the physical colour from Y to A

 LDX #3                 \ Set a counter in X to write the next four values, so
                        \ the following loop writes:
                        \
                        \   physical, 0, 0, 0

.setl1

 JSR OSWRCH             \ Write the value in A

 LDA #0                 \ Set A to 0 to write the three zeroes

 DEX                    \ Decrement the loop counter

 BPL setl1              \ Loop back until we have written the whole VDU command

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawCanopyView
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw the main view out of the canopy
\  Deep dive: Flicker-free animation through colour cycling
\
\ ******************************************************************************

.DrawCanopyView

 JSR ModifyDrawRoutine  \ Modify the drawing routines to use the current colour
                        \ cycle

 LDA linesToShowEnd     \ If linesToShowEnd is non-zero, jump to view1 to skip
 BNE view1              \ the following instruction, as there are lines in the
                        \ linesToShow list that we need to draw

 BEQ view6              \ linesToShowEnd is zero, which means the linesToShow
                        \ list is empty, so there is nothing to draw, so we
                        \ jump down to view6 to flip the colours (this BEQ is
                        \ effectively a JMP as we know A is zero)

.view1

 LDA #0                 \ Set lineCounter = 0 to act as a counter in the
 STA lineCounter        \ following loop, where we loop through the linesToShow
                        \ list

.view2

 TAX                    \ Set lineId to the next line ID from the linesToShow
 LDA linesToShow,X      \ list
 STA lineId

 BNE view3              \ If lineId is non-zero, jump to view3, as this is not
                        \ the horizon

 JSR DrawHalfHorizon    \ The line ID is 0, which is the horizon, so draw half
                        \ of the horizon line (as only half of the horizon is
                        \ stored in line 0)

 LDA lineId             \ Retrieve the line's ID, as it will have been corrupted
                        \ by the call to DrawHalfHorizon, and fall through into
                        \ view3 to draw the other half of the horizon

.view3

 TAX                    \ Set M to the point ID for the line's end point
 LDY lineEndPointId,X
 STY M

 LDA #0                 \ Zero the end point's status byte, so it is no longer
 STA pointStatus,Y      \ marked as having had its coordinates and visibility
                        \ calculated

 LDY lineStartPointId,X \ Set L to the point ID for the line's start point
 STY L

 STA pointStatus,Y      \ Zero the start point's status byte, so it is no longer
                        \ marked as having had its coordinates and visibility
                        \ calculated

 JSR DrawClippedLine    \ Draw the line, clipping it to the canopy view if
                        \ required

 INC lineCounter        \ Increment the loop counter

 LDA lineCounter        \ Loop back to draw the next line from the linesToShow
 CMP linesToShowEnd     \ list
 BCC view2

 JSR DrawGunSights      \ Draw the gun sights, if shown

                        \ We now flip the screens between the old screen (which
                        \ is being shown in white) and the new one (which we
                        \ just drew in black)

 LDA colourCycle        \ If bit 7 of colourCycle is set, i.e. %11110000, jump
 BMI view4              \ down to view4 to hide colour 1 and show colour 2

                        \ If we get here then colourCycle is %00001111

 LDX #2                 \ Set logical colour 2 to black, to hide the old canopy
 JSR SetColourToBlack   \ view in colour 2

 LDX #1                 \ Set logical colour 1 to white, to show the new canopy
 JSR SetColourToWhite   \ view that we just drew in colour 1

 JMP view5              \ Now that we have cycled the colours, jump down to
                        \ view5

.view4

                        \ If we get here then colourCycle is %11110000

 LDX #1                 \ Set logical colour 1 to black, to hide the old canopy
 JSR SetColourToBlack   \ view in colour 1

 LDX #2                 \ Set logical colour 2 to white, to show the new
 JSR SetColourToWhite   \ view that we just drew in colour 2

.view5

 JSR EraseCanopyLines   \ Erase the lines that are now hidden, and which are
                        \ stored in the relevant line buffer

.view6

 JSR FlipColours        \ Flip the values of colourCycle and colourLogic to
                        \ cycle to the next colour state

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessHorizonLine
\       Type: Subroutine
\   Category: Visibility
\    Summary: Calculate coordinates for the horizon's start and end points
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   L                   The point ID of the horizon line's start point
\
\   M                   The point ID of the horizon line's end point
\
\ ******************************************************************************

.ProcessHorizonLine

 LDX M                  \ Set the end point to (0, 0, 0)
 JSR SetPointToOrigin

 LDX L                  \ Set X = the point ID of the horizon line's start point

 JSR SetPointToOrigin   \ Set the start point to (0, 0, 0)

 LDA #&F0               \ Set the x-coordinate of the horizon line's start point
 STA xPointHi,X         \ to &F000 by setting the high byte

 STX GG                 \ Set GG = the point ID of the horizon line's start
                        \ point

                        \ We now do the following loop twice, once for the
                        \ horizon's start point, and again for the end point

.phor1

 BIT L0CFA              \ If bit 7 of (L0CFA L0CEA) is set, jump to phor3
 BMI phor3

 BVS phor4              \ If bit 6 of (L0CFA L0CEA) is set (so bit 7 is clear
                        \ and bit 6 is set), jump to phor4

.phor2

                        \ We get here if in (L0CFA L0CEA):
                        \
                        \   * Bit 7 set, bit 6 set
                        \   * Bit 7 clear, bit 6 clear
                        \
                        \ i.e. if bit 6 and 7 match

 LDA #40                \ Set A = 40 and jump to phor5 to set this as the
 BNE phor5              \ point's z-coordinate (this BNE is effectively a JMP
                        \ as A is never zero)

.phor3

 BVS phor2              \ If bit 6 of (L0CFA L0CEA) is set (so both bits 6 and 7
                        \ are set), jump to phor2

.phor4

                        \ We get here if in (L0CFA L0CEA):
                        \
                        \   * Bit 7 clear, bit 6 set
                        \   * Bit 7 set, bit 6 clear
                        \
                        \ i.e. if bit 6 and 7 differ

 LDA #216               \ Set A = -40 to use as the point's z-coordinate

.phor5

 STA zPointHi,X         \ Set the z-coordinate of the horizon line's start (or
                        \ end) point to A

 LDA #%10000000         \ Set bit 7 of point X's status byte, to indicate that
 ORA pointStatus,X      \ the point's coordinates and visibility have been
 STA pointStatus,X      \ calculated

 LDA #27                \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 4 in the calculation

 JSR SetPointCoords     \ Calculate the coordinates for point GG, which will
                        \ be the start or end point of the horizon

 CPX M                  \ If we just calculated the coordinates for the horizon
 BEQ phor6              \ line's end point, then we have now done both points,
                        \ so jump to phor6 to return from the subroutine

 LDX M                  \ Set GG and X to the point ID for the horizon line's
 STX GG                 \ end point

 BNE phor1              \ Loop back to phor1 to calculate the coordinates for
                        \ the end point (this BNE is effectively a JMP as X is
                        \ never zero)

.phor6

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateRadarBlip
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Update a blip on the radar (runway or alien)
\
\ ------------------------------------------------------------------------------
\
\ This routine calculates the screen coordinates for a blip on the radar, which
\ it then passes to DrawRadarBlip to update the blip.
\
\ Arguments:
\
\   Y                   The item to update on the radar:
\
\                         * 1 = update the runway
\
\                         * 33 = update the alien
\
\ ******************************************************************************

.UpdateRadarBlip

 LDX #0                 \ Set X = 0 act as an offset in the loop below, so we
                        \ iterate through the x, y and z axes

 STX TC                 \ Set TC = 0, to indicate that we should draw the runway
                        \ for when we fall through into DrawRadarBlip below

 CPY #33                \ If Y = 33, skip the following two instructions
 BNE upbl1

 LDA #1                 \ Y = 33, which is the alien, so set TC = 1, to indicate
 STA TC                 \ that we should draw the alien for when we fall through
                        \ into DrawRadarBlip below

                        \ We now loop through the x-, y- and z-axes to do the
                        \ following, where the object is either the runway or
                        \ the alien:
                        \
                        \   xTemp2 = xObject - xPlane
                        \   yTemp2 = yObject - yPlane
                        \   zTemp2 = zObject - zPlane
                        \
                        \ so (xTemp2 yTemp2 zTemp2) contains the vector from the
                        \ plane to the object, which is the same as the vector
                        \ from the centre of the radar to the blip
                        \
                        \ Note that we only bother with the top and high bytes
                        \ of the calculation (where top, high and low are the
                        \ bytes in a 24-bit number), as the radar isn't accurate
                        \ enough to show the low byte, so we can just ignore it
                        \
                        \ The loop comments are for the xTemp2 iteration
.upbl1

 LDA xObjectHi,Y        \ Set (xTemp2Hi xTemp2Lo) to the following:
 SEC                    \
 SBC xPlaneHi,X         \   (0 xObjectHi) - (xPlaneTop xPlaneHi)
 STA xTemp2Lo,X         \
                        \ starting with the top bytes

 LDA #0                 \ and then the high bytes (we don't bother with the low
 SBC xPlaneTop,X        \ bytes)
 STA xTemp2Hi,X

 TYA                    \ Set Y = Y + 40
 CLC                    \
 ADC #40                \ so Y points to xObject, then yObject, and then zObject
 TAY

 INX                    \ Increment X to move on to the next axis

 CPX #3                 \ Loop back until we have done all 3 axes
 BNE upbl1

                        \ We now want to calculate the coordinates for this
                        \ vector when rotated correctly, so we first set up
                        \ the coordinates, and then rotate them

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (xTemp2, yTemp2, zTemp2)

 LDY #0                 \ Set Y so the call to CopyWorkToPoint copies the
                        \ coordinates to point 0

 STY GG                 \ Set GG = 0

 JSR CopyWorkToPoint    \ Copy the coordinates from (xTemp2, yTemp2, zTemp2)
                        \ to point 0

 LDA #0                 \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 1 in the calculation

 JSR SetPointCoords     \ Calculate the coordinates for point 0

                        \ We now take the rotated x- and z-coordinates and
                        \ scale them down so they work as screen coordinates
                        \ within the range of the radar display (we can ignore
                        \ the y-coordinate, as the radar is a top-down display
                        \ that ignores altitude)
                        
 LDA xPointHi           \ Set R = xPointHi so we can shift xPoint below without
 STA R                  \ affecting the value of xPointHi

 LDA zPointHi           \ Set S = zPointHi so we can shift zPoint below without
 STA S                  \ affecting the value of zPointHi

 LDX #3                 \ We now want to shift the point values right by 3
                        \ places, so set a shift counter in X

.upbl2

 LSR R                  \ Set (R xPointLo) = (R xPointLo) >> 1
 ROR xPointLo           \                  = xPoint / 2

 LSR S                  \ Set (S zPointLo) = (S zPointLo) >> 1
 ROR zPointLo           \                  = zPoint / 2

 DEX                    \ Decrement the shift counter

 BPL upbl2              \ Loop back until we have shifted right three times

                        \ Because mode 5 pixels are twice as wide as they are
                        \ high, we need to halve the x-coordinate one more time
                        \ to get the correct result for the pixel x-coordinate

 LSR R                  \ Set (R A) = (R xPointLo) >> 1
 LDA xPointLo
 ROR A

 ADC #0                 \ Add bit 0 of the original value to round up the
 STA xPointLo           \ division and store the result in xPointLo

                        \ We now fall through into DrawRadarBlip to erase and
                        \ redraw the blip on the radar at the coordinates in
                        \ (xPointLo, zPointLo)

\ ******************************************************************************
\
\       Name: DrawRadarBlip
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Draw a blip on the radar (runway or alien)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   xPointLo            The radar x-coordinate of the blip to update
\
\   xPointHi            The sign of the x-coordinate in bit 7
\
\   zPointLo            The radar y-coordinate of the blip to update (we use the
\                       real-world z-coordinate, as the radar is a top-down
\                       view)
\
\   zPointHi            The sign of the y-coordinate in bit 7
\
\   TC                  The blip to update on the radar:
\
\                         * 0 = update the runway
\
\                         * 1 = update the alien
\
\ ******************************************************************************

.DrawRadarBlip

 LDX TC                 \ Set X = TC to point to the blip to update on the radar
                        \ (0 for the runway, 1 for the alien)

 LDA xRadarBuffer,X     \ Set I = the X-th byte of xRadarBuffer, which contains
 STA I                  \ the x-coordinate of the current line or dot on the
                        \ radar from a previous call to DrawRadarBlip

 LDA yRadarBuffer,X     \ Set J = the X-th byte of yRadarBuffer, which contains
 STA J                  \ the y-coordinate of the current line or dot on the
                        \ radar from a previous call to DrawRadarBlip

 LDA #128               \ Set N = 128 so the call to DrawVectorLine erases the
 STA N                  \ current line

 LDA previousCompass    \ Set A = previousCompass, so it contains the value of A
                        \ from the last call to GetRadarVector, i.e. for the
                        \ current line on the radar

 JSR GetRadarVector     \ Calculate the vector for the current line on the radar

 JSR DrawVectorLine     \ Erase a line from (I, J) as a vector (T, U) with
                        \ direction V

 LDX TC                 \ If TC is non-zero then we just erased a dot from the
 BNE drbl1              \ radar, so jump to drbl1 as we don't need to redraw the
                        \ cross at the centre of the radar
                        
                        \ If we get here then we just erased a line from the
                        \ radar, which may have corrupted the cross in the
                        \ centre, so we redraw it

 LDA #%10001000         \ Redraw the top-but-one pixel of the cross (though,
 STA row25_block35_6    \ oddly, not the very top pixel)

 STA row26_block35_0    \ Redraw the bottom two pixels of the cross
 STA row26_block35_1

 LDA #%00010001         \ Redraw the left pixel of the cross
 STA row25_block34_7

 LDA #%11001100         \ Redraw the centre and right pixels of the cross
 STA row25_block35_7

.drbl1

                        \ Now to calculate the position of the new line or dot
                        \ to draw on the radar

 LDA xPointLo           \ Set A = xPointLo, the x-coordinate of the alien or
                        \ runway

 BIT xPointHi           \ If the high byte in xPointHi is positive, jump to
 BPL drbl2              \ drbl2 to skip the following three instructions

 EOR #&FF               \ Otherwise negate A using two's complement, so A is
 CLC                    \ positive, i.e. A = |xPointLo|
 ADC #1

.drbl2

 CMP #13                \ If A >= 13, jump to drbl4 to return from the
 BCS drbl4              \ subroutine, as the item is off the side of the radar

 LDA zPointLo           \ Set A = zPointLo, the y-coordinate of the alien or
                        \ runway

 BIT zPointHi           \ If the high byte in zPointHi is positive, jump to
 BPL drbl3              \ drbl3 to skip the following three instructions

 EOR #&FF               \ Otherwise negate A using two's complement, so A is
 CLC                    \ positive, i.e. A = |zPointLo|
 ADC #1

.drbl3

 CMP #26                \ If A >= 26, jump to drbl4 to return from the
 BCS drbl4              \ subroutine, as the item is off the top or bottom of
                        \ the radar

 LDA xPointLo           \ Set I = xPointLo + 140
 CLC                    \
 ADC #140               \ to move the coordinate onto the radar, whose centre
 STA I                  \ cross on-screen is at (140, 207)

 STA xRadarBuffer,X     \ Store the x-coordinate in the relevant byte of
                        \ xRadarBuffer, so we can easily erase this item from
                        \ the radar when we want to move it again

 LDA zPointLo           \ Set J = zPointLo + 208
 CLC                    \
 ADC #208               \ to move the coordinate onto the radar, whose centre
 STA J                  \ cross on-screen is at (140, 207)

 STA yRadarBuffer,X     \ Store the x-coordinate in the relevant byte of
                        \ yRadarBuffer, so we can easily erase this item from
                        \ the radar when we want to move it again

 LDA #0                 \ Set N = 0 so the call to DrawVectorLine draws the
 STA N                  \ new line

 LDA compassHeading     \ Set A to the current compass heading, for use in the
                        \ call to GetRadarVector if this is the runway (if this
                        \ is an alien, this value is ignored)

 JSR GetRadarVector     \ Calculate the vector for the new line on the radar

 JSR DrawVectorLine     \ Draw a line from (I, J) as a vector (T, U) with
                        \ direction V

.drbl4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: AlienInAcornsville
\       Type: Subroutine
\   Category: Theme
\    Summary: Move an alien towards Acornsville and check whether it has reached
\             it yet (and if so, end the game)
\
\ ******************************************************************************

.AlienInAcornsville

 LDY alienToMove        \ Set Y to the number of the alien whose turn it is to
                        \ move towards Acornsville in this iteration of the main
                        \ loop, which we set in UpdateAliens

 BMI acrn1              \ If Y is negative, then there is no alien to move, so
                        \ jump to acrn1 to return from the subroutine

 LDA alienState,Y       \ If the alien's state is 27, then it is heading for the
 CMP #27                \ town, so jump to acrn7 if this is not the case
 BNE acrn7

                        \ The alien is heading towards the town. This happens
                        \ in three stages: first, the alien takes off; then it
                        \ flies towards the town; and finally it descends. When
                        \ the alien's state is 27, it is working through the
                        \ first two stages, so that's what we do now

 LDA yObjectHi+33       \ If the high byte of the alien's y-coordinate >= 12,
 CMP #12                \ then the alien is already flying high, so jump to
 BCS acrn2              \ acrn2 to move it closer to Acornsville

 LDA yObjectLo+33       \ Otherwise add 10 to the alien's yObject coordinate,
 ADC #10                \ so that it rises into the air, starting with the low
 STA yObjectLo+33       \ bytes

 BCC acrn1              \ If the addition of the low bytes overflowed, increment
 INC yObjectHi+33       \ the high byte

.acrn1

 RTS                    \ Return from the subroutine

.acrn2

                        \ If we get here then the alien's yObjectHi coordinate
                        \ is 12 or more, so it's already flying high

 LDX #0                 \ Set X = 0, to use in the following to check either the
                        \ x-coordinate (X = 0) or the z-coordinate (X = 80)

 STX T                  \ Set T = 0, which we use to record whether we move the
                        \ alien along the x-axis or z-axis (or both)

.acrn3

                        \ We either do the following with X = 0 or X = 80, which
                        \ either checks the x-coordinate or the z-coordinate
                        \ (as zObjectHi - xObjectHi is 80)
                        \
                        \ The comments are for when X = 0, which checks the
                        \ x-coordinate

 LDA xObjectHi+33,X     \ If the high byte of the alien's x-coordinate is zero,
 BEQ acrn5              \ then we have already reached the right longitude for
                        \ Acornsville, so jump to acrn5

 LDA xObjectLo+33,X     \ Subtract L0CF8 from the alien's x-coordinate, starting
 SEC                    \ with the low bytes, so the alien moves towards
 SBC L0CF8              \ Acornsville along the x-axis
 STA xObjectLo+33,X

 BCS acrn4              \ If the subtraction of the low bytes underflowed,
 DEC xObjectHi+33,X     \ decrement the high byte

.acrn4

 LDA #1                 \ Set T = 1, to record the fact that we moved the alien
 STA T

.acrn5

 CPX #80                \ If X = 80 then we have checked both axes, so jump to
 BEQ acrn6              \ acrn6 to check the alien's altitude

 LDX #80                \ Otherwise jump back to acrn3 with X = 80 to check the
 BNE acrn3              \ alien's latitude in its z-coordinate (this BNE is
                        \ effectively a JMP as X is never zero)

.acrn6

 LDA T                  \ If T <> 0 then we moved the alien along at least one
 BNE acrn1              \ of the axes, so jump to acrn1 to return from the
                        \ subroutine as the alien is still in the process of
                        \ flying to Acornsville

 LDA #28                \ Set the alien's state to 28, so the next time we call
 STA alienState,Y       \ this routine, we jump straight to the following

.acrn7

 CMP #28                \ If the alien's state is not 28, then it isn't
 BNE acrn1              \ attacking the town, so jump to acrn1 to return from
                        \ the subroutine

                        \ The alien is heading towards the town. This happens
                        \ in three stages: first, the alien takes off; then it
                        \ flies towards the town; and finally it descends. When
                        \ the alien's state is 28, it is on the final stage, so
                        \ that's what we do now

 LDA L368F              \ If L368F is non-zero, jump to acrn1 to return from
 BNE acrn1              \ the subroutine

 LDA yObjectLo+33       \ Subtract 10 from the alien's yObject coordinate, so
 SEC                    \ that it descends towards the town, starting with the
 SBC #10                \ low bytes
 STA yObjectLo+33

 BCS acrn8              \ If the subtraction of the low bytes underflowed,
 DEC yObjectHi+33       \ decrement the high byte

.acrn8

 LDA yObjectHi+33       \ If the high byte of the alien's y-coordinate is zero,
 BNE acrn1              \ then it is still too high to attack, so jump to acrn1
                        \ to return from the subroutine

 LDA yObjectLo+33       \ If the low byte of the alien's y-coordinate is 10 or
 CMP #10                \ more, then it is still too high to attack, so jump to
 BCS acrn1              \ acrn1 to return from the subroutine

 JSR PrintTooLate       \ Otherwise the alien is close enough to the town to
                        \ wreak havoc... which means it's game over, so print
                        \ the "TOO LATE!" message in the middle of the screen

 LDA #90                \ Delay for 90^3 loop iterations
 JSR Delay

 JSR TerminateGame      \ Terminate the game

 TSX                    \ Remove the two bytes from the top of the stack that
 INX                    \ were put there by the JSR that called this routine, so
 INX                    \ we can jump to NewGame without leaving any trace on
 TXS                    \ the stack

 JMP NewGame            \ Jump to NewGame to start a new game

\ ******************************************************************************
\
\       Name: GetRadarVector
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Calculate the radar line vector for a line (the runway) or a dot
\             (an alien)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   For the runway line only, this is either the current
\                       compass direction from compassHeading (if we are drawing
\                       the radar line), or a previous compass direction (if we
\                       are erasing the existing radar line)
\
\   X                   The type of radar line to calculate:
\
\                         * 0 = runway line
\
\                         * Non-zero = alien (shown as a dot)
\
\ Returns:
\
\   T                   Magnitude of x-coordinate of line's vector |x-delta|
\
\   U                   Magnitude of y-coordinate of line's vector |y-delta|
\
\   V                   The direction of the line (runway), or an arbitrary
\                       direction for the dot, because it doesn't matter (alien)
\
\                         * Bit 7 is the direction of the the x-delta
\
\                         * Bit 6 is the direction of the the y-delta
\
\                       Direction is like a clock, so positive (clear) is up and
\                       right
\
\ ******************************************************************************

.GetRadarVector

 CPX #0                 \ If X = 0, jump to rvec1 to calculate the line vector
 BEQ rvec1              \ for the runway

                        \ Otherwise we return the deltas for a dot, T = U = 1,
                        \ and don't worry about setting the direction in V as
                        \ it gets ignored when drawing dots

 LDY #1                 \ Set Y = 1 to return as the y-delta in U

 BNE rvec2              \ Jump down to rvec2 to set X = 1 and return from the
                        \ subroutine (this BNE is effectively a JMP as Y is
                        \ never zero)

.rvec1

                        \ We now want to calculate the vector for the runway
                        \ line on the radar
                        \
                        \ The runway runs north-south, so our compass direction
                        \ in A lets us work out the direction of the runway line
                        \ on the radar. The value of our compass in A is:
                        \
                        \   * 0 = North
                        \   * &40 = East
                        \   * &80 = South
                        \   * &C0 = West

 STA previousCompass    \ Store A in previousCompass, so we can pass it to this
                        \ routine again when we want to erase the line we are
                        \ about to draw

 CLC                    \ Set A = A + &10
 ADC #&10               \
                        \ This rotates the compass needle clockwise by &10, or
                        \ 22.5 degrees, so if the needle is just anticlockwise
                        \ of a cardinal compass point (e.g. NNW, ENE) it will be
                        \ bumped along to the quadrant and will inherit the
                        \ correct direction bit in bit 7. At the cardinal
                        \ points, A now contains the following:
                        \
                        \   * &10 = North   -> bit 7 clear
                        \   * &50 = East    -> bit 7 clear
                        \   * &90 = South   -> bit 7 set
                        \   * &D0 = West    -> bit 7 set
                        \
                        \ So bit 7 contains the direction of the needle along
                        \ the x-axis, with 0 to the right and 1 to the left

 ASL A                  \ Shift bit 7 of the result into the C flag, which we
                        \ will use below as the direction of the line's x-delta

 STA P                  \ Store the result in P, so:
                        \
                        \   P = (A + &10) << 1
                        \
                        \ which looks like this:
                        \
                        \   * %00100000 = North
                        \   * %10100000 = East
                        \   * %00100000 = South
                        \   * %10100000 = West
                        \
                        \ We use this below to work out the line's vector

 PHP                    \ Store the flags on the stack, in particular the C
                        \ flag from the above operation, which gives us the
                        \ direction of the line's x-delta

 ROR A                  \ Shift the C flag back into bit 7 of A, so bit 7 once
                        \ again contains the direction of the x-delta

 SEC                    \ Set A = A - &40
 SBC #&40
                        \ This rotates the compass needle anticlockwise by &40,
                        \ or 90 degrees, which will change bit 7 from being the
                        \ direction of the x-delta to the being the direction of
                        \ the y-delta

 PLP                    \ Retrieve the C flag from above, which contains the
                        \ direction of the x-delta

 ROR A                  \ Shift the direction of the x-delta into bit 7 of A,
                        \ and at the same time shift the y-delta from bit 7 to
                        \ bit 6

 EOR #%11000000         \ Reverse both deltas by flipping bits 6 and 7 of A
                        \ (I am not sure why this is done)

 STA V                  \ Store the result in V to set the direction of the line
                        \ vector

                        \ Above, we stored a value in P like this:
                        \
                        \   * %00100000 = North
                        \   * %10100000 = East
                        \   * %00100000 = South
                        \   * %10100000 = West
                        \
                        \ We can use this below to work out the vector of the
                        \ line to show, as follows:
                        \
                        \   * A set bit 6 means the line is between the cardinal
                        \     points, e.g. northeast, southwest and so on, so
                        \     the line is diagonal
                        \
                        \   * A set bit 7 means the line is generally east-west,
                        \     which is horizontal
                        \
                        \   * A clear bit 7 means the line is generally north-
                        \     south, which is vertical
                        \
                        \ We use this to set the vector in T and U to the
                        \ following:
                        \
                        \   * Diagonal: x-delta = 2, y-delta = 4
                        \
                        \   * Horizontal: x-delta = 2, y-delta = 1
                        \
                        \   * Vertical: x-delta = 1, y-delta = 4
                        \
                        \ The y-delta is twice the x-delta because the pixels
                        \ in mode 5 are twice as wide as they are tall

 LDX #2                 \ Set X = 2 to return as the x-delta in T for a diagonal

 LDY #4                 \ Set Y = 4 to return as the y-delta in U for a diagonal

 BIT P                  \ If bit 6 of P is set, jump to rvec3 to return these
 BVS rvec3              \ values as the deltas (i.e. 2 and 4), as the runway
                        \ line is diagonal

 BPL rvec2              \ If bit 7 of P is clear, jump to rvec2 to return an
                        \ x-delta of 1 and a y-delta of 4, as the runway line is
                        \ vertical

 LDY #1                 \ Otherwise set Y = 1 and jump to rvec3 to return an
 BNE rvec3              \ x-delta of 2 and a y-delta of 1, as the runway line is
                        \ horizontal

.rvec2

 LDX #1                 \ Set X = 1 to return as the x-delta in T

.rvec3

 STX T                  \ Return X as the x-delta in T

 STY U                  \ Return Y as the y-delta in U

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: Lookup2E60
\       Type: Variable
\   Category: Drawing lines
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

.Lookup2E74

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

.Lookup2E7E

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

.Lookup2E88

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

.Lookup2E92

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
\       Name: previousCompass
\       Type: Variable
\   Category: Dashboard
\    Summary: Stores the value of compassHeading when we draw the runway on the
\             radar, so we can erase the line later
\
\ ******************************************************************************

.previousCompass

 EQUB &20

\ ******************************************************************************
\
\       Name: previousTime
\       Type: Variable
\   Category: Main loop
\    Summary: Stores the current time (low byte only), so we can process lines
\             in a timely fashion during the main loop
\
\ ******************************************************************************

.previousTime

 EQUB &20

 EQUB &20, &20          \ These bytes appear to be unused

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

 LDY #HI(row1_block1_0) \ Set (Y X) to the screen address for row 1, block 1
 LDX #LO(row1_block1_0)

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

 STY Q                  \ Set (P Q) = (Y X), so (P Q) is now the screen address
 STX P                  \ we want to start filling from

 STA S                  \ Store the value we want to store into S

.fcrw1

 LDY #0                 \ Set a byte counter in Y

 LDA S                  \ Fetch the value of A that we stored in S above

.fcrw2

 STA (P),Y              \ Set the Y-th byte of (P Q) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BNE fcrw2              \ Loop back until we have set 256 bytes, starting at
                        \ (P Q), to the value in A

 LDY #47                \ Set a byte counter in Y for 47 bytes

 INC Q                  \ Set (P Q) = (P Q) + 256
                        \
                        \ so it points to the next byte to fill after the 256
                        \ bytes we just did

.fcrw3

 STA (P),Y              \ Set the Y-th byte of (P Q) to A, which sets 4 pixels
                        \ to the pixel pattern in S

 DEY                    \ Decrement the byte counter

 BPL fcrw3              \ Loop back until we have set 47 bytes, starting at
                        \ (P Q), to the value in A

 LDA P                  \ Set (P Q) = (P Q) + 64
 CLC                    \
 ADC #64                \ starting with the low bytes
 STA P

 BCC fcrw4              \ If the above addition didn't overflow, skip the next
                        \ instruction

 INC Q                  \ The above addition overflowed, so increment the high
                        \ byte of (P Q) to point to the next page in memory

                        \ So now (P Q) is 320 greater than at the start, so it
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
\       Name: UpdateBullets
\       Type: Subroutine
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called UBUL in the original source code.
\
\ ******************************************************************************

.UpdateBullets

 LDY #15
 STY objectId

 LDA #98
 STA GG

.L2EEF

 TYA
 CLC
 ADC #216
 TAX
 JSR AddPointToObject

 LDA #0
 STA showLine

 JSR SetObjectCoords    \ Calculate the object's coordinates and visibilty,
                        \ updating the object's status byte with the results

 BPL L2F0A              \ If bit 7 of the object's updated status byte is clear,
                        \ then the object is not visible, so jump to L2F0A

 LDY GG
 LDX #60
 JSR CheckLineDistance

 BEQ L2F0F

.L2F0A

 LDA #0                 \ Set firingStatus = 0 to indicate that there are no
 STA firingStatus       \ bullets are in the air

.L2F0F

 DEC GG
 DEC objectId
 LDY objectId
 CPY #12
 BCS L2EEF

 RTS

\ ******************************************************************************
\
\       Name: UpdateThemeStatus
\       Type: Subroutine
\   Category: Theme
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called SUTR in the original source code.
\
\ ******************************************************************************

.UpdateThemeStatus

 LDX themeStatus        \ If bit 7 of themeStatus is set, then the Theme is not
 BMI upth3              \ enabled, so jump to upth3 to return from the
                        \ subroutine

 BEQ upth3              \ If themeStatus is zero, return from the subroutine

 LDA onGround           \ If onGround is non-zero, then we are on the ground, so
 BNE upth3              \ jump to upth3 to return from the subroutine

 STA alienState-1,X     \ X is 1 to 8, so this updates the X-th alien's state

 LDA VIA+&64            \ Read the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

 AND #15                \ Reduce the random number to the range 0 to 15

 CMP #14                \ If the random number is >= 14 (12.5% chance), jump to
 BCS upth3              \ upth3 to return from the subroutine

 ORA #16                \ Increase the random number to the range 16 to 29

 DEC themeStatus        \ Decrement the alien counter in themeStatus

 LDX #8                 \ Set X to act as a loop counter, going from 8 down to
                        \ themeStatus

.upth1

 DEX                    \ Decrement the loop counter

 CPX themeStatus        \ If X <> themeStatus, jump to upth2
 BNE upth2

 STA L4208,X            \ X = themeStatus, so store the random number (in the
                        \ range 16 to 29) in the X-th byte of L4208

 RTS                    \ Return from the subroutine

.upth2

 CMP L4208,X            \ If the X-th byte of L4208 <> our random number, jump
 BNE upth1              \ back to upth1 to move on to the next alien

 INC themeStatus        \ Increment the alien counter in themeStatus again

.upth3

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateAliens
\       Type: Subroutine
\   Category: Theme
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.UpdateAliens

 LDA mainLoopCounter
 AND #127
 BNE upal3

 LDX #7

.upal1

 LDA alienState,X
 BEQ upal2

 CMP #22
 BEQ upal2

 CMP #27
 BCS upal2

 INC alienState,X

.upal2

 DEX
 BPL upal1

.upal3

 LDY #31                \ Loop through object IDs 31 and 32

.upal4

 LDX alienCounter-30,Y  \ Points to alienCounter+1 and alienCounter+2
 BMI upal6

 LDA alienState,X
 CMP #24
 BEQ upal5

 LDA L4208,X
 BPL upal11

.upal5

 LDA #&FE
 STA alienCounter-30,Y

.upal6

 LDX #7

.upal7

 LDA L4208,X
 BMI upal10

 LDA alienState,X
 BNE upal10

 CPY #31
 BEQ upal8

 CPX alienCounter+1
 JMP upal9

.upal8

 CPX alienCounter+2

.upal9

 BEQ upal10

 TXA
 STA alienCounter-30,Y
 STX U
 LDA #&80
 JSR L302C

 LDX U
 LDA #1
 STA alienState,X
 BNE upal11

.upal10

 DEX
 BPL upal7

.upal11

 INY
 CPY #33
 BNE upal4

 LDX alienCounter-30,Y  \ Y = 33 at this point, so this points to alienToMove
 BMI upal12

 LDA L4208,X
 BPL upal15

 STA alienCounter-30,Y

.upal12

 LDY #31                \ We now work our way through the aliens in objects 31,
                        \ 32 and 33, so set a counter in Y for the object ID

.upal13

 LDX alienCounter-30,Y
 BMI upal14

 LDA alienState,X
 CMP #22
 BNE upal14

 STX alienToMove        \ Set this alien as the one to move towards Acornsville
                        \ in this iteration of the main loop by setting
                        \ alienToMove to the alien number in X

 LDA #23                \ Set the alien's state to 23
 STA alienState,X

 BNE upal15              \ Jump to upal15 to exit the loop (this BNE is
                        \ effectively a JMP as A is never zero)

.upal14

 INY
 CPY #33
 BNE upal13

.upal15

 LDA mainLoopCounter
 AND #127
 BNE upal19

 LDY #31

.upal16

 LDX alienCounter-30,Y
 BMI upal17

 LDA alienState,X
 CMP #5
 BCC upal17

 CMP #&14
 BCS upal17

 AND #3
 BNE upal17

 JSR L302C

.upal17

 INY
 CPY #33
 BNE upal16

 LDX #7

.upal18

 LDA L4208,X
 BPL upal19

 DEX
 BPL upal18

 LDA #8
 STA themeStatus

 LDX #&00               \ Add 500 points to the score and make a beep by calling
 LDA #&50               \ ScorePoints with (X A) = &0050
 JSR ScorePoints        \
                        \ This is the score for completing a wave in the Theme

 LDA L0CF8
 CLC
 ADC #4
 CMP #&13
 BCS upal19

 STA L0CF8

.upal19

 RTS

\ ******************************************************************************
\
\       Name: L302C
\       Type: Subroutine
\   Category: Theme
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
 CPY #31
 BEQ L303A

 LDA #&BF

.L303A

 TAY

.L303B

 LDA zObjectPoint,Y
 CLC
 ADC #&10
 BIT K
 BPL L3049

 AND #&0F
 ORA #&20

.L3049

 STA zObjectPoint,Y
 DEY
 DEX
 BPL L303B

 LDY T
 RTS

\ ******************************************************************************
\
\       Name: MoveAliens
\       Type: Subroutine
\   Category: Theme
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.MoveAliens

 LDA #&7D
 STA QQ
 LDA #&40
 STA Q
 LDA #&A0
 STA RR
 STA PP
 CPY #31
 BCS mval1

 LDA #4
 LDX #3
 BNE mval4

.mval1

 LDA #0
 CPY #32
 BCS mval2

 LDX #&B7
 BNE mval3

.mval2

 BNE mval5

 LDX #188

.mval3

 LDA zObjectPoint,X
 EOR #&70
 LSR A
 LSR A
 LSR A
 LSR A
 TAX
 DEX
 DEX
 TXA
 BEQ mval5

.mval4

 LSR QQ
 LSR RR
 LSR PP
 LSR Q
 DEX
 BNE mval4

.mval5

 STA L368D
 LDA #0
 STA L368F
 LDY objectId
 JSR L3129

 LDX #&E4
 STX VV

.mval6

 LDX VV
 LDA #31
 STA WW
 LDY #0

.mval7

 STY Q
 JSR L3181

 LDY Q
 STA xTemp2Hi,Y
 LDA V
 STA xTemp2Lo,Y
 LDA R
 STA xTempLo,Y
 INY
 CPY #3
 BNE mval7

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (xTemp2, yTemp2, zTemp2)

 LDY #0                 \ Set Y so the call to CopyWorkToPoint copies the
                        \ coordinates to point 0

 JSR CopyWorkToPoint    \ Copy the coordinates from (xTemp2, yTemp2, zTemp2)
                        \ to point 0

 LDY VV
 JSR L3152

 LDY VV

 LDX #216               \ X goes: 0, 40, 80, 120, 200

.mval8

 TYA
 CLC
 ADC #40
 TAY
 TXA
 CLC
 ADC #40
 TAX
 LDA xObjectLo,Y
 STA xObjectLo,X        \ Store in first byte of all the coord tables
 CPX #&C8
 BNE mval8

.mval9

 LDY #2                 \ Y goes:  2,  1, 0
 LDX #80                \ X goes: 80, 40, 0

.mval10

 LDA xTempLo,Y
 CLC
 ADC xTemp2Hi,Y
 STA xTemp2Hi,Y
 BCC mval11

 INC xObjectLo,X
 BNE mval11

 INC xObjectHi,X

.mval11

 TXA
 SEC
 SBC #40
 TAX
 DEY
 BPL mval10

 LDX #0                 \ Move object 0 by the vector in point 0
 LDY #0
 JSR AddPointToObject

 LDY #216
 JSR L3152

 DEC WW
 BPL mval9

 LDA VV
 CLC
 ADC #2
 STA VV
 CMP #232
 BEQ mval12

 JMP mval6

.mval12

 RTS

\ ******************************************************************************
\
\       Name: L3129
\       Type: Subroutine
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called STIP in the original source code.
\
\ ******************************************************************************

.L3129

 LDX #2

.L312B

 LDA xObjectLo,Y
 CLC
 ADC Q
 STA W,X
 LDA xObjectHi,Y
 ADC #5
 STA I,X

.L313A

 TYA
 CLC
 ADC #40
 TAY
 DEX
 BPL L3143

 RTS

.L3143

 BEQ L312B

 LDA xObjectLo,Y
 STA W,X
 LDA xObjectHi,Y
 STA I,X
 JMP L313A

\ ******************************************************************************
\
\       Name: L3152
\       Type: Subroutine
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called HITS in the original source code.
\
\ ******************************************************************************

.L3152

 LDX #2

.L3154

 TYA
 CLC
 ADC #40
 TAY
 LDA xObjectLo,Y
 SEC
 SBC W,X
 STA T
 LDA xObjectHi,Y
 SBC I,X
 BNE L3180

 LDA T
 CMP PP,X
 BCS L3180

 DEX
 BPL L3154

 LDA objectId
 STA L368E

 TSX                    \ Remove two bytes from the top of the stack
 INX
 INX
 TXS

 LDA #27
 STA L368F

.L3180

 RTS

\ ******************************************************************************
\
\       Name: L3181
\       Type: Subroutine
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called ADIF in the original source code.
\
\ ******************************************************************************

.L3181

 LDA #0
 STA P
 STA R
 TXA
 CLC
 ADC #40
 TAX
 LDA xObjectLo+1,X
 SEC
 SBC xObjectLo,X
 STA V
 LDA xObjectHi+1,X
 SBC xObjectHi,X
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
\       Name: ShowUpsideDownBar
\       Type: Subroutine
\   Category: Dashboard
\    Summary: Show or hide the upside down bar in the artificial horizon
\             indicator
\
\ ------------------------------------------------------------------------------
\
\ Shows the upside down bar in the artificial horizon if bit 7 and bit 6 of
\ L0CFC are different
\
\ ******************************************************************************

.ShowUpsideDownBar

 LDA L0CFC              \ If bit 7 of L0CFC is clear, skip the following
 BPL upsi1              \ instruction

 EOR #%11000000         \ Flip bits 6 and 7 of A, making bit 7 clear and bit 6
                        \ flipped

.upsi1

                        \ When we get here, we know bit 7 of A is clear

 AND #%11000000         \ Extract bits 6 and 7 of A

 BEQ upsi2              \ If bit 6 of A is clear (we already know bit 7 is
                        \ clear), then the plane is the correct way up, so skip
                        \ the following instruction

                        \ We get here if one of the following is true:
                        \
                        \   * Bit 7 of L0CFC is clear and bit 6 is set
                        \   * Bit 7 of L0CFC is set and bit 6 is clear
                        \
                        \ either of which means the plane is upside down

 LDA #%00001110         \ Bit 6 is set, so set A to a three-pixel horizontal
                        \ line to show in the indicator

.upsi2

 STA row25_block13_1    \ Set the line at the bottom of the artificial horizon
                        \ indicator to the pixel pattern in A (0 if the plane is
                        \ the right way up, %00001110 if it is upside down)

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessRunwayLine (Part 1 of 5)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Calculate coordinates and visibility for a runway line
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   lineId              The line ID to process (1 to 11):
\
\                         * 1 to 4 are the runway outline
\
\                         * 5 to 11 are the dashes down the middle of the runway
\
\ Returns:
\
\   showLine            Whether this line is visible:
\
\                         * 0 = line is visible
\
\                         * Non-zero = line is not visible
\
\ ******************************************************************************

.ProcessRunwayLine

 LDA objectStatus+1     \ Fetch the status byte for object 1, the runway object

 BEQ prun3              \ If object 1's status byte is zero, then we have not
                        \ yet calculated the runway object's coordinates and
                        \ visibility, so jump to prun3 to do this

 BMI prun1              \ If bit 7 of object 1's status byte is set, then we
                        \ have already decided that the runway object is
                        \ visible, so jump to prun1 to set the line's visibility
                        \ accordingly

 JMP prun9              \ If we get here then we have already decided that the
                        \ runway object is hidden, so jump to prun9 to set the
                        \ line's visibility as hidden

.prun1

 LDA lineId             \ If lineId < 5, then the line ID is in the range 1 to
 CMP #5                 \ 4, so it's part of the runway outline, so jump to
 BCC prun2              \ prun2 to return from the subroutine as we always show
                        \ the outline when the runway is visible

 LDA showRunwayDashes   \ The line we are checking is one of the dashes down the
 STA showLine           \ middle of the runway, so set the line's visibility to
                        \ the value of showRunwayDashes, which contains the
                        \ visibility of the runway dashes

.prun2

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessRunwayLine (Part 2 of 5)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Calculate coordinates and visibility for the runway outline
\
\ ******************************************************************************

.prun3

 LDA #0                 \ Set the matrix number so the calls to SetPointCoords
 STA matrixNumber       \ and SetObjPointCoords below use matrix 1 in the
                        \ calculation

 LDA #1                 \ Set objectId = 1 to denote the runway object
 STA objectId

 JSR SetObjectCoords    \ Calculate the runway object's coordinates and
                        \ visibility, updating the object's status byte with the
                        \ results and setting point 217 to the object's anchor
                        \ point

 BPL prun9              \ If bit 7 of the runway object's updated status byte is
                        \ clear, then the runway object is not visible, so jump
                        \ to prun9 to set the line's visibility accordingly

                        \ The runway object is visible, so now we work out the
                        \ coordinates of the runway outline, which is a
                        \ rectangle whose corners are points 1 to 4

 LDA #0                 \ We start by zeroing the (xTemp yTemp zTemp) vector,
                        \ which is stored in six bytes to give us three 16-bit
                        \ coordinate values (from xTempLo to zTempHi), so first
                        \ we set A = 0 to use as our zero

 LDX #5                 \ Set a counter in X to count the six bytes

.prun4

 STA xTempLo,X          \ Zero the X-th byte of the six-byte coordinate block
                        \ between xTempLo and zTempHi

 DEX                    \ Decrement the loop counter

 BPL prun4              \ Loop back until we have zeroed all six bytes

                        \ We now calculate the coordinates for points 1 to 4,
                        \ starting with point 1

 LDY #217               \ Set Y so the call to AddTempToPoint adds point 217 to
                        \ the xTemp vector

 STY objectAnchorPoint  \ The anchor point of the runway is point 217, so set
                        \ objectAnchorPoint to this point for the call to
                        \ SetObjPointCoords

 LDX #1                 \ Set X so the call to AddTempToPoint stores the result
                        \ in point ID 1

 JSR AddTempToPoint     \ Add point 217 to the (xTemp yTemp zTemp) point and
                        \ store the result in (xPoint, yPoint, zPoint) for
                        \ point 1
                        \
                        \ This simply sets point ID 1 to the object's anchor
                        \ point, as we just zeroed (xTemp yTemp zTemp), so point
                        \ 1 of the runway outline is now calculated

 LDA #2                 \ Calculate the coordinates for object point 2 with
 STA GG                 \ anchor point 217, so point 2 is now calculated
 JSR SetObjPointCoords  \
                        \ This also sets (xTemp yTemp zTemp) to the vector from
                        \ the anchor point to point 2, which we now copy into
                        \ xTemp2 by copying the following values:
                        \
                        \   xTempLo, yTempLo, zTempLo
                        \   xTempHi, yTempHi, zTempHi
                        \
                        \ into the following locations:
                        \
                        \   xTemp2Hi,  yTemp2Hi,  zTemp2Hi
                        \   xTemp2Top, yTemp2Top, zTemp2Top
                        \
                        \ so (xTemp2Top xTempHi) etc. contain the vector from
                        \ the anchor point to the point 2

 LDX #5                 \ Set a counter for six bytes

.prun5

 LDA xTempLo,X          \ Copy the X-th byte of xTempLo to the X-th byte of
 STA xTemp2Hi,X         \ xTemp2Hi

 DEX                    \ Decrement the loop counter

 BPL prun5              \ Loop back until we have copied all six bytes

                        \ By now we have coordinates for points 1 and 2, plus
                        \ the vector from the anchor point to point 2 (which
                        \ is the same as the vector from point 1 to point 2,
                        \ as point 1 is the runway's anchor point)

 LDA #4                 \ Calculate the coordinates for object point 4 with
 STA GG                 \ anchor point 217, so point 4 is now calculated
 JSR SetObjPointCoords  \
                        \ This also sets (xTemp yTemp zTemp) to the vector
                        \ from the anchor point (point 1) to point 4

                        \ By now we have coordinates for points 1, 2 and 4, and
                        \ we could just call SetObjPointCoords for point 3, but
                        \ we can save a bit of time as the runway outline is a
                        \ rectangle, so we already have all the data we need to
                        \ calculate the coordinates for point 3
                        \
                        \ The runway outline looks like this:
                        \
                        \      2         3
                        \       +-------+
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       +-------+
                        \      1         4
                        \
                        \ We know the vector from point 1 to point 4 - it's in
                        \ the (xTemp yTemp zTemp) vector - and we know the
                        \ coordinates of point 2, so we can calculate the
                        \ coordinates of point 3 by simply adding the vector to
                        \ the coordinates of point 2, which is what we do next

 LDY #2                 \ Set point 3's coordinates to point 2's coordinates +
 LDX #3                 \ (xTemp yTemp zTemp), so point 3 is now calculated
 JSR AddTempToPoint

 LDA showLine           \ If showLine is zero, then all four coordinates fit
 BEQ prun6              \ within the boundaries of the world, so jump to prun6
                        \ to keep going

 LDA #%01000000         \ At least one of the calculations above overflowed, so
 STA objectStatus+1     \ at leat one coordinate is outside the boundaries of
                        \ the world, so set bit 6 of the status byte for the
                        \ runway object to indicate that we have now calculated
                        \ the runway object's coordinates and visibility, and
                        \ clear bit 7 to indicate that the runway is not visible

 RTS                    \ Return from the subroutine

.prun6

 LDX #4                 \ Set the status byte for points 1 to 4 to indicate
 JSR SetPointVisibility \ that their coordinates and visibility have been
                        \ calculated

\ ******************************************************************************
\
\       Name: ProcessRunwayLine (Part 3 of 5)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Calculate visibility for the runway dashes
\
\ ******************************************************************************

 LDY #1                 \ Set Y = 1 so we check point ID 1 in the call to
                        \ CheckLineDistance (point ID 1 is the anchor point of
                        \ the runway)

 LDX #10                \ Set X = 10 so we check the distance against that for
                        \ line ID 10, which is one of the dashes in the middle
                        \ of the runway

.prun7

 JSR CheckLineDistance  \ Check whether point Y on line X is within the visible
 STA showLine           \ distance for the line and store the result in showLine

 BNE prun8              \ If the point is too far away to be visible, then all
                        \ the dashes are too far away to be seen, so jump to
                        \ prun8 to return the relevant result

 CPY #3                 \ If Y = 3, then we have checked both point 1 and 3 and
 BEQ prun12             \ both are close enough to be visible, so jump to prun12
                        \ to finish off the processing

 LDY #3                 \ Otherwise set Y = 3 and jump back prun7 to check point
 BNE prun7              \ 3 as well (point 3 is the corner of the runway outline
                        \ opposite the anchor point)

.prun8

 LDA #%10000000         \ Set showRunwayDashes to indicate that the dashes down
 STA showRunwayDashes   \ the middle of the runway are not visible

 LDA lineId             \ If lineId < 5, then the line ID is in the range 1 to
 CMP #5                 \ 4, so it's part of the runway outline, so jump to
 BCC prun10             \ prun10 to return the result that the line is visible,
                        \ as we always show the outline when the runway is
                        \ visible, even when the runway dashes are hidden

.prun9

 LDA #%10000000         \ Set A to indicate the line is not visible, and jump to
 BNE prun11             \ prun11 to return this as the value of showLine (this
                        \ BNE is effectively a JMP as A is never zero)

.prun10

 LDA #0                 \ Set A to indicate the line is visible, so we can
                        \ return this as the value of showLine

.prun11

 STA showLine           \ Set the line's visibility to the value in A, to return
                        \ as our result

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ProcessRunwayLine (Part 4 of 5)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Construct the dashes down the middle of the runway
\
\ ******************************************************************************

.prun12

                        \ By the time we get here, (xTemp yTemp zTemp) contains
                        \ the vector from the anchor point (point 1) to point 4,
                        \ which is the vector from one side of the runway to the
                        \ other
                        \
                        \ We now want to halve the (xTemp yTemp zTemp) vector,
                        \ to give the vector from one side of the runway to the
                        \ line of dashes down the middle
                        \
                        \ As a reminder, the runway outline looks like this:
                        \
                        \      2         3
                        \       +-------+
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       +-------+
                        \      1         4
                        \
                        \ so we now calculate (xTemp yTemp zTemp) to be the
                        \ vector from the left edge of the runway to the dashes
                        \ in the middle

 LDX #2                 \ Set a counter in X to work through the three axes of
                        \ the (xTemp yTemp zTemp) vector (the comments below
                        \ cover the iteration for the x-axis)

.prun13

 CLC                    \ Clear the C flag, to use when (xTempHi xTempLo) is
                        \ positive

 LDA xTempHi,X          \ If xTempHi is positive, skip the following instruction
 BPL prun14

 SEC                    \ Set the C flag, to use when (xTempHi xTempLo) is
                        \ negative

.prun14

 ROR A                  \ Shift (xTempHi xTempLo) to the right by one place,
 STA xTempHi,X          \ inserting the C flag into the top bit of xTempHi,
 LDA xTempLo,X          \ which ensures that we retain the same sign
 ROR A
 STA xTempLo,X

 DEX                    \ Decrement the loop counter to move to the next axis

 BPL prun13             \ Loop back until we have halved xTemp, yTemp and zTemp

                        \ (xTemp yTemp zTemp) now contains the vector from one
                        \ side of the runway to the line of dashes down the
                        \ middle

 LDY #2                 \ Set point 21's coordinates to point 2's coordinates +
 LDX #21                \ (xTemp yTemp zTemp)
 JSR AddTempToPoint

 LDY #1                 \ Set point 5's coordinates to point 1's coordinates +
 LDX #5                 \ (xTemp yTemp zTemp)
 JSR AddTempToPoint

                        \ So we've now calculated points 5 and 21 as follows:
                        \
                        \      2    21   3
                        \       +-------+
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       +-------+
                        \      1    5    4
                        \
                        \ Next, we make a backup of the (xTemp yTemp zTemp)
                        \ vector into (xTemp3 yTemp3 zTemp3)

 LDX #5                 \ Set a counter for six bytes

.prun15

 LDA xTempLo,X          \ Copy the X-th byte of xTempLo to the X-th byte of
 STA xTemp3Lo,X         \ xTemp3Lo

 DEX                    \ Decrement the loop counter

 BPL prun15             \ Loop back until we have copied all six bytes

                        \ So (xTemp3 yTemp3 zTemp3) now contains the vector from
                        \ one side of the runway to the line of dashes down the
                        \ middle

                        \ We now zero variables T, U, V, W, G and H

 LDX #5                 \ Set a counter for six bytes

 LDA #0                 \ Set A = 0 so we can zero the variables

.prun16

 STA T,X                \ Zero the X-th byte from T

 DEX                    \ Decrement the loop counter

 BPL prun16             \ Loop back until we have zeroed all six bytes

                        \ In part 2 above, we set (xTemp2Top xTempHi) etc. to
                        \ the vector from the anchor point (i.e. point 1) to
                        \ point 2

 LDX #2                 \ Set a counter in X to work through the three axes (the
                        \ comments below cover the iteration for the x-axis)

                        \ For each axis in turn, we 

.prun17

 LDA #0                 \ Set R = 0
 STA R

 LDA xTemp2Top,X        \ Set A = xTemp2Top

 BPL prun18             \ If xTemp2Top is positive, skip the following
                        \ instruction

 DEC R                  \ Decrement R to %11111111

                        \ So by this point, R contains the correct bits to
                        \ rotate into bit 7 of A to retain the sign of A

.prun18

                        \ Set (xTempHi A T) = (xTemp2Top xTemp2Hi 0) / 2
                        \
                        \ keeping the sign intact by feeding in bits from R

 LSR R                  \ We start with the top byte
 ROR A
 STA xTempHi,X

 LDA xTemp2Hi,X         \ Then the high byte
 ROR A

 ROR T,X                \ And then the low byte

 LDY #2                 \ We now shift right by three places, so set a counter
                        \ in Y

.prun19

 LSR R                  \ Set (xTempHi A T) = (xTempHi A T) / 2
 ROR xTempHi,X          \
 ROR A                  \ keeping the sign intact by feeding in bits from R
 ROR T,X

 DEY                    \ Decrement the loop counter

 BPL prun19             \ Loop back until we have shifted right by three places

                        \ In all, the above does the following:
                        \
                        \   (xTempHi A T) = (xTemp2Top xTemp2Hi 0) / 16
                        \
                        \ while retaining the sign

 STA xTempLo,X          \ Set (xTempHi xTempLo T) = (xTempHi A T)
                        \                         = (xTemp2Top xTemp2Hi 0) / 16

 DEX                    \ Decrement the loop counter to move to the next axis

 BPL prun17             \ Loop back until we have processed all three axes

                        \ So we have now calculated the vector from point 1 to
                        \ point 2, divided by 16, with the result stored in the
                        \ xTemp vector and the variables T, U and V used for
                        \ the lowest bytes, like this:
                        \
                        \   x-coordinate = (xTempHi xTempLo T)
                        \   y-coordinate = (yTempHi yTempLo U)
                        \   z-coordinate = (zTempHi zTempLo V)
                        \
                        \ In other words, the xTemp/T/U/V vector contains 1/16
                        \ of the full vector between points 5 and 21

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyPointToWork copies the
                        \ coordinates to (xTemp2, yTemp2, zTemp2)

 LDY #5                 \ Set Y so the call to CopyPointToWork copies the
                        \ coordinates from point 5

 JSR CopyPointToWork    \ Copy the coordinates from point 5 to
                        \ (xTemp2, yTemp2, zTemp2)

                        \ So (xTemp2, yTemp2, zTemp2) now contains the
                        \ coordinates of point 5

                        \ We now calculate the start and end points for the
                        \ dashes in the middle of the runway by starting at
                        \ point 5, and moving up the middle line in steps of
                        \ 1/16 of the distance between points 5 and 21
.prun20

 LDX #2                 \ Set a counter in X to work through the three axes (the
                        \ comments below cover the iteration for the x-axis)

.prun21

 CLC                    \ Set (xTemp2Hi xTemp2Lo W) += (xTempHi xTempLo T)
 LDA W,X                \
 ADC T,X                \ starting with the lowest bytes
 STA W,X

 LDA xTemp2Lo,X         \ Then the middle bytes
 ADC xTempLo,X
 STA xTemp2Lo,X

 LDA xTemp2Hi,X         \ And then the highest bytes
 ADC xTempHi,X
 STA xTemp2Hi,X

 DEX                    \ Decrement the loop counter to move to the next axis

 BPL prun21             \ Loop back until we have added all three axes

                        \ On the first iteration through this code, the full
                        \ (xTemp2Hi xTemp2Lo W) vector contains a point 1/16
                        \ of the way from point 5 to point 21

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (xTemp2, yTemp2, zTemp2)

 INY                    \ Increment Y so the call to CopyPointToWork copies the
                        \ coordinates from the next point along the dash line
                        \ (which will be point 6 on the first iteration through
                        \ this code, then point 7, and so on)

 JSR CopyWorkToPoint    \ Copy the coordinates from (xTemp2, yTemp2, zTemp2)
                        \ to point Y, the next point along the dash line

 CPY #19                \ Loop back to prun20 to move another 1/16 along the
 BNE prun20             \ dash line, until we have done point 19, meaning we
                        \ have set the coordinates for points 6 through 19
                        \ (i.e. we have added 14 points, two for each of the
                        \ seven dashes in the middle of the runway)

 LDX #19                \ Set the status byte for points 1 to 19 to indicate
 JSR SetPointVisibility \ that their coordinates and visibility have been
                        \ calculated

\ ******************************************************************************
\
\       Name: ProcessRunwayLine (Part 5 of 5)
\       Type: Subroutine
\   Category: Visibility
\    Summary: Clip any portion of the runway outline that's behind us
\
\ ******************************************************************************

                        \ The final step is to check whether the runway appears
                        \ both in front of us and behind us (which will happen
                        \ when we are sitting on the runway, for example, or
                        \ during the final approach when trying to land)
                        \
                        \ If it is, then we want to clip the part of the runway
                        \ outline that's behind us, as close to the screen as
                        \ possible (though we still want the runway to go behind
                        \ us a bit, so clipping to the nearest coordinate behind
                        \ the screen is the best approach)
                        \
                        \ We start by restoring the vector that we stored in
                        \ (xTemp3 yTemp3 zTemp3) back to (xTemp yTemp zTemp),
                        \ which is the vector from one side of the runway to the
                        \ line of dashes down the middle

 LDX #5                 \ Set a counter for six bytes

.prun22

 LDA xTemp3Lo,X         \ Copy the X-th byte of xTemp3Lo to the X-th byte of
 STA xTempLo,X          \ xTempLo

 DEX                    \ Decrement the loop counter

 BPL prun22             \ Loop back until we have copied all six bytes

                        \ So (xTemp yTemp zTemp) is once again the vector from
                        \ one side of the runway to the line of dashes down the
                        \ middle

                        \ We now work our way along the dash line, checking the
                        \ coordinates of the points we just added to see if the
                        \ sign of the z-coordinate changes between any of the
                        \ points (which will indicate that the runway is both in
                        \ front of us and behind us)

 LDA zPointHi+6         \ Set P to the high byte of the z-coordinate for point 6
 STA P                  \ (which contains the sign of the coordinate)

 LDY #6                 \ We now loop through the points we just calculated for
                        \ the dashes, so we set a counter in Y to loop from 6 to
                        \ 19

.prun23

 LDA zPointHi,Y         \ Set A = z-coordinate for point Y EOR P
 EOR P

 BMI prun24             \ If A has a set bit 7, then the z-coordinate for point
                        \ Y has a different sign to the z-coordinate for point
                        \ 6, so jump to prun24 as the runway is both behind us
                        \ and in front of us

 INY                    \ Increment Y to point to the next point in the dash
                        \ line

 CPY #20                \ Loop back until we have worked our way through all the
 BCC prun23             \ points that we just calculated

 BCS prun28             \ If we get here then all the points have the same sign
                        \ z-coordinate as point 6, so jump to prun28 to return
                        \ from the subroutine (this BCS is effectively a JMP as
                        \ we just passed through the BCC above)

.prun24

                        \ If we get here, then point Y has a different sign in
                        \ its z-coordinate to point 6, so the runway is both
                        \ behind us and in front of us
                        \
                        \ We now want to find out which part is in front of us
                        \ and which is behind
                        \
                        \ We do this by working out which part of the dash line
                        \ is in front of us and which is behind, using the
                        \ following:
                        \
                        \      2    21   3
                        \       +-------+
                        \       |   :   |   <- Dashes end at point 19
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |
                        \       |   :   |   <- Dashes start at point 6
                        \       +-------+
                        \      1    5    4
                        \
                        \ If the start of the dash line is behind us (i.e. the
                        \ point 6 end), then that means we need to clip points 1
                        \ and 4 as close as possible to the screen, while if the
                        \ end of the dash line is behind us (i.e. the point 19
                        \ end), then we need to clip points 2 and 3 as close as
                        \ possible to the screen

 LDA P                  \ If point 6 has a positive z-coordinate, jump to prun25
 BPL prun25

                        \ If we get here then point 6 has a negative
                        \ z-coordinate, so point Y must have a positive
                        \ z-coordinate, and the point before Y must have a
                        \ negative z-coordinate
                        \
                        \ In other words, the dashes start behind us, and pass
                        \ in front of us at point Y, which is in front of us, so
                        \ the point before Y is the last point behind us
                        \
                        \ To clip the runway, we therefore need to move points 1
                        \ and 4

 DEY                    \ Decrement Y to point to the last point in the sequence
                        \ we added that has a negative z-coordinate

 LDA #1                 \ Set Q so the second call to AddTempToPoint moves point
 STA Q                  \ 1

 LDX #4                 \ Set X so the first call to AddTempToPoint moves point
                        \ 4

 BNE prun26             \ Jump to prun26 to call AddTempToPoint (this BNE is
                        \ effectively a JMP as X is never zero)

.prun25

                        \ If we get here then point 6 has a positive z-coordinate
                        \ so point Y must have a negative z-coordinate, and the
                        \ point before Y must have a positive z-coordinate
                        \
                        \ In other words, the dashes start in front of us, and
                        \ go behind us at point Y, which is the first point
                        \ behind us
                        \
                        \ To clip the runway, we therefore need to move points 2
                        \ and 3

 LDA #2                 \ Set Q so the second call to AddTempToPoint moves point
 STA Q                  \ 2

 LDX #3                 \ Set X so the first call to AddTempToPoint moves point
                        \ 3

.prun26

                        \ By the time we get here, Y is the point with the
                        \ negative z-coordinate that's nearest to the screen
                        \ (i.e. nearest to a z-coordinate of 0)
                        \
                        \ We now work out the new corner coordinates for the
                        \ end of the runway that's behind us, by taking point Y
                        \ and:
                        \
                        \   * Adding (xTemp yTemp zTemp) to point Y to get one
                        \     corner (i.e. corner 3 or 4)
                        \
                        \   * Subtracting (xTemp yTemp zTemp) from point Y to
                        \     get the other corner (i.e. corner 1 or 2)
                        \
                        \ We start with the addition

 JSR AddTempToPoint     \ Add point Y to the (xTemp yTemp zTemp) vector and
                        \ store the result in (xPoint, yPoint, zPoint) for
                        \ point X

                        \ We now negate the (xTemp yTemp zTemp) vector so we can
                        \ do the subtraction

 LDX #2                 \ Set a counter in X to work through the three axes of
                        \ the (xTemp yTemp zTemp) vector (the comments below
                        \ cover the iteration for the x-axis)

.prun27

 LDA #0                 \ Negate (xTempHi xTempLo), starting with the low bytes
 SEC
 SBC xTempLo,X
 STA xTempLo,X

 LDA #0                 \ And then the high bytes
 SBC xTempHi,X
 STA xTempHi,X

 DEX                    \ Decrement the loop counter to move to the next axis

 BPL prun27             \ Loop back until we have negated xTemp, yTemp and zTemp

                        \ The xTemp yTemp zTemp) vector is now negated, so we
                        \ can add it with AddTempToPoint to do the subtraction
                        \ we want

 LDX Q                  \ Set X so the call to AddTempToPoint stores the result
                        \ in point Q

 JSR AddTempToPoint     \ Add point Y to the (xTemp yTemp zTemp) vector and
                        \ store the result in (xPoint, yPoint, zPoint) for
                        \ point Q

.prun28

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetPointVisibility
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Set the status byte for multiple points to indicate that their
\             coordinates and visibility have been calculated
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The ID of the point to update
\
\ ******************************************************************************

.SetPointVisibility

 LDA #%10000000         \ Set bit 7 of point X's status byte, to indicate that
 ORA pointStatus,X      \ the point's coordinates and visibility have been
 STA pointStatus,X      \ calculated

 DEX                    \ Decrement X to point to the previous point

 BNE SetPointVisibility \ Loop back until we have set the status byte for points
                        \ X down to 1, i.e. points 1 to X

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawHalfHorizon
\       Type: Subroutine
\   Category: Drawing lines
\    Summary: Draw half of the horizon line
\
\ ------------------------------------------------------------------------------
\
\ The horizon line is line ID 0, which is the line from point 31 to point 30.
\ This line is only half the actual horizon, so this routine calculates the
\ other half of the horizon into point 30, and draws the line from point 30 to
\ point 32.
\
\ Point 30 is therefore the mid-point of the two-segment horizon line, which
\ goes point 31 to point 30 to point 32.
\
\ The calculation looks like this:
\
\                                         +  (x_32, y_32)
\                                      .´ |
\                                    .´   |  h
\                                  .´     |
\                   (x_30, y_30) .´_______|
\                              .´|    w
\                            .´  |
\                          .´    | h
\                        .´      |
\        (x_31, y_31)   ´--------+
\                            w
\
\ We already know the coordinates of points 30 and 31, and we want to calculate
\ point 32. It's easy to calculate w and h in the bottom triangle:
\
\   w = x_30 - x_31
\   h = y_30 - y_31
\
\ so to extend the line to point 32, we simply add w and h to the coordinates
\ for point 30, like this:
\
\  x_32 = x_30 + w
\       = x_30 + x_30 - x_31
\       = (x_30 * 2) - x_31
\
\  y_32 = y_30 + h
\       = y_30 + y_30 - y_31
\       = (y_30 * 2) - y_31
\
\ This routine draws the horizon from point 30 to point 32, while the other half
\ from point 31 to 30 is drawn along with all the other lines in DrawCanopyView.
\
\ ******************************************************************************

.DrawHalfHorizon

 LDX #30                \ Set X = 30, to use as the point ID for point 30, which
                        \ is the start of the horizon line

 LDY #32                \ Set Y = 32, to use as the point ID for point 32

 LDA xPointHi,X         \ Set (T A) = x_30
 STA T
 LDA xPointLo,X

 ASL A                  \ Set (T A) = (T A) * 2
 ROL T                  \           = x_30 * 2

 SEC                    \ Set x_32 = (T A) - x_31
 SBC xPointLo+31        \          = (x_30 * 2) - x_31
 STA xPointLo,Y
 LDA T
 SBC xPointHi+31
 STA xPointHi,Y

 LDA yPointHi,X         \ Set (T A) = y_30
 STA T
 LDA yPointLo,X

 ASL A                  \ Set (T A) = (T A) * 2
 ROL T                  \           = y_30 * 2

 SEC                    \ Set y_32 = (T A) - y_31
 SBC yPointLo+31        \          = (y_30 * 2) - y_31
 STA yPointLo,Y
 LDA T
 SBC yPointHi+31
 STA yPointHi,Y

                        \ So now we have:
                        \
                        \   x_32 = (x_30 * 2) - x_31
                        \   y_32 = (y_30 * 2) - y_31
                        \
                        \ which is what we want

 STX L                  \ Set L to point 30, so we draw the line from this start
                        \ point

 STY M                  \ Set L to point 32, so we draw the line to this end
                        \ point

 JSR DrawClippedHorizon \ Draw the line from point 30 to 32, which is the first
                        \ half of the horizon line

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: FillUpFuelTank
\       Type: Subroutine
\   Category: Flight
\    Summary: Fill up the fuel tank by 1/65th of a full tank every four
\             iterations of the main loop
\
\ ******************************************************************************

.FillUpFuelTank

 LDA mainLoopCounter    \ If the mainLoopCounter is a multiple of 4, jump to
 AND #3                 \ fuel1 to add some fuel to the tank (so we do this
 BEQ fuel1              \ every four iterations of the main loop)

 RTS                    \ Return from the subroutine

.fuel1

 TAX                    \ We got here because A = 0, so this sets X = 0

 LDA fuelLevel          \ If fuelLevel >= 65, then the tank is already full, so
 CMP #65                \ jump to fuel2 to skip filling it up any more
 BCS fuel2

 INC fuelLevel          \ fuelLevel < 65, so increment the fuel level by 1, to
                        \ fill up the fuel tank by 1/65th of a full tank

 JMP DrawFuelPixel      \ Draw an extra pixel at the top of the fuel level, so
                        \ the fuel gauge goes up by one pixel, returning from
                        \ the subroutine using a tail call

.fuel2

                        \ If we get here then the fuel tank is full

 STX landingStatus      \ Set landingStatus = 0 to disable all the landing tasks
                        \ in the main loop, including filling up with fuel

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

 LDA mainLoopCounter    \ If the mainLoopCounter is a multiple of 16, jump to
 AND #15                \ upfu1 to update the fuel gauge
 BEQ upfu1

 RTS                    \ Return from the subroutine

.upfu1

 LDX #128               \ Set X = 128, so we erase a pixel from the top of the
                        \ fuel gauge in DrawFuelPixel below, if there is one

 LDA fuelLevel          \ Set A = fuelLevel

                        \ Fall through into DrawFuelPixel to erase a pixel from
                        \ the fuel gauge at the top of the gauge if there is
                        \ one, which will set the amount shown on the fuel gauge
                        \ to fuelLevel

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
\       Name: ProcessVolumeKeys
\       Type: Subroutine
\   Category: Sound
\    Summary: Adjust the volume when the volume keys are pressed
\
\ ******************************************************************************

.ProcessVolumeKeys

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
 ADC soundData+10

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

 STA soundData+10       \ The new volume is valid, so update byte #3 of sound #1
                        \ (low byte of amplitude) with the new volume

 INC soundData+60       \ Increment byte #5 of sound #7 (low byte of engine
                        \ pitch) to make the engine pitch jump up a bit, so we
                        \ can hear the engine noise changing while adjusting the
                        \ volume (the MakeEngineSound routine will bring it back
                        \ down to the correct pitch)

.volk4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: RetractFlapsIfFast
\       Type: Subroutine
\   Category: Flight
\    Summary: Retract the flaps if we are going faster than 150 mph
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   A                   The high byte of the current airspeed
\
\ ******************************************************************************

.RetractFlapsIfFast

 CMP #14                \ First we check the high byte of the current airspeed
 BCC rflp1              \ in A to see if it is less than 14, at which point the
                        \ airspeed is:
                        \
                        \   (14 0) * 100 / 2368 = 3584 * 100 / 2368 = 151
                        \
                        \ So if the airspeed is less than 151mph, we jump to
                        \ rflp1 to return from the subroutine without changing
                        \ the flaps

 LDA flapsStatus        \ If the flaps are already retracted, jump to rflp1 to
 BEQ rflp1              \ return from the subroutine without changing anything

 LDA #0                 \ The speed is at least 151 mph and the flaps are on,
 STA flapsStatus        \ so we retract them by setting flapsStatus to 0

 JSR IndicatorF         \ Update the flaps indicator

.rflp1

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: xObjectPoint
\       Type: Variable
\   Category: 3D geometry
\    Summary: Scaled x-coordinates of the points that make up objects, relative
\             to the object's anchor point
\
\ ------------------------------------------------------------------------------
\
\ For a point within an object, (xObjectPoint, yObjectPoint, zObjectPoint) are
\ the coordinates of this point relative to the object's anchor.
\
\ This is the same as saying (xObjectPoint, yObjectPoint, zObjectPoint) is the
\ vector from the object's anchor to the point.
\
\ This table effectively defines the shape of each object.
\
\ Each vector is stored as three coordinates, with each coordinate being in the
\ range 0 to 15, plus a scale factor, which is stored in bits 4 to 7 of the
\ z-coordinate in zObjectPoint. The scale is given as a power of 2, so a scale
\ factor of n means we scale the coordinates by 2^n (where n = 0 to 9).
\
\ All vectors are positive in all three axes, so the anchor point for an object
\ is therefore the closest point to the origin.
\
\ ******************************************************************************

.xObjectPoint

 EQUB 13                \ Point ID 0   is (13, 61, 13) with scale factor 2^0
 EQUB 0                 \ Point ID 1   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 2   is ( 0,  0, 12) with scale factor 2^9
 EQUB 0                 \ Point ID 3   is ( 0,  0,  0) with scale factor 2^0
 EQUB 8                 \ Point ID 4   is ( 8,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 5   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 6   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 7   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 8   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 9   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 10  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 11  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 12  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 13  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 14  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 15  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 16  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 17  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 18  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 19  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 20  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 21  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 22  is ( 0,  0,  8) with scale factor 2^4
 EQUB 0                 \ Point ID 23  is ( 0,  0,  8) with scale factor 2^4
 EQUB 10                \ Point ID 24  is (10,  0,  0) with scale factor 2^6
 EQUB 0                 \ Point ID 25  is ( 0,  1,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 26  is ( 0,  1,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 27  is ( 0,  1,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 28  is ( 0,  1,  0) with scale factor 2^8
 EQUB 4                 \ Point ID 29  is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 30  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 31  is ( 0,  0,  0) with scale factor 2^0
 EQUB 4                 \ Point ID 32  is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 33  is ( 0,  0, 10) with scale factor 2^5
 EQUB 0                 \ Point ID 34  is ( 0,  0, 12) with scale factor 2^4
 EQUB 0                 \ Point ID 35  is ( 0,  0,  0) with scale factor 2^0
 EQUB 4                 \ Point ID 36  is ( 4,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 37  is ( 0,  0,  2) with scale factor 2^8
 EQUB 12                \ Point ID 38  is (12,  0,  0) with scale factor 2^4
 EQUB 5                 \ Point ID 39  is ( 5,  0, 10) with scale factor 2^5
 EQUB 8                 \ Point ID 40  is ( 8,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 41  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 42  is ( 0, 10,  0) with scale factor 2^3
 EQUB 0                 \ Point ID 43  is ( 0, 10,  0) with scale factor 2^3
 EQUB 0                 \ Point ID 44  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 45  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 46  is ( 0, 10,  0) with scale factor 2^3
 EQUB 0                 \ Point ID 47  is ( 0, 10,  0) with scale factor 2^3
 EQUB 12                \ Point ID 48  is (12,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 49  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 50  is ( 0,  0,  8) with scale factor 2^3
 EQUB 12                \ Point ID 51  is (12,  0,  0) with scale factor 2^5
 EQUB 11                \ Point ID 52  is (11,  0,  0) with scale factor 2^6
 EQUB 0                 \ Point ID 53  is ( 0, 10,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 54  is ( 0, 10,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 55  is ( 0, 10,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 56  is ( 0, 10,  0) with scale factor 2^4
 EQUB 2                 \ Point ID 57  is ( 2,  0, 14) with scale factor 2^8
 EQUB 1                 \ Point ID 58  is ( 1,  0, 11) with scale factor 2^8
 EQUB 3                 \ Point ID 59  is ( 3,  0,  9) with scale factor 2^9
 EQUB 6                 \ Point ID 60  is ( 6,  0, 12) with scale factor 2^8
 EQUB 10                \ Point ID 61  is (10,  0,  1) with scale factor 2^8
 EQUB 3                 \ Point ID 62  is ( 3,  0,  9) with scale factor 2^7
 EQUB 9                 \ Point ID 63  is ( 9,  0, 15) with scale factor 2^6
 EQUB 6                 \ Point ID 64  is ( 6,  0, 13) with scale factor 2^8
 EQUB 13                \ Point ID 65  is (13,  0,  3) with scale factor 2^4
 EQUB 0                 \ Point ID 66  is ( 0,  0, 14) with scale factor 2^9
 EQUB 1                 \ Point ID 67  is ( 1,  0,  0) with scale factor 2^8
 EQUB 5                 \ Point ID 68  is ( 5,  0, 12) with scale factor 2^9
 EQUB 1                 \ Point ID 69  is ( 1,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 70  is ( 0,  0,  0) with scale factor 2^0
 EQUB 9                 \ Point ID 71  is ( 9,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 72  is ( 0,  0,  9) with scale factor 2^5
 EQUB 8                 \ Point ID 73  is ( 8,  0,  6) with scale factor 2^9
 EQUB 0                 \ Point ID 74  is ( 0,  0,  1) with scale factor 2^8
 EQUB 14                \ Point ID 75  is (14,  0,  7) with scale factor 2^9
 EQUB 0                 \ Point ID 76  is ( 0,  0,  1) with scale factor 2^8
 EQUB 13                \ Point ID 77  is (13,  0,  2) with scale factor 2^9
 EQUB 5                 \ Point ID 78  is ( 5,  0, 13) with scale factor 2^4
 EQUB 12                \ Point ID 79  is (12,  0,  0) with scale factor 2^8
 EQUB 15                \ Point ID 80  is (15,  0, 15) with scale factor 2^1
 EQUB 0                 \ Point ID 81  is ( 0, 12,  0) with scale factor 2^2
 EQUB 7                 \ Point ID 82  is ( 7, 12,  7) with scale factor 2^1
 EQUB 6                 \ Point ID 83  is ( 6,  7, 11) with scale factor 2^2
 EQUB 12                \ Point ID 84  is (12,  8,  5) with scale factor 2^2
 EQUB 0                 \ Point ID 85  is ( 0, 10,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 86  is ( 0,  0,  1) with scale factor 2^8
 EQUB 8                 \ Point ID 87  is ( 8,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 88  is ( 0,  2,  0) with scale factor 2^8
 EQUB 15                \ Point ID 89  is (15,  0, 15) with scale factor 2^1
 EQUB 0                 \ Point ID 90  is ( 0, 10,  0) with scale factor 2^2
 EQUB 4                 \ Point ID 91  is ( 4, 12,  4) with scale factor 2^1
 EQUB 3                 \ Point ID 92  is ( 3,  5, 12) with scale factor 2^2
 EQUB 10                \ Point ID 93  is (10,  7,  8) with scale factor 2^2
 EQUB 0                 \ Point ID 94  is ( 0, 10,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 95  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 96  is ( 0,  0,  1) with scale factor 2^8
 EQUB 10                \ Point ID 97  is (10,  0,  0) with scale factor 2^1
 EQUB 0                 \ Point ID 98  is ( 0,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 99  is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 100 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 101 is ( 0,  0, 11) with scale factor 2^4
 EQUB 0                 \ Point ID 102 is ( 0,  0, 10) with scale factor 2^4
 EQUB 11                \ Point ID 103 is (11,  0,  7) with scale factor 2^8
 EQUB 11                \ Point ID 104 is (11,  0,  4) with scale factor 2^9
 EQUB 13                \ Point ID 105 is (13,  0, 13) with scale factor 2^3
 EQUB 14                \ Point ID 106 is (14,  0,  0) with scale factor 2^9
 EQUB 4                 \ Point ID 107 is ( 4,  0, 10) with scale factor 2^3
 EQUB 4                 \ Point ID 108 is ( 4,  0,  0) with scale factor 2^8
 EQUB 13                \ Point ID 109 is (13,  0,  3) with scale factor 2^8
 EQUB 12                \ Point ID 110 is (12,  0,  0) with scale factor 2^8
 EQUB 13                \ Point ID 111 is (13,  0, 10) with scale factor 2^9
 EQUB 4                 \ Point ID 112 is ( 4,  0, 12) with scale factor 2^8
 EQUB 14                \ Point ID 113 is (14,  0,  1) with scale factor 2^9
 EQUB 0                 \ Point ID 114 is ( 0,  0, 12) with scale factor 2^8
 EQUB 3                 \ Point ID 115 is ( 3,  0,  5) with scale factor 2^8
 EQUB 15                \ Point ID 116 is (15,  0,  0) with scale factor 2^8
 EQUB 10                \ Point ID 117 is (10,  0,  5) with scale factor 2^8
 EQUB 11                \ Point ID 118 is (11,  0,  4) with scale factor 2^8
 EQUB 2                 \ Point ID 119 is ( 2,  0, 14) with scale factor 2^8
 EQUB 14                \ Point ID 120 is (14,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 121 is ( 0,  0,  9) with scale factor 2^8
 EQUB 11                \ Point ID 122 is (11,  0,  7) with scale factor 2^9
 EQUB 10                \ Point ID 123 is (10,  0,  3) with scale factor 2^9
 EQUB 10                \ Point ID 124 is (10,  0,  3) with scale factor 2^9
 EQUB 5                 \ Point ID 125 is ( 5,  0,  9) with scale factor 2^9
 EQUB 14                \ Point ID 126 is (14,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 127 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 128 is ( 0,  0,  7) with scale factor 2^8
 EQUB 11                \ Point ID 129 is (11,  0, 14) with scale factor 2^8
 EQUB 14                \ Point ID 130 is (14,  0, 10) with scale factor 2^8
 EQUB 5                 \ Point ID 131 is ( 5,  0,  0) with scale factor 2^8
 EQUB 4                 \ Point ID 132 is ( 4,  0, 14) with scale factor 2^8
 EQUB 9                 \ Point ID 133 is ( 9,  0,  4) with scale factor 2^9
 EQUB 10                \ Point ID 134 is (10,  0,  2) with scale factor 2^9
 EQUB 0                 \ Point ID 135 is ( 0,  0,  0) with scale factor 2^0
 EQUB 1                 \ Point ID 136 is ( 1,  0, 15) with scale factor 2^8
 EQUB 5                 \ Point ID 137 is ( 5,  0, 10) with scale factor 2^9
 EQUB 13                \ Point ID 138 is (13,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 139 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 140 is ( 0,  0, 11) with scale factor 2^8
 EQUB 13                \ Point ID 141 is (13,  0,  9) with scale factor 2^8
 EQUB 15                \ Point ID 142 is (15,  0,  0) with scale factor 2^7
 EQUB 2                 \ Point ID 143 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 144 is ( 0,  0, 13) with scale factor 2^8
 EQUB 9                 \ Point ID 145 is ( 9,  0,  9) with scale factor 2^9
 EQUB 13                \ Point ID 146 is (13,  0, 11) with scale factor 2^8
 EQUB 15                \ Point ID 147 is (15,  0,  5) with scale factor 2^8
 EQUB 11                \ Point ID 148 is (11,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 149 is ( 0,  0, 11) with scale factor 2^8
 EQUB 11                \ Point ID 150 is (11,  0, 13) with scale factor 2^8
 EQUB 13                \ Point ID 151 is (13,  0,  2) with scale factor 2^8
 EQUB 2                 \ Point ID 152 is ( 2,  0,  0) with scale factor 2^8
 EQUB 3                 \ Point ID 153 is ( 3,  0,  8) with scale factor 2^8
 EQUB 10                \ Point ID 154 is (10,  0,  7) with scale factor 2^8
 EQUB 8                 \ Point ID 155 is ( 8,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 156 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 157 is ( 0,  0,  6) with scale factor 2^8
 EQUB 4                 \ Point ID 158 is ( 4,  0,  8) with scale factor 2^8
 EQUB 12                \ Point ID 159 is (12,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 160 is ( 0,  0,  6) with scale factor 2^8
 EQUB 6                 \ Point ID 161 is ( 6,  0,  9) with scale factor 2^9
 EQUB 14                \ Point ID 162 is (14,  0, 12) with scale factor 2^8
 EQUB 11                \ Point ID 163 is (11,  0,  0) with scale factor 2^7
 EQUB 0                 \ Point ID 164 is ( 0,  0,  3) with scale factor 2^8
 EQUB 5                 \ Point ID 165 is ( 5,  0, 12) with scale factor 2^9
 EQUB 10                \ Point ID 166 is (10,  0,  9) with scale factor 2^9
 EQUB 14                \ Point ID 167 is (14,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 168 is ( 0,  0, 12) with scale factor 2^8
 EQUB 5                 \ Point ID 169 is ( 5,  0, 11) with scale factor 2^9
 EQUB 11                \ Point ID 170 is (11,  0,  7) with scale factor 2^8
 EQUB 5                 \ Point ID 171 is ( 5,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 172 is ( 0,  0,  9) with scale factor 2^8
 EQUB 5                 \ Point ID 173 is ( 5,  0,  8) with scale factor 2^9
 EQUB 13                \ Point ID 174 is (13,  0, 13) with scale factor 2^8
 EQUB 2                 \ Point ID 175 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 176 is ( 0,  0,  8) with scale factor 2^8
 EQUB 2                 \ Point ID 177 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 178 is ( 0,  0, 12) with scale factor 2^0
 EQUB 12                \ Point ID 179 is (12,  0,  0) with scale factor 2^0
 EQUB 14                \ Point ID 180 is (14,  0, 14) with scale factor 2^2
 EQUB 5                 \ Point ID 181 is ( 5,  0,  5) with scale factor 2^8
 EQUB 5                 \ Point ID 182 is ( 5,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 183 is ( 0,  0,  3) with scale factor 2^2
 EQUB 3                 \ Point ID 184 is ( 3,  0,  0) with scale factor 2^2
 EQUB 14                \ Point ID 185 is (14,  0, 14) with scale factor 2^2
 EQUB 3                 \ Point ID 186 is ( 3,  4,  3) with scale factor 2^2
 EQUB 5                 \ Point ID 187 is ( 5,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 188 is ( 0,  0,  3) with scale factor 2^2
 EQUB 3                 \ Point ID 189 is ( 3,  0,  0) with scale factor 2^2
 EQUB 14                \ Point ID 190 is (14,  0, 14) with scale factor 2^2
 EQUB 3                 \ Point ID 191 is ( 3,  4,  3) with scale factor 2^2
 EQUB 9                 \ Point ID 192 is ( 9,  0,  9) with scale factor 2^7
 EQUB 4                 \ Point ID 193 is ( 4,  0,  5) with scale factor 2^5
 EQUB 5                 \ Point ID 194 is ( 5,  0,  4) with scale factor 2^5
 EQUB 9                 \ Point ID 195 is ( 9,  0,  8) with scale factor 2^6
 EQUB 7                 \ Point ID 196 is ( 7,  4,  5) with scale factor 2^5
 EQUB 4                 \ Point ID 197 is ( 4,  0,  0) with scale factor 2^4
 EQUB 4                 \ Point ID 198 is ( 4,  3,  2) with scale factor 2^5
 EQUB 0                 \ Point ID 199 is ( 0,  0,  4) with scale factor 2^4
 EQUB 2                 \ Point ID 200 is ( 2,  3,  4) with scale factor 2^5
 EQUB 0                 \ Point ID 201 is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 202 is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 203 is ( 0,  0, 12) with scale factor 2^4
 EQUB 11                \ Point ID 204 is (11,  0,  0) with scale factor 2^5
 EQUB 12                \ Point ID 205 is (12,  0,  0) with scale factor 2^4
 EQUB 11                \ Point ID 206 is (11,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 207 is ( 0,  8,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 208 is ( 0,  8,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 209 is ( 0,  8,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 210 is ( 0,  8,  0) with scale factor 2^4
 EQUB 4                 \ Point ID 211 is ( 4,  1,  4) with scale factor 2^7
 EQUB 1                 \ Point ID 212 is ( 1,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 213 is ( 0,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 214 is ( 0,  0,  5) with scale factor 2^8
 EQUB 4                 \ Point ID 215 is ( 4,  2,  5) with scale factor 2^7

\ ******************************************************************************
\
\       Name: yObjectPoint
\       Type: Variable
\   Category: 3D geometry
\    Summary: Scaled y-coordinates of the points that make up objects, relative
\             to the object's anchor point
\
\ ------------------------------------------------------------------------------
\
\ See xObjectPoint for an explanation of object points.
\
\ ******************************************************************************

.yObjectPoint

 EQUB 61                \ Point ID 0   is (13, 61, 13) with scale factor 2^0
 EQUB 0                 \ Point ID 1   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 2   is ( 0,  0, 12) with scale factor 2^9
 EQUB 0                 \ Point ID 3   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 4   is ( 8,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 5   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 6   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 7   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 8   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 9   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 10  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 11  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 12  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 13  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 14  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 15  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 16  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 17  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 18  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 19  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 20  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 21  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 22  is ( 0,  0,  8) with scale factor 2^4
 EQUB 0                 \ Point ID 23  is ( 0,  0,  8) with scale factor 2^4
 EQUB 0                 \ Point ID 24  is (10,  0,  0) with scale factor 2^6
 EQUB 1                 \ Point ID 25  is ( 0,  1,  0) with scale factor 2^8
 EQUB 1                 \ Point ID 26  is ( 0,  1,  0) with scale factor 2^8
 EQUB 1                 \ Point ID 27  is ( 0,  1,  0) with scale factor 2^8
 EQUB 1                 \ Point ID 28  is ( 0,  1,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 29  is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 30  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 31  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 32  is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 33  is ( 0,  0, 10) with scale factor 2^5
 EQUB 0                 \ Point ID 34  is ( 0,  0, 12) with scale factor 2^4
 EQUB 0                 \ Point ID 35  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 36  is ( 4,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 37  is ( 0,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 38  is (12,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 39  is ( 5,  0, 10) with scale factor 2^5
 EQUB 0                 \ Point ID 40  is ( 8,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 41  is ( 0,  0,  8) with scale factor 2^3
 EQUB 10                \ Point ID 42  is ( 0, 10,  0) with scale factor 2^3
 EQUB 10                \ Point ID 43  is ( 0, 10,  0) with scale factor 2^3
 EQUB 0                 \ Point ID 44  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 45  is ( 0,  0,  0) with scale factor 2^0
 EQUB 10                \ Point ID 46  is ( 0, 10,  0) with scale factor 2^3
 EQUB 10                \ Point ID 47  is ( 0, 10,  0) with scale factor 2^3
 EQUB 0                 \ Point ID 48  is (12,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 49  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 50  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 51  is (12,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 52  is (11,  0,  0) with scale factor 2^6
 EQUB 10                \ Point ID 53  is ( 0, 10,  0) with scale factor 2^4
 EQUB 10                \ Point ID 54  is ( 0, 10,  0) with scale factor 2^4
 EQUB 10                \ Point ID 55  is ( 0, 10,  0) with scale factor 2^4
 EQUB 10                \ Point ID 56  is ( 0, 10,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 57  is ( 2,  0, 14) with scale factor 2^8
 EQUB 0                 \ Point ID 58  is ( 1,  0, 11) with scale factor 2^8
 EQUB 0                 \ Point ID 59  is ( 3,  0,  9) with scale factor 2^9
 EQUB 0                 \ Point ID 60  is ( 6,  0, 12) with scale factor 2^8
 EQUB 0                 \ Point ID 61  is (10,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 62  is ( 3,  0,  9) with scale factor 2^7
 EQUB 0                 \ Point ID 63  is ( 9,  0, 15) with scale factor 2^6
 EQUB 0                 \ Point ID 64  is ( 6,  0, 13) with scale factor 2^8
 EQUB 0                 \ Point ID 65  is (13,  0,  3) with scale factor 2^4
 EQUB 0                 \ Point ID 66  is ( 0,  0, 14) with scale factor 2^9
 EQUB 0                 \ Point ID 67  is ( 1,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 68  is ( 5,  0, 12) with scale factor 2^9
 EQUB 0                 \ Point ID 69  is ( 1,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 70  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 71  is ( 9,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 72  is ( 0,  0,  9) with scale factor 2^5
 EQUB 0                 \ Point ID 73  is ( 8,  0,  6) with scale factor 2^9
 EQUB 0                 \ Point ID 74  is ( 0,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 75  is (14,  0,  7) with scale factor 2^9
 EQUB 0                 \ Point ID 76  is ( 0,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 77  is (13,  0,  2) with scale factor 2^9
 EQUB 0                 \ Point ID 78  is ( 5,  0, 13) with scale factor 2^4
 EQUB 0                 \ Point ID 79  is (12,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 80  is (15,  0, 15) with scale factor 2^1
 EQUB 12                \ Point ID 81  is ( 0, 12,  0) with scale factor 2^2
 EQUB 12                \ Point ID 82  is ( 7, 12,  7) with scale factor 2^1
 EQUB 7                 \ Point ID 83  is ( 6,  7, 11) with scale factor 2^2
 EQUB 8                 \ Point ID 84  is (12,  8,  5) with scale factor 2^2
 EQUB 10                \ Point ID 85  is ( 0, 10,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 86  is ( 0,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 87  is ( 8,  0,  0) with scale factor 2^4
 EQUB 2                 \ Point ID 88  is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 89  is (15,  0, 15) with scale factor 2^1
 EQUB 10                \ Point ID 90  is ( 0, 10,  0) with scale factor 2^2
 EQUB 12                \ Point ID 91  is ( 4, 12,  4) with scale factor 2^1
 EQUB 5                 \ Point ID 92  is ( 3,  5, 12) with scale factor 2^2
 EQUB 7                 \ Point ID 93  is (10,  7,  8) with scale factor 2^2
 EQUB 10                \ Point ID 94  is ( 0, 10,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 95  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 96  is ( 0,  0,  1) with scale factor 2^8
 EQUB 0                 \ Point ID 97  is (10,  0,  0) with scale factor 2^1
 EQUB 0                 \ Point ID 98  is ( 0,  0,  1) with scale factor 2^8
 EQUB 2                 \ Point ID 99  is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 100 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 101 is ( 0,  0, 11) with scale factor 2^4
 EQUB 0                 \ Point ID 102 is ( 0,  0, 10) with scale factor 2^4
 EQUB 0                 \ Point ID 103 is (11,  0,  7) with scale factor 2^8
 EQUB 0                 \ Point ID 104 is (11,  0,  4) with scale factor 2^9
 EQUB 0                 \ Point ID 105 is (13,  0, 13) with scale factor 2^3
 EQUB 0                 \ Point ID 106 is (14,  0,  0) with scale factor 2^9
 EQUB 0                 \ Point ID 107 is ( 4,  0, 10) with scale factor 2^3
 EQUB 0                 \ Point ID 108 is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 109 is (13,  0,  3) with scale factor 2^8
 EQUB 0                 \ Point ID 110 is (12,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 111 is (13,  0, 10) with scale factor 2^9
 EQUB 0                 \ Point ID 112 is ( 4,  0, 12) with scale factor 2^8
 EQUB 0                 \ Point ID 113 is (14,  0,  1) with scale factor 2^9
 EQUB 0                 \ Point ID 114 is ( 0,  0, 12) with scale factor 2^8
 EQUB 0                 \ Point ID 115 is ( 3,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 116 is (15,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 117 is (10,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 118 is (11,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 119 is ( 2,  0, 14) with scale factor 2^8
 EQUB 0                 \ Point ID 120 is (14,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 121 is ( 0,  0,  9) with scale factor 2^8
 EQUB 0                 \ Point ID 122 is (11,  0,  7) with scale factor 2^9
 EQUB 0                 \ Point ID 123 is (10,  0,  3) with scale factor 2^9
 EQUB 0                 \ Point ID 124 is (10,  0,  3) with scale factor 2^9
 EQUB 0                 \ Point ID 125 is ( 5,  0,  9) with scale factor 2^9
 EQUB 0                 \ Point ID 126 is (14,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 127 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 128 is ( 0,  0,  7) with scale factor 2^8
 EQUB 0                 \ Point ID 129 is (11,  0, 14) with scale factor 2^8
 EQUB 0                 \ Point ID 130 is (14,  0, 10) with scale factor 2^8
 EQUB 0                 \ Point ID 131 is ( 5,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 132 is ( 4,  0, 14) with scale factor 2^8
 EQUB 0                 \ Point ID 133 is ( 9,  0,  4) with scale factor 2^9
 EQUB 0                 \ Point ID 134 is (10,  0,  2) with scale factor 2^9
 EQUB 0                 \ Point ID 135 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 136 is ( 1,  0, 15) with scale factor 2^8
 EQUB 0                 \ Point ID 137 is ( 5,  0, 10) with scale factor 2^9
 EQUB 0                 \ Point ID 138 is (13,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 139 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 140 is ( 0,  0, 11) with scale factor 2^8
 EQUB 0                 \ Point ID 141 is (13,  0,  9) with scale factor 2^8
 EQUB 0                 \ Point ID 142 is (15,  0,  0) with scale factor 2^7
 EQUB 0                 \ Point ID 143 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 144 is ( 0,  0, 13) with scale factor 2^8
 EQUB 0                 \ Point ID 145 is ( 9,  0,  9) with scale factor 2^9
 EQUB 0                 \ Point ID 146 is (13,  0, 11) with scale factor 2^8
 EQUB 0                 \ Point ID 147 is (15,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 148 is (11,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 149 is ( 0,  0, 11) with scale factor 2^8
 EQUB 0                 \ Point ID 150 is (11,  0, 13) with scale factor 2^8
 EQUB 0                 \ Point ID 151 is (13,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 152 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 153 is ( 3,  0,  8) with scale factor 2^8
 EQUB 0                 \ Point ID 154 is (10,  0,  7) with scale factor 2^8
 EQUB 0                 \ Point ID 155 is ( 8,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 156 is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 157 is ( 0,  0,  6) with scale factor 2^8
 EQUB 0                 \ Point ID 158 is ( 4,  0,  8) with scale factor 2^8
 EQUB 0                 \ Point ID 159 is (12,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 160 is ( 0,  0,  6) with scale factor 2^8
 EQUB 0                 \ Point ID 161 is ( 6,  0,  9) with scale factor 2^9
 EQUB 0                 \ Point ID 162 is (14,  0, 12) with scale factor 2^8
 EQUB 0                 \ Point ID 163 is (11,  0,  0) with scale factor 2^7
 EQUB 0                 \ Point ID 164 is ( 0,  0,  3) with scale factor 2^8
 EQUB 0                 \ Point ID 165 is ( 5,  0, 12) with scale factor 2^9
 EQUB 0                 \ Point ID 166 is (10,  0,  9) with scale factor 2^9
 EQUB 0                 \ Point ID 167 is (14,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 168 is ( 0,  0, 12) with scale factor 2^8
 EQUB 0                 \ Point ID 169 is ( 5,  0, 11) with scale factor 2^9
 EQUB 0                 \ Point ID 170 is (11,  0,  7) with scale factor 2^8
 EQUB 0                 \ Point ID 171 is ( 5,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 172 is ( 0,  0,  9) with scale factor 2^8
 EQUB 0                 \ Point ID 173 is ( 5,  0,  8) with scale factor 2^9
 EQUB 0                 \ Point ID 174 is (13,  0, 13) with scale factor 2^8
 EQUB 0                 \ Point ID 175 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 176 is ( 0,  0,  8) with scale factor 2^8
 EQUB 0                 \ Point ID 177 is ( 2,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 178 is ( 0,  0, 12) with scale factor 2^0
 EQUB 0                 \ Point ID 179 is (12,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 180 is (14,  0, 14) with scale factor 2^2
 EQUB 0                 \ Point ID 181 is ( 5,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 182 is ( 5,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 183 is ( 0,  0,  3) with scale factor 2^2
 EQUB 0                 \ Point ID 184 is ( 3,  0,  0) with scale factor 2^2
 EQUB 0                 \ Point ID 185 is (14,  0, 14) with scale factor 2^2
 EQUB 4                 \ Point ID 186 is ( 3,  4,  3) with scale factor 2^2
 EQUB 0                 \ Point ID 187 is ( 5,  0,  5) with scale factor 2^8
 EQUB 0                 \ Point ID 188 is ( 0,  0,  3) with scale factor 2^2
 EQUB 0                 \ Point ID 189 is ( 3,  0,  0) with scale factor 2^2
 EQUB 0                 \ Point ID 190 is (14,  0, 14) with scale factor 2^2
 EQUB 4                 \ Point ID 191 is ( 3,  4,  3) with scale factor 2^2
 EQUB 0                 \ Point ID 192 is ( 9,  0,  9) with scale factor 2^7
 EQUB 0                 \ Point ID 193 is ( 4,  0,  5) with scale factor 2^5
 EQUB 0                 \ Point ID 194 is ( 5,  0,  4) with scale factor 2^5
 EQUB 0                 \ Point ID 195 is ( 9,  0,  8) with scale factor 2^6
 EQUB 4                 \ Point ID 196 is ( 7,  4,  5) with scale factor 2^5
 EQUB 0                 \ Point ID 197 is ( 4,  0,  0) with scale factor 2^4
 EQUB 3                 \ Point ID 198 is ( 4,  3,  2) with scale factor 2^5
 EQUB 0                 \ Point ID 199 is ( 0,  0,  4) with scale factor 2^4
 EQUB 3                 \ Point ID 200 is ( 2,  3,  4) with scale factor 2^5
 EQUB 2                 \ Point ID 201 is ( 0,  2,  0) with scale factor 2^8
 EQUB 2                 \ Point ID 202 is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 203 is ( 0,  0, 12) with scale factor 2^4
 EQUB 0                 \ Point ID 204 is (11,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 205 is (12,  0,  0) with scale factor 2^4
 EQUB 0                 \ Point ID 206 is (11,  0,  0) with scale factor 2^5
 EQUB 8                 \ Point ID 207 is ( 0,  8,  0) with scale factor 2^4
 EQUB 8                 \ Point ID 208 is ( 0,  8,  0) with scale factor 2^4
 EQUB 8                 \ Point ID 209 is ( 0,  8,  0) with scale factor 2^4
 EQUB 8                 \ Point ID 210 is ( 0,  8,  0) with scale factor 2^4
 EQUB 1                 \ Point ID 211 is ( 4,  1,  4) with scale factor 2^7
 EQUB 0                 \ Point ID 212 is ( 1,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 213 is ( 0,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 214 is ( 0,  0,  5) with scale factor 2^8
 EQUB 2                 \ Point ID 215 is ( 4,  2,  5) with scale factor 2^7

\ ******************************************************************************
\
\       Name: zObjectPoint
\       Type: Variable
\   Category: 3D geometry
\    Summary: Scaled y-coordinates of the points that make up objects, relative
\             to the object's anchor point
\
\ ------------------------------------------------------------------------------
\
\ See xObjectPoint for an explanation of object points.
\
\ ******************************************************************************

.zObjectPoint

 EQUB 13                \ Point ID 0   is (13, 61, 13) with scale factor 2^0
 EQUB 0                 \ Point ID 1   is ( 0,  0,  0) with scale factor 2^0
 EQUB 156               \ Point ID 2   is ( 0,  0, 12) with scale factor 2^9
 EQUB 0                 \ Point ID 3   is ( 0,  0,  0) with scale factor 2^0
 EQUB 80                \ Point ID 4   is ( 8,  0,  0) with scale factor 2^5
 EQUB 0                 \ Point ID 5   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 6   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 7   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 8   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 9   is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 10  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 11  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 12  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 13  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 14  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 15  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 16  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 17  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 18  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 19  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 20  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 21  is ( 0,  0,  0) with scale factor 2^0
 EQUB 72                \ Point ID 22  is ( 0,  0,  8) with scale factor 2^4
 EQUB 72                \ Point ID 23  is ( 0,  0,  8) with scale factor 2^4
 EQUB 96                \ Point ID 24  is (10,  0,  0) with scale factor 2^6
 EQUB 128               \ Point ID 25  is ( 0,  1,  0) with scale factor 2^8
 EQUB 128               \ Point ID 26  is ( 0,  1,  0) with scale factor 2^8
 EQUB 128               \ Point ID 27  is ( 0,  1,  0) with scale factor 2^8
 EQUB 128               \ Point ID 28  is ( 0,  1,  0) with scale factor 2^8
 EQUB 128               \ Point ID 29  is ( 4,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 30  is ( 0,  0,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 31  is ( 0,  0,  0) with scale factor 2^0
 EQUB 128               \ Point ID 32  is ( 4,  0,  0) with scale factor 2^8
 EQUB 90                \ Point ID 33  is ( 0,  0, 10) with scale factor 2^5
 EQUB 76                \ Point ID 34  is ( 0,  0, 12) with scale factor 2^4
 EQUB 0                 \ Point ID 35  is ( 0,  0,  0) with scale factor 2^0
 EQUB 130               \ Point ID 36  is ( 4,  0,  2) with scale factor 2^8
 EQUB 130               \ Point ID 37  is ( 0,  0,  2) with scale factor 2^8
 EQUB 64                \ Point ID 38  is (12,  0,  0) with scale factor 2^4
 EQUB 90                \ Point ID 39  is ( 5,  0, 10) with scale factor 2^5
 EQUB 64                \ Point ID 40  is ( 8,  0,  0) with scale factor 2^4
 EQUB 56                \ Point ID 41  is ( 0,  0,  8) with scale factor 2^3
 EQUB 48                \ Point ID 42  is ( 0, 10,  0) with scale factor 2^3
 EQUB 48                \ Point ID 43  is ( 0, 10,  0) with scale factor 2^3
 EQUB 56                \ Point ID 44  is ( 0,  0,  8) with scale factor 2^3
 EQUB 0                 \ Point ID 45  is ( 0,  0,  0) with scale factor 2^0
 EQUB 48                \ Point ID 46  is ( 0, 10,  0) with scale factor 2^3
 EQUB 48                \ Point ID 47  is ( 0, 10,  0) with scale factor 2^3
 EQUB 80                \ Point ID 48  is (12,  0,  0) with scale factor 2^5
 EQUB 56                \ Point ID 49  is ( 0,  0,  8) with scale factor 2^3
 EQUB 56                \ Point ID 50  is ( 0,  0,  8) with scale factor 2^3
 EQUB 80                \ Point ID 51  is (12,  0,  0) with scale factor 2^5
 EQUB 96                \ Point ID 52  is (11,  0,  0) with scale factor 2^6
 EQUB 64                \ Point ID 53  is ( 0, 10,  0) with scale factor 2^4
 EQUB 64                \ Point ID 54  is ( 0, 10,  0) with scale factor 2^4
 EQUB 64                \ Point ID 55  is ( 0, 10,  0) with scale factor 2^4
 EQUB 64                \ Point ID 56  is ( 0, 10,  0) with scale factor 2^4
 EQUB 142               \ Point ID 57  is ( 2,  0, 14) with scale factor 2^8
 EQUB 139               \ Point ID 58  is ( 1,  0, 11) with scale factor 2^8
 EQUB 153               \ Point ID 59  is ( 3,  0,  9) with scale factor 2^9
 EQUB 140               \ Point ID 60  is ( 6,  0, 12) with scale factor 2^8
 EQUB 129               \ Point ID 61  is (10,  0,  1) with scale factor 2^8
 EQUB 121               \ Point ID 62  is ( 3,  0,  9) with scale factor 2^7
 EQUB 111               \ Point ID 63  is ( 9,  0, 15) with scale factor 2^6
 EQUB 141               \ Point ID 64  is ( 6,  0, 13) with scale factor 2^8
 EQUB 67                \ Point ID 65  is (13,  0,  3) with scale factor 2^4
 EQUB 158               \ Point ID 66  is ( 0,  0, 14) with scale factor 2^9
 EQUB 128               \ Point ID 67  is ( 1,  0,  0) with scale factor 2^8
 EQUB 156               \ Point ID 68  is ( 5,  0, 12) with scale factor 2^9
 EQUB 128               \ Point ID 69  is ( 1,  0,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 70  is ( 0,  0,  0) with scale factor 2^0
 EQUB 80                \ Point ID 71  is ( 9,  0,  0) with scale factor 2^5
 EQUB 89                \ Point ID 72  is ( 0,  0,  9) with scale factor 2^5
 EQUB 150               \ Point ID 73  is ( 8,  0,  6) with scale factor 2^9
 EQUB 129               \ Point ID 74  is ( 0,  0,  1) with scale factor 2^8
 EQUB 151               \ Point ID 75  is (14,  0,  7) with scale factor 2^9
 EQUB 129               \ Point ID 76  is ( 0,  0,  1) with scale factor 2^8
 EQUB 146               \ Point ID 77  is (13,  0,  2) with scale factor 2^9
 EQUB 77                \ Point ID 78  is ( 5,  0, 13) with scale factor 2^4
 EQUB 128               \ Point ID 79  is (12,  0,  0) with scale factor 2^8
 EQUB 31                \ Point ID 80  is (15,  0, 15) with scale factor 2^1
 EQUB 32                \ Point ID 81  is ( 0, 12,  0) with scale factor 2^2
 EQUB 23                \ Point ID 82  is ( 7, 12,  7) with scale factor 2^1
 EQUB 43                \ Point ID 83  is ( 6,  7, 11) with scale factor 2^2
 EQUB 37                \ Point ID 84  is (12,  8,  5) with scale factor 2^2
 EQUB 0                 \ Point ID 85  is ( 0, 10,  0) with scale factor 2^0
 EQUB 129               \ Point ID 86  is ( 0,  0,  1) with scale factor 2^8
 EQUB 64                \ Point ID 87  is ( 8,  0,  0) with scale factor 2^4
 EQUB 128               \ Point ID 88  is ( 0,  2,  0) with scale factor 2^8
 EQUB 31                \ Point ID 89  is (15,  0, 15) with scale factor 2^1
 EQUB 32                \ Point ID 90  is ( 0, 10,  0) with scale factor 2^2
 EQUB 20                \ Point ID 91  is ( 4, 12,  4) with scale factor 2^1
 EQUB 44                \ Point ID 92  is ( 3,  5, 12) with scale factor 2^2
 EQUB 40                \ Point ID 93  is (10,  7,  8) with scale factor 2^2
 EQUB 0                 \ Point ID 94  is ( 0, 10,  0) with scale factor 2^0
 EQUB 0                 \ Point ID 95  is ( 0,  0,  0) with scale factor 2^0
 EQUB 129               \ Point ID 96  is ( 0,  0,  1) with scale factor 2^8
 EQUB 16                \ Point ID 97  is (10,  0,  0) with scale factor 2^1
 EQUB 129               \ Point ID 98  is ( 0,  0,  1) with scale factor 2^8
 EQUB 128               \ Point ID 99  is ( 0,  2,  0) with scale factor 2^8
 EQUB 0                 \ Point ID 100 is ( 0,  0,  0) with scale factor 2^0
 EQUB 75                \ Point ID 101 is ( 0,  0, 11) with scale factor 2^4
 EQUB 74                \ Point ID 102 is ( 0,  0, 10) with scale factor 2^4
 EQUB 135               \ Point ID 103 is (11,  0,  7) with scale factor 2^8
 EQUB 148               \ Point ID 104 is (11,  0,  4) with scale factor 2^9
 EQUB 61                \ Point ID 105 is (13,  0, 13) with scale factor 2^3
 EQUB 144               \ Point ID 106 is (14,  0,  0) with scale factor 2^9
 EQUB 58                \ Point ID 107 is ( 4,  0, 10) with scale factor 2^3
 EQUB 128               \ Point ID 108 is ( 4,  0,  0) with scale factor 2^8
 EQUB 131               \ Point ID 109 is (13,  0,  3) with scale factor 2^8
 EQUB 128               \ Point ID 110 is (12,  0,  0) with scale factor 2^8
 EQUB 154               \ Point ID 111 is (13,  0, 10) with scale factor 2^9
 EQUB 140               \ Point ID 112 is ( 4,  0, 12) with scale factor 2^8
 EQUB 145               \ Point ID 113 is (14,  0,  1) with scale factor 2^9
 EQUB 140               \ Point ID 114 is ( 0,  0, 12) with scale factor 2^8
 EQUB 133               \ Point ID 115 is ( 3,  0,  5) with scale factor 2^8
 EQUB 128               \ Point ID 116 is (15,  0,  0) with scale factor 2^8
 EQUB 133               \ Point ID 117 is (10,  0,  5) with scale factor 2^8
 EQUB 132               \ Point ID 118 is (11,  0,  4) with scale factor 2^8
 EQUB 142               \ Point ID 119 is ( 2,  0, 14) with scale factor 2^8
 EQUB 64                \ Point ID 120 is (14,  0,  0) with scale factor 2^4
 EQUB 137               \ Point ID 121 is ( 0,  0,  9) with scale factor 2^8
 EQUB 151               \ Point ID 122 is (11,  0,  7) with scale factor 2^9
 EQUB 147               \ Point ID 123 is (10,  0,  3) with scale factor 2^9
 EQUB 147               \ Point ID 124 is (10,  0,  3) with scale factor 2^9
 EQUB 153               \ Point ID 125 is ( 5,  0,  9) with scale factor 2^9
 EQUB 130               \ Point ID 126 is (14,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 127 is ( 0,  0,  0) with scale factor 2^0
 EQUB 135               \ Point ID 128 is ( 0,  0,  7) with scale factor 2^8
 EQUB 142               \ Point ID 129 is (11,  0, 14) with scale factor 2^8
 EQUB 138               \ Point ID 130 is (14,  0, 10) with scale factor 2^8
 EQUB 128               \ Point ID 131 is ( 5,  0,  0) with scale factor 2^8
 EQUB 142               \ Point ID 132 is ( 4,  0, 14) with scale factor 2^8
 EQUB 148               \ Point ID 133 is ( 9,  0,  4) with scale factor 2^9
 EQUB 146               \ Point ID 134 is (10,  0,  2) with scale factor 2^9
 EQUB 0                 \ Point ID 135 is ( 0,  0,  0) with scale factor 2^0
 EQUB 143               \ Point ID 136 is ( 1,  0, 15) with scale factor 2^8
 EQUB 154               \ Point ID 137 is ( 5,  0, 10) with scale factor 2^9
 EQUB 132               \ Point ID 138 is (13,  0,  4) with scale factor 2^8
 EQUB 0                 \ Point ID 139 is ( 0,  0,  0) with scale factor 2^0
 EQUB 139               \ Point ID 140 is ( 0,  0, 11) with scale factor 2^8
 EQUB 137               \ Point ID 141 is (13,  0,  9) with scale factor 2^8
 EQUB 112               \ Point ID 142 is (15,  0,  0) with scale factor 2^7
 EQUB 128               \ Point ID 143 is ( 2,  0,  0) with scale factor 2^8
 EQUB 141               \ Point ID 144 is ( 0,  0, 13) with scale factor 2^8
 EQUB 153               \ Point ID 145 is ( 9,  0,  9) with scale factor 2^9
 EQUB 139               \ Point ID 146 is (13,  0, 11) with scale factor 2^8
 EQUB 133               \ Point ID 147 is (15,  0,  5) with scale factor 2^8
 EQUB 128               \ Point ID 148 is (11,  0,  0) with scale factor 2^8
 EQUB 139               \ Point ID 149 is ( 0,  0, 11) with scale factor 2^8
 EQUB 141               \ Point ID 150 is (11,  0, 13) with scale factor 2^8
 EQUB 130               \ Point ID 151 is (13,  0,  2) with scale factor 2^8
 EQUB 128               \ Point ID 152 is ( 2,  0,  0) with scale factor 2^8
 EQUB 136               \ Point ID 153 is ( 3,  0,  8) with scale factor 2^8
 EQUB 135               \ Point ID 154 is (10,  0,  7) with scale factor 2^8
 EQUB 130               \ Point ID 155 is ( 8,  0,  2) with scale factor 2^8
 EQUB 0                 \ Point ID 156 is ( 0,  0,  0) with scale factor 2^0
 EQUB 134               \ Point ID 157 is ( 0,  0,  6) with scale factor 2^8
 EQUB 136               \ Point ID 158 is ( 4,  0,  8) with scale factor 2^8
 EQUB 128               \ Point ID 159 is (12,  0,  0) with scale factor 2^8
 EQUB 134               \ Point ID 160 is ( 0,  0,  6) with scale factor 2^8
 EQUB 153               \ Point ID 161 is ( 6,  0,  9) with scale factor 2^9
 EQUB 140               \ Point ID 162 is (14,  0, 12) with scale factor 2^8
 EQUB 112               \ Point ID 163 is (11,  0,  0) with scale factor 2^7
 EQUB 131               \ Point ID 164 is ( 0,  0,  3) with scale factor 2^8
 EQUB 156               \ Point ID 165 is ( 5,  0, 12) with scale factor 2^9
 EQUB 153               \ Point ID 166 is (10,  0,  9) with scale factor 2^9
 EQUB 128               \ Point ID 167 is (14,  0,  0) with scale factor 2^8
 EQUB 140               \ Point ID 168 is ( 0,  0, 12) with scale factor 2^8
 EQUB 155               \ Point ID 169 is ( 5,  0, 11) with scale factor 2^9
 EQUB 135               \ Point ID 170 is (11,  0,  7) with scale factor 2^8
 EQUB 128               \ Point ID 171 is ( 5,  0,  0) with scale factor 2^8
 EQUB 137               \ Point ID 172 is ( 0,  0,  9) with scale factor 2^8
 EQUB 152               \ Point ID 173 is ( 5,  0,  8) with scale factor 2^9
 EQUB 141               \ Point ID 174 is (13,  0, 13) with scale factor 2^8
 EQUB 128               \ Point ID 175 is ( 2,  0,  0) with scale factor 2^8
 EQUB 136               \ Point ID 176 is ( 0,  0,  8) with scale factor 2^8
 EQUB 128               \ Point ID 177 is ( 2,  0,  0) with scale factor 2^8
 EQUB 12                \ Point ID 178 is ( 0,  0, 12) with scale factor 2^0
 EQUB 0                 \ Point ID 179 is (12,  0,  0) with scale factor 2^0
 EQUB 46                \ Point ID 180 is (14,  0, 14) with scale factor 2^2
 EQUB 133               \ Point ID 181 is ( 5,  0,  5) with scale factor 2^8
 EQUB 133               \ Point ID 182 is ( 5,  0,  5) with scale factor 2^8
 EQUB 35                \ Point ID 183 is ( 0,  0,  3) with scale factor 2^2
 EQUB 32                \ Point ID 184 is ( 3,  0,  0) with scale factor 2^2
 EQUB 46                \ Point ID 185 is (14,  0, 14) with scale factor 2^2
 EQUB 35                \ Point ID 186 is ( 3,  4,  3) with scale factor 2^2
 EQUB 133               \ Point ID 187 is ( 5,  0,  5) with scale factor 2^8
 EQUB 35                \ Point ID 188 is ( 0,  0,  3) with scale factor 2^2
 EQUB 32                \ Point ID 189 is ( 3,  0,  0) with scale factor 2^2
 EQUB 46                \ Point ID 190 is (14,  0, 14) with scale factor 2^2
 EQUB 35                \ Point ID 191 is ( 3,  4,  3) with scale factor 2^2
 EQUB 121               \ Point ID 192 is ( 9,  0,  9) with scale factor 2^7
 EQUB 85                \ Point ID 193 is ( 4,  0,  5) with scale factor 2^5
 EQUB 84                \ Point ID 194 is ( 5,  0,  4) with scale factor 2^5
 EQUB 104               \ Point ID 195 is ( 9,  0,  8) with scale factor 2^6
 EQUB 85                \ Point ID 196 is ( 7,  4,  5) with scale factor 2^5
 EQUB 64                \ Point ID 197 is ( 4,  0,  0) with scale factor 2^4
 EQUB 82                \ Point ID 198 is ( 4,  3,  2) with scale factor 2^5
 EQUB 68                \ Point ID 199 is ( 0,  0,  4) with scale factor 2^4
 EQUB 84                \ Point ID 200 is ( 2,  3,  4) with scale factor 2^5
 EQUB 128               \ Point ID 201 is ( 0,  2,  0) with scale factor 2^8
 EQUB 128               \ Point ID 202 is ( 0,  2,  0) with scale factor 2^8
 EQUB 76                \ Point ID 203 is ( 0,  0, 12) with scale factor 2^4
 EQUB 80                \ Point ID 204 is (11,  0,  0) with scale factor 2^5
 EQUB 64                \ Point ID 205 is (12,  0,  0) with scale factor 2^4
 EQUB 80                \ Point ID 206 is (11,  0,  0) with scale factor 2^5
 EQUB 64                \ Point ID 207 is ( 0,  8,  0) with scale factor 2^4
 EQUB 64                \ Point ID 208 is ( 0,  8,  0) with scale factor 2^4
 EQUB 64                \ Point ID 209 is ( 0,  8,  0) with scale factor 2^4
 EQUB 64                \ Point ID 210 is ( 0,  8,  0) with scale factor 2^4
 EQUB 116               \ Point ID 211 is ( 4,  1,  4) with scale factor 2^7
 EQUB 132               \ Point ID 212 is ( 1,  0,  4) with scale factor 2^8
 EQUB 130               \ Point ID 213 is ( 0,  0,  2) with scale factor 2^8
 EQUB 133               \ Point ID 214 is ( 0,  0,  5) with scale factor 2^8
 EQUB 117               \ Point ID 215 is ( 4,  2,  5) with scale factor 2^7

\ ******************************************************************************
\
\       Name: xRadarBuffer
\       Type: Variable
\   Category: Dashboard
\    Summary: The x-coordinates of the runway and alien on the radar
\
\ ******************************************************************************

.xRadarBuffer

 EQUB &8A               \ The x-coordinate of the runway on the radar, stored so
                        \ we can erase it again

 EQUB &8A               \ The x-coordinate of the alien on the radar, stored so
                        \ we can erase it again

\ ******************************************************************************
\
\       Name: yRadarBuffer
\       Type: Variable
\   Category: Dashboard
\    Summary: The y-coordinates of the runway and alien on the radar
\
\ ******************************************************************************

.yRadarBuffer

 EQUB &D0               \ The y-coordinate of the runway on the radar, stored so
                        \ we can erase it again

 EQUB &D0               \ The y-coordinate of the alien on the radar, stored so
                        \ we can erase it again

\ ******************************************************************************
\
\       Name: L368C
\       Type: Variable
\   Category: Theme
\    Summary: 
\
\ ******************************************************************************

.L368C

 EQUB &48

\ ******************************************************************************
\
\       Name: L368D
\       Type: Variable
\   Category: Bullets
\    Summary: 
\
\ ******************************************************************************

.L368D

 EQUB &49

\ ******************************************************************************
\
\       Name: L368E
\       Type: Variable
\   Category: Bullets
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called EPTR in the original source.
\
\ ******************************************************************************

.L368E

 EQUB &3D

\ ******************************************************************************
\
\       Name: L368F
\       Type: Variable
\   Category: Theme
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called EPLO in the original source.
\
\ ******************************************************************************

.L368F

 EQUB &26               \ Zeroed in ResetVariables
                        \
                        \ Can't fire guns if this or firingStatus are non-zero

\ ******************************************************************************
\
\       Name: L3690
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ******************************************************************************

.L3690

 EQUB &34

\ ******************************************************************************
\
\       Name: L3691
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ******************************************************************************

.L3691

 EQUB &34

\ ******************************************************************************
\
\       Name: fuelLevel
\       Type: Variable
\   Category: Flight
\    Summary: The current fuel level
\
\ ******************************************************************************

.fuelLevel

 EQUB &41               \ Current fuel level
                        \
                        \   * 0 = empty
                        \
                        \   * 65 = full

 EQUB &B2, &B7          \ These bytes appear to be unused
 EQUB &BC, &C1
 EQUB &0F, &B4
 EQUB &BA, &BF
 EQUB &C8

\ ******************************************************************************
\
\       Name: scoreLo
\       Type: Variable
\   Category: Scoring
\    Summary: Score (low byte)
\
\ ******************************************************************************

.scoreLo

 EQUB &49               \ Score (low byte of a BCD number)
                        \
                        \ The score is displayed with an extra "0" added to the
                        \ end, so this contains the score divided by 10

\ ******************************************************************************
\
\       Name: scoreHi
\       Type: Variable
\   Category: Scoring
\    Summary: Score (high byte)
\
\ ******************************************************************************

.scoreHi

 EQUB &3D               \ Score (high byte of a BCD number)
                        \
                        \ The score is displayed with an extra "0" added to the
                        \ end, so this contains the score divided by 10

\ ******************************************************************************
\
\       Name: highScoreLo
\       Type: Variable
\   Category: Scoring
\    Summary: High score (high byte)
\
\ ******************************************************************************

.highScoreLo

 EQUB &26               \ High score (high byte of a BCD number)
                        \
                        \ The high score is displayed with an extra "0" added to
                        \ the end, so this contains the high score divided by 10

\ ******************************************************************************
\
\       Name: highScoreHi
\       Type: Variable
\   Category: Scoring
\    Summary: High score (low byte)
\
\ ******************************************************************************

.highScoreHi

 EQUB &34               \ High score (low byte of a BCD number)
                        \
                        \ The high score is displayed with an extra "0" added to
                        \ the end, so this contains the high score divided by 10

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

 CMP engineStatus       \ If the value of engineStatus is already the same as A,
 BEQ seng3              \ jump to seng3 to return from the subroutine

 STA engineStatus       \ Update the value of engineStatus to the new status in
                        \ A

 TAX                    \ Either turn the engine sound off (if A = 0) or turn it
 JSR ToggleEngineSound  \ on (if A is non-zero)

 LDA L4F85              \ Set A = L4F85

 LDX engineStatus       \ If the engine is now on, jump to seng1
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
\       Name: skillZoneLo
\       Type: Variable
\   Category: Scoring
\    Summary: Low byte of the skill zone coordinates for testing flying skills
\
\ ******************************************************************************

.skillZoneLo

 EQUB &A8, &00, &56     \ Bridge skill zone 0 coordinate = (&4CA8, &0000, &8656)
 EQUB &A8, &60, &56     \ Bridge skill zone 3 coordinate = (&4CA8, &0060, &8656)
 EQUB &88, &00, &56     \ Bridge skill zone 6 coordinate = (&4C88, &0000, &8656)

 EQUB &30, &00, &30     \ Town skill zone  9 coordinate = (&0430, &0000, &0330)
 EQUB &D0, &00, &70     \ Town skill zone 12 coordinate = (&04D0, &0000, &0470)
 EQUB &10, &00, &70     \ Town skill zone 15 coordinate = (&0610, &0000, &0470)
 EQUB &E0, &00, &C0     \ Town skill zone 18 coordinate = (&04E0, &0000, &03C0)

\ ******************************************************************************
\
\       Name: skillZoneHi
\       Type: Variable
\   Category: Scoring
\    Summary: High byte of the skill zone coordinates for testing flying skills
\
\ ******************************************************************************

.skillZoneHi

 EQUB &4C, &00, &86     \ Bridge skill zone 0 coordinate = (&4CA8, &0000, &8656)
 EQUB &4C, &00, &86     \ Bridge skill zone 3 coordinate = (&4CA8, &0060, &8656)
 EQUB &4C, &00, &86     \ Bridge skill zone 6 coordinate = (&4C88, &0000, &8656)

 EQUB &04, &00, &03     \ Town skill zone  9 coordinate = (&0430, &0000, &0330)
 EQUB &04, &00, &04     \ Town skill zone 12 coordinate = (&04D0, &0000, &0470)
 EQUB &06, &00, &04     \ Town skill zone 15 coordinate = (&0610, &0000, &0470)
 EQUB &04, &00, &03     \ Town skill zone 18 coordinate = (&04E0, &0000, &03C0)

\ ******************************************************************************
\
\       Name: skillZoneSize
\       Type: Variable
\   Category: Scoring
\    Summary: Sizes of the skill zones for testing flying skills
\
\ ******************************************************************************

.skillZoneSize

 EQUB &A8, &10, &18     \ Bridge skill zone 0 size = (&A8, &10, &18)
 EQUB &A8, &16, &18     \ Bridge skill zone 3 size = (&A8, &16, &18)
 EQUB &B8, &2C, &18     \ Bridge skill zone 6 size = (&B8, &2C, &18)

 EQUB &A8, &44, &28     \ Town skill zone  9 size = (&A8, &44, &28)
 EQUB &28, &84, &48     \ Town skill zone 12 size = (&28, &84, &48)
 EQUB &60, &24, &38     \ Town skill zone 15 size = (&60, &24, &38)
 EQUB &78, &20, &60     \ Town skill zone 18 size = (&78, &20, &60)

 EQUB &20               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: shift4Right
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for shifting a byte four places to the right, to
\             extract the high nibble
\
\ ------------------------------------------------------------------------------
\
\ In the table below, shift4Right,X contains the high byte of X * 16. So if X is
\ %XXXXxxxx, shift4Right,X contains %0000XXXX.
\
\ ******************************************************************************

.shift4Right

FOR I%, 0, 255

 EQUB HI(I% * 16)

NEXT

\ ******************************************************************************
\
\       Name: shift4Left
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for shifting a byte four places to the left, to
\             extract the low nibble
\
\ ------------------------------------------------------------------------------
\
\ In the table below, shift4Left,X contains the low byte of X * 16. So if X is
\ %XXXXxxxx, shift4Left,X contains %xxxx0000.
\
\ ******************************************************************************

.shift4Left

FOR I%, 0, 255

 EQUB LO(I% * 16)

NEXT

\ ******************************************************************************
\
\       Name: Lookup3900
\       Type: Variable
\   Category: Maths
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Is this a log table for multiplication?
\
\ This table contains the high byte, while bits 3 to 7 of Lookup4700 contain the
\ low byte
\
\ FOR I%, 0, 255
\
\  EQUB HI(INT(65535 - (256x - x^2 + 0.0035*x^3 + 0.00001*x^4 - ...)))
\
\ NEXT
\
\ ******************************************************************************

.Lookup3900

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
\       Name: timesTable
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for multiplication times tables
\
\ ------------------------------------------------------------------------------
\
\ In the table below, timesTable+X*16,Y contains X * Y.
\
\ To put it another way, X and Y are both in the range 0 to 15, so they are
\ 4-bit values. If, in binary, they are X = %xxxx and Y = %yyyy, then:
\
\   timesTable,%xxxxyyyy contains X * Y.
\
\ This table is used in conjunction with the highNibble and lowNibble tables to
\ look up multiplication results.
\
\ ******************************************************************************

.timesTable

FOR I%, 0, 15

 FOR J%, 0, 15

  EQUB I% * J%

 NEXT

NEXT

\ ******************************************************************************
\
\       Name: maxLineDistance
\       Type: Variable
\   Category: Visibility
\    Summary: The furthest distance at which each line is visible
\
\ ------------------------------------------------------------------------------
\
\ Lines are only shown if they are closer than the distance in this table, so
\ this table contains the maximum visible distance for each line.
\
\ The table is indexed by line ID, so for line ID X, maxLineDistance,X contains
\ the maximum distance at which that line is visible, in any of the individual
\ axes.
\
\ ******************************************************************************

.maxLineDistance

 EQUB 16                \ Line ID:   0
 EQUB 125               \ Line ID:   1
 EQUB 125               \ Line ID:   2
 EQUB 125               \ Line ID:   3
 EQUB 125               \ Line ID:   4
 EQUB 16                \ Line ID:   5
 EQUB 16                \ Line ID:   6
 EQUB 16                \ Line ID:   7
 EQUB 16                \ Line ID:   8
 EQUB 16                \ Line ID:   9
 EQUB 40                \ Line ID:  10
 EQUB 16                \ Line ID:  11
 EQUB 80                \ Line ID:  12
 EQUB 80                \ Line ID:  13
 EQUB 50                \ Line ID:  14
 EQUB 50                \ Line ID:  15
 EQUB 50                \ Line ID:  16
 EQUB 40                \ Line ID:  17
 EQUB 40                \ Line ID:  18
 EQUB 40                \ Line ID:  19
 EQUB 80                \ Line ID:  20
 EQUB 80                \ Line ID:  21
 EQUB 40                \ Line ID:  22
 EQUB 40                \ Line ID:  23
 EQUB 80                \ Line ID:  24
 EQUB 80                \ Line ID:  25
 EQUB 80                \ Line ID:  26
 EQUB 80                \ Line ID:  27
 EQUB 80                \ Line ID:  28
 EQUB 80                \ Line ID:  29
 EQUB 80                \ Line ID:  30
 EQUB 80                \ Line ID:  31
 EQUB 80                \ Line ID:  32
 EQUB 80                \ Line ID:  33
 EQUB 80                \ Line ID:  34
 EQUB 80                \ Line ID:  35
 EQUB 80                \ Line ID:  36
 EQUB 80                \ Line ID:  37
 EQUB 80                \ Line ID:  38
 EQUB 60                \ Line ID:  39
 EQUB 70                \ Line ID:  40
 EQUB 60                \ Line ID:  41
 EQUB 70                \ Line ID:  42
 EQUB 60                \ Line ID:  43
 EQUB 70                \ Line ID:  44
 EQUB 60                \ Line ID:  45
 EQUB 70                \ Line ID:  46
 EQUB 63                \ Line ID:  47
 EQUB 63                \ Line ID:  48
 EQUB 63                \ Line ID:  49
 EQUB 63                \ Line ID:  50
 EQUB 60                \ Line ID:  51
 EQUB 70                \ Line ID:  52
 EQUB 60                \ Line ID:  53
 EQUB 70                \ Line ID:  54
 EQUB 60                \ Line ID:  55
 EQUB 63                \ Line ID:  56
 EQUB 63                \ Line ID:  57
 EQUB 63                \ Line ID:  58
 EQUB 63                \ Line ID:  59
 EQUB 30                \ Line ID:  60
 EQUB 30                \ Line ID:  61
 EQUB 70                \ Line ID:  62
 EQUB 60                \ Line ID:  63
 EQUB 70                \ Line ID:  64
 EQUB 60                \ Line ID:  65
 EQUB 70                \ Line ID:  66
 EQUB 60                \ Line ID:  67
 EQUB 70                \ Line ID:  68
 EQUB 60                \ Line ID:  69
 EQUB 70                \ Line ID:  70
 EQUB 60                \ Line ID:  71
 EQUB 70                \ Line ID:  72
 EQUB 60                \ Line ID:  73
 EQUB 70                \ Line ID:  74
 EQUB 60                \ Line ID:  75
 EQUB 120               \ Line ID:  76
 EQUB 70                \ Line ID:  77
 EQUB 125               \ Line ID:  78
 EQUB 125               \ Line ID:  79
 EQUB 125               \ Line ID:  80
 EQUB 125               \ Line ID:  81
 EQUB 125               \ Line ID:  82
 EQUB 125               \ Line ID:  83
 EQUB 125               \ Line ID:  84
 EQUB 125               \ Line ID:  85
 EQUB 125               \ Line ID:  86
 EQUB 125               \ Line ID:  87
 EQUB 125               \ Line ID:  88
 EQUB 125               \ Line ID:  89
 EQUB 125               \ Line ID:  90
 EQUB 125               \ Line ID:  91
 EQUB 125               \ Line ID:  92
 EQUB 125               \ Line ID:  93
 EQUB 125               \ Line ID:  94
 EQUB 125               \ Line ID:  95
 EQUB 125               \ Line ID:  96
 EQUB 125               \ Line ID:  97
 EQUB 125               \ Line ID:  98
 EQUB 125               \ Line ID:  99
 EQUB 125               \ Line ID: 100
 EQUB 125               \ Line ID: 101
 EQUB 125               \ Line ID: 102
 EQUB 125               \ Line ID: 103
 EQUB 125               \ Line ID: 104
 EQUB 125               \ Line ID: 105
 EQUB 125               \ Line ID: 106
 EQUB 125               \ Line ID: 107
 EQUB 125               \ Line ID: 108
 EQUB 125               \ Line ID: 109
 EQUB 125               \ Line ID: 110
 EQUB 125               \ Line ID: 111
 EQUB 125               \ Line ID: 112
 EQUB 125               \ Line ID: 113
 EQUB 125               \ Line ID: 114
 EQUB 125               \ Line ID: 115
 EQUB 125               \ Line ID: 116
 EQUB 125               \ Line ID: 117
 EQUB 125               \ Line ID: 118
 EQUB 125               \ Line ID: 119
 EQUB 125               \ Line ID: 120
 EQUB 125               \ Line ID: 121
 EQUB 125               \ Line ID: 122
 EQUB 120               \ Line ID: 123
 EQUB 125               \ Line ID: 124
 EQUB 125               \ Line ID: 125
 EQUB 125               \ Line ID: 126
 EQUB 125               \ Line ID: 127
 EQUB 125               \ Line ID: 128
 EQUB 125               \ Line ID: 129
 EQUB 125               \ Line ID: 130
 EQUB 125               \ Line ID: 131
 EQUB 125               \ Line ID: 132
 EQUB 125               \ Line ID: 133
 EQUB 125               \ Line ID: 134
 EQUB 25                \ Line ID: 135
 EQUB 25                \ Line ID: 136
 EQUB 25                \ Line ID: 137
 EQUB 100               \ Line ID: 138
 EQUB 100               \ Line ID: 139
 EQUB 100               \ Line ID: 140
 EQUB 100               \ Line ID: 141
 EQUB 100               \ Line ID: 142
 EQUB 100               \ Line ID: 143
 EQUB 100               \ Line ID: 144
 EQUB 100               \ Line ID: 145
 EQUB 100               \ Line ID: 146
 EQUB 100               \ Line ID: 147
 EQUB 100               \ Line ID: 148
 EQUB 100               \ Line ID: 149
 EQUB 120               \ Line ID: 150
 EQUB 100               \ Line ID: 151
 EQUB 100               \ Line ID: 152
 EQUB 100               \ Line ID: 153
 EQUB 100               \ Line ID: 154
 EQUB 100               \ Line ID: 155
 EQUB 100               \ Line ID: 156
 EQUB 100               \ Line ID: 157
 EQUB 100               \ Line ID: 158
 EQUB 100               \ Line ID: 159
 EQUB 100               \ Line ID: 160
 EQUB 120               \ Line ID: 161
 EQUB 120               \ Line ID: 162
 EQUB 120               \ Line ID: 163
 EQUB 120               \ Line ID: 164
 EQUB 120               \ Line ID: 165
 EQUB 120               \ Line ID: 166
 EQUB 120               \ Line ID: 167
 EQUB 120               \ Line ID: 168
 EQUB 60                \ Line ID: 169
 EQUB 60                \ Line ID: 170
 EQUB 60                \ Line ID: 171
 EQUB 60                \ Line ID: 172
 EQUB 60                \ Line ID: 173
 EQUB 60                \ Line ID: 174
 EQUB 60                \ Line ID: 175
 EQUB 60                \ Line ID: 176
 EQUB 60                \ Line ID: 177
 EQUB 60                \ Line ID: 178
 EQUB 60                \ Line ID: 179
 EQUB 60                \ Line ID: 180
 EQUB 60                \ Line ID: 181
 EQUB 60                \ Line ID: 182
 EQUB 60                \ Line ID: 183
 EQUB 60                \ Line ID: 184
 EQUB 60                \ Line ID: 185
 EQUB 120               \ Line ID: 186
 EQUB 120               \ Line ID: 187
 EQUB 120               \ Line ID: 188
 EQUB 120               \ Line ID: 189
 EQUB 120               \ Line ID: 190
 EQUB 120               \ Line ID: 191

 EQUB &78, &3F          \ These bytes appear to be unused
 EQUB &0D, &03
 EQUB &B1, &10
 EQUB &2E, &64
 EQUB &6C, &70
 EQUB &32, &20
 EQUB &53, &54
 EQUB &41, &26
 EQUB &37, &36
 EQUB &0D, &03
 EQUB &B2, &19
 EQUB &2E, &64

\ ******************************************************************************
\
\       Name: maxObjDistance
\       Type: Variable
\   Category: Visibility
\    Summary: The furthest distance at which each object is visible
\
\ ------------------------------------------------------------------------------
\
\ Objects are only shown if they are closer than the distance in this table, so
\ this table contains the maximum visible distance for each object.
\
\ The table is indexed by object ID, so for object ID X, maxObjDistance,X
\ contains the maximum distance at which that object is visible, in any of the
\ individual axes.
\
\ The initial contents of the last five bytes of this table contains workspace
\ noise and is ignored. It actually contains snippets of the original source
\ code.
\
\ ******************************************************************************

.maxObjDistance

 EQUB 108               \ Object ID:  0
 EQUB 125               \ Object ID:  1
 EQUB 125               \ Object ID:  2
 EQUB 125               \ Object ID:  3
 EQUB 125               \ Object ID:  4
 EQUB 125               \ Object ID:  5
 EQUB  40               \ Object ID:  6
 EQUB  40               \ Object ID:  7
 EQUB 110               \ Object ID:  8
 EQUB 110               \ Object ID:  9
 EQUB  58               \ Object ID: 10
 EQUB  66               \ Object ID: 11
 EQUB  30               \ Object ID: 12
 EQUB  30               \ Object ID: 13
 EQUB  30               \ Object ID: 14
 EQUB  30               \ Object ID: 15
 EQUB 125               \ Object ID: 16
 EQUB 125               \ Object ID: 17
 EQUB 125               \ Object ID: 18
 EQUB 125               \ Object ID: 19
 EQUB 125               \ Object ID: 20
 EQUB 125               \ Object ID: 21
 EQUB 125               \ Object ID: 22
 EQUB 125               \ Object ID: 23
 EQUB 125               \ Object ID: 24
 EQUB 125               \ Object ID: 25
 EQUB 125               \ Object ID: 26
 EQUB 125               \ Object ID: 27
 EQUB 125               \ Object ID: 28
 EQUB 125               \ Object ID: 29
 EQUB  25               \ Object ID: 30
 EQUB  90               \ Object ID: 31
 EQUB  90               \ Object ID: 32
 EQUB  90               \ Object ID: 33
 EQUB 125               \ Object ID: 34
 EQUB  58               \ Object ID: 35
 EQUB  66               \ Object ID: 36
 EQUB  78               \ Object ID: 37
 EQUB  69               \ Object ID: 38
 EQUB  32               \ Object ID: 39

\ ******************************************************************************
\
\       Name: lineBufferR
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the start x-coordinate (R)
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.lineBufferR

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
\       Name: lineBufferW
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the max/min x-coordinate (W)
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.lineBufferW

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
\       Name: lineBufferS
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the start y-coordinate (S)
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.lineBufferS

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
\       Name: lineBufferG
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the max/min y-coordinate (G)
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.lineBufferG

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
\       Name: lineBufferT
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the line's |x-delta| (T)
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.lineBufferT

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

\ ******************************************************************************
\
\       Name: scoreText
\       Type: Variable
\   Category: Scoring
\    Summary: The high score text
\
\ ******************************************************************************

.scoreText

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
\       Name: lineEndPointId
\       Type: Variable
\   Category: 3D geometry
\    Summary: The point ID for a line's end point
\
\ ------------------------------------------------------------------------------
\
\ This table contains the point ID for each line's end point.
\
\ The table is indexed by line ID, so for line ID X, lineEndPointId,X contains
\ the point ID of the line's end point.
\
\ ******************************************************************************

.lineEndPointId

 EQUB 30                \ Line ID   0 goes from point  31 to point  30
 EQUB 2                 \ Line ID   1 goes from point   1 to point   2
 EQUB 3                 \ Line ID   2 goes from point   2 to point   3
 EQUB 4                 \ Line ID   3 goes from point   3 to point   4
 EQUB 1                 \ Line ID   4 goes from point   4 to point   1
 EQUB 7                 \ Line ID   5 goes from point   6 to point   7
 EQUB 9                 \ Line ID   6 goes from point   8 to point   9
 EQUB 11                \ Line ID   7 goes from point  10 to point  11
 EQUB 13                \ Line ID   8 goes from point  12 to point  13
 EQUB 15                \ Line ID   9 goes from point  14 to point  15
 EQUB 17                \ Line ID  10 goes from point  16 to point  17
 EQUB 19                \ Line ID  11 goes from point  18 to point  19
 EQUB 59                \ Line ID  12 goes from point 114 to point  59
 EQUB 114               \ Line ID  13 goes from point 115 to point 114
 EQUB 42                \ Line ID  14 goes from point  41 to point  42
 EQUB 43                \ Line ID  15 goes from point  42 to point  43
 EQUB 44                \ Line ID  16 goes from point  43 to point  44
 EQUB 46                \ Line ID  17 goes from point  45 to point  46
 EQUB 47                \ Line ID  18 goes from point  46 to point  47
 EQUB 48                \ Line ID  19 goes from point  47 to point  48
 EQUB 53                \ Line ID  20 goes from point  49 to point  53
 EQUB 54                \ Line ID  21 goes from point  50 to point  54
 EQUB 55                \ Line ID  22 goes from point  51 to point  55
 EQUB 56                \ Line ID  23 goes from point  52 to point  56
 EQUB 58                \ Line ID  24 goes from point  59 to point  58
 EQUB 57                \ Line ID  25 goes from point  58 to point  57
 EQUB 51                \ Line ID  26 goes from point  57 to point  51
 EQUB 60                \ Line ID  27 goes from point  52 to point  60
 EQUB 61                \ Line ID  28 goes from point  60 to point  61
 EQUB 62                \ Line ID  29 goes from point  49 to point  62
 EQUB 63                \ Line ID  30 goes from point  50 to point  63
 EQUB 64                \ Line ID  31 goes from point  62 to point  64
 EQUB 65                \ Line ID  32 goes from point  63 to point  65
 EQUB 66                \ Line ID  33 goes from point  64 to point  66
 EQUB 116               \ Line ID  34 goes from point 115 to point 116
 EQUB 113               \ Line ID  35 goes from point 116 to point 113
 EQUB 113               \ Line ID  36 goes from point 112 to point 113
 EQUB 112               \ Line ID  37 goes from point 111 to point 112
 EQUB 111               \ Line ID  38 goes from point  61 to point 111
 EQUB 67                \ Line ID  39 goes from point  65 to point  67
 EQUB 119               \ Line ID  40 goes from point  66 to point 119
 EQUB 120               \ Line ID  41 goes from point  67 to point 120
 EQUB 68                \ Line ID  42 goes from point 119 to point  68
 EQUB 69                \ Line ID  43 goes from point 120 to point  69
 EQUB 70                \ Line ID  44 goes from point  68 to point  70
 EQUB 71                \ Line ID  45 goes from point  69 to point  71
 EQUB 117               \ Line ID  46 goes from point  70 to point 117
 EQUB 81                \ Line ID  47 goes from point  80 to point  81
 EQUB 85                \ Line ID  48 goes from point  82 to point  85
 EQUB 85                \ Line ID  49 goes from point  83 to point  85
 EQUB 85                \ Line ID  50 goes from point  84 to point  85
 EQUB 118               \ Line ID  51 goes from point  71 to point 118
 EQUB 72                \ Line ID  52 goes from point 117 to point  72
 EQUB 73                \ Line ID  53 goes from point 118 to point  73
 EQUB 74                \ Line ID  54 goes from point  72 to point  74
 EQUB 75                \ Line ID  55 goes from point  73 to point  75
 EQUB 90                \ Line ID  56 goes from point  89 to point  90
 EQUB 94                \ Line ID  57 goes from point  91 to point  94
 EQUB 94                \ Line ID  58 goes from point  92 to point  94
 EQUB 94                \ Line ID  59 goes from point  93 to point  94
 EQUB 96                \ Line ID  60 goes from point  95 to point  96
 EQUB 98                \ Line ID  61 goes from point  97 to point  98
 EQUB 76                \ Line ID  62 goes from point  74 to point  76
 EQUB 77                \ Line ID  63 goes from point  75 to point  77
 EQUB 78                \ Line ID  64 goes from point  76 to point  78
 EQUB 79                \ Line ID  65 goes from point  77 to point  79
 EQUB 101               \ Line ID  66 goes from point  78 to point 101
 EQUB 100               \ Line ID  67 goes from point  79 to point 100
 EQUB 102               \ Line ID  68 goes from point 101 to point 102
 EQUB 103               \ Line ID  69 goes from point 100 to point 103
 EQUB 105               \ Line ID  70 goes from point 102 to point 105
 EQUB 104               \ Line ID  71 goes from point 103 to point 104
 EQUB 107               \ Line ID  72 goes from point 105 to point 107
 EQUB 106               \ Line ID  73 goes from point 104 to point 106
 EQUB 109               \ Line ID  74 goes from point 107 to point 109
 EQUB 109               \ Line ID  75 goes from point 106 to point 109
 EQUB 215               \ Line ID  76 goes from point 213 to point 215
 EQUB 110               \ Line ID  77 goes from point 109 to point 110
 EQUB 122               \ Line ID  78 goes from point 121 to point 122
 EQUB 121               \ Line ID  79 goes from point 177 to point 121
 EQUB 123               \ Line ID  80 goes from point 122 to point 123
 EQUB 123               \ Line ID  81 goes from point 177 to point 123
 EQUB 145               \ Line ID  82 goes from point 144 to point 145
 EQUB 145               \ Line ID  83 goes from point 146 to point 145
 EQUB 147               \ Line ID  84 goes from point 146 to point 147
 EQUB 147               \ Line ID  85 goes from point 148 to point 147
 EQUB 148               \ Line ID  86 goes from point 144 to point 148
 EQUB 158               \ Line ID  87 goes from point 157 to point 158
 EQUB 159               \ Line ID  88 goes from point 158 to point 159
 EQUB 160               \ Line ID  89 goes from point 159 to point 160
 EQUB 160               \ Line ID  90 goes from point 157 to point 160
 EQUB 161               \ Line ID  91 goes from point 164 to point 161
 EQUB 162               \ Line ID  92 goes from point 163 to point 162
 EQUB 161               \ Line ID  93 goes from point 162 to point 161
 EQUB 163               \ Line ID  94 goes from point 164 to point 163
 EQUB 168               \ Line ID  95 goes from point 165 to point 168
 EQUB 166               \ Line ID  96 goes from point 165 to point 166
 EQUB 167               \ Line ID  97 goes from point 166 to point 167
 EQUB 168               \ Line ID  98 goes from point 167 to point 168
 EQUB 172               \ Line ID  99 goes from point 169 to point 172
 EQUB 171               \ Line ID 100 goes from point 169 to point 171
 EQUB 124               \ Line ID 101 goes from point 142 to point 124
 EQUB 171               \ Line ID 102 goes from point 172 to point 171
 EQUB 175               \ Line ID 103 goes from point 176 to point 175
 EQUB 174               \ Line ID 104 goes from point 175 to point 174
 EQUB 173               \ Line ID 105 goes from point 176 to point 173
 EQUB 174               \ Line ID 106 goes from point 173 to point 174
 EQUB 151               \ Line ID 107 goes from point 150 to point 151
 EQUB 151               \ Line ID 108 goes from point 152 to point 151
 EQUB 149               \ Line ID 109 goes from point 152 to point 149
 EQUB 150               \ Line ID 110 goes from point 149 to point 150
 EQUB 138               \ Line ID 111 goes from point 139 to point 138
 EQUB 138               \ Line ID 112 goes from point 137 to point 138
 EQUB 137               \ Line ID 113 goes from point 136 to point 137
 EQUB 139               \ Line ID 114 goes from point 136 to point 139
 EQUB 133               \ Line ID 115 goes from point 132 to point 133
 EQUB 135               \ Line ID 116 goes from point 132 to point 135
 EQUB 134               \ Line ID 117 goes from point 135 to point 134
 EQUB 134               \ Line ID 118 goes from point 133 to point 134
 EQUB 129               \ Line ID 119 goes from point 128 to point 129
 EQUB 130               \ Line ID 120 goes from point 129 to point 130
 EQUB 131               \ Line ID 121 goes from point 130 to point 131
 EQUB 131               \ Line ID 122 goes from point 128 to point 131
 EQUB 209               \ Line ID 123 goes from point 203 to point 209
 EQUB 126               \ Line ID 124 goes from point 125 to point 126
 EQUB 126               \ Line ID 125 goes from point 127 to point 126
 EQUB 127               \ Line ID 126 goes from point 125 to point 127
 EQUB 141               \ Line ID 127 goes from point 140 to point 141
 EQUB 124               \ Line ID 128 goes from point 141 to point 124
 EQUB 143               \ Line ID 129 goes from point 140 to point 143
 EQUB 142               \ Line ID 130 goes from point 143 to point 142
 EQUB 154               \ Line ID 131 goes from point 153 to point 154
 EQUB 155               \ Line ID 132 goes from point 154 to point 155
 EQUB 156               \ Line ID 133 goes from point 155 to point 156
 EQUB 153               \ Line ID 134 goes from point 156 to point 153
 EQUB 179               \ Line ID 135 goes from point 178 to point 179
 EQUB 180               \ Line ID 136 goes from point 178 to point 180
 EQUB 180               \ Line ID 137 goes from point 179 to point 180
 EQUB 184               \ Line ID 138 goes from point 183 to point 184
 EQUB 185               \ Line ID 139 goes from point 183 to point 185
 EQUB 185               \ Line ID 140 goes from point 184 to point 185
 EQUB 186               \ Line ID 141 goes from point 183 to point 186
 EQUB 184               \ Line ID 142 goes from point 186 to point 184
 EQUB 185               \ Line ID 143 goes from point 186 to point 185
 EQUB 189               \ Line ID 144 goes from point 188 to point 189
 EQUB 190               \ Line ID 145 goes from point 188 to point 190
 EQUB 190               \ Line ID 146 goes from point 189 to point 190
 EQUB 191               \ Line ID 147 goes from point 188 to point 191
 EQUB 189               \ Line ID 148 goes from point 191 to point 189
 EQUB 190               \ Line ID 149 goes from point 191 to point 190
 EQUB 215               \ Line ID 150 goes from point 108 to point 215
 EQUB 194               \ Line ID 151 goes from point 193 to point 194
 EQUB 195               \ Line ID 152 goes from point 193 to point 195
 EQUB 195               \ Line ID 153 goes from point 194 to point 195
 EQUB 196               \ Line ID 154 goes from point 193 to point 196
 EQUB 194               \ Line ID 155 goes from point 196 to point 194
 EQUB 195               \ Line ID 156 goes from point 196 to point 195
 EQUB 200               \ Line ID 157 goes from point 193 to point 200
 EQUB 198               \ Line ID 158 goes from point 194 to point 198
 EQUB 198               \ Line ID 159 goes from point 197 to point 198
 EQUB 200               \ Line ID 160 goes from point 199 to point 200
 EQUB 88                \ Line ID 161 goes from point  86 to point  88
 EQUB 87                \ Line ID 162 goes from point  99 to point  87
 EQUB 201               \ Line ID 163 goes from point  39 to point 201
 EQUB 40                \ Line ID 164 goes from point 202 to point  40
 EQUB 25                \ Line ID 165 goes from point  22 to point  25
 EQUB 28                \ Line ID 166 goes from point  21 to point  28
 EQUB 23                \ Line ID 167 goes from point  26 to point  23
 EQUB 24                \ Line ID 168 goes from point  27 to point  24
 EQUB 88                \ Line ID 169 goes from point 201 to point  88
 EQUB 99                \ Line ID 170 goes from point  88 to point  99
 EQUB 99                \ Line ID 171 goes from point 202 to point  99
 EQUB 202               \ Line ID 172 goes from point 201 to point 202
 EQUB 28                \ Line ID 173 goes from point  25 to point  28
 EQUB 26                \ Line ID 174 goes from point  25 to point  26
 EQUB 27                \ Line ID 175 goes from point  26 to point  27
 EQUB 28                \ Line ID 176 goes from point  27 to point  28
 EQUB 29                \ Line ID 177 goes from point  22 to point  29
 EQUB 40                \ Line ID 178 goes from point  33 to point  40
 EQUB 34                \ Line ID 179 goes from point 205 to point  34
 EQUB 37                \ Line ID 180 goes from point  40 to point  37
 EQUB 38                \ Line ID 181 goes from point 205 to point  38
 EQUB 209               \ Line ID 182 goes from point 207 to point 209
 EQUB 210               \ Line ID 183 goes from point 209 to point 210
 EQUB 208               \ Line ID 184 goes from point 210 to point 208
 EQUB 208               \ Line ID 185 goes from point 207 to point 208
 EQUB 204               \ Line ID 186 goes from point 210 to point 204
 EQUB 206               \ Line ID 187 goes from point 208 to point 206
 EQUB 207               \ Line ID 188 goes from point 205 to point 207
 EQUB 211               \ Line ID 189 goes from point  35 to point 211
 EQUB 211               \ Line ID 190 goes from point 212 to point 211
 EQUB 211               \ Line ID 191 goes from point  36 to point 211

 EQUB &D7, &D7          \ These bytes appear to be unused
 EQUB &74, &72
 EQUB &75, &32
 EQUB &3A, &43

\ ******************************************************************************
\
\       Name: objectGroup
\       Type: Variable
\   Category: 3D geometry
\    Summary: The current group number for object IDs 6, 7, 8 and 9
\
\ ------------------------------------------------------------------------------
\
\ The current object number in each of the four object groups. The values in
\ this table cycle through the following values:
\
\   * 0 to 7    the current group number for object ID 6
\   * 8 to 15   the current group number for object ID 7
\   * 16 to 23  the current group number for object ID 8
\   * 24 to 31  the current group number for object ID 9
\
\ and then back round to the start. The cycling is performed by successive calls
\ to the NextObjectGroup routine.
\
\ ******************************************************************************

.objectGroup

 EQUB 0, 8, 16, 24

\ ******************************************************************************
\
\       Name: groupStart
\       Type: Variable
\   Category: 3D geometry
\    Summary: The starting value for each object's group number
\
\ ------------------------------------------------------------------------------
\
\ The starting point for the four object groups, to which we add a number in the
\ range 0 to 7 to get the next number, so the group numbers cycle through the
\ following values:
\
\   * 0 to 7
\   * 8 to 15
\   * 16 to 23
\   * 24 to 31
\
\ ******************************************************************************

.groupStart

 EQUB 0, 8, 16, 24

\ ******************************************************************************
\
\       Name: xGroupHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the x-coordinate for objects in a group (6 to 9)
\
\ ******************************************************************************

.xGroupHi

 EQUB &C8               \ Object 6: group 0 has coordinate (&C800, &0000, &5200)
 EQUB &2A               \ Object 6: group 1 has coordinate (&2A00, &0000, &D200)
 EQUB &CF               \ Object 6: group 2 has coordinate (&CF00, &0000, &9A00)
 EQUB &82               \ Object 6: group 3 has coordinate (&8200, &0000, &C900)
 EQUB &1D               \ Object 6: group 4 has coordinate (&1D00, &0000, &3E00)
 EQUB &75               \ Object 6: group 5 has coordinate (&7500, &0000, &3300)
 EQUB &1A               \ Object 6: group 6 has coordinate (&1A00, &0000, &8A00)
 EQUB &CF               \ Object 6: group 7 has coordinate (&CF00, &0000, &EC00)

 EQUB &9C               \ Object 7: group 0 has coordinate (&9C00, &0000, &C600)
 EQUB &43               \ Object 7: group 1 has coordinate (&4300, &0000, &E200)
 EQUB &E5               \ Object 7: group 2 has coordinate (&E500, &0000, &BA00)
 EQUB &8A               \ Object 7: group 3 has coordinate (&8A00, &0000, &7000)
 EQUB &EA               \ Object 7: group 4 has coordinate (&EA00, &0000, &6E00)
 EQUB &22               \ Object 7: group 5 has coordinate (&2200, &0000, &4400)
 EQUB &6A               \ Object 7: group 6 has coordinate (&6A00, &0000, &2000)
 EQUB &C5               \ Object 7: group 7 has coordinate (&C500, &0000, &1B00)

 EQUB &15               \ Object 8: group 0 has coordinate (&1500, &0000, &2F00)
 EQUB &C4               \ Object 8: group 1 has coordinate (&C400, &0000, &0500)
 EQUB &C4               \ Object 8: group 2 has coordinate (&C400, &0000, &0500)
 EQUB &CE               \ Object 8: group 3 has coordinate (&CE00, &0000, &F500)
 EQUB &CE               \ Object 8: group 4 has coordinate (&CE00, &0000, &F500)
 EQUB &CE               \ Object 8: group 5 has coordinate (&CE00, &0000, &F500)
 EQUB &15               \ Object 8: group 6 has coordinate (&1500, &0000, &2F00)
 EQUB &11               \ Object 8: group 7 has coordinate (&1100, &0000, &D600)

 EQUB &38               \ Object 9: group 0 has coordinate (&3800, &0000, &1C00)
 EQUB &D5               \ Object 9: group 1 has coordinate (&D500, &0000, &2E00)
 EQUB &D5               \ Object 9: group 2 has coordinate (&D500, &0000, &2E00)
 EQUB &DA               \ Object 9: group 3 has coordinate (&DA00, &0000, &D300)
 EQUB &DA               \ Object 9: group 4 has coordinate (&DA00, &0000, &D300)
 EQUB &0D               \ Object 9: group 5 has coordinate (&0D00, &0000, &D900)
 EQUB &38               \ Object 9: group 6 has coordinate (&3800, &0000, &1C00)
 EQUB &0D               \ Object 9: group 7 has coordinate (&0D00, &0000, &D900)

\ ******************************************************************************
\
\       Name: zGroupHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the z-coordinate for objects in a group (6 to 9)
\
\ ******************************************************************************

.zGroupHi

 EQUB &52               \ Object 6: group 0 has coordinate (&C800, &0000, &5200)
 EQUB &D2               \ Object 6: group 1 has coordinate (&2A00, &0000, &D200)
 EQUB &9A               \ Object 6: group 2 has coordinate (&CF00, &0000, &9A00)
 EQUB &C9               \ Object 6: group 3 has coordinate (&8200, &0000, &C900)
 EQUB &3E               \ Object 6: group 4 has coordinate (&1D00, &0000, &3E00)
 EQUB &33               \ Object 6: group 5 has coordinate (&7500, &0000, &3300)
 EQUB &8A               \ Object 6: group 6 has coordinate (&1A00, &0000, &8A00)
 EQUB &EC               \ Object 6: group 7 has coordinate (&CF00, &0000, &EC00)

 EQUB &C6               \ Object 7: group 0 has coordinate (&9C00, &0000, &C600)
 EQUB &E2               \ Object 7: group 1 has coordinate (&4300, &0000, &E200)
 EQUB &BA               \ Object 7: group 2 has coordinate (&E500, &0000, &BA00)
 EQUB &70               \ Object 7: group 3 has coordinate (&8A00, &0000, &7000)
 EQUB &6E               \ Object 7: group 4 has coordinate (&EA00, &0000, &6E00)
 EQUB &44               \ Object 7: group 5 has coordinate (&2200, &0000, &4400)
 EQUB &20               \ Object 7: group 6 has coordinate (&6A00, &0000, &2000)
 EQUB &1B               \ Object 7: group 7 has coordinate (&C500, &0000, &1B00)

 EQUB &2F               \ Object 8: group 0 has coordinate (&1500, &0000, &2F00)
 EQUB &05               \ Object 8: group 1 has coordinate (&C400, &0000, &0500)
 EQUB &05               \ Object 8: group 2 has coordinate (&C400, &0000, &0500)
 EQUB &F5               \ Object 8: group 3 has coordinate (&CE00, &0000, &F500)
 EQUB &F5               \ Object 8: group 4 has coordinate (&CE00, &0000, &F500)
 EQUB &F5               \ Object 8: group 5 has coordinate (&CE00, &0000, &F500)
 EQUB &2F               \ Object 8: group 6 has coordinate (&1500, &0000, &2F00)
 EQUB &D6               \ Object 8: group 7 has coordinate (&1100, &0000, &D600)

 EQUB &1C               \ Object 9: group 0 has coordinate (&3800, &0000, &1C00)
 EQUB &2E               \ Object 9: group 1 has coordinate (&D500, &0000, &2E00)
 EQUB &2E               \ Object 9: group 2 has coordinate (&D500, &0000, &2E00)
 EQUB &D3               \ Object 9: group 3 has coordinate (&DA00, &0000, &D300)
 EQUB &D3               \ Object 9: group 4 has coordinate (&DA00, &0000, &D300)
 EQUB &D9               \ Object 9: group 5 has coordinate (&0D00, &0000, &D900)
 EQUB &1C               \ Object 9: group 6 has coordinate (&3800, &0000, &1C00)
 EQUB &D9               \ Object 9: group 7 has coordinate (&0D00, &0000, &D900)

\ ******************************************************************************
\
\       Name: CheckTimePassed
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Flag whether 9 centiseconds have passed since the last call
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   P                   The current time, incrementing 100 times a second
\
\ Returns:
\
\   C flag              Returns:
\
\                         * Clear if fewer than 9 centiseconds have passed since
\                           the last call to this routine that reset the counter
\
\                         * Set if 9 centiseconds or more have passed since the
\                           last call to this routine, in which case the counter
\                           resets
\
\ ******************************************************************************

.CheckTimePassed

 LDX P                  \ Set X = P

 TXA                    \ Set A = P - previousTime
 SEC                    \
 SBC previousTime       \ so A is the number of centiseconds that have passed
                        \ since the last call to this routine (unless the time
                        \ has wrapped, in which case it will be negative)

 BPL L3F1E              \ If A is positive, skip the following three
                        \ instructions

 EOR #&FF               \ A is negative, so negate A using two's complement, so:
 CLC                    \
 ADC #1                 \   A = |P - previousTime|

.L3F1E

 CMP #9                 \ If |A| < 9, skip the following instruction
 BCC L3F25

 STX previousTime       \ Update previousTime to the current timer in X, so the
                        \ count of 9 centiseconds since the last call can start
                        \ again

.L3F25

 RTS                    \ Return from the subroutine

 EQUB &3D, &41          \ These bytes appear to be unused
 EQUB &42, &43
 EQUB &77, &78
 EQUB &44, &45
 EQUB &46, &50

\ ******************************************************************************
\
\       Name: lineStartPointId
\       Type: Variable
\   Category: 3D geometry
\    Summary: The point ID for a line's start point
\
\ ------------------------------------------------------------------------------
\
\ This table contains the point ID for each line's start point.
\
\ The table is indexed by line ID, so for line ID X, lineStartPointId,X contains
\ the point ID of the line's start point.
\
\ ******************************************************************************

.lineStartPointId

 EQUB 31                \ Line ID   0 goes from point  31 to point  30
 EQUB 1                 \ Line ID   1 goes from point   1 to point   2
 EQUB 2                 \ Line ID   2 goes from point   2 to point   3
 EQUB 3                 \ Line ID   3 goes from point   3 to point   4
 EQUB 4                 \ Line ID   4 goes from point   4 to point   1
 EQUB 6                 \ Line ID   5 goes from point   6 to point   7
 EQUB 8                 \ Line ID   6 goes from point   8 to point   9
 EQUB 10                \ Line ID   7 goes from point  10 to point  11
 EQUB 12                \ Line ID   8 goes from point  12 to point  13
 EQUB 14                \ Line ID   9 goes from point  14 to point  15
 EQUB 16                \ Line ID  10 goes from point  16 to point  17
 EQUB 18                \ Line ID  11 goes from point  18 to point  19
 EQUB 114               \ Line ID  12 goes from point 114 to point  59
 EQUB 115               \ Line ID  13 goes from point 115 to point 114
 EQUB 41                \ Line ID  14 goes from point  41 to point  42
 EQUB 42                \ Line ID  15 goes from point  42 to point  43
 EQUB 43                \ Line ID  16 goes from point  43 to point  44
 EQUB 45                \ Line ID  17 goes from point  45 to point  46
 EQUB 46                \ Line ID  18 goes from point  46 to point  47
 EQUB 47                \ Line ID  19 goes from point  47 to point  48
 EQUB 49                \ Line ID  20 goes from point  49 to point  53
 EQUB 50                \ Line ID  21 goes from point  50 to point  54
 EQUB 51                \ Line ID  22 goes from point  51 to point  55
 EQUB 52                \ Line ID  23 goes from point  52 to point  56
 EQUB 59                \ Line ID  24 goes from point  59 to point  58
 EQUB 58                \ Line ID  25 goes from point  58 to point  57
 EQUB 57                \ Line ID  26 goes from point  57 to point  51
 EQUB 52                \ Line ID  27 goes from point  52 to point  60
 EQUB 60                \ Line ID  28 goes from point  60 to point  61
 EQUB 49                \ Line ID  29 goes from point  49 to point  62
 EQUB 50                \ Line ID  30 goes from point  50 to point  63
 EQUB 62                \ Line ID  31 goes from point  62 to point  64
 EQUB 63                \ Line ID  32 goes from point  63 to point  65
 EQUB 64                \ Line ID  33 goes from point  64 to point  66
 EQUB 115               \ Line ID  34 goes from point 115 to point 116
 EQUB 116               \ Line ID  35 goes from point 116 to point 113
 EQUB 112               \ Line ID  36 goes from point 112 to point 113
 EQUB 111               \ Line ID  37 goes from point 111 to point 112
 EQUB 61                \ Line ID  38 goes from point  61 to point 111
 EQUB 65                \ Line ID  39 goes from point  65 to point  67
 EQUB 66                \ Line ID  40 goes from point  66 to point 119
 EQUB 67                \ Line ID  41 goes from point  67 to point 120
 EQUB 119               \ Line ID  42 goes from point 119 to point  68
 EQUB 120               \ Line ID  43 goes from point 120 to point  69
 EQUB 68                \ Line ID  44 goes from point  68 to point  70
 EQUB 69                \ Line ID  45 goes from point  69 to point  71
 EQUB 70                \ Line ID  46 goes from point  70 to point 117
 EQUB 80                \ Line ID  47 goes from point  80 to point  81
 EQUB 82                \ Line ID  48 goes from point  82 to point  85
 EQUB 83                \ Line ID  49 goes from point  83 to point  85
 EQUB 84                \ Line ID  50 goes from point  84 to point  85
 EQUB 71                \ Line ID  51 goes from point  71 to point 118
 EQUB 117               \ Line ID  52 goes from point 117 to point  72
 EQUB 118               \ Line ID  53 goes from point 118 to point  73
 EQUB 72                \ Line ID  54 goes from point  72 to point  74
 EQUB 73                \ Line ID  55 goes from point  73 to point  75
 EQUB 89                \ Line ID  56 goes from point  89 to point  90
 EQUB 91                \ Line ID  57 goes from point  91 to point  94
 EQUB 92                \ Line ID  58 goes from point  92 to point  94
 EQUB 93                \ Line ID  59 goes from point  93 to point  94
 EQUB 95                \ Line ID  60 goes from point  95 to point  96
 EQUB 97                \ Line ID  61 goes from point  97 to point  98
 EQUB 74                \ Line ID  62 goes from point  74 to point  76
 EQUB 75                \ Line ID  63 goes from point  75 to point  77
 EQUB 76                \ Line ID  64 goes from point  76 to point  78
 EQUB 77                \ Line ID  65 goes from point  77 to point  79
 EQUB 78                \ Line ID  66 goes from point  78 to point 101
 EQUB 79                \ Line ID  67 goes from point  79 to point 100
 EQUB 101               \ Line ID  68 goes from point 101 to point 102
 EQUB 100               \ Line ID  69 goes from point 100 to point 103
 EQUB 102               \ Line ID  70 goes from point 102 to point 105
 EQUB 103               \ Line ID  71 goes from point 103 to point 104
 EQUB 105               \ Line ID  72 goes from point 105 to point 107
 EQUB 104               \ Line ID  73 goes from point 104 to point 106
 EQUB 107               \ Line ID  74 goes from point 107 to point 109
 EQUB 106               \ Line ID  75 goes from point 106 to point 109
 EQUB 213               \ Line ID  76 goes from point 213 to point 215
 EQUB 109               \ Line ID  77 goes from point 109 to point 110
 EQUB 121               \ Line ID  78 goes from point 121 to point 122
 EQUB 177               \ Line ID  79 goes from point 177 to point 121
 EQUB 122               \ Line ID  80 goes from point 122 to point 123
 EQUB 177               \ Line ID  81 goes from point 177 to point 123
 EQUB 144               \ Line ID  82 goes from point 144 to point 145
 EQUB 146               \ Line ID  83 goes from point 146 to point 145
 EQUB 146               \ Line ID  84 goes from point 146 to point 147
 EQUB 148               \ Line ID  85 goes from point 148 to point 147
 EQUB 144               \ Line ID  86 goes from point 144 to point 148
 EQUB 157               \ Line ID  87 goes from point 157 to point 158
 EQUB 158               \ Line ID  88 goes from point 158 to point 159
 EQUB 159               \ Line ID  89 goes from point 159 to point 160
 EQUB 157               \ Line ID  90 goes from point 157 to point 160
 EQUB 164               \ Line ID  91 goes from point 164 to point 161
 EQUB 163               \ Line ID  92 goes from point 163 to point 162
 EQUB 162               \ Line ID  93 goes from point 162 to point 161
 EQUB 164               \ Line ID  94 goes from point 164 to point 163
 EQUB 165               \ Line ID  95 goes from point 165 to point 168
 EQUB 165               \ Line ID  96 goes from point 165 to point 166
 EQUB 166               \ Line ID  97 goes from point 166 to point 167
 EQUB 167               \ Line ID  98 goes from point 167 to point 168
 EQUB 169               \ Line ID  99 goes from point 169 to point 172
 EQUB 169               \ Line ID 100 goes from point 169 to point 171
 EQUB 142               \ Line ID 101 goes from point 142 to point 124
 EQUB 172               \ Line ID 102 goes from point 172 to point 171
 EQUB 176               \ Line ID 103 goes from point 176 to point 175
 EQUB 175               \ Line ID 104 goes from point 175 to point 174
 EQUB 176               \ Line ID 105 goes from point 176 to point 173
 EQUB 173               \ Line ID 106 goes from point 173 to point 174
 EQUB 150               \ Line ID 107 goes from point 150 to point 151
 EQUB 152               \ Line ID 108 goes from point 152 to point 151
 EQUB 152               \ Line ID 109 goes from point 152 to point 149
 EQUB 149               \ Line ID 110 goes from point 149 to point 150
 EQUB 139               \ Line ID 111 goes from point 139 to point 138
 EQUB 137               \ Line ID 112 goes from point 137 to point 138
 EQUB 136               \ Line ID 113 goes from point 136 to point 137
 EQUB 136               \ Line ID 114 goes from point 136 to point 139
 EQUB 132               \ Line ID 115 goes from point 132 to point 133
 EQUB 132               \ Line ID 116 goes from point 132 to point 135
 EQUB 135               \ Line ID 117 goes from point 135 to point 134
 EQUB 133               \ Line ID 118 goes from point 133 to point 134
 EQUB 128               \ Line ID 119 goes from point 128 to point 129
 EQUB 129               \ Line ID 120 goes from point 129 to point 130
 EQUB 130               \ Line ID 121 goes from point 130 to point 131
 EQUB 128               \ Line ID 122 goes from point 128 to point 131
 EQUB 203               \ Line ID 123 goes from point 203 to point 209
 EQUB 125               \ Line ID 124 goes from point 125 to point 126
 EQUB 127               \ Line ID 125 goes from point 127 to point 126
 EQUB 125               \ Line ID 126 goes from point 125 to point 127
 EQUB 140               \ Line ID 127 goes from point 140 to point 141
 EQUB 141               \ Line ID 128 goes from point 141 to point 124
 EQUB 140               \ Line ID 129 goes from point 140 to point 143
 EQUB 143               \ Line ID 130 goes from point 143 to point 142
 EQUB 153               \ Line ID 131 goes from point 153 to point 154
 EQUB 154               \ Line ID 132 goes from point 154 to point 155
 EQUB 155               \ Line ID 133 goes from point 155 to point 156
 EQUB 156               \ Line ID 134 goes from point 156 to point 153
 EQUB 178               \ Line ID 135 goes from point 178 to point 179
 EQUB 178               \ Line ID 136 goes from point 178 to point 180
 EQUB 179               \ Line ID 137 goes from point 179 to point 180
 EQUB 183               \ Line ID 138 goes from point 183 to point 184
 EQUB 183               \ Line ID 139 goes from point 183 to point 185
 EQUB 184               \ Line ID 140 goes from point 184 to point 185
 EQUB 183               \ Line ID 141 goes from point 183 to point 186
 EQUB 186               \ Line ID 142 goes from point 186 to point 184
 EQUB 186               \ Line ID 143 goes from point 186 to point 185
 EQUB 188               \ Line ID 144 goes from point 188 to point 189
 EQUB 188               \ Line ID 145 goes from point 188 to point 190
 EQUB 189               \ Line ID 146 goes from point 189 to point 190
 EQUB 188               \ Line ID 147 goes from point 188 to point 191
 EQUB 191               \ Line ID 148 goes from point 191 to point 189
 EQUB 191               \ Line ID 149 goes from point 191 to point 190
 EQUB 108               \ Line ID 150 goes from point 108 to point 215
 EQUB 193               \ Line ID 151 goes from point 193 to point 194
 EQUB 193               \ Line ID 152 goes from point 193 to point 195
 EQUB 194               \ Line ID 153 goes from point 194 to point 195
 EQUB 193               \ Line ID 154 goes from point 193 to point 196
 EQUB 196               \ Line ID 155 goes from point 196 to point 194
 EQUB 196               \ Line ID 156 goes from point 196 to point 195
 EQUB 193               \ Line ID 157 goes from point 193 to point 200
 EQUB 194               \ Line ID 158 goes from point 194 to point 198
 EQUB 197               \ Line ID 159 goes from point 197 to point 198
 EQUB 199               \ Line ID 160 goes from point 199 to point 200
 EQUB 86                \ Line ID 161 goes from point  86 to point  88
 EQUB 99                \ Line ID 162 goes from point  99 to point  87
 EQUB 39                \ Line ID 163 goes from point  39 to point 201
 EQUB 202               \ Line ID 164 goes from point 202 to point  40
 EQUB 22                \ Line ID 165 goes from point  22 to point  25
 EQUB 21                \ Line ID 166 goes from point  21 to point  28
 EQUB 26                \ Line ID 167 goes from point  26 to point  23
 EQUB 27                \ Line ID 168 goes from point  27 to point  24
 EQUB 201               \ Line ID 169 goes from point 201 to point  88
 EQUB 88                \ Line ID 170 goes from point  88 to point  99
 EQUB 202               \ Line ID 171 goes from point 202 to point  99
 EQUB 201               \ Line ID 172 goes from point 201 to point 202
 EQUB 25                \ Line ID 173 goes from point  25 to point  28
 EQUB 25                \ Line ID 174 goes from point  25 to point  26
 EQUB 26                \ Line ID 175 goes from point  26 to point  27
 EQUB 27                \ Line ID 176 goes from point  27 to point  28
 EQUB 22                \ Line ID 177 goes from point  22 to point  29
 EQUB 33                \ Line ID 178 goes from point  33 to point  40
 EQUB 205               \ Line ID 179 goes from point 205 to point  34
 EQUB 40                \ Line ID 180 goes from point  40 to point  37
 EQUB 205               \ Line ID 181 goes from point 205 to point  38
 EQUB 207               \ Line ID 182 goes from point 207 to point 209
 EQUB 209               \ Line ID 183 goes from point 209 to point 210
 EQUB 210               \ Line ID 184 goes from point 210 to point 208
 EQUB 207               \ Line ID 185 goes from point 207 to point 208
 EQUB 210               \ Line ID 186 goes from point 210 to point 204
 EQUB 208               \ Line ID 187 goes from point 208 to point 206
 EQUB 205               \ Line ID 188 goes from point 205 to point 207
 EQUB 35                \ Line ID 189 goes from point  35 to point 211
 EQUB 212               \ Line ID 190 goes from point 212 to point 211
 EQUB 36                \ Line ID 191 goes from point  36 to point 211

 EQUB &D6, &6C          \ These bytes appear to be unused
 EQUB &03, &0A
 EQUB &20, &20
 EQUB &20, &20
 EQUB &00, &00

\ ******************************************************************************
\
\       Name: alienScore
\       Type: Variable
\   Category: Theme
\    Summary: The scores for killing aliens in the various feeding stages
\
\ ******************************************************************************

.alienScore

 EQUB &05               \ The score for a large feeding alien (50 points)
 EQUB &10               \ The score for a medium feeding alien (100 points)
 EQUB &15               \ The score for a small feeding alien (150 points)
 EQUB &25               \ The score for the smallest feeding alien (250 points)

 EQUB &00

\ ******************************************************************************
\
\       Name: dormantAlienScore
\       Type: Variable
\   Category: Theme
\    Summary: The score for killing a dormant alien
\
\ ******************************************************************************

.dormantAlienScore

 EQUB &40               \ The score for a dormant alien (400 points)

\ ******************************************************************************
\
\       Name: Lookup4000
\       Type: Variable
\   Category: 3D geometry
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
\   Category: 3D geometry
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
 EQUB &FB, &FB, &FB, &FC, &FC, &FC, &FC, &FD
 EQUB &FD, &FD, &FD, &FE, &FE, &FE, &FE, &FE
 EQUB &FE, &FF, &FF, &FF, &FF, &FF, &FF, &FF
 EQUB &FF, &FF, &FF, &FF, &FF, &FF, &FF, &FF

\ ******************************************************************************
\
\       Name: alienCounter
\       Type: Variable
\   Category: Theme
\    Summary: 
\
\ ******************************************************************************

.alienCounter

 EQUB &6C               \ Counter for alien 30 ???
 EQUB &6B               \ Counter for alien 31 ???
 EQUB &6A               \ Counter for alien 32 ???
                        \
                        \ Zeroed in ResetVariables

\ ******************************************************************************
\
\       Name: alienToMove
\       Type: Variable
\   Category: Theme
\    Summary: The number of the alien to move towards Acornsville in this
\             iteration of the main loop
\
\ ******************************************************************************

.alienToMove

 EQUB &69               \ Zeroed in ResetVariables, counter for alien 33?

\ ******************************************************************************
\
\       Name: mainLoopCounter
\       Type: Variable
\   Category: Main loop
\    Summary: The main loop counter
\
\ ******************************************************************************

.mainLoopCounter

 EQUB &67               \ The main loop counter, which is incremented every
                        \ iteration of the main loop

\ ******************************************************************************
\
\       Name: numberOfLines
\       Type: Variable
\   Category: 3D geometry
\    Summary: The total number of lines in Aviator's 3D world
\
\ ******************************************************************************

.numberOfLines

 EQUB 193               \ The total number of lines in the world + 1, so there
                        \ are 192 lines in total

\ ******************************************************************************
\
\       Name: L4208
\       Type: Variable
\   Category: Theme
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ This is called FLDPTR in the original source code.
\
\ ******************************************************************************

.L4208

 EQUB &65, &64          \ Zeroed in ResetVariables
 EQUB &62, &61
 EQUB &60, &5F
 EQUB &5E, &5C

\ ******************************************************************************
\
\       Name: alienState
\       Type: Variable
\   Category: Theme
\    Summary: The aliens' state bytes
\
\ ------------------------------------------------------------------------------
\
\ 23 = ???
\ 27 = flying to Acornsville
\ 28 = descending towards Acornsville
\
\ ******************************************************************************

.alienState

 EQUB &5B, &5A          \ Zeroed in ResetVariables
 EQUB &59, &58
 EQUB &7D, &7C
 EQUB &7B, &7A

\ ******************************************************************************
\
\       Name: alienStatus
\       Type: Variable
\   Category: Theme
\    Summary: Storage for the object status bytes for the four alien objects
\
\ ******************************************************************************

.alienStatus

 EQUB &78, &77
 EQUB &76, &75

 EQUB &74, &72          \ These bytes appear to be unused
 EQUB &71, &70

\ ******************************************************************************
\
\       Name: matrix1Lo
\       Type: Variable
\   Category: Maths
\    Summary: The low bytes of matrix 1
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix1Lo

 EQUB &31, &39, &0D
 EQUB &06, &18, &10
 EQUB &20, &20, &20

\ ******************************************************************************
\
\       Name: matrix2Lo
\       Type: Variable
\   Category: Maths
\    Summary: The low bytes of matrix 2
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix2Lo

 EQUB &20, &20, &20
 EQUB &4C, &44, &59
 EQUB &23, &33, &31

\ ******************************************************************************
\
\       Name: matrix3Lo
\       Type: Variable
\   Category: Maths
\    Summary: The low bytes of matrix 3
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix3Lo

 EQUB &0D, &06, &00
 EQUB &1D, &2E, &00
 EQUB &00, &00, &FE

\ ******************************************************************************
\
\       Name: matrix4Lo
\       Type: Variable
\   Category: Maths
\    Summary: The low bytes of matrix 4
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix4Lo

 EQUB &20, &4C, &44
 EQUB &58, &20, &50
 EQUB &00, &52, &4E

\ ******************************************************************************
\
\       Name: CheckFlyingSkills (Part 1 of 2)
\       Type: Subroutine
\   Category: Scoring
\    Summary: Check whether we are performing one of the tests of flying skill
\
\ ------------------------------------------------------------------------------
\
\ This routine checks where we are, and awards the following points:
\
\   * 50 points for flying under the bridge the right way up
\
\   * 100 points for flying under the bridge upside down
\
\   * 100 points for flying down the main street of Acornsville the right way up
\
\   * 200 points for flying down the main street of Acornsville upside down
\
\ There are multiple skill zones defined for each object (the bridge and the
\ main street). To earn the points, we need to fly into the correct skill zones
\ while avoiding others, and then back out again without hitting the ground.
\
\ Arguments:
\
\   Y                   The skill to check:
\
\                         * 2 = Flying under the suspension bridge
\
\                         * 34 = Flying down the main street of Acornsville
\
\ ******************************************************************************

.CheckFlyingSkills

 LDA xPlaneHi           \ Set A = xPlaneHi - the x-coordinate of either the
 SEC                    \ bridge or town, which is the high byte of the distance
 SBC xObjectHi,Y        \ along the x-axis between the plane and the object that
                        \ we are checking

 BPL skil1              \ If A is negative, flip the bits, so A contains the
 EOR #&FF               \ absolute value of the distance along the x-axis

.skil1

 CMP #5                 \ If the high byte of the distance is less than 5, then
 BCC skil3              \ we are close enough to the bridge or town to warrant
                        \ further checks, so jump to skil3

.skil2

 RTS                    \ Otherwise we are too far away from the bridge and town
                        \ to score any points, so return from the subroutine

.skil3

 LDA zPlaneHi           \ Set A = zPlaneHi - the z-coordinate of either the
 SEC                    \ bridge or town, which is the high byte of the distance
 SBC zObjectHi,Y        \ along the z-axis between the plane and the object that
                        \ we are checking

 JMP skil4              \ Jump down to part 2 of the routine

 EQUB &4D, &50          \ These bytes appear to be unused

\ ******************************************************************************
\
\       Name: matrix1Hi
\       Type: Variable
\   Category: Maths
\    Summary: The high bytes of matrix 1
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix1Hi

 EQUB &B2, &32, &AF
 EQUB &0B, &F2, &51
 EQUB &B6, &40, &A7

\ ******************************************************************************
\
\       Name: matrix2Hi
\       Type: Variable
\   Category: Maths
\    Summary: The high bytes of matrix 2
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix2Hi

 EQUB &B2, &0B, &B6
 EQUB &32, &F2, &40
 EQUB &AF, &51, &A7

\ ******************************************************************************
\
\       Name: matrix3Hi
\       Type: Variable
\   Category: Maths
\    Summary: The high bytes of matrix 3
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix3Hi

 EQUB &FA, &34, &00
 EQUB &34, &FA, &00
 EQUB &00, &00, &FF

\ ******************************************************************************
\
\       Name: matrix4Hi
\       Type: Variable
\   Category: Maths
\    Summary: The high bytes of matrix 4
\
\ ------------------------------------------------------------------------------
\
\ If bit 0 is set in the low byte of a matrix entry, then it is negative.
\
\ ******************************************************************************

.matrix4Hi

 EQUB &FA, &32, &0D
 EQUB &34, &F2, &3F
 EQUB &00, &40, &F7

\ ******************************************************************************
\
\       Name: CheckFlyingSkills (Part 2 of 2)
\       Type: Subroutine
\   Category: Scoring
\    Summary: Perform finer checks to see if we are flying under the bridge or
\             along the main street of the town
\
\ ******************************************************************************

.skil4

 BPL skil5              \ If A is negative, flip the bits, so A contains the
 EOR #&FF               \ absolute value of the distance along the z-axis

.skil5

 CMP #5                 \ If the high byte of the distance is 5 or more, then
 BCS skil2              \ we are too far away from the bridge or town to warrant
                        \ further checks, so jump to skil2 to return from the
                        \ subroutine

                        \ If we get here then we are within a distance of &0500
                        \ from the place we need to check, in both the x-axis
                        \ and z-axis, so now we need to check exactly where we
                        \ are

 CPY #2                 \ If Y = 2, then we are checking against the suspension
 BEQ skil7              \ bridge, so jump to skil7

                        \ If we get here then we are checking where we are
                        \ compared to the town

 LDA #12                \ If we are inside skill zone 12, jump to skil8 to crash
 JSR CheckBridgeAndTown \ the plane
 BCS skil8

 LDA #15                \ If we are inside skill zone 15, jump to skil8 to crash
 JSR CheckBridgeAndTown \ the plane
 BCS skil8

 LDA #9                 \ If we are inside skill zone 9, jump to skil8 to crash
 JSR CheckBridgeAndTown \ the plane
 BCS skil8

 LDA #18                \ If we are outside skill zone 18, jump to slip9 to add
 JSR CheckBridgeAndTown \ any awarded points to our score
 BCC skil9

                        \ If we get here then we are:
                        \
                        \   * Outside skill zone 12
                        \   * Outside skill zone 15
                        \   * Outside skill zone 9
                        \   * Inside skill zone 18
                        \
                        \ This means we are flying along the main street of the
                        \ town, so we have earned ourselves some points, to be
                        \ awarded when we exit skill zone 18

 LDA #&20               \ Set A = &20 so we award 200 points for flying down
                        \ main street while upside down

 LDX row25_block13_1    \ If there is a line at the bottom of the artificial
 BNE skil10             \ horizon indicator, then the plane is upside down, so
                        \ jump to skil10 to bank these points in pointsToAward
                        \ and return from the subroutine

.skil6

 LDA #&10               \ Set A = &10 so we award 100 points for flying down
                        \ main street the right way up

 BNE skil10             \ Jump to skil10 to bank these points in pointsToAward
                        \ and return from the subroutine

.skil7

                        \ If we get here then we are checking where we are
                        \ compared to the suspension bridge

 LDA #6                 \ If we are outside skill zone 6, jump to slip9 to add
 JSR CheckBridgeAndTown \ any awarded points to our score
 BCC skil9

 LDA #3                 \ If we are inside skill zone 3, jump to slip9 to add
 JSR CheckBridgeAndTown \ any awarded points to our score
 BCS skil9

 LDA #0                 \ If we are outside skill zone 0, jump to skil8 to crash
 JSR CheckBridgeAndTown \ the plane
 BCC skil8

                        \ If we get here then we are:
                        \
                        \   * Inside skill zone 6
                        \   * Outside skill zone 3
                        \   * Inside skill zone 0
                        \
                        \ This means we are flying under the bridge, so we have
                        \ earned ourselves some points, to be awarded when we
                        \ exit skill zone 6 or enter skill zone 3

 LDX row25_block13_1    \ If there is a line at the bottom of the artificial
 BNE skil6              \ horizon indicator, then the plane is upside down, so
                        \ jump to skil6 to award 100 points for flying under the
                        \ bridge upside down

 LDA #5                 \ Set A = 5 so we award 50 points for flying under the
                        \ bridge the right way up

 BNE skil10             \ Jump to skil10 to bank these points in pointsToAward
                        \ and return from the subroutine

.skil8

 TSX                    \ Add four bytes to the top of the stack, so they can be
 TXA                    \ stripped away in Crash routine, along with the two
 SEC                    \ bytes currently on the stack
 SBC #4
 TAX
 TXS

 JMP Crash              \ Jump to the Crash routine as we have just crashed

.skil9

 LDA pointsToAward      \ We get here when we are outside the skill zone, so
 BEQ skil11             \ check whether we have any points to award, and if
                        \ not, jump to skil11 to return from the subroutine

                        \ If we get here then we have earned ourselves some
                        \ points and have exited the skill zone, so it's time
                        \ to award those points and give a celebratory beep

 LDX #0                 \ Add A * 10 points to the score and make a beep by
 JSR ScorePoints        \ calling ScorePoints with (X A) = (0 A) = A

 LDA #0                 \ Set A = 0 so we set pointsToAward to zero below, so
                        \ we don't award any more points until they are earned

.skil10

 STA pointsToAward      \ Store any points we've earned in pointsToAward, so
                        \ they get awarded when we leave the skill zone (or, if
                        \ A = 0, this does nothing)

.skil11

 RTS                    \ Return from the subroutine

 EQUB &20               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: Lookup42F0
\       Type: Variable
\   Category: Flight model
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
\       Name: lowNibble
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the low nibble of a value
\
\ ------------------------------------------------------------------------------
\
\ In the table below, lowNibble,X contains the low nibble of X:
\
\   X AND %00001111
\
\ ******************************************************************************

.lowNibble

FOR I%, 0, 255

 EQUB I% AND %00001111

NEXT

\ ******************************************************************************
\
\       Name: xObjectLo
\       Type: Variable
\   Category: 3D geometry
\    Summary: Low byte of the x-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The low byte of the x-coordinate for the object with ID X is at xObjectLo,X.
\
\ This is called XALO in the original source code.
\
\ Object ID  0 has coordinate (  8227, 17731, 11856 )
\ Object ID  1 has coordinate ( 50790,     0, 17500 )
\ Object ID  2 has coordinate ( 19224,     0, 34406 )
\ Object ID  3 has coordinate ( 17885,     0, 25395 )
\ Object ID  4 has coordinate ( 21299,     0, 49152 )
\ Object ID  5 has coordinate ( 36591,     0, 49425 )
\ Object ID  6 has coordinate (     0,     0,     0 )
\ Object ID  7 has coordinate (     0,     0,     0 )
\ Object ID  8 has coordinate (     0,     0,     0 )
\ Object ID  9 has coordinate (     0,     0,     0 )
\ Object ID 10 has coordinate ( 19791,  3367, 23086 )
\ Object ID 11 has coordinate ( 20568,  1824, 21107 )
\ Object ID 12 has coordinate (     0,     0,     0 )
\ Object ID 13 has coordinate (     0,     0,     0 )
\ Object ID 14 has coordinate (     0,     0,     0 )
\ Object ID 15 has coordinate (     0,     0,     0 )
\ Object ID 16 has coordinate ( 36590,     0, 60070 )
\ Object ID 17 has coordinate ( 60074,     0, 54610 )
\ Object ID 18 has coordinate (  2184,     0, 25941 )
\ Object ID 19 has coordinate (  9557,     0, 59801 )
\ Object ID 20 has coordinate ( 22391,     0, 58709 )
\ Object ID 21 has coordinate (  4915,     0, 43964 )
\ Object ID 22 has coordinate ( 34679,     0, 38230 )
\ Object ID 23 has coordinate ( 58163,     0, 39321 )
\ Object ID 24 has coordinate ( 34406,     0, 19960 )
\ Object ID 25 has coordinate ( 55432,     0,  1911 )
\ Object ID 26 has coordinate ( 60894,     0, 16657 )
\ Object ID 27 has coordinate ( 18022,     0, 11469 )
\ Object ID 28 has coordinate ( 34406,     0,  1365 )
\ Object ID 29 has coordinate ( 46421,     0, 29764 )
\ Object ID 30 has coordinate (     0,     0,     0 )
\ Object ID 31 has coordinate (     0,     0,     0 )
\ Object ID 32 has coordinate (     0,     0,     0 )
\ Object ID 33 has coordinate (     0,     0,     0 )
\ Object ID 34 has coordinate (  1088,     0,   832 )
\ Object ID 35 has coordinate ( 16675, 14371, 16672 )
\ Object ID 36 has coordinate (  8243,  3380, 14880 )
\ Object ID 37 has coordinate ( 21297,  1850, 19488 )
\ Object ID 38 has coordinate ( 18746, 30282, 21280 )
\ Object ID 39 has coordinate ( 23106,  6733, 21024 )
\
\ ******************************************************************************

.xObjectLo

 EQUB &23               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &66               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &18               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &DD               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &33               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &EF               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &4F               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &58               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &EE               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &AA               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &88               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &55               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &77               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &33               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &77               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &33               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &66               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &88               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &DE               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &66               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &66               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &55               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &40               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &23               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &33               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &31               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &3A               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &42               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: yObjectLo
\       Type: Variable
\   Category: 3D geometry
\    Summary: Low byte of the y-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The low byte of the y-coordinate for the object with ID X is at yObjectLo,X.
\
\ ******************************************************************************

.yObjectLo

 EQUB &43               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &00               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &00               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &00               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &00               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &00               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &27               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &20               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &00               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &00               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &00               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &00               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &00               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &00               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &00               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &00               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &00               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &00               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &00               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &00               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &00               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &23               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &34               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &3A               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &4A               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &4D               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: zObjectLo
\       Type: Variable
\   Category: 3D geometry
\    Summary: Low byte of the z-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The low byte of the y-coordinate for the object with ID X is at zObjectLo,X.
\
\ ******************************************************************************

.zObjectLo

 EQUB &50               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &5C               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &66               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &33               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &00               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &11               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &2E               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &73               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &A6               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &52               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &55               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &99               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &55               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &BC               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &56               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &99               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &F8               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &77               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &11               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &CD               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &55               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &44               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &40               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &20               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &20               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &20               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &20               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &20               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: xObjectHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the x-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The high byte of the x-coordinate for the object with ID X is at xObjectHi,X.
\
\ This is called XAHI in the original source code.
\
\ ******************************************************************************

.xObjectHi

 EQUB &20               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &C6               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &4B               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &45               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &53               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &8E               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &4D               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &50               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &8E               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &EA               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &08               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &25               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &57               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &13               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &87               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &E3               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &86               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &D8               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &ED               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &46               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &86               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &B5               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &04               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &41               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &20               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &53               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &49               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &5A               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: yObjectHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the y-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The high byte of the y-coordinate for the object with ID X is at yObjectHi,X.
\
\ ******************************************************************************

.yObjectHi

 EQUB &45               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &00               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &00               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &00               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &00               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &00               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &0D               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &07               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &00               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &00               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &00               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &00               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &00               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &00               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &00               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &00               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &00               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &00               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &00               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &00               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &00               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &38               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &0D               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &07               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &76               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &1A               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: zObjectHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the z-coordinate for an object
\
\ ------------------------------------------------------------------------------
\
\ The high byte of the z-coordinate for the object with ID X is at zObjectHi,X.
\
\ ******************************************************************************

.zObjectHi

 EQUB &2E               \ Object ID  0 has coordinate (&2023, &4543, &2E50)
 EQUB &44               \ Object ID  1 has coordinate (&C666, &0000, &445C)
 EQUB &86               \ Object ID  2 has coordinate (&4B18, &0000, &8666)
 EQUB &63               \ Object ID  3 has coordinate (&45DD, &0000, &6333)
 EQUB &C0               \ Object ID  4 has coordinate (&5333, &0000, &C000)
 EQUB &C1               \ Object ID  5 has coordinate (&8EEF, &0000, &C111)
 EQUB &00               \ Object ID  6 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  7 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  8 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID  9 has coordinate (&0000, &0000, &0000)
 EQUB &5A               \ Object ID 10 has coordinate (&4D4F, &0D27, &5A2E)
 EQUB &52               \ Object ID 11 has coordinate (&5058, &0720, &5273)
 EQUB &00               \ Object ID 12 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 13 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 14 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 15 has coordinate (&0000, &0000, &0000)
 EQUB &EA               \ Object ID 16 has coordinate (&8EEE, &0000, &EAA6)
 EQUB &D5               \ Object ID 17 has coordinate (&EAAA, &0000, &D552)
 EQUB &65               \ Object ID 18 has coordinate (&0888, &0000, &6555)
 EQUB &E9               \ Object ID 19 has coordinate (&2555, &0000, &E999)
 EQUB &E5               \ Object ID 20 has coordinate (&5777, &0000, &E555)
 EQUB &AB               \ Object ID 21 has coordinate (&1333, &0000, &ABBC)
 EQUB &95               \ Object ID 22 has coordinate (&8777, &0000, &9556)
 EQUB &99               \ Object ID 23 has coordinate (&E333, &0000, &9999)
 EQUB &4D               \ Object ID 24 has coordinate (&8666, &0000, &4DF8)
 EQUB &07               \ Object ID 25 has coordinate (&D888, &0000, &0777)
 EQUB &41               \ Object ID 26 has coordinate (&EDDE, &0000, &4111)
 EQUB &2C               \ Object ID 27 has coordinate (&4666, &0000, &2CCD)
 EQUB &05               \ Object ID 28 has coordinate (&8666, &0000, &0555)
 EQUB &74               \ Object ID 29 has coordinate (&B555, &0000, &7444)
 EQUB &00               \ Object ID 30 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 31 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 32 has coordinate (&0000, &0000, &0000)
 EQUB &00               \ Object ID 33 has coordinate (&0000, &0000, &0000)
 EQUB &03               \ Object ID 34 has coordinate (&0440, &0000, &0340)
 EQUB &41               \ Object ID 35 has coordinate (&4123, &3823, &4120)
 EQUB &3A               \ Object ID 36 has coordinate (&2033, &0D34, &3A20)
 EQUB &4C               \ Object ID 37 has coordinate (&5331, &073A, &4C20)
 EQUB &53               \ Object ID 38 has coordinate (&493A, &764A, &5320)
 EQUB &52               \ Object ID 39 has coordinate (&5A42, &1A4D, &5220)

\ ******************************************************************************
\
\       Name: randomNumbers
\       Type: Variable
\   Category: Utility routines
\    Summary: A list for keeping a list of random numbers
\
\ ------------------------------------------------------------------------------
\
\ This list contains a pointer to the current position in the first byte. This
\ is stored as an offset in the range 0 to 10, and is incremented every time we
\ stash a new random number in the list, wrapping round to the start when it
\ reaches the end.
\
\ The pointer gets zeroed in the ResetVariables routine.
\
\ ******************************************************************************

.randomNumbers

 EQUB &FB, &FD, &FF, &F9, &FB, &F8, &FB, &FA
 EQUB &53, &52, &FF, &FE, &01, &41, &58, &0D

\ ******************************************************************************
\
\       Name: highNibble
\       Type: Variable
\   Category: Maths
\    Summary: Lookup table for the high nibble of a value
\
\ ------------------------------------------------------------------------------
\
\ In the table below, highNibble,X contains the high nibble of X:
\
\   X AND %11110000
\
\ ******************************************************************************

.highNibble

FOR I%, 0, 255

 EQUB I% AND %11110000

NEXT

\ ******************************************************************************
\
\       Name: objectPoints
\       Type: Variable
\   Category: 3D geometry
\    Summary: Sequences of related points that together make up objects
\  Deep dive: Multi-point objects
\
\ ******************************************************************************

.objectPoints

 EQUB 9 + 40            \ Object  1:   0 -> 9
 EQUB 1                 \ Object  1:   1
 EQUB 1                 \ Object  1:   2
 EQUB 1                 \ Object  1:   3
 EQUB 1                 \ Object  1:   4
 EQUB 1                 \ Object  1:   5
 EQUB 1                 \ Object  1:   6
 EQUB 1                 \ Object  1:   7
 EQUB 1                 \ Object  1:   8
 EQUB 1                 \ Object  1:   9
 EQUB 1                 \ Object  1:  10
 EQUB 1                 \ Object  1:  11
 EQUB 1                 \ Object  1:  12
 EQUB 1                 \ Object  1:  13
 EQUB 1                 \ Object  1:  14
 EQUB 1                 \ Object  1:  15
 EQUB 1                 \ Object  1:  16
 EQUB 1                 \ Object  1:  17
 EQUB 1                 \ Object  1:  18
 EQUB 1                 \ Object  1:  19
 EQUB 1                 \ Object  1:  20
 EQUB 34                \ Object 34:  21
 EQUB 34                \ Object 34:  22
 EQUB 24 + 40           \ Object 34:  23 -> 24
 EQUB 34                \ Object 34:  24
 EQUB 22 + 40           \ Object 34:  25 -> 22
 EQUB 23 + 40           \ Object 34:  26 -> 23 -> 24
 EQUB 24 + 40           \ Object 34:  27 -> 24
 EQUB 34                \ Object 34:  28
 EQUB 22 + 40           \ Object 34:  29 -> 22
 EQUB 0                 \ Object  0:  30
 EQUB 0                 \ Object  0:  31
 EQUB 22 + 40           \ Object 34:  32 -> 22
 EQUB 34                \ Object 34:  33
 EQUB 29 + 40           \ Object 34:  34 -> 29 -> 22
 EQUB 8                 \ Object  8:  35
 EQUB 8                 \ Object  8:  36
 EQUB 40 + 40           \ Object 34:  37 -> 40 -> 39
 EQUB 37 + 40           \ Object 34:  38 -> 37 -> 40 -> 39
 EQUB 34                \ Object 34:  39
 EQUB 39 + 40           \ Object 34:  40 -> 39
 EQUB 2                 \ Object  2:  41
 EQUB 49 + 40           \ Object  2:  42 -> 49 -> 51
 EQUB 50 + 40           \ Object  2:  43 -> 50 -> 52 -> 51
 EQUB 48 + 40           \ Object  2:  44 -> 48 -> 52 -> 51
 EQUB 2                 \ Object  2:  45
 EQUB 51 + 40           \ Object  2:  46 -> 51
 EQUB 52 + 40           \ Object  2:  47 -> 52 -> 51
 EQUB 52 + 40           \ Object  2:  48 -> 52 -> 51
 EQUB 51 + 40           \ Object  2:  49 -> 51
 EQUB 52 + 40           \ Object  2:  50 -> 52 -> 51
 EQUB 2                 \ Object  2:  51
 EQUB 51 + 40           \ Object  2:  52 -> 51
 EQUB 49 + 40           \ Object  2:  53 -> 49 -> 51
 EQUB 50 + 40           \ Object  2:  54 -> 50 -> 52 -> 51
 EQUB 51 + 40           \ Object  2:  55 -> 51
 EQUB 52 + 40           \ Object  2:  56 -> 52 -> 51
 EQUB 59 + 40           \ Object  3:  57 -> 59
 EQUB 59 + 40           \ Object  3:  58 -> 59
 EQUB 3                 \ Object  3:  59
 EQUB 59 + 40           \ Object  3:  60 -> 59
 EQUB 59 + 40           \ Object  3:  61 -> 59
 EQUB 2                 \ Object  2:  62
 EQUB 2                 \ Object  2:  63
 EQUB 2                 \ Object  2:  64
 EQUB 64 + 40           \ Object  2:  65 -> 64
 EQUB 2                 \ Object  2:  66
 EQUB 66 + 40           \ Object  2:  67 -> 66
 EQUB 66 + 40           \ Object  2:  68 -> 66
 EQUB 68 + 40           \ Object  2:  69 -> 68 -> 66
 EQUB 4                 \ Object  4:  70
 EQUB 4                 \ Object  4:  71
 EQUB 73 + 40           \ Object  4:  72 -> 73
 EQUB 4                 \ Object  4:  73
 EQUB 75 + 40           \ Object  4:  74 -> 75
 EQUB 4                 \ Object  4:  75
 EQUB 77 + 40           \ Object  4:  76 -> 77 -> 118
 EQUB 118 + 40          \ Object  4:  77 -> 118
 EQUB 79 + 40           \ Object  4:  78 -> 79 -> 77 -> 118
 EQUB 77 + 40           \ Object  4:  79 -> 77 -> 118
 EQUB 7                 \ Object  7:  80
 EQUB 80 + 40           \ Object  7:  81 -> 80
 EQUB 7                 \ Object  7:  82
 EQUB 7                 \ Object  7:  83
 EQUB 7                 \ Object  7:  84
 EQUB 80 + 40           \ Object  7:  85 -> 80
 EQUB 39 + 40           \ Object 34:  86 -> 39
 EQUB 86 + 40           \ Object 34:  87 -> 86 -> 39
 EQUB 86 + 40           \ Object 34:  88 -> 86 -> 39
 EQUB 6                 \ Object  6:  89
 EQUB 89 + 40           \ Object  6:  90 -> 89
 EQUB 6                 \ Object  6:  91
 EQUB 6                 \ Object  6:  92
 EQUB 6                 \ Object  6:  93
 EQUB 89 + 40           \ Object  6:  94 -> 89
 EQUB 12                \ Object 12:  95
 EQUB 13                \ Object 13:  96
 EQUB 14                \ Object 14:  97
 EQUB 15                \ Object 15:  98
 EQUB 87 + 40           \ Object 34:  99 -> 87 -> 86 -> 39
 EQUB 5                 \ Object  5: 100
 EQUB 5                 \ Object  5: 101
 EQUB 103 + 40          \ Object  5: 102 -> 103
 EQUB 5                 \ Object  5: 103
 EQUB 5                 \ Object  5: 104
 EQUB 104 + 40          \ Object  5: 105 -> 104
 EQUB 5                 \ Object  5: 106
 EQUB 106 + 40          \ Object  5: 107 -> 106
 EQUB 9                 \ Object  9: 108
 EQUB 106 + 40          \ Object  5: 109 -> 106
 EQUB 109 + 40          \ Object  5: 110 -> 109 -> 106
 EQUB 3                 \ Object  3: 111
 EQUB 113 + 40          \ Object  3: 112 -> 113
 EQUB 3                 \ Object  3: 113
 EQUB 3                 \ Object  3: 114
 EQUB 3                 \ Object  3: 115
 EQUB 3                 \ Object  3: 116
 EQUB 4                 \ Object  4: 117
 EQUB 4                 \ Object  4: 118
 EQUB 66 + 40           \ Object  2: 119 -> 66
 EQUB 119 + 40          \ Object  2: 120 -> 119 -> 66
 EQUB 19                \ Object 19: 121
 EQUB 19                \ Object 19: 122
 EQUB 19                \ Object 19: 123
 EQUB 22                \ Object 22: 124
 EQUB 20                \ Object 20: 125
 EQUB 20                \ Object 20: 126
 EQUB 20                \ Object 20: 127
 EQUB 16                \ Object 16: 128
 EQUB 16                \ Object 16: 129
 EQUB 16                \ Object 16: 130
 EQUB 16                \ Object 16: 131
 EQUB 17                \ Object 17: 132
 EQUB 17                \ Object 17: 133
 EQUB 17                \ Object 17: 134
 EQUB 17                \ Object 17: 135
 EQUB 23                \ Object 23: 136
 EQUB 23                \ Object 23: 137
 EQUB 23                \ Object 23: 138
 EQUB 23                \ Object 23: 139
 EQUB 22                \ Object 22: 140
 EQUB 22                \ Object 22: 141
 EQUB 22                \ Object 22: 142
 EQUB 22                \ Object 22: 143
 EQUB 21                \ Object 21: 144
 EQUB 21                \ Object 21: 145
 EQUB 21                \ Object 21: 146
 EQUB 21                \ Object 21: 147
 EQUB 21                \ Object 21: 148
 EQUB 29                \ Object 29: 149
 EQUB 29                \ Object 29: 150
 EQUB 29                \ Object 29: 151
 EQUB 29                \ Object 29: 152
 EQUB 24                \ Object 24: 153
 EQUB 24                \ Object 24: 154
 EQUB 24                \ Object 24: 155
 EQUB 24                \ Object 24: 156
 EQUB 160 + 40          \ Object 18: 157 -> 160
 EQUB 159 + 40          \ Object 18: 158 -> 159
 EQUB 18                \ Object 18: 159
 EQUB 18                \ Object 18: 160
 EQUB 27                \ Object 27: 161
 EQUB 27                \ Object 27: 162
 EQUB 27                \ Object 27: 163
 EQUB 27                \ Object 27: 164
 EQUB 28                \ Object 28: 165
 EQUB 28                \ Object 28: 166
 EQUB 28                \ Object 28: 167
 EQUB 28                \ Object 28: 168
 EQUB 25                \ Object 25: 169
 EQUB 25                \ Object 25: 170
 EQUB 25                \ Object 25: 171
 EQUB 25                \ Object 25: 172
 EQUB 26                \ Object 26: 173
 EQUB 26                \ Object 26: 174
 EQUB 26                \ Object 26: 175
 EQUB 26                \ Object 26: 176
 EQUB 19                \ Object 19: 177
 EQUB 181 + 40          \ Object 30: 178 -> 181
 EQUB 181 + 40          \ Object 30: 179 -> 181
 EQUB 181 + 40          \ Object 30: 180 -> 181
 EQUB 30                \ Object 30: 181
 EQUB 31                \ Object 31: 182
 EQUB 182 + 40          \ Object 31: 183 -> 182
 EQUB 182 + 40          \ Object 31: 184 -> 182
 EQUB 182 + 40          \ Object 31: 185 -> 182
 EQUB 182 + 40          \ Object 31: 186 -> 182
 EQUB 32                \ Object 32: 187
 EQUB 187 + 40          \ Object 32: 188 -> 187
 EQUB 187 + 40          \ Object 32: 189 -> 187
 EQUB 187 + 40          \ Object 32: 190 -> 187
 EQUB 187 + 40          \ Object 32: 191 -> 187
 EQUB 33                \ Object 33: 192
 EQUB 199 + 40          \ Object 33: 193 -> 199 -> 192
 EQUB 197 + 40          \ Object 33: 194 -> 197 -> 192
 EQUB 199 + 40          \ Object 33: 195 -> 199 -> 192
 EQUB 199 + 40          \ Object 33: 196 -> 199 -> 192
 EQUB 192 + 40          \ Object 33: 197 -> 192
 EQUB 197 + 40          \ Object 33: 198 -> 197 -> 192
 EQUB 192 + 40          \ Object 33: 199 -> 192
 EQUB 199 + 40          \ Object 33: 200 -> 199 -> 192
 EQUB 39 + 40           \ Object 34: 201 -> 39
 EQUB 40 + 40           \ Object 34: 202 -> 40 -> 39
 EQUB 205 + 40          \ Object 34: 203 -> 205 -> 40 -> 39
 EQUB 203 + 40          \ Object 34: 204 -> 203 -> 205 -> 40 -> 39
 EQUB 40 + 40           \ Object 34: 205 -> 40 -> 39
 EQUB 205 + 40          \ Object 34: 206 -> 205 -> 40 -> 39
 EQUB 205 + 40          \ Object 34: 207 -> 205 -> 40 -> 39
 EQUB 206 + 40          \ Object 34: 208 -> 206 -> 205 -> 40 -> 39
 EQUB 203 + 40          \ Object 34: 209 -> 203 -> 205 -> 40 -> 39
 EQUB 204 + 40          \ Object 34: 210 -> 204 -> 203 -> 205 -> 40 -> 39
 EQUB 8                 \ Object  8: 211
 EQUB 8                 \ Object  8: 212
 EQUB 9                 \ Object  9: 213
 EQUB 108 + 40          \ Object  9: 214 -> 108
 EQUB 9                 \ Object  9: 215

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

 LDA row29_block20_4    \ If the screen byte at row 29, block 20, pixel row 4 is
 BEQ rjoy1              \ zero (i.e. black) then the joystick is not enabled, so
                        \ jump to rjoy1 to return from the subroutine

 LDX #1                 \ Set aileronPosition to the value from ADC channel 1,
 JSR ReadADCChannel     \ the joystick's x-position, inverted and clipped to the
 STA aileronPosition    \ range -118 to +116

 LDX #2                 \ Set elevatorPosition to the value from ADC channel 2,
 JSR ReadADCChannel     \ the joystick's y-position, inverted and clipped to the
 STA elevatorPosition   \ range -118 to +116

 LDX #0                 \ Call OSBYTE with A = 128 and X = 0 to read the status
 LDA #128               \ of the joystick's fire button into X
 JSR OSBYTE

 TXA                    \ If bit 0 of X is zero, the fire button is not being
 AND #1                 \ pressed, so jump to rjoy1
 BEQ rjoy1

 LDA #8                 \ The fire button is being pressed, so update the key
 STA keyLoggerLow+5     \ logger at keyLoggerLow+5, which corresponds to the
                        \ flaps and fire keys. We set the value to 8, the value
                        \ from keyTable2Lo for the fire button

.rjoy1

 RTS                    \ Return from the subroutine

 EQUB &36

\ ******************************************************************************
\
\       Name: Lookup4700
\       Type: Variable
\   Category: Maths
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Bits 0 to 2 of Lookup4700,X contain int(log2(X))
\ i.e. if Lookup4700,X = n, then X fits into n + 1 binary digits
\
\ Bits 3 to 7 contain the low byte of a lookup, with bits 0 to 2 zeroed, and the
\ high byte coming from Lookup3900 (is this a logarithm table?)
\
\ FOR I%, 0, 255
\
\  EQUB LO(INT(65535 - (256x - x^2 + 0.0035*x^3 + 0.00001*x^4 - ...)))
\
\ NEXT
\
\ ******************************************************************************

.Lookup4700

 EQUB %00000000         \ Index   0 = 00000 ( 0) and 000 (0)
 EQUB %00000000         \ Index   1 = 00000 ( 0) and 000 (0)
 EQUB %00000001         \ Index   2 = 00000 ( 0) and 001 (1)
 EQUB %00001001         \ Index   3 = 00001 ( 1) and 001 (1)
 EQUB %00010010         \ Index   4 = 00010 ( 2) and 010 (2)
 EQUB %00011010         \ Index   5 = 00011 ( 3) and 010 (2)
 EQUB %00100010         \ Index   6 = 00100 ( 4) and 010 (2)
 EQUB %00110010         \ Index   7 = 00110 ( 6) and 010 (2)
 EQUB %01000011         \ Index   8 = 01000 ( 8) and 011 (3)
 EQUB %01010011         \ Index   9 = 01010 (10) and 011 (3)
 EQUB %01100011         \ Index  10 = 01100 (12) and 011 (3)
 EQUB %01111011         \ Index  11 = 01111 (15) and 011 (3)
 EQUB %10001011         \ Index  12 = 10001 (17) and 011 (3)
 EQUB %10100011         \ Index  13 = 10100 (20) and 011 (3)
 EQUB %10111011         \ Index  14 = 10111 (23) and 011 (3)
 EQUB %11011011         \ Index  15 = 11011 (27) and 011 (3)
 EQUB %11110100         \ Index  16 = 11110 (30) and 100 (4)
 EQUB %00010100         \ Index  17 = 00010 ( 2) and 100 (4)
 EQUB %00110100         \ Index  18 = 00110 ( 6) and 100 (4)
 EQUB %01010100         \ Index  19 = 01010 (10) and 100 (4)
 EQUB %01110100         \ Index  20 = 01110 (14) and 100 (4)
 EQUB %10011100         \ Index  21 = 10011 (19) and 100 (4)
 EQUB %11000100         \ Index  22 = 11000 (24) and 100 (4)
 EQUB %11101100         \ Index  23 = 11101 (29) and 100 (4)
 EQUB %00010100         \ Index  24 = 00010 ( 2) and 100 (4)
 EQUB %00111100         \ Index  25 = 00111 ( 7) and 100 (4)
 EQUB %01101100         \ Index  26 = 01101 (13) and 100 (4)
 EQUB %10010100         \ Index  27 = 10010 (18) and 100 (4)
 EQUB %11000100         \ Index  28 = 11000 (24) and 100 (4)
 EQUB %11110100         \ Index  29 = 11110 (30) and 100 (4)
 EQUB %00101100         \ Index  30 = 00101 ( 5) and 100 (4)
 EQUB %01011100         \ Index  31 = 01011 (11) and 100 (4)
 EQUB %10010101         \ Index  32 = 10010 (18) and 101 (5)
 EQUB %11001101         \ Index  33 = 11001 (25) and 101 (5)
 EQUB %00000101         \ Index  34 = 00000 ( 0) and 101 (5)
 EQUB %00111101         \ Index  35 = 00111 ( 7) and 101 (5)
 EQUB %01110101         \ Index  36 = 01110 (14) and 101 (5)
 EQUB %10110101         \ Index  37 = 10110 (22) and 101 (5)
 EQUB %11101101         \ Index  38 = 11101 (29) and 101 (5)
 EQUB %00101101         \ Index  39 = 00101 ( 5) and 101 (5)
 EQUB %01101101         \ Index  40 = 01101 (13) and 101 (5)
 EQUB %10101101         \ Index  41 = 10101 (21) and 101 (5)
 EQUB %11101101         \ Index  42 = 11101 (29) and 101 (5)
 EQUB %00110101         \ Index  43 = 00110 ( 6) and 101 (5)
 EQUB %01111101         \ Index  44 = 01111 (15) and 101 (5)
 EQUB %10111101         \ Index  45 = 10111 (23) and 101 (5)
 EQUB %00000101         \ Index  46 = 00000 ( 0) and 101 (5)
 EQUB %01001101         \ Index  47 = 01001 ( 9) and 101 (5)
 EQUB %10011101         \ Index  48 = 10011 (19) and 101 (5)
 EQUB %11100101         \ Index  49 = 11100 (28) and 101 (5)
 EQUB %00101101         \ Index  50 = 00101 ( 5) and 101 (5)
 EQUB %01111101         \ Index  51 = 01111 (15) and 101 (5)
 EQUB %11001101         \ Index  52 = 11001 (25) and 101 (5)
 EQUB %00011101         \ Index  53 = 00011 ( 3) and 101 (5)
 EQUB %01101101         \ Index  54 = 01101 (13) and 101 (5)
 EQUB %10111101         \ Index  55 = 10111 (23) and 101 (5)
 EQUB %00010101         \ Index  56 = 00010 ( 2) and 101 (5)
 EQUB %01100101         \ Index  57 = 01100 (12) and 101 (5)
 EQUB %10111101         \ Index  58 = 10111 (23) and 101 (5)
 EQUB %00010101         \ Index  59 = 00010 ( 2) and 101 (5)
 EQUB %01101101         \ Index  60 = 01101 (13) and 101 (5)
 EQUB %11000101         \ Index  61 = 11000 (24) and 101 (5)
 EQUB %00011101         \ Index  62 = 00011 ( 3) and 101 (5)
 EQUB %01110101         \ Index  63 = 01110 (14) and 101 (5)
 EQUB %11010110         \ Index  64 = 11010 (26) and 110 (6)
 EQUB %00101110         \ Index  65 = 00101 ( 5) and 110 (6)
 EQUB %10001110         \ Index  66 = 10001 (17) and 110 (6)
 EQUB %11101110         \ Index  67 = 11101 (29) and 110 (6)
 EQUB %01001110         \ Index  68 = 01001 ( 9) and 110 (6)
 EQUB %10101110         \ Index  69 = 10101 (21) and 110 (6)
 EQUB %00001110         \ Index  70 = 00001 ( 1) and 110 (6)
 EQUB %01101110         \ Index  71 = 01101 (13) and 110 (6)
 EQUB %11010110         \ Index  72 = 11010 (26) and 110 (6)
 EQUB %00110110         \ Index  73 = 00110 ( 6) and 110 (6)
 EQUB %10011110         \ Index  74 = 10011 (19) and 110 (6)
 EQUB %00000110         \ Index  75 = 00000 ( 0) and 110 (6)
 EQUB %01101110         \ Index  76 = 01101 (13) and 110 (6)
 EQUB %11010110         \ Index  77 = 11010 (26) and 110 (6)
 EQUB %00111110         \ Index  78 = 00111 ( 7) and 110 (6)
 EQUB %10100110         \ Index  79 = 10100 (20) and 110 (6)
 EQUB %00010110         \ Index  80 = 00010 ( 2) and 110 (6)
 EQUB %01111110         \ Index  81 = 01111 (15) and 110 (6)
 EQUB %11101110         \ Index  82 = 11101 (29) and 110 (6)
 EQUB %01010110         \ Index  83 = 01010 (10) and 110 (6)
 EQUB %11000110         \ Index  84 = 11000 (24) and 110 (6)
 EQUB %00110110         \ Index  85 = 00110 ( 6) and 110 (6)
 EQUB %10100110         \ Index  86 = 10100 (20) and 110 (6)
 EQUB %00010110         \ Index  87 = 00010 ( 2) and 110 (6)
 EQUB %10000110         \ Index  88 = 10000 (16) and 110 (6)
 EQUB %11111110         \ Index  89 = 11111 (31) and 110 (6)
 EQUB %01101110         \ Index  90 = 01101 (13) and 110 (6)
 EQUB %11100110         \ Index  91 = 11100 (28) and 110 (6)
 EQUB %01010110         \ Index  92 = 01010 (10) and 110 (6)
 EQUB %11001110         \ Index  93 = 11001 (25) and 110 (6)
 EQUB %01000110         \ Index  94 = 01000 ( 8) and 110 (6)
 EQUB %10111110         \ Index  95 = 10111 (23) and 110 (6)
 EQUB %00110110         \ Index  96 = 00110 ( 6) and 110 (6)
 EQUB %10101110         \ Index  97 = 10101 (21) and 110 (6)
 EQUB %00100110         \ Index  98 = 00100 ( 4) and 110 (6)
 EQUB %10011110         \ Index  99 = 10011 (19) and 110 (6)
 EQUB %00011110         \ Index 100 = 00011 ( 3) and 110 (6)
 EQUB %10010110         \ Index 101 = 10010 (18) and 110 (6)
 EQUB %00010110         \ Index 102 = 00010 ( 2) and 110 (6)
 EQUB %10010110         \ Index 103 = 10010 (18) and 110 (6)
 EQUB %00001110         \ Index 104 = 00001 ( 1) and 110 (6)
 EQUB %10001110         \ Index 105 = 10001 (17) and 110 (6)
 EQUB %00001110         \ Index 106 = 00001 ( 1) and 110 (6)
 EQUB %10001110         \ Index 107 = 10001 (17) and 110 (6)
 EQUB %00001110         \ Index 108 = 00001 ( 1) and 110 (6)
 EQUB %10010110         \ Index 109 = 10010 (18) and 110 (6)
 EQUB %00010110         \ Index 110 = 00010 ( 2) and 110 (6)
 EQUB %10010110         \ Index 111 = 10010 (18) and 110 (6)
 EQUB %00011110         \ Index 112 = 00011 ( 3) and 110 (6)
 EQUB %10011110         \ Index 113 = 10011 (19) and 110 (6)
 EQUB %00100110         \ Index 114 = 00100 ( 4) and 110 (6)
 EQUB %10101110         \ Index 115 = 10101 (21) and 110 (6)
 EQUB %00110110         \ Index 116 = 00110 ( 6) and 110 (6)
 EQUB %10110110         \ Index 117 = 10110 (22) and 110 (6)
 EQUB %00111110         \ Index 118 = 00111 ( 7) and 110 (6)
 EQUB %11000110         \ Index 119 = 11000 (24) and 110 (6)
 EQUB %01010110         \ Index 120 = 01010 (10) and 110 (6)
 EQUB %11011110         \ Index 121 = 11011 (27) and 110 (6)
 EQUB %01100110         \ Index 122 = 01100 (12) and 110 (6)
 EQUB %11101110         \ Index 123 = 11101 (29) and 110 (6)
 EQUB %01111110         \ Index 124 = 01111 (15) and 110 (6)
 EQUB %00000110         \ Index 125 = 00000 ( 0) and 110 (6)
 EQUB %10010110         \ Index 126 = 10010 (18) and 110 (6)
 EQUB %00100110         \ Index 127 = 00100 ( 4) and 110 (6)
 EQUB %10101111         \ Index 128 = 10101 (21) and 111 (7)
 EQUB %00111111         \ Index 129 = 00111 ( 7) and 111 (7)
 EQUB %11001111         \ Index 130 = 11001 (25) and 111 (7)
 EQUB %01011111         \ Index 131 = 01011 (11) and 111 (7)
 EQUB %11101111         \ Index 132 = 11101 (29) and 111 (7)
 EQUB %01111111         \ Index 133 = 01111 (15) and 111 (7)
 EQUB %00001111         \ Index 134 = 00001 ( 1) and 111 (7)
 EQUB %10100111         \ Index 135 = 10100 (20) and 111 (7)
 EQUB %00110111         \ Index 136 = 00110 ( 6) and 111 (7)
 EQUB %11000111         \ Index 137 = 11000 (24) and 111 (7)
 EQUB %01011111         \ Index 138 = 01011 (11) and 111 (7)
 EQUB %11101111         \ Index 139 = 11101 (29) and 111 (7)
 EQUB %10000111         \ Index 140 = 10000 (16) and 111 (7)
 EQUB %00010111         \ Index 141 = 00010 ( 2) and 111 (7)
 EQUB %10101111         \ Index 142 = 10101 (21) and 111 (7)
 EQUB %01000111         \ Index 143 = 01000 ( 8) and 111 (7)
 EQUB %11011111         \ Index 144 = 11011 (27) and 111 (7)
 EQUB %01110111         \ Index 145 = 01110 (14) and 111 (7)
 EQUB %00001111         \ Index 146 = 00001 ( 1) and 111 (7)
 EQUB %10100111         \ Index 147 = 10100 (20) and 111 (7)
 EQUB %00111111         \ Index 148 = 00111 ( 7) and 111 (7)
 EQUB %11010111         \ Index 149 = 11010 (26) and 111 (7)
 EQUB %01101111         \ Index 150 = 01101 (13) and 111 (7)
 EQUB %00001111         \ Index 151 = 00001 ( 1) and 111 (7)
 EQUB %10100111         \ Index 152 = 10100 (20) and 111 (7)
 EQUB %01000111         \ Index 153 = 01000 ( 8) and 111 (7)
 EQUB %11011111         \ Index 154 = 11011 (27) and 111 (7)
 EQUB %01111111         \ Index 155 = 01111 (15) and 111 (7)
 EQUB %00010111         \ Index 156 = 00010 ( 2) and 111 (7)
 EQUB %10110111         \ Index 157 = 10110 (22) and 111 (7)
 EQUB %01010111         \ Index 158 = 01010 (10) and 111 (7)
 EQUB %11101111         \ Index 159 = 11101 (29) and 111 (7)
 EQUB %10001111         \ Index 160 = 10001 (17) and 111 (7)
 EQUB %00101111         \ Index 161 = 00101 ( 5) and 111 (7)
 EQUB %11001111         \ Index 162 = 11001 (25) and 111 (7)
 EQUB %01101111         \ Index 163 = 01101 (13) and 111 (7)
 EQUB %00001111         \ Index 164 = 00001 ( 1) and 111 (7)
 EQUB %10101111         \ Index 165 = 10101 (21) and 111 (7)
 EQUB %01010111         \ Index 166 = 01010 (10) and 111 (7)
 EQUB %11110111         \ Index 167 = 11110 (30) and 111 (7)
 EQUB %10010111         \ Index 168 = 10010 (18) and 111 (7)
 EQUB %00110111         \ Index 169 = 00110 ( 6) and 111 (7)
 EQUB %11011111         \ Index 170 = 11011 (27) and 111 (7)
 EQUB %01111111         \ Index 171 = 01111 (15) and 111 (7)
 EQUB %00100111         \ Index 172 = 00100 ( 4) and 111 (7)
 EQUB %11000111         \ Index 173 = 11000 (24) and 111 (7)
 EQUB %01101111         \ Index 174 = 01101 (13) and 111 (7)
 EQUB %00010111         \ Index 175 = 00010 ( 2) and 111 (7)
 EQUB %10111111         \ Index 176 = 10111 (23) and 111 (7)
 EQUB %01011111         \ Index 177 = 01011 (11) and 111 (7)
 EQUB %00000111         \ Index 178 = 00000 ( 0) and 111 (7)
 EQUB %10101111         \ Index 179 = 10101 (21) and 111 (7)
 EQUB %01010111         \ Index 180 = 01010 (10) and 111 (7)
 EQUB %11111111         \ Index 181 = 11111 (31) and 111 (7)
 EQUB %10100111         \ Index 182 = 10100 (20) and 111 (7)
 EQUB %01001111         \ Index 183 = 01001 ( 9) and 111 (7)
 EQUB %11110111         \ Index 184 = 11110 (30) and 111 (7)
 EQUB %10011111         \ Index 185 = 10011 (19) and 111 (7)
 EQUB %01001111         \ Index 186 = 01001 ( 9) and 111 (7)
 EQUB %11110111         \ Index 187 = 11110 (30) and 111 (7)
 EQUB %10011111         \ Index 188 = 10011 (19) and 111 (7)
 EQUB %01001111         \ Index 189 = 01001 ( 9) and 111 (7)
 EQUB %11110111         \ Index 190 = 11110 (30) and 111 (7)
 EQUB %10100111         \ Index 191 = 10100 (20) and 111 (7)
 EQUB %01001111         \ Index 192 = 01001 ( 9) and 111 (7)
 EQUB %11111111         \ Index 193 = 11111 (31) and 111 (7)
 EQUB %10100111         \ Index 194 = 10100 (20) and 111 (7)
 EQUB %01010111         \ Index 195 = 01010 (10) and 111 (7)
 EQUB %00000111         \ Index 196 = 00000 ( 0) and 111 (7)
 EQUB %10101111         \ Index 197 = 10101 (21) and 111 (7)
 EQUB %01011111         \ Index 198 = 01011 (11) and 111 (7)
 EQUB %00001111         \ Index 199 = 00001 ( 1) and 111 (7)
 EQUB %10111111         \ Index 200 = 10111 (23) and 111 (7)
 EQUB %01101111         \ Index 201 = 01101 (13) and 111 (7)
 EQUB %00011111         \ Index 202 = 00011 ( 3) and 111 (7)
 EQUB %11001111         \ Index 203 = 11001 (25) and 111 (7)
 EQUB %01111111         \ Index 204 = 01111 (15) and 111 (7)
 EQUB %00101111         \ Index 205 = 00101 ( 5) and 111 (7)
 EQUB %11011111         \ Index 206 = 11011 (27) and 111 (7)
 EQUB %10001111         \ Index 207 = 10001 (17) and 111 (7)
 EQUB %01000111         \ Index 208 = 01000 ( 8) and 111 (7)
 EQUB %11110111         \ Index 209 = 11110 (30) and 111 (7)
 EQUB %10100111         \ Index 210 = 10100 (20) and 111 (7)
 EQUB %01011111         \ Index 211 = 01011 (11) and 111 (7)
 EQUB %00001111         \ Index 212 = 00001 ( 1) and 111 (7)
 EQUB %11000111         \ Index 213 = 11000 (24) and 111 (7)
 EQUB %01110111         \ Index 214 = 01110 (14) and 111 (7)
 EQUB %00101111         \ Index 215 = 00101 ( 5) and 111 (7)
 EQUB %11011111         \ Index 216 = 11011 (27) and 111 (7)
 EQUB %10010111         \ Index 217 = 10010 (18) and 111 (7)
 EQUB %01000111         \ Index 218 = 01000 ( 8) and 111 (7)
 EQUB %11111111         \ Index 219 = 11111 (31) and 111 (7)
 EQUB %10110111         \ Index 220 = 10110 (22) and 111 (7)
 EQUB %01101111         \ Index 221 = 01101 (13) and 111 (7)
 EQUB %00011111         \ Index 222 = 00011 ( 3) and 111 (7)
 EQUB %11010111         \ Index 223 = 11010 (26) and 111 (7)
 EQUB %10001111         \ Index 224 = 10001 (17) and 111 (7)
 EQUB %01000111         \ Index 225 = 01000 ( 8) and 111 (7)
 EQUB %11111111         \ Index 226 = 11111 (31) and 111 (7)
 EQUB %10110111         \ Index 227 = 10110 (22) and 111 (7)
 EQUB %01101111         \ Index 228 = 01101 (13) and 111 (7)
 EQUB %00100111         \ Index 229 = 00100 ( 4) and 111 (7)
 EQUB %11011111         \ Index 230 = 11011 (27) and 111 (7)
 EQUB %10010111         \ Index 231 = 10010 (18) and 111 (7)
 EQUB %01001111         \ Index 232 = 01001 ( 9) and 111 (7)
 EQUB %00001111         \ Index 233 = 00001 ( 1) and 111 (7)
 EQUB %11000111         \ Index 234 = 11000 (24) and 111 (7)
 EQUB %01111111         \ Index 235 = 01111 (15) and 111 (7)
 EQUB %00111111         \ Index 236 = 00111 ( 7) and 111 (7)
 EQUB %11110111         \ Index 237 = 11110 (30) and 111 (7)
 EQUB %10101111         \ Index 238 = 10101 (21) and 111 (7)
 EQUB %01101111         \ Index 239 = 01101 (13) and 111 (7)
 EQUB %00100111         \ Index 240 = 00100 ( 4) and 111 (7)
 EQUB %11100111         \ Index 241 = 11100 (28) and 111 (7)
 EQUB %10011111         \ Index 242 = 10011 (19) and 111 (7)
 EQUB %01011111         \ Index 243 = 01011 (11) and 111 (7)
 EQUB %00010111         \ Index 244 = 00010 ( 2) and 111 (7)
 EQUB %11010111         \ Index 245 = 11010 (26) and 111 (7)
 EQUB %10010111         \ Index 246 = 10010 (18) and 111 (7)
 EQUB %01001111         \ Index 247 = 01001 ( 9) and 111 (7)
 EQUB %00001111         \ Index 248 = 00001 ( 1) and 111 (7)
 EQUB %11001111         \ Index 249 = 11001 (25) and 111 (7)
 EQUB %10001111         \ Index 250 = 10001 (17) and 111 (7)
 EQUB %01000111         \ Index 251 = 01000 ( 8) and 111 (7)
 EQUB %00000111         \ Index 252 = 00000 ( 0) and 111 (7)
 EQUB %11000111         \ Index 253 = 11000 (24) and 111 (7)
 EQUB %10000111         \ Index 254 = 10000 (16) and 111 (7)
 EQUB %01000111         \ Index 255 = 01000 ( 8) and 111 (7)

\ ******************************************************************************
\
\       Name: yLookupLo
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel y-coordinate to low byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ See yLookupHi for an explanation of this table.
\
\ ******************************************************************************

.yLookupLo

FOR I%, 19, 0, -1

 EQUB LO(&5800 + (I% * &138))

NEXT

FOR I%, 31, 20, -1

 EQUB LO(&5800 + (I% * &138))

NEXT

\ ******************************************************************************
\
\       Name: yLookupHi
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel y-coordinate to high byte of
\             screen address
\  Deep dive: Converting pixel coordinates to screen addresses
\
\ ******************************************************************************

.yLookupHi

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

 LDA row1_block1_0,X    \ We want to update the X-th pixel row in the character
                        \ block in the top-left corner of the canopy, so fetch
                        \ the current contents of the row

 AND P                  \ Clear the pixel pointed to by P, which on the first
                        \ iteration round the loop will be the first pixel

 ORA Q                  \ Set the pixel pointed to by Q, which on the first
                        \ iteration round the loop will be the first pixel

 STA row1_block1_0,X    \ Store the updated pixel row back in screen memory, so
                        \ on the first iteration round the loop, we just set the
                        \ first pixel in the bottom pixel row, which is the
                        \ bottom-left pixel of the diagonal in the top-left
                        \ corner of the canopy

 LDA row1_block39_0,X   \ We want to update the X-th pixel row in the character
                        \ block in the top-right corner of the canopy, so fetch
                        \ the current contents of the row

 AND R                  \ Clear the pixel pointed to by R, which on the first
                        \ iteration round the loop will be the last pixel

 ORA S                  \ Set the pixel pointed to by S, which on the first
                        \ iteration round the loop will be the last pixel

 STA row1_block39_0,X   \ Store the updated pixel row back in screen memory, so
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

 LDY #HI(row3_block1_0) \ Set (Y X) to the screen address for row 3, block 1
 LDX #LO(row3_block1_0)

 LDA #8                 \ Set R = 19, so we clear 8 character rows
 STA R

 LDA #0                 \ Set X = 0 so we clear the canopy to black

 JSR FillCanopyRows     \ Fill the 8 screen rows with black, avoiding the canopy
                        \ edges and removing the score display from the screen

 RTS                    \ Return from the subroutine

 EQUB &20, &20          \ These bytes appear to be unused. They actually contain
 EQUB &20, &4C          \ snippets of the original source code
 EQUB &44, &41
 EQUB &26, &38
 EQUB &36, &3A
 EQUB &43, &4C
 EQUB &43, &3A
 EQUB &41

\ ******************************************************************************
\
\       Name: lineBufferV
\       Type: Variable
\   Category: Drawing lines
\    Summary: Line buffer storage for the line direction (V)
\  Deep dive: Source code clues hidden in the game binary
\
\ ------------------------------------------------------------------------------
\
\ This table stores information about lines that are drawn on-screen, so they
\ can be quickly erased without having to spend precious time recalculating the
\ line coordinates. The information is stored when a line is drawn by the
\ DrawClippedLine routine, and is read by the EraseCanopyLines routine when the
\ line is erased.
\
\ ******************************************************************************

.lineBufferV

 EQUB &A2, &07, &A9, &77, &85, &70, &A9, &88
 EQUB &85, &71, &A9, &EE, &85, &72, &A9, &11
 EQUB &85, &73, &A0, &01, &BD, &40, &59, &25
 EQUB &70, &05, &71, &9D, &40, &59, &BD, &68
 EQUB &5A, &25, &72, &05, &73, &9D, &68, &5A
 EQUB &CA, &88, &10, &E8, &46, &72, &46, &73
 EQUB &46, &70, &46, &71, &E0, &FF, &D0, &DA
 EQUB &60, &A0, &5B, &A2, &C0, &A9, &08, &85
 EQUB &72, &A9, &00, &20, &AB, &2E, &60, &10
 EQUB &0F, &2E, &53, &54, &49, &50, &20, &4C
 EQUB &44, &58, &23, &32, &0D, &09, &1A, &2A
 EQUB &2E, &73, &74, &69, &31, &20, &4C, &44

\ ******************************************************************************
\
\       Name: zPointHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the z-coordinate for a point
\
\ ------------------------------------------------------------------------------
\
\ The high byte of the z-coordinate for the point with ID X is at zPointHi,X.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.zPointHi

 EQUB &41, &20, &58, &41, &4C, &4F, &2C, &59
 EQUB &3A, &43, &4C, &43, &3A, &41, &44, &43
 EQUB &20, &44, &54, &49, &50, &3A, &53, &54
 EQUB &41, &26, &37, &37, &2C, &58, &0D, &09
 EQUB &24, &23, &20, &20, &20, &20, &20, &20
 EQUB &4C, &44, &41, &20, &58, &41, &48, &49
 EQUB &2C, &59, &3A, &41, &44, &43, &23, &35
 EQUB &3A, &53, &54, &41, &26, &37, &41, &2C
 EQUB &58, &0D, &09, &2E, &1C, &2E, &73, &74
 EQUB &69, &34, &20, &54, &59, &41, &3A, &43
 EQUB &4C, &43, &3A, &41, &44, &43, &23, &34
 EQUB &30, &3A, &54, &41, &59, &0D, &09, &38
 EQUB &1A, &2E, &73, &74, &69, &32, &20, &44
 EQUB &45, &58, &3A, &42, &50, &4C, &20, &73
 EQUB &74, &69, &33, &3A, &72, &74, &73, &0D
 EQUB &09, &42, &12, &2E, &73, &74, &69, &33
 EQUB &20, &42, &45, &51, &20, &73, &74, &69
 EQUB &31, &0D, &09, &4C, &1D, &20, &20, &20
 EQUB &20, &20, &20, &4C, &44, &41, &20, &58
 EQUB &41, &4C, &4F, &2C, &59, &3A, &53, &54
 EQUB &41, &26, &37, &37, &2C, &58, &0D, &09
 EQUB &56, &26, &20, &20, &20, &20, &20, &20
 EQUB &4C, &44, &41, &20, &58, &41, &48, &49
 EQUB &2C, &59, &3A, &53, &54, &41, &26, &37
 EQUB &41, &2C, &58, &3A, &4A, &4D, &50, &20
 EQUB &73, &74, &69, &34, &0D, &09, &60, &05
 EQUB &20, &0D, &09, &6A, &0F, &2E, &48, &49
 EQUB &54, &53, &20, &4C, &44, &58, &23, &32
 EQUB &0D, &09, &74, &1C, &2E, &68, &69, &74
 EQUB &32, &20, &54, &59, &41, &3A, &43, &4C
 EQUB &43, &3A, &41, &44, &43, &23, &34, &30
 EQUB &3A, &54, &41, &59, &0D, &09, &7E, &28

\ ******************************************************************************
\
\       Name: xPointHi
\       Type: Variable
\   Category: 3D geometry
\    Summary: High byte of the x-coordinate for a point
\
\ ------------------------------------------------------------------------------
\
\ The high byte of the x-coordinate for the point with ID X is at xPointHi,X.
\
\ The initial contents of the variable is just workspace noise and is ignored.
\ It actually contains snippets of the original source code.
\
\ ******************************************************************************

.xPointHi

 EQUB &20, &20, &20, &20, &20, &20, &4C, &44
 EQUB &41, &20, &58, &41, &4C, &4F, &2C, &59
 EQUB &3A, &53, &45, &43, &3A, &53, &42, &43
 EQUB &26, &37, &37, &2C, &58, &3A, &53, &54
 EQUB &41, &26, &37, &34, &0D, &09, &88, &26
 EQUB &20, &20, &20, &20, &20, &20, &4C, &44
 EQUB &41, &20, &58, &41, &48, &49, &2C, &59
 EQUB &3A, &53, &42, &43, &26, &37, &41, &2C
 EQUB &58, &3A, &42, &4E, &45, &20, &68, &69
 EQUB &74, &31, &0D, &09, &92, &22, &20, &20
 EQUB &20, &20, &20, &20, &4C, &44, &41, &26
 EQUB &37, &34, &3A, &43, &4D, &50, &26, &38
 EQUB &30, &2C, &58, &3A, &42, &43, &53, &20
 EQUB &68, &69, &74, &31, &0D, &09, &9C, &26
 EQUB &20, &20, &20, &20, &20, &20, &44, &45
 EQUB &58, &3A, &42, &50, &4C, &20, &68, &69
 EQUB &74, &32, &3A, &4C, &44, &41, &20, &4F
 EQUB &42, &3A, &53, &54, &41, &20, &45, &50
 EQUB &54, &52, &0D, &09, &A6, &19, &20, &20
 EQUB &20, &20, &20, &20, &54, &53, &58, &3A
 EQUB &49, &4E, &58, &3A, &49, &4E, &58, &3A
 EQUB &54, &58, &53, &0D, &09, &A7, &1D, &20
 EQUB &20, &20, &20, &20, &20, &4C, &44, &41
 EQUB &23, &32, &37, &3A, &53, &54, &41, &20
 EQUB &45, &50, &4C, &4F, &3A, &72, &74, &73
 EQUB &0D, &09, &B0, &0D, &2E, &68, &69, &74
 EQUB &31, &20, &72, &74, &73, &0D, &09, &BA
 EQUB &05, &20, &0D, &09, &C4, &1D, &2E, &41
 EQUB &44, &49, &46, &20, &4C, &44, &41, &23
 EQUB &30, &3A, &53, &54, &41, &26, &37, &30
 EQUB &3A, &53, &54, &41, &26, &37, &32, &0D
 EQUB &09, &CE, &1C, &20, &20, &20, &20, &20

\ ******************************************************************************
\
\       Name: CopyWorkToPoint
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Copy a point from the L0C00 workspace to the point tables
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The low byte of the workspace point to copy (x, y, z):
\
\                         * LO(L0C00) = L0C00, turnLo, L0C02
\                                       L0C10, turnHi, L0C12
\
\                         * LO(L0C89) = L0C89, verticalSpeedLo, L0C8B
\                                       L0C99, verticalSpeedHi, L0C9B
\
\                         * LO(xTemp2Lo) = xTemp2Lo, yTemp2Lo, zTemp2Lo
\                                          xTemp2Hi, yTemp2Hi, zTemp2Hi
\
\                         * LO(xPlaneLo) = xPlaneLo, yPlaneLo, zPlaneLo
\                                          xPlaneHi, yPlaneHi, zPlaneHi
\
\   Y                   The ID of the point to update in the point tables
\
\ ******************************************************************************

.CopyWorkToPoint

 LDA L0C00,X            \ Copy the X-th tuple from the L0C00 workspace to the
 STA xPointLo,Y         \ Y-th point coordinate, starting with the low bytes
 LDA turnLo,X
 STA yPointLo,Y
 LDA L0C02,X
 STA zPointLo,Y

 LDA L0C10,X            \ And then the high bytes
 STA xPointHi,Y
 LDA turnHi,X
 STA yPointHi,Y
 LDA L0C12,X
 STA zPointHi,Y

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: CopyPointToWork
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Copy a point from the point tables to the L0C00 workspace
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   Y                   The ID of the point to copy from the point tables
\
\   X                   The low byte of the workspace point to update (x, y, z):
\
\                         * LO(L0C03) = L0C03, L0C04, airspeedLo
\                                       L0C13, L0C14, airspeedHi
\
\                         * LO(L0C83) = L0C83, L0C84, L0C85
\                                       L0C93, L0C94, L0C95
\
\                         * LO(L0C86) = L0C86, L0C87, L0C88
\                                       L0C96, L0C97, L0C98
\
\                         * LO(xTemp2Lo) = xTemp2Lo, yTemp2Lo, zTemp2Lo
\                                          xTemp2Hi, yTemp2Hi, zTemp2Hi
\
\ ******************************************************************************

.CopyPointToWork

 LDA xPointLo,Y         \ Copy the Y-th point coordinate to the X-th tuple from
 STA L0C00,X            \ the L0C00 workspace, starting with the low bytes
 LDA yPointLo,Y
 STA turnLo,X
 LDA zPointLo,Y
 STA L0C02,X

 LDA xPointHi,Y         \ And then the high bytes
 STA L0C10,X
 LDA yPointHi,Y
 STA turnHi,X
 LDA zPointHi,Y
 STA L0C12,X

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: SetPointToOrigin
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Set a point's coordinates to the origin at (0, 0, 0)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The ID of the point to set to the origin
\
\ ******************************************************************************

.SetPointToOrigin

 LDA #0                 \ Set A = 0 so we set the X-th point to (0, 0, 0) below

\ ******************************************************************************
\
\       Name: SetPoint
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Set a point's coordinates to the value (a, a, a)
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The ID of the point to set to the origin
\
\   A                   The value for all three coordinates
\
\ ******************************************************************************

.SetPoint

 STA xPointLo,X         \ Set the point's x-coordinate to A
 STA xPointHi,X

 STA yPointLo,X         \ Set the point's y-coordinate to A
 STA yPointHi,X

 STA zPointLo,X         \ Set the point's z-coordinate to A
 STA zPointHi,X

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: CheckLineDistance
\       Type: Subroutine
\   Category: Visibility
\    Summary: Check whether a point on a line is within the visible distance for
\             the line
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   The line ID of the line to check
\
\   Y                   The point ID of the point to check
\
\ Returns:
\
\   A                   Contains the result as follows:
\
\                         * The current value of showLine if the point is close
\                           enough to be visible
\
\                         * 1 if the point is too far away to be visible
\
\ ******************************************************************************

.CheckLineDistance

 LDA xPointHi,Y         \ Set A to the high byte of the point's x-coordinate

 BPL dist1              \ If the x-coordinate is positive, skip the following
                        \ instruction

 EOR #&FF               \ Otherwise flip the x-coordinate so it's positive, so:
                        \
                        \   A = |xPointHi|

.dist1

 CMP maxLineDistance,X  \ If A >= this line's visible distance, then the point
 BCS dist4              \ is too far away to be seen in the x-axis, so jump to
                        \ dist4 to return a "not visible" result

 LDA yPointHi,Y         \ Set A to the high byte of the point's y-coordinate

 BPL dist2              \ If the y-coordinate is positive, skip the following
                        \ instruction

 EOR #&FF               \ Otherwise flip the y-coordinate so it's positive, so:
                        \
                        \   A = |yPointHi|

.dist2

 CMP maxLineDistance,X  \ If A >= this line's visible distance, then the point
 BCS dist4              \ is too far away to be seen in the y-axis, so jump to
                        \ dist4 to return a "not visible" result

 LDA zPointHi,Y         \ Set A to the high byte of the point's z-coordinate

 BPL dist3              \ If the z-coordinate is positive, skip the following
                        \ instruction

 EOR #&FF               \ Otherwise flip the z-coordinate so it's positive, so:
                        \
                        \   A = |zPointHi|

.dist3

 CMP maxLineDistance,X  \ If A < this line's visible distance, then the point
 BCC dist5              \ is close enough to be visible in the z-axis, so jump
                        \ to dist5 to return an "is visible" result

.dist4

                        \ If we get here then the point is too far away to be
                        \ visible in at least one axis

 LDA #1                 \ Set A = 1 as the return value for a "not visible"
                        \ result

 RTS                    \ Return from the subroutine

.dist5

 LDA #0                 \ The point is close enough to be visible, so return the
 ORA showLine           \ current value of showLine (this could be achieved by a
                        \ simple LDA showLine instruction, so perhaps this more
                        \ convoluted approach is left over from a different
                        \ version of the routine)

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: AddTempToPoint (Part 1 of 2)
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Check whether the vector addition overflowed and set the point's
\             visibility accordingly
\
\ ******************************************************************************

.addv1

                        \ This routine follows on directly from the part 1 of
                        \ AddTempToPoint

 PHP                    \ Store the flags for the z-axis addition on the stack,
                        \ so we can check them below

 LDX #2                 \ We now want to check whether the vector addition
                        \ overflowed in any direction, so set as a counter for
                        \ the three axes

.addv2

 PLP                    \ Retrieve the flags from the stack, so we work through
                        \ the flags from the z-, y- and x-axes in turn

 BVC addv3              \ If the C flag is clear then this addition didn't
                        \ overflow, so jump to addv3 to move on to the next axis

 LDA #%01000000         \ The addition overflowed for this axis, so set bit 6 of
 STA showLine           \ showLine so the line containing this point is marked
                        \ as not being visible

.addv3

 DEX                    \ Decrement the counter to move on to the next axis

 BPL addv2              \ Loop back until we have checked the flags from all
                        \ three additions

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: CheckBridgeAndTown
\       Type: Subroutine
\   Category: Scoring
\    Summary: Check whether we are safely flying under the bridge or down the
\             main street in Acornsville
\
\ ------------------------------------------------------------------------------
\
\ This routine checks whether the plane is within a certain distance of a
\ specific coordinate from the (skillZoneHi skillZoneLo) table. If it is within
\ the correct distance, then it is within the skill zone.
\
\ The plane is said to be within a coordinate's skill zone if the following
\ checks are all true. They start with larger checks and whittle it down to more
\ fine-grained checks, as follows:
\
\   * The vector from the skill zone coordinate to the plane is in a positive
\     direction along each axis, i.e. the plane is somewhere inside a cuboid
\     that has the skill zone coordinate at its bottom-left corner, i.e. the
\     point nearest to the origin in the cuboid is the skill zone coordinate
\     (the origin is at ground level level in the bottom-left corner of the
\     map).
\
\   * The length of the vector along each axis is < 1024, so the plane is close
\     enough to the skill zone coordinate for the following check to be done,
\     i.e. within the rectangular cuboid described above, it is within a cube,
\     of size 1024, in the skill zone coordinate's corner, i.e. in the corner
\     of the cuboid nearest the origin.
\
\   * The length of the vector along each axis divided by 4 is within the margin
\     for this skill zone (as defined in the skillZoneSize table), i.e. the
\     plane is within an even smaller rectangular cuboid, again in the skill
\     zone coordinate's corner, with dimensions given in the skillZoneSize
\     table.
\
\ In short, the plane is in the skill zone if it's inside a box, whose
\ dimensions are given in the skillZoneSize table, and whose corner nearest the
\ origin is at the skill zone coordinate given in the skillZone table - in other
\ words, the cuboid at the skill zone coordinate, with the dimensions in
\ skillZoneSize.
\
\ Or, even shorter, the plane is in a skill zone if this is true for all three
\ axes:
\
\   skill zone    <=      plane      <   skill zone  +  skill zone
\   coordinate         coordinate        coordinate        size
\
\ Arguments:
\
\   A                   Determines which skill zone coordinate to check:
\
\                         * 0, 3, 6 = under the suspension bridge
\
\                         * 9, 12, 15, 18 = along main street in Acornsville
\
\ Returns:
\
\   C flag              The result:
\
\                         * 0 = We are currently flying outside this skill zone
\
\                         * 1 = We are currently flying inside this skill zone
\
\ ******************************************************************************

.CheckBridgeAndTown

 STA Q                  \ Set Q to the skill zone to check

 LDY #2                 \ We now work through the three axes (z, y, x), so set
                        \ Y = 2 to act as an axis counter, going 2, 1, 0

.brtn1

 TYA                    \ Set X = Q + Y
 CLC                    \
 ADC Q                  \ so X is an index into the skill zone coordinate tables
 TAX                    \ for skill zone Q and axis Y

 SEC                    \ Set (A P) = plane coordinate - skillZone coordinate
 LDA xPlaneLo,Y         \
 SBC skillZoneLo,X      \ starting with the high bytes
 STA P

 LDA xPlaneHi,Y         \ And then the low bytes, so (A P) contains the vector
 SBC skillZoneHi,X      \ from the skill zone coordinate to the plane, along
                        \ axis Y

 BMI brtn2              \ If (A P) is negative, jump to brtn2 to clear the C
                        \ flag

 LSR A                  \ Set (A P) = (A P) / 4
 ROR P                  \
 LSR A                  \ If the high byte in A is non-zero, then the original A
 BNE brtn2              \ must be less than %10000000000 (1024), so jump to
 ROR P                  \ brtn2 to clear the C flag

 LDA P                  \ If the low byte in P >= the margin for this skill zone
 CMP skillZoneSize,X    \ in this axis, jump to brtn2 to clear the C flag
 BCS brtn2

 DEY                    \ Decrement the axis counter to point to the next axis

 BPL brtn1              \ Loop back until we have checked all three axes

                        \ If we get here, then:
                        \
                        \   * The vector from the skill zone coordinate to the
                        \     plane is in a positive direction along each axis
                        \
                        \   * The length of the vector along each axis is < 1024
                        \
                        \   * The length of the vector along each axis divided
                        \     by 4 is within the margin for this skill zone
                        \
                        \ which means we are currently flying within this safe
                        \ zone

 SEC                    \ Set the C flag to indicate we are currently flying
                        \ within this skill zone

 RTS                    \ Return from the subroutine

.brtn2

 CLC                    \ Clear the C flag to indicate we are currently flying
                        \ outside this skill zone

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: ScorePoints
\       Type: Subroutine
\   Category: Scoring
\    Summary: Increase the score and make a beep
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (X A)               The number of points to add to the score (in BCD),
\                       divided by 10, so adding &15 will add 150 to the score
\
\ ******************************************************************************

.ScorePoints

 JSR UpdateScore        \ Increase the score by the number of points in A

 LDA #3                 \ Make sound #3, a long, medium beep
 JSR MakeSound

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: Increase the score by a specified number of points
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   (X A)               The number of points to add to the score (in BCD)
\
\ ******************************************************************************

.UpdateScore

 SED                    \ The scores are stored in BCD format, so first of all
                        \ we set the D flag to switch arithmetic to decimal

 CLC                    \ We now want to add (X A) points to the score in
 ADC scoreLo            \ (scoreHi scoreLo), so we start by adding the low bytes
 STA scoreLo            \ and store the result in scoreLo

 TXA                    \ And then we add the high bytes and store the result
 ADC scoreHi            \ in scoreHi
 STA scoreHi

 BCS upsc1              \ If the addition overflowed (so the high byte is
                        \ greater than &99), jump to upsc1 to return from the
                        \ subroutine

 CPX #&99               \ If X is not &99, jump to upsc1 to return from the
 BNE upsc1              \ subroutine (in practice, this routine is only ever
                        \ called with X = 0, so we should never get here)

 LDA #0                 \ If we get here then X = &99 and the addition of the
 STA scoreLo            \ high bytes overflowed, so reset the score to zero
 STA scoreHi

.upsc1

 CLD                    \ Clear the D flag to switch arithmetic back to normal

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: UpdateHighScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: If this is a high score, update the high score
\
\ ******************************************************************************

.UpdateHighScore

 LDA scoreHi            \ If scoreHi < highScoreHi then we have not achieved a
 CMP highScoreHi        \ high score, so jump to uphs3 to return from the
 BCC uphs3              \ subroutine

 BNE uphs1              \ If the high byte of the score and high score are not
                        \ equal, then we know scoreHi > highScoreHi, so jump to
                        \ uphs1 to update the high score

 LDA scoreLo            \ If we get here then scoreHi = highScoreHi, so now we
 CMP highScoreLo        \ check the low bytes. If ScoreHLo < highScoreLo then we
 BCC uphs3              \ have not achieved a high score, so jump to uphs3 to
                        \ return from the subroutine

.uphs1

 LDA scoreLo            \ (scoreHi scoreLo) > (highScoreHi highScoreLo), so this
 STA highScoreLo        \ is a new high score, so update the 16-bit high score
 LDA scoreHi            \ to the new score
 STA highScoreHi

.uphs3

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DisplayScore
\       Type: Subroutine
\   Category: Scoring
\    Summary: Print the scores on-screen
\
\ ******************************************************************************

.DisplayScore

 LDX #0                 \ Print characters 0-15 from scoreText, which moves the
 LDY #16                \ text cursor to column 1, row 3 and prints
 JSR PrintscoreText     \ "HIGH SCORE:  "

 LDA highScoreHi        \ Print the high byte of the high score
 JSR PrintScore

 LDA highScoreLo        \ Print the low byte of the high score
 JSR PrintScore

 LDX #16                \ Print characters 16-19 from scoreText, which prints a
 LDY #20                \ "0" and moves the text cursor to column 3, row 10
 JSR PrintscoreText

 LDX #8                 \ Print characters 8-15 from scoreText, which prints
 LDY #16                \ "SCORE:  "
 JSR PrintscoreText

 LDA scoreHi            \ Print the high byte of the score
 JSR PrintScore

 LDA scoreLo            \ Print the low byte of the score
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
\       Name: PrintscoreText
\       Type: Subroutine
\   Category: Scoring
\    Summary: Print text when showing the scores on-screen
\
\ ------------------------------------------------------------------------------
\
\ Arguments:
\
\   X                   Offset of the first character to print from scoreText
\
\   Y                   Offset of the character that's just after the end of the
\                       string that we want to print from scoreText
\
\ ******************************************************************************

.PrintscoreText

 STY T                  \ Set Y to the offset of the character that's just after
                        \ the end of the string to print

.L4C5E

 LDA scoreText,X        \ Print the X-th character from scoreText
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

 LDA #5                 \ Make sound #5, the sound of a crash
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

 TSX                    \ Remove six bytes from the top of the stack, which
 TXA                    \ removes the top three return addresses that were put
 CLC                    \ there by JSR instructions. This enables us to jump
 ADC #6                 \ straight back to NewGame without leaving any remnants
 TAX                    \ of the call stack behind
 TXS

 JMP NewGame            \ Jump to NewGame to start a new game

\ ******************************************************************************
\
\       Name: NextObjectGroup
\       Type: Subroutine
\   Category: 3D geometry
\    Summary: Cycle to the next object group
\
\ ------------------------------------------------------------------------------
\
\ If the object ID passed to the routine is 6, 7, 8 or 9, then this object is
\ part of an object group, in which case this routine increments the value
\ in objectGroup for this object, so:
\
\   * Object 6 increments objectGroup+0 through  0 to  7 and round again
\   * Object 7 increments objectGroup+1 through  8 to 15 and round again
\   * Object 8 increments objectGroup+2 through 16 to 23 and round again
\   * Object 9 increments objectGroup+3 through 24 to 31 and round again
\
\ Arguments:
\
\   Y                   The Object ID to move on to the next set of coordinates
\
\ Returns:
\
\   C flag              The result of the operation:
\
\                         * Set if this object ID is 6, 7, 8 or 9
\
\                         * Clear otherwise
\
\ ******************************************************************************

.NextObjectGroup

 CPY #6                 \ If Y < 6, jump to nobj1 to return from the subroutine
 BCC nobj1              \ with the C flag clear

 CPY #10                \ If Y >= 10, jump to nobj1 to return from the
 BCS nobj1              \ subroutine with the C flag clear

                        \ If we get here then Y = 6, 7, 8 or 9

 LDA objectGroup-6,Y    \ Increment the value in objectGroup for this object
 CLC                    \ from 0-7, adding in the value from groupStart (which
 ADC #1                 \ contains the start value for each group, i.e. 0, 8,
 AND #7                 \ 16 and 24)
 ORA groupStart-6,Y
 STA objectGroup-6,Y

 SEC                    \ Set the C flag

 RTS                    \ Return from the subroutine

.nobj1

 CLC                    \ Clear the C flag

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: CheckAlienHit
\       Type: Subroutine
\   Category: Theme
\    Summary: Destroy aliens, causing turbulence
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.CheckAlienHit

 LDA L368F
 BEQ L4D19

 LDA #2                 \ Make sound #2, the sound of gunfire hitting its target
 JSR MakeSound          \ ???

 LDX L368E
 LDY zObjectPoint+202,X
 LDA zObjectPoint+197,X
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

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyPointToWork copies the
                        \ coordinates to (xTemp2, yTemp2, zTemp2)

 JSR CopyPointToWork    \ Copy the coordinates from point Y to
                        \ (xTemp2, yTemp2, zTemp2)

 STY T
 LDY #2

.L4CE0

 LDA #0
 STA R
 JSR NextRandomNumber

 TAX
 LDA randomNumbers+1,X
 LSR A
 AND P
 BCC L4CF4

 DEC R
 EOR #&FF

.L4CF4

 ADC xTemp2Lo,Y
 STA xTemp2Lo,Y
 LDA R
 ADC xTemp2Hi,Y
 STA xTemp2Hi,Y
 DEY
 BPL L4CE0

 LDY T                  \ Set Y so the call to CopyWorkToPoint copies the
                        \ coordinates to point T

 LDX #LO(xTemp2Lo)      \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (xTemp2, yTemp2, zTemp2)

 JSR CopyWorkToPoint    \ Copy the coordinates from (xTemp2, yTemp2, zTemp2)
                        \ to point T

 DEY
 CPY U
 BCS L4CD7

 DEC L368F
 BNE L4D19

 JSR ScoreHitPoints

.L4D19

 LDA L368F
 CMP #26
 BNE L4D34

 LDA zTemp2Hi
 LDX L368E
 CPX #33
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
\       Name: ScoreHitPoints
\       Type: Subroutine
\   Category: Scoring
\    Summary: Award points for destroying aliens
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.ScoreHitPoints

 LDA #&FF
 LDY L368E
 CPY #30
 BNE L4D44

 LDX alienCounter
 JMP L4D4A

.L4D44

 LDX alienCounter-30,Y
 STA alienCounter-30,Y

.L4D4A

 STA L4208,X
 CPY #33
 BNE L4D58

 JSR ResetRadar

 LDA #3                 \ Set A = 3 and jump down to L4D68 to award 30 points
 BNE L4D68

.L4D58

 LDX L368D
 CPY #31
 BCS L4D65

 LDA dormantAlienScore  \ Fetch the score for killing a dormant alien (400
 JMP L4D68              \ points) and jump down to L4D68 to increase the score

.L4D65

 LDA alienScore,X

.L4D68

 LDX #0                 \ Add A * 10 points to the score by calling UpdateScore
 JSR UpdateScore        \ with (X A) = (0 A) = A

 RTS

\ ******************************************************************************
\
\       Name: SetRandomNumber
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Set the next item in the randomNumbers list to a new random number
\             and update the pointer to point to it
\
\ ******************************************************************************

.SetRandomNumber

 LDX randomNumbers      \ Fetch the pointer for the randomNumbers list

 LDA VIA+&64            \ Read the 6522 User VIA T1C-L timer 1 low-order
                        \ counter (SHEILA &44) which increments 1000 times a
                        \ second so this will be pretty random

 STA randomNumbers+1,X  \ Set the next item in the list to the random number we
                        \ just fetched

                        \ Fall through into NextRandomNumber to move the list
                        \ pointer to point to the new number we just added

\ ******************************************************************************
\
\       Name: NextRandomNumber
\       Type: Subroutine
\   Category: Utility routines
\    Summary: Point to the next item in the randomNumbers list
\
\ ------------------------------------------------------------------------------
\
\ The pointer for the randomNumbers list is stored in the first location. Each
\ call to this routine increments the pointer through 0 to 10, after which it
\ wraps back round to 0.
\
\ Returns:
\
\   A                   Points to the next number in the randomNumbers list
\
\ ******************************************************************************

.NextRandomNumber

 LDA randomNumbers      \ Set A = randomNumbers + 1
 CLC                    \
 ADC #1                 \ so A points to the next item in the randomNumbers list

 CMP #11                \ If A < 11, skip the following instruction as the
 BCC L4D83              \ pointer hasn't yet reached the end of the list

 LDA #0                 \ A >= 11, which is past the end of the list, so set
                        \ A = 0 to set the pointer back at the start of the list

.L4D83

 STA randomNumbers      \ Store the updated pointer in randomNumbers

 RTS                    \ Return from the subroutine

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
\   A                   The sound number from the soundData table (0 to 7)
\
\ ******************************************************************************

.MakeSound

 ASL A                  \ Set A = A * 8
 ASL A                  \
 ASL A                  \ so we can use it as an index into the soundData table,
                        \ which has 8 bytes per entry

 CLC                    \ Set (Y X) = soundData + A
 ADC #LO(soundData)     \
 TAX                    \ starting with the low byte in X

 LDA #7                 \ Set A = 7 for the OSWORD command to make a sound

 BNE MakeSoundEnvelope  \ Jump to MakeSoundEnvelope to set up Y and apply the
                        \ OSWORD command to the (Y X) block, which makes the
                        \ relevant sound (this BNE is effectively a JMP as A is
                        \ never zero)

\ ******************************************************************************
\
\       Name: TerminateGame
\       Type: Subroutine
\   Category: Setup
\    Summary: Terminate the current game
\
\ ******************************************************************************

.TerminateGame

 LDA #0                 \ Turn off the engine sound
 JSR ToggleEngineSound

 JSR UpdateHighScore    \ If this is a high score, update the high score 

 JSR DisplayScore       \ Print the scores on-screen

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
\   A                   The offset of the sound envelope data in envelopeData:
\
\                         * A = 0 for the first envelope definition
\
\                         * A = 14 for the first envelope definition
\
\ ******************************************************************************

.DefineEnvelope

 CLC                    \ Set (Y X) = envelopeData + A
 ADC #LO(envelopeData)  \
 TAX                    \ starting with the low byte

 LDA #8                 \ Set A = 8 for the OSWORD command to define an envelope

                        \ Fall through into MakeSoundEnvelope to set up Y and
                        \ apply the OSWORD command to the (Y X) block, which
                        \ defines the relevant sound envelope

\ ******************************************************************************
\
\       Name: MakeSoundEnvelope
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

.MakeSoundEnvelope

 LDY #HI(envelopeData)  \ Set y to the high byte of the envelopeData block
                        \ address, so (Y X) now points to the relevant envelope
                        \ or sound data block

 BCC senv1              \ If the addition we did before calling the routine
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

 LDA #0                 \ Make sound #0, to turn off the engine sound
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
 STA soundData+60       \ 255, which is the default setting

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

 LDA engineStatus       \ If engineStatus is zero, then the engine is not
 BEQ engs4              \ running, so jump to engs4 to return from the
                        \ subroutine

 LDA thrustHi           \ Set (K A) = (Thrusthi thrustLo)
 STA K                  \           = Thrust
 LDA thrustLo

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

 CLC                    \ Set K = A + airspeedHi
 ADC airspeedHi         \       = (Thrust / 8) + airspeedHi
 STA K

 LDA #50                \ Set A = 50 - K
 SEC                    \       = 50 - ((Thrust / 8) + airspeedHi)
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

 STA envelopeData+2     \ Set the third and fifth values of sound envelope 1 to
 STA envelopeData+4     \ the value in A, and set the fourth value to the
 EOR #&FF               \ inverse of A, which is -(A + 1) as this is a signed
 STA envelopeData+3     \ value

                        \ We now want to set the pitch of the engine sound so
                        \ that higher thrust and airspeed give us a higher
                        \ pitch, making our Spitfire scream through the air
                        \
                        \ The engine pitch is controlled by byte #5 of sound #7,
                        \ at soundData+60, which contains the low byte of the
                        \ engine pitch, so we now need to calculate a suitable
                        \ pitch value

 LDA K                  \ Set A = K + 80
 CLC                    \       = (Thrust / 8) + airspeedHi + 50
 ADC #80                \
                        \ so A is a higher value when we have higher thrust and
                        \ airspeed, which is what we want

 CMP soundData+60       \ If the pitch in byte #5 of sound #7 is already at this
 BEQ engs4              \ value, jump to engs4 to return from the subroutine, as
                        \ we don't need to change the pitch

 STA soundData+60       \ Otherwise set byte #5 of sound #7 to our new pitch in
                        \ A, so the pitch of the engine sound goes up with our
                        \ thrust and airspeed

 LDA #0                 \ Call DefineEnvelope with A = 0 to redefine the first
 JSR DefineEnvelope     \ sound envelope with the new choppiness values

 LDA #7                 \ Make sound #7, the engine pitch, to change the engine
 JSR MakeSound          \ sound's pitch and choppiness

 LDA #1                 \ Make sound #1, the engine amplitude, to ensure that
 JSR MakeSound          \ both engine sounds are being made, as we need to make
                        \ both #1 and #7 for the sound to work

.engs4

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: DrawGunSights
\       Type: Subroutine
\   Category: Graphics
\    Summary: Draw the canopy corners and the gun sights, if shown
\
\ ******************************************************************************

.DrawGunSights

 JSR DrawCanopyCorners  \ Draw the canopy corners

 LDX #&DA               \ Scan the keyboard to see if "I" is being pressed
 JSR ScanKeyboard

 BNE guns1              \ If "I" is not being pressed, jump to guns1

 BIT gunSights          \ If bit 6 of gunSights is set, then "I" is still being
 BVS guns3              \ held down from a previous call to this routine, so
                        \ jump to guns3 to move on from the subroutine

 LDA #%11000000         \ Set A = gunSights with bits 6 and 7 flipped, which we
 EOR gunSights          \ will set as the new value of gunSights below

 BMI guns2              \ If the result has bit 7 set, that means that bit 7 of
                        \ gunSights is currently clear, so jump to guns2 as the
                        \ sights are not already being shown, so we don't need
                        \ to remove them

                        \ If we get here then bit 7 of gunSights is set, so the
                        \ sights are already on-screen, and we aren't still
                        \ holding down "I" from a previous call, so now we
                        \ remove the sights

 PHA                    \ Store A on the stack so we can retrieve it below

 LDY #HI(row6_block1_0) \ Set (Y X) to the screen address for row 6, block 0
 LDX #LO(row6_block1_0)

 LDA #3                 \ Set R = 3, so we clear 3 character rows for the sights
 STA R

 LDA #0                 \ Set X = 0 so we clear the sights to black

 JSR FillCanopyRows     \ Fill the 3 screen rows with black, avoiding the canopy
                        \ edges and removing the sights from the screen

 PLA                    \ Retrieve A from the stack

 JMP guns2              \ Jump down to guns2 to set gunSights to the value in A

.guns1

                        \ If we get here then "I" is not being pressed

 LDA #%10000000         \ Extract bit 7 from gunSights into A, which clears bit
 AND gunSights          \ 6 to indicate that "I" is not being pressed, while
                        \ leaving the current state of bit 7 alone

.guns2

 STA gunSights          \ Update gunSights to the new value in A

.guns3

 BPL ToggleJoystick     \ If bit 7 of the new value of gunSights is clear, then
                        \ the sights are no longer being shown, so jump down to
                        \ ToggleJoystick to move onto the next routine

                        \ If we get here, then bit 7 of gunSights is set, so we
                        \ need to draw the sights

 LDY #7                 \ First we draw the vertical bar in the middle of the
                        \ sights, which runs through block 20 on rows 6 and 7,
                        \ so we set a pixel row counter in Y to count through
                        \ the rows in each character block

.guns4

 LDA #%10001000         \ Draw a vertical bar in the first pixel of the Y-th
 ORA row6_block20_0,Y   \ pixel row in block 20 on row 6, keeping whatever is
 STA row6_block20_0,Y   \ already on screen

 LDA #%10001000         \ Draw a vertical bar in the first pixel of the Y-th
 ORA row7_block20_0,Y   \ pixel row in block 20 on row 7, keeping whatever is
 STA row7_block20_0,Y   \ already on screen

 DEY                    \ Decrement the pixel row counter

 BPL guns4              \ Loop back to draw the next pixel row until we have
                        \ drawn a vertical line through both character blocks

                        \ Now to draw the horizontal bar of the gun sights

 LDA #%01110111         \ First we draw the left end of the horizontal bar,
 ORA row8_block11_0     \ which is starts with the three rightmost pixels in
 STA row8_block11_0     \ block 11 on row 8

 SEC                    \ Set the C flag for the subtraction below

 LDY #136               \ The rest of the line is made up of 17 character blocks
                        \ with four pixels in each block, so we set a counter in
                        \ Y to work as an offset from the left end of the line,
                        \ counting 8 bytes per character block (17 * 8 = 136),
                        \ working from the right end of the line to the left

.guns5

 LDA #%11111111         \ Draw a horizontal bar of four pixels starting at the
 STA row8_block11_0,Y   \ Y-th offset from the start of block 11 on row 8

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
\   Category: Keyboard
\    Summary: Toggle the joystick setting
\
\ ------------------------------------------------------------------------------
\
\ Note that the game uses row29_block20_4 to check the joystick status, so it
\ is not only an on-screen indicator, it's also the joystick status variable.
\
\ ******************************************************************************

.ToggleJoystick

 LDX #&9F               \ Scan the keyboard to see if TAB is being pressed
 JSR ScanKeyboard

 BNE tjoy1              \ If TAB is not being pressed, jump to tjoy1

 LDA pressingTab        \ If pressingTab is non-zero, then we are still pressing
 BNE tjoy3              \ TAB from a previous visit to this routine, so jump to
                        \ tjoy3 to return from the subroutine

                        \ This is a new press of TAB, so now we want to toggle
                        \ the joystick setting

 LDA row29_block20_4    \ Toggle the joystick indicator pixel above the middle
 EOR #%10001000         \ of the rudder indicator
 STA row29_block20_4

 LDA #128               \ Set A = 128 to use as the value for pressingTab below,
                        \ to indicate that TAB is being pressed

 BNE tjoy2              \ Jump to tjoy2 to skip the following instruction (this
                        \ BNE is effectively a JMP as A is never zero)

.tjoy1

 LDA #0                 \ If we get here then TAB is not being pressed, so we
                        \ set A = 0 to set as the value for pressingTab

.tjoy2

 STA pressingTab        \ Set pressingTab to the value in A, which will be 0 if
                        \ TAB is not being pressed, or 128 if it is being
                        \ pressed

.tjoy3

 RTS                    \ Return from the subroutine

 EQUB &8D               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: envelopeData
\       Type: Variable
\   Category: Sound
\    Summary: Data for two sound envelopes
\
\ ------------------------------------------------------------------------------
\
\ There are two sound envelopes defined in Aviator.
\
\   * Envelope 1 defines the engine sound. The third, fourth and fifth values
\     (envelopeData+2, envelopeData+3 and envelopeData+4) control the choppiness
\     of the engine sound and get altered by the MakeEngineSound routine,
\     depending on the thrust and airspeed. These values control the change of
\     pitch per step in the three stages of the sound envelope, so higher values
\     make the sound jump up and down more in terms of pitch, which makes the
\     sound more choppy and less smooth.
\
\   * Envelope 2 defines the sound of gunfire, both for our Spitfire and for the
\     Theme aliens.
\
\ ******************************************************************************

.envelopeData

 EQUB 1, 1, 50, -50, 50, 1, 2, 1, 0, 0, 0, 0, 0, 0

 EQUB 2, 1, -5, 0, 0, 10, 0, 0, 120, -1, -24, -10, 120, 116

\ ******************************************************************************
\
\       Name: soundData
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

.soundData

 EQUB &10, &00          \ Sound #0: Stop engine sound  (SOUND &10, 0, 0, 0)
 EQUB &00, &00
 EQUB &00, &00
 EQUB &00, &00

 EQUB &10, &00          \ Sound #1: Engine amplitude (SOUND &10, -5, 3, 255)
 EQUB &FB, &FF          \ 
 EQUB &03, &00          \ Second parameter (soundData+10) gets changed in the
 EQUB &FF, &00          \ ProcessVolumeKeys routine to alter the volume

 EQUB &13, &00          \ Sound #2: Gunfire hitting ??? (SOUND &13, 2, 220, 2)
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
                        \ The fifth byte (soundData+60) is the low byte of the
                        \ sound's pitch and gets changed in various places
                        \ to change the pitch of the engine sound

\ ******************************************************************************
\
\       Name: PrintTooLate
\       Type: Subroutine
\   Category: Theme
\    Summary: Print the "TOO LATE!" message at column 6, row 7 on-screen
\
\ ******************************************************************************

.PrintTooLate

 LDX #11                \ There are 11 VDU characters in the message, so set up
                        \ a counter in X

.late1

 LDA tooLateText,X      \ Print the X-th character from pleaseWaitText
 JSR OSWRCH

 DEX                    \ Decrement the loop counter, as the characters are
                        \ stored backwards in the pleaseWaitText variable

 BPL late1              \ Loop back to print the next character until we have
                        \ printed all 11

 RTS                    \ Return from the subroutine

\ ******************************************************************************
\
\       Name: tooLateText
\       Type: Variable
\   Category: Theme
\    Summary: The "TOO LATE!" message shown when the aliens land in Acornsville
\
\ ------------------------------------------------------------------------------
\
\ The text and VDU codes in this variable are stored backwards, perhaps to
\ discourage hackers from working out how to cheat.
\
\ ******************************************************************************

.tooLateText

 EQUB "!ETAL OOT"       \ "TOO LATE!", stored backwards

 EQUB 7, 6, 31          \ VDU 31, 6, 7 moves the text cursor to column 6, row 7

\ ******************************************************************************
\
\       Name: xLookupLo
\       Type: Variable
\   Category: Graphics
\    Summary: Lookup table for converting pixel x-coordinate to low byte of
\             screen address
\
\ ------------------------------------------------------------------------------
\
\ See xLookupHi for an explanation of this table.
\
\ ******************************************************************************

.xLookupLo

FOR I%, 0, 39

 EQUB LO(I% * 8)

NEXT

\ ******************************************************************************
\
\       Name: xLookupHi
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

.xLookupHi

FOR I%, 0, 39

 EQUB HI(I% * 8)

NEXT


\ ******************************************************************************
\
\       Name: keyTable1
\       Type: Variable
\   Category: Keyboard
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Keys in this table are scanned for first. If pressed, the corresponding value
\ in the key logger is set to the 16-bit value, with the high byte coming from
\ keyTable1Hi and the low byte from keyTable1Lo.
\
\ If the key in keyTable1 is not being pressed, we then check the corresponding
\ key in keyTable2. This contains the other key in this key pair, which is
\ normally the opposite key, e.g. up vs down, left vs right and so on.
\
\ ******************************************************************************

.keyTable1

 EQUB &A9               \ L         Elevator (stick forwards, dive)
 EQUB &BE               \ A         Left rudder
 EQUB &AE               \ S         Aileron (joystick left, bank left)
 EQUB &DE               \ W         Decrease throttle
 EQUB &CA               \ U         Undercarriage up/down
 EQUB &BC               \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: keyTable2
\       Type: Variable
\   Category: Keyboard
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ Keys in this table are scanned only if the corresponding key in keyTable1 is
\ not being pressed. If pressed, the corresponding value in the key logger is
\ set to the 16-bit value, with the high byte coming from keyTable2Hi and the
\ low byte from keyTable2Lo.
\
\ ******************************************************************************

.keyTable2

 EQUB &99               \ <         Elevator (stick backwards, ascend)
 EQUB &A8               \ +         Right rudder
 EQUB &CD               \ D         Aileron (joystick right, bank right)
 EQUB &DD               \ E         Increase throttle
 EQUB &9B               \ B         Brakes on/off
 EQUB &FF               \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: axisChangeRate
\       Type: Variable
\   Category: Flight
\    Summary: Stores the amount by which the three axes of movement change when
\             the aileron, elevator or rudder are moved
\
\ ------------------------------------------------------------------------------
\
\ If an axis control key is held down (e.g. dive, yaw left, roll right and so
\ on), then it will change that axis value by 1 in the relevant direction (by
\ updating elevatorPosition, rudderPosition or aileronPosition). If the key is
\ held down, then after six calls to UpdateFlightModel without the key being
\ released, the relevant control is fully engaged, and the rate of change
\ increases to 4 in the relevant direction.
\
\ ******************************************************************************

.axisChangeRate

 EQUB 0                 \ The rate of change of the elevator (pitch)
 EQUB 0                 \ The rate of change of the rudder (yaw)
 EQUB 0                 \ The rate of change of the aileron (roll)

 EQUB 0                 \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: keyTable2Lo
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (low byte) for key presses in keyTable2
\
\ ------------------------------------------------------------------------------
\
\ When a key in keyTable2 is pressed (and assuming the corresponding key in
\ keyTable1 is not being pressed), the low byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.keyTable2Lo

 EQUB 1                 \ <         Elevator (stick backwards, ascend)
 EQUB 1                 \ +         Right rudder
 EQUB 1                 \ D         Aileron (joystick right, bank right)
 EQUB 15                \ E         Increase throttle
 EQUB 7                 \ B         Brakes on/off
 EQUB 8                 \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: keyTable2Hi
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (high byte) for key presses in keyTable2
\
\ ------------------------------------------------------------------------------
\
\ When a key in keyTable2 is pressed (and assuming the corresponding key in
\ keyTable1 is not being pressed), the high byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.keyTable2Hi

 EQUB 1                 \ <         Elevator (stick backwards, ascend)
 EQUB 1                 \ +         Right rudder
 EQUB 1                 \ D         Aileron (joystick right, bank right)
 EQUB 0                 \ E         Increase throttle
 EQUB 0                 \ B         Brakes on/off
 EQUB 0                 \ SHIFT     Fire

\ ******************************************************************************
\
\       Name: keyTable1Lo
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (low byte) for key presses in keyTable1
\
\ ------------------------------------------------------------------------------
\
\ When a key in keyTable1 is pressed (and assuming the corresponding key in
\ keyTable1 is not being pressed), the low byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.keyTable1Lo

 EQUB 1                 \ L         Elevator (stick forwards, dive)
 EQUB 1                 \ A         Left rudder
 EQUB 1                 \ S         Aileron (joystick left, bank left)
 EQUB 241               \ W         Decrease throttle
 EQUB 4                 \ U         Undercarriage up/down
 EQUB 5                 \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: keyTable1Hi
\       Type: Variable
\   Category: Keyboard
\    Summary: Key logger value (high byte) for key presses in keyTable1
\
\ ------------------------------------------------------------------------------
\
\ When a key in keyTable1 is pressed (and assuming the corresponding key in
\ keyTable1 is not being pressed), the high byte of the key logger for this key
\ pair is set to the value in this table.
\
\ ******************************************************************************

.keyTable1Hi

 EQUB 255               \ L         Elevator (stick forwards, dive)
 EQUB 255               \ A         Left rudder
 EQUB 255               \ S         Aileron (joystick left, bank left)
 EQUB 255               \ W         Decrease throttle
 EQUB 0                 \ U         Undercarriage up/down
 EQUB 0                 \ F         Flaps on/off

\ ******************************************************************************
\
\       Name: soundData26
\       Type: Variable
\   Category: Sound
\    Summary: The sound of us making contact with the ground without the
\             undercarriage down
\
\ ------------------------------------------------------------------------------
\
\ This location is at soundData + (26 * 8), so this block is contains the
\ details for sound #26.
\
\ ******************************************************************************

.soundData26

 EQUB &10, &00          \ Sound #26: Ground contact (SOUND &10, -13, 6, 3)
 EQUB &F3, &FF
 EQUB &06, &00
 EQUB &03, &00
 
\ ******************************************************************************
\
\       Name: L4F80
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F80

 EQUB &D4, &C9, &CC, &B0

\ ******************************************************************************
\
\       Name: L4F84
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F84

 EQUB &9C               \ Always either &9C or &27 (156 or 39)

\ ******************************************************************************
\
\       Name: L4F85
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F85

 EQUB &16               \ Drag factor? lift factor?
                        \
                        \ Goes up by 10 if undercarriage is down
                        \ Goes down by 10 if undercarriage is up
                        \ Goes up by 200 if flaps are on
                        \ Goes down by 200 if flaps are off
                        \ Goes up by 20 if engine is on
                        \ Goes down by 20 if engine is switched off
                        \
                        \ Set to 198 in ResetVariables

 EQUB &28

\ ******************************************************************************
\
\       Name: L4F87
\       Type: Variable
\   Category: Flight model
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.L4F87

 EQUB 152               \ Flaps lift factor? Drag factor?
                        \
                        \ Set to 0 if flaps are off, 152 if they are on
                        \
                        \ Zeroed in ResetVariables

 EQUB &00, &00          \ These bytes appear to be unused
 EQUB &FF, &8D
 EQUB &BE, &00
 EQUB &05, &7D
 EQUB &FF, &50

\ ******************************************************************************
\
\       Name: dialQuadrant
\       Type: Variable
\   Category: Dashboard
\    Summary: The value range of a quadrant in each indicator
\
\ ******************************************************************************

.dialQuadrant

 EQUB 18                \ Centre value for indicator 0 (compass)
 EQUB 22                \ Centre value for indicator 1 (airspeed)
 EQUB 16                \ Centre value for indicator 2 (altimeter small)
 EQUB 26                \ Centre value for indicator 3 (altimeter large)
 EQUB 22                \ Centre value for indicator 4 (vertical speed)
 EQUB 26                \ Centre value for indicator 5 (turn)
 EQUB 26                \ Centre value for indicator 6 (slip)

 EQUB &41               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: xDeltaMax
\       Type: Variable
\   Category: Dashboard
\    Summary: The maximum x-delta for the hand line in each indicator
\
\ ******************************************************************************

.xDeltaMax

 EQUB 7                 \ Maximum x-delta for indicator 0 (compass)
 EQUB 9                 \ Maximum x-delta for indicator 1 (airspeed)
 EQUB 5                 \ Maximum x-delta for indicator 2 (altimeter small)
 EQUB 10                \ Maximum x-delta for indicator 3 (altimeter large)
 EQUB 8                 \ Maximum x-delta for indicator 4 (vertical speed)
 EQUB 9                 \ Maximum x-delta for indicator 5 (turn)
 EQUB 9                 \ Maximum x-delta for indicator 6 (slip)

 EQUB &0D               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: yDeltaMax
\       Type: Variable
\   Category: Dashboard
\    Summary: The maximum y-delta for the hand line in each indicator
\
\ ******************************************************************************

.yDeltaMax

 EQUB 12                \ Maximum y-delta for indicator 0 (compass)
 EQUB 10                \ Maximum y-delta for indicator 1 (airspeed)
 EQUB 10                \ Maximum y-delta for indicator 2 (altimeter small)
 EQUB 14                \ Maximum y-delta for indicator 3 (altimeter large)
 EQUB 12                \ Maximum y-delta for indicator 4 (vertical speed)
 EQUB 14                \ Maximum y-delta for indicator 5 (turn)
 EQUB 14                \ Maximum y-delta for indicator 6 (slip)

 EQUB &20               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: indicatorLineI
\       Type: Variable
\   Category: Dashboard
\    Summary: Line buffer storage for the start x-coordinate for each indicator
\             line (I)
\
\ ******************************************************************************

.indicatorLineI

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

\ ******************************************************************************
\
\       Name: indicatorLineJ
\       Type: Variable
\   Category: Dashboard
\    Summary: Line buffer storage for the start y-coordinate for each indicator
\             line (J)
\
\ ******************************************************************************

.indicatorLineJ

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

\ ******************************************************************************
\
\       Name: indicatorBase
\       Type: Variable
\   Category: Dashboard
\    Summary: The base value for each indicator
\
\ ******************************************************************************

.indicatorBase

 EQUB 0                 \ Base value for indicator 0 (compass)
 EQUB 48                \ Base value for indicator 1 (airspeed)
 EQUB 0                 \ Base value for indicator 2 (altimeter small)
 EQUB 0                 \ Base value for indicator 3 (altimeter large)
 EQUB 67                \ Base value for indicator 4 (vertical speed)
 EQUB 53                \ Base value for indicator 5 (turn)
 EQUB 106               \ Base value for indicator 6 (slip)

 EQUB &4C               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: indicatorMin
\       Type: Variable
\   Category: Dashboard
\    Summary: The minimum value shown on each indicator
\
\******************************************************************************

.indicatorMin

 EQUB 0                 \ Minimum value shown on indicator 0 (compass)
 EQUB 57                \ Minimum value shown on indicator 1 (airspeed)
 EQUB 0                 \ Minimum value shown on indicator 2 (altimeter small)
 EQUB 0                 \ Minimum value shown on indicator 3 (altimeter large)
 EQUB 30                \ Minimum value shown on indicator 4 (vertical speed)
 EQUB 33                \ Minimum value shown on indicator 5 (turn)
 EQUB 91                \ Minimum value shown on indicator 6 (slip)

 EQUB &F4               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: indicatorMax
\       Type: Variable
\   Category: Dashboard
\    Summary: The maximum value shown on each indicator
\
\ ******************************************************************************

.indicatorMax

 EQUB 255               \ Maximum value shown on indicator 0 (compass)
 EQUB 122               \ Maximum value shown on indicator 1 (airspeed)
 EQUB 255               \ Maximum value shown on indicator 2 (altimeter small)
 EQUB 255               \ Maximum value shown on indicator 3 (altimeter large)
 EQUB 104               \ Maximum value shown on indicator 4 (vertical speed)
 EQUB 72                \ Maximum value shown on indicator 5 (turn)
 EQUB 120               \ Maximum value shown on indicator 6 (slip)

 EQUB &4C               \ This byte appears to be unused

\ ******************************************************************************
\
\       Name: indicatorLineT
\       Type: Variable
\   Category: Dashboard
\    Summary: Line buffer storage for the indicator line's |x-delta| (T)
\
\ ******************************************************************************

.indicatorLineT

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

\ ******************************************************************************
\
\       Name: indicatorLineU
\       Type: Variable
\   Category: Dashboard
\    Summary: Line buffer storage for the indicator line's |y-delta| (U)
\
\ ******************************************************************************

.indicatorLineU

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

\ ******************************************************************************
\
\       Name: indicatorLineV
\       Type: Variable
\   Category: Dashboard
\    Summary: Line buffer storage for the indicator line's direction (V)
\
\ ******************************************************************************

.indicatorLineV

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

\ ******************************************************************************
\
\       Name: joyYCoord
\       Type: Variable
\   Category: Dashboard
\    Summary: Temporary storage
\
\ ******************************************************************************

.joyYCoord

 EQUB 0                 \ Temporary storage, typically used for storing
                        \ y-coordinates when drawing indicators
 
 EQUB 0                 \ The y-coordinate of the top of the current vertical
                        \ bar for indicator 9 (rudder), so we can erase it when
                        \ required

\ ******************************************************************************
\
\       Name: joyXCoord
\       Type: Variable
\   Category: Dashboard
\    Summary: Temporary storage
\
\ ******************************************************************************

.joyXCoord

 EQUB 0                 \ Temporary storage, typically used for storing
                        \ x-coordinates when drawing indicators

 EQUB 0                 \ The y-coordinate of the top of the current vertical
                        \ bar for indicator 11 (thrust), so we can erase it when
                        \ required

 EQUB &4D, &0D          \ These bytes appear to be unused
 EQUB &0C, &08
 EQUB &15, &20
 EQUB &20, &20
 EQUB &20, &20
 EQUB &20, &4C

\ ******************************************************************************
\
\       Name: indicator0To6
\       Type: Variable
\   Category: Dashboard
\    Summary: The first indicator counter
\
\ ******************************************************************************

.indicator0To6

 EQUB &44               \ The first indicator counter, which cycles through
                        \ indicators 0 to 6, and is used to denote the first
                        \ indicator that gets refreshed in UpdateDashboard

\ ******************************************************************************
\
\       Name: indicator7To11
\       Type: Variable
\   Category: Dashboard
\    Summary: The second indicator counter
\
\ ******************************************************************************

.indicator7To11

 EQUB &59               \ The second indicator counter, which cycles through
                        \ indicators 7 to 10, and is used to denote the second
                        \ indicator that gets refreshed in UpdateDashboard

\ ******************************************************************************
\
\       Name: JC
\       Type: Variable
\   Category: Dashboard
\    Summary: Temporary storage
\
\ ******************************************************************************

.JC

 EQUB &23               \ Temporary storage, typically used to store coordinates
                        \ when drawing the crosses on the joystick position
                        \ display

 EQUB &31, &3A          \ These bytes appear to be unused

\ ******************************************************************************
\
\       Name: altitudeMinutes
\       Type: Variable
\   Category: Dashboard
\    Summary: The value of the altimeter's large "minute" hand
\
\ ******************************************************************************

.altitudeMinutes

 EQUB &4C               \ The value of the altimeter's large "minute" hand,
                        \ in the range 0 to 104 to match the 1,000 feet range
                        \ of the large hand

\ ******************************************************************************
\
\       Name: ApplyFlightModel
\       Type: Subroutine
\   Category: 
\    Summary: Apply the flight model to our plane
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.ApplyFlightModel

 LDX #253               \ Set the point with ID 253 to (0, 0, 0)
 JSR SetPointToOrigin

 LDA #&FE
 LDX onGround
 STX L
 BEQ L502B

 LDX ucStatus
 BEQ L502B

 LDX L0C94
 BPL L502B

 STX Q
 LDA L0C84
 SEC
 ROR Q
 ROR A
 EOR #&FF
 STA yPointLo+253
 LDA #&FE
 CLC
 SBC Q

.L502B

 STA yPointHi+253

 LDA #253               \ Set GG to point ID 253, to pass to the call to 
 STA GG                 \ SetPointCoords

 LDA #27                \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 4 in the calculation

 JSR SetPointCoords     \ Calculate the coordinates for point 253

 LDX #LO(L0C89)         \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (L0C89, verticalSpeed, L0C8B)

 LDY #255               \ Set Y so the call to CopyWorkToPoint copies the
                        \ coordinates to point 255

 STY GG                 \ Set GG to point ID 255, to pass to the call to 
                        \ SetPointCoords

 JSR CopyWorkToPoint    \ Copy the coordinates from (L0C89, verticalSpeed,
                        \ L0C8B) to point 255

 LDA #0                 \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 1 in the calculation

 JSR SetPointCoords     \ Calculate the coordinates for point 255

 LDX #LO(L0C03)         \ Set X so the call to CopyPointToWork copies the
                        \ coordinates to (L0C03, L0C04, airspeed)

 LDY #255               \ Set Y so the call to CopyPointToWork copies the
                        \ coordinates from point 255

 JSR CopyPointToWork    \ Copy the coordinates from point 255 to
                        \ (L0C03, L0C04, airspeed)

 JSR L5295

 JSR L5500

 JSR L5408

 LDA L368F
 BEQ L5081

 LDX #&6A

.L5062

 JSR NextRandomNumber

 TAY
 LDA randomNumbers+1,Y
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

 LDA xPointLo+252
 EOR #&80
 ASL A
 LDA #0
 SBC xPointHi+252
 STA slipRate
 LDA L
 BNE L5099

 JMP L5151

.L5099

 LDX #0
 LDY #0
 LDA airspeedHi
 BMI L50B1

 BNE L50AB

 LDA airspeedLo
 CMP #&14
 BCC L50B1

.L50AB

 LDY rudderPosition
 BPL L50B1

 DEX

.L50B1

 STY turnLo
 TXA
 LDX #1

.L50B7

 ASL turnLo
 ROL A
 DEX
 BPL L50B7

 STA turnHi
 LDX #&82
 JSR L57F6

 STA L0C32
 LDY ucStatus
 BNE L50E7

 LDA L0CFA
 AND L0C90
 BPL L50DE

 LDX #&80
 JSR L57F6

 STA L0C30

.L50DE

 JSR CheckRunway

 BCC L50F5

 LDA #&32
 BNE L50F7

.L50E7

 LDX brakesStatus
 BNE L50DE

 JSR CheckRunway

 BCC L5127

 LDA #7
 BNE L50F7

.L50F5

 LDA #&0B

.L50F7

 LDX airspeedHi
 BMI L5113

 BNE L5115

 LDX airspeedLo
 BEQ L5123

 CPX #&0B
 BCS L5115

 LDA #0
 STA zPointLo+252
 LDA #&FF
 STA zPointHi+252
 BNE L5123

.L5113

 LDA #&F8

.L5115

 STA P
 SEC
 LDA zPointHi+252
 SBC P
 STA zPointHi+252
 JMP L5127

.L5123

 LDA #%01000000
 BNE L5129

.L5127

 LDA #0

.L5129

 STA landingStatus

 LDA L0C03
 LSR A
 STA P
 LDX #0
 STX slipRate
 TXA
 ROR A
 STA V
 LDA L0C13
 AND #&80
 ORA P
 STA Q
 TXA
 SEC
 SBC V
 STA xPointLo+252
 TXA
 SBC Q
 STA xPointHi+252

.L5151

 LDA #9                 \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 2 in the calculation

 LDA #252               \ Set GG to point ID 252, to pass to the call to 
 STA GG                 \ SetPointCoords

 JSR SetPointCoords     \ Calculate the coordinates for point 252

 LDA yPointHi+252
 SEC
 SBC #&10
 STA yPointHi+252

 LDX #LO(L0C83)         \ Set X so the call to CopyPointToWork copies the
                        \ coordinates to (L0C83, L0C84, L0C85)

 LDY #252               \ Set Y so the call to CopyPointToWork copies the
                        \ coordinates from point 252

 JSR CopyPointToWork    \ Copy the coordinates from point 252 to
                        \ (L0C83, L0C84, L0C85)

 JSR L51F9

 JSR L51D7

 LDX #LO(L0C00)         \ Set X so the call to CopyWorkToPoint copies the
                        \ coordinates from (L0C00, turnLo, L0C02)

 LDY #254               \ Set Y so the call to CopyWorkToPoint copies the
                        \ coordinates to point 254

 STY GG                 \ Set GG to point ID 254, to pass to the call to 
                        \ SetPointCoords

 JSR CopyWorkToPoint    \ Copy the coordinates from (L0C00, turnLo, L0C02)
                        \ to point 254

 LDA #18                \ Set the matrix number so the call to SetPointCoords
 STA matrixNumber       \ uses matrix 3 in the calculation

 JSR SetPointCoords     \ Calculate the coordinates for point 254

 LDX #LO(L0C86)         \ Set X so the call to CopyPointToWork copies the
                        \ coordinates to (L0C86, L0C87, L0C88)

 LDY #254               \ Set Y so the call to CopyPointToWork copies the
                        \ coordinates from point 254

 JSR CopyPointToWork    \ Copy the coordinates from point 254 to
                        \ (L0C86, L0C87, L0C88)

 JSR L522D

 LDA #7                 \ Make the engine sound
 JSR ToggleEngineSound

 JSR CheckLanding

 JSR ShowUpsideDownBar  \ Show or hide the bar in the artificial horizon that
                        \ shows whether the plane is upside down

 LDA fuelLevel
 BEQ L51D1

 LDA engineStatus
 BEQ L51D6

 LDA thrustHi
 STA R
 LDA thrustLo
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

 LDA fuelLevel
 BEQ L51D1

 DEC fuelLevel
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

 ADC xPlaneLo,X
 STA xPlaneLo,X
 LDA xPlaneHi,X
 ADC R
 STA xPlaneHi,X
 LDA xPlaneTop,X
 ADC R
 STA xPlaneTop,X
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

 LDA compassHeading,X
 EOR #&80
 STA compassHeading,X
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

 STA Q
 CPX #1
 BNE L52D3

 LDA P
 STA I
 LDA Q
 ASL I
 ROL A
 ASL I
 ROL A
 STA J
 LDA Q

.L52D3

 CMP SS
 BCC L52E7

 BNE L52E1

 LDA P
 CMP RR
 BCC L52E7

 LDA Q

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

 LDA airspeedHi
 CMP #&0B
 BCC L533A

.L5307

 LDA J
 CMP airspeedHi
 BCC L5347

 BNE L5317

 LDA I
 CMP airspeedLo
 BCC L5347

.L5317

 LDA yPlaneHi
 BNE L5323

 LDA yPlaneLo
 CMP #&14
 BCC L533A

.L5323

 LDA L4F84
 CMP #&27
 BEQ L533A

 LDA turnHi
 ASL A
 LDY #4
 LDX #2
 LDA L0C10
 EOR #&3F
 JSR L57BB

.L533A

 LDA L
 BNE L5347

 LDA #4                 \ Make sound #4, a short, low beep
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
 STA mult1+1

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

 LDA #0                 \ Set K = 0, so Multiply16x16Mix doesn't negate the
 STA K                  \ result, and returns the sign of the result in K

 STX VV

 JSR Multiply16x16Mix

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

 LDA #128               \ Default
 STA mult1+1

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
 LDA flapsStatus
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

 LDA #3                 \ Make sound #3, a long, medium beep
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
 STA Q

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

 LDX Q
 BPL L5484

 LDA #0
 SEC
 SBC P
 STA P
 LDA #0
 SBC Q
 TAX

.L5484

 LDY R

 JSR Multiply8x8        \ Set (A V) = X * Y

 STA G
 LDA V
 STA W
 LDY R
 LDX P

 JSR Multiply8x8        \ Set (A V) = X * Y

 CLC
 ADC W
 STA W
 LDA #0
 ADC G
 STA G
 LDX Q
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
 STA Q
 ASL P
 ROL Q
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

 LDA elevatorPosition,X
 BEQ L552F

 LDY keyLoggerLow,X
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

 EOR keyLoggerHigh,X
 BPL L552F

.L552A

 LDA #0

.L552C

 STA elevatorPosition,X

.L552F

 LDA elevatorPosition,X
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
 LDY elevatorPosition,X
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
 LDA yPointLo+253
 CLC
 ADC L0C30
 STA L0C30
 LDA yPointHi+253
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
 STA xPointLo+252
 LDA #0
 SBC L0C73
 STA xPointHi+252
 SEC
 LDA L0C67
 SBC L0C64
 STA yPointLo+252
 LDA L0C77
 SBC L0C74
 STA yPointHi+252

 LDA airspeedHi         \ Set A to the high byte of our airspeed

 BMI L55F3              \ If it is negative, jump down to L55F3 to skip the
                        \ following checks

 PHA                    \ Store A on the stack so we can retrieve it after the
                        \ following call to RetractFlapsIfFast

 JSR RetractFlapsIfFast \ Retract the flaps if we are going too fast

 PLA                    \ Retrieve the value of A from the stack

 CMP #&30
 BCC L55F5

 LDA #&EA
 BNE L5649

.L55F3

 LDA #0

.L55F5

 LDX engineStatus
 BEQ L5636

 STA H
 STA G
 LDA airspeedLo
 LDX #3

.L5603

 LSR G
 ROR A
 DEX
 BPL L5603

 STA W
 LDY thrustHi
 STY R
 LDA thrustLo
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
 STA zPointLo+252
 TYA
 SBC L0C75

.L5649

 STA zPointHi+252
 RTS

\ ******************************************************************************
\
\       Name: CheckRunway
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.CheckRunway

 LDA xPlaneLo
 SEC
 SBC xObjectLo+1
 LDA xPlaneHi
 SBC xObjectHi+1
 BNE L566E

 LDA zPlaneLo
 SEC
 SBC zObjectLo+1
 LDA zPlaneHi
 SBC zObjectHi+1
 BMI L566E

 CMP #&18
 RTS

.L566E

 SEC
 RTS

\ ******************************************************************************
\
\       Name: CheckLanding
\       Type: Subroutine
\   Category: 
\    Summary: 
\
\ ------------------------------------------------------------------------------
\
\ 
\
\ ******************************************************************************

.CheckLanding

 LDA L
 BEQ L568F

 JSR CheckRunway

 BCC L568F

 ASL landingStatus      \ Shift landingStatus left and set bit 0

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

 LDA yPlaneHi
 BMI L56A3

 BEQ L56A8

 CMP #2
 BCC L569D

 STA reached512ft       \ Set reached512ft = 2 when yPlaneHi >= 2

.L569D

 LDA #0
 STA onGround
 RTS

.L56A3

 LDX #&EE
 JSR L57F6

.L56A8

 LDA L0CF0
 CMP yPlaneLo
 BCC L569D

 LDX L
 BEQ L5701

 STA yPlaneLo
 LDX verticalSpeedHi
 BPL L56C1

 LDX #&8A
 JSR L57F6

.L56C1

 LDX #&EC
 JSR L57F6

 LDX #2
 JSR L57F6

 LDX ucStatus
 BNE L56E8

 LDX landingStatus
 BMI L56D8

 ASL landingStatus

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
 SBC yPlaneLo
 LSR A
 CLC
 ADC L0CF0
 STA yPlaneLo
 LDA verticalSpeedHi
 BPL L5720

 SEC
 LDA #0
 SBC verticalSpeedLo
 STA verticalSpeedLo
 LDA #0
 SBC verticalSpeedHi

.L5720

 STA verticalSpeedHi
 LSR A
 BNE L573D

 LDA verticalSpeedLo
 ROR A
 STA R

 LDX ucStatus           \ If ucStatus is non-zero, then the undercarriage
 BNE L5739              \ is down, so jump to L5739

                        \ If we get here then the undercarriage is up and
                        \ verticalSpeedHi / 2 = 0, so we are in the process of
                        \ making a crash landing (or we've pulled up the
                        \ undercarriage when still on the runway)

 DEX                    \ Set propellorStatus = 255 to denote that the propellor
 STX propellorStatus    \ is broken, so we can't turn the engine on again

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

 JSR CheckRunway

 BCC L575A

 LDA R
 STA verticalSpeedLo
 LDX ucStatus
 BEQ L575A

 CMP #&50
 BCC L5762

 BCS L573D

.L575A

 LDA #26                \ Make sound #26, the sound of us making contact with
 JSR MakeSound          \ the ground without having our undercarriage down

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

 LDA ucStatus
 BNE L579F

 LDX #&EA
 JSR L57F6

.L579F

 LDA R
 CMP #&0C
 BCS L57B2

 LDA yPlaneLo
 CMP L0CF0
 BNE L57B2

 LDA #1                 \ Set onGround = 1 to denote that we are on the ground
 STA onGround

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

 LDA airspeedHi
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

 STY Q
 STX P
 LDA yPlaneHi
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

\ Code between &0D00 and &10FF starts out at &5800 before being moved
COPYBLOCK &0D00, &1100, &5800

\ Code between &0B00 and &0CFF starts out at &5C00 before being moved
COPYBLOCK &0B00, &0D00, &5C00

SAVE "3-assembled-output/AVIA.bin", LOAD%, P%

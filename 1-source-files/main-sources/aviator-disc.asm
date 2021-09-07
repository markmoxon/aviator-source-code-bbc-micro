\ ******************************************************************************
\
\ AVIATOR DISC IMAGE SCRIPT
\
\ Aviator was written by Geoffrey J Crammond and is copyright Acornsoft 1984
\
\ ------------------------------------------------------------------------------
\
\ This source file produces the following SSD disc image:
\
\   * aviator-bbcmicro-co-uk.ssd
\
\ This can be loaded into an emulator or a real BBC Micro.
\
\ ******************************************************************************

PUTFILE "1-source-files/boot-files/$.!BOOT.bin", "!BOOT", &FFFFFF, &FFFFFF
PUTFILE "1-source-files/basic-programs/$.AVIA.bin", "AVIA", &FF1900, &FF8023
PUTFILE "1-source-files/basic-programs/$.AVIA1.bin", "AVIA1", &FF1900, &FF8023
PUTFILE "1-source-files/basic-programs/$.AVIATOR.bin", "AVIATOR", &FF1900, &FF8023
PUTFILE "1-source-files/images/$.DASHBD.bin", "DASHBD", &FF7100, &FF7100
PUTFILE "3-assembled-output/AVIA.bin", "AVIA?", &FF1100, &FF5E00

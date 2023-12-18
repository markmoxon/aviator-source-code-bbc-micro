BEEBASM?=beebasm
PYTHON?=python

# A make command with no arguments will build Aviator with crc32
# verification of the game binaries
#
# Optional arguments for the make command are:
#
#   verify=no           Disable crc32 verification of the game binaries
#
# So, for example:
#
#   make verify=no
#
# will build Aviator with no crc32 verification

.PHONY:all
all:
	$(BEEBASM) -i 1-source-files/main-sources/aviator-source.asm -v > 3-assembled-output/compile.txt
	$(BEEBASM) -i 1-source-files/main-sources/aviator-disc.asm -do 5-compiled-game-discs/aviator-bbcmicro-co-uk.ssd -opt 3 -title "Aviator"
ifneq ($(verify), no)
	@$(PYTHON) 2-build-files/crc32.py 4-reference-binaries/bbcmicro-co-uk 3-assembled-output
endif

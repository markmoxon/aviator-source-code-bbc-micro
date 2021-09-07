BEEBASM?=beebasm
PYTHON?=python

.PHONY:build
build:
	$(BEEBASM) -i 1-source-files/main-sources/aviator-source.asm -v > 3-assembled-output/compile.txt
	$(BEEBASM) -i 1-source-files/main-sources/aviator-disc.asm -do 5-compiled-game-discs/aviator-bbcmicro-co-uk.ssd -opt 3 -title "Aviator"

.PHONY:verify
verify:
	@$(PYTHON) 2-build-files/crc32.py 4-reference-binaries/bbcmicro-co-uk 3-assembled-output

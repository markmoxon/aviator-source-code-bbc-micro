# Fully documented source code for Aviator on the BBC Micro

![Screenshot of Aviator on the BBC Micro](https://aviator.bbcelite.com/images/github/Aviator.png)

This repository contains source code for the Aviator on the BBC Micro, with every single line documented and (for the most part) explained.

It is a companion to the [aviator.bbcelite.com website](https://aviator.bbcelite.com).

See the [introduction](#introduction) for more information.

## Contents

* [Introduction](#introduction)

* [Acknowledgements](#acknowledgements)

  * [A note on licences, copyright etc.](#user-content-a-note-on-licences-copyright-etc)

* [Browsing the source in an IDE](#browsing-the-source-in-an-ide)

* [Folder structure](#folder-structure)

* [Building Aviator from the source](#building-aviator-from-the-source)

  * [Requirements](#requirements)
  * [Build targets](#build-targets)
  * [Windows](#windows)
  * [Mac and Linux](#mac-and-linux)
  * [Verifying the output](#verifying-the-output)
  * [Log files](#log-files)

## Introduction

This repository contains source code for Aviator on the BBC Micro, with every single line documented and (for the most part) explained..

You can build the fully functioning game from this source. One release is currently supported: the version from the Complete BBC Micro Games Archive at bbcmicro.co.uk.

It is a companion to the [aviator.bbcelite.com website](https://aviator.bbcelite.com) website, which contains all the code from this repository, but laid out in a much more human-friendly fashion.

* If you want to browse the source and read about how Aviator works under the hood, you will probably find [the website](https://aviator.bbcelite.com) is a better place to start than this repository.

* If you would rather explore the source code in your favourite IDE, then the [annotated source](1-source-files/main-sources/aviator-source.asm) is what you're looking for. It contains the exact same content as the website, so you won't be missing out (the website is generated from the source files, so they are guaranteed to be identical). You might also like to read the section on [Browsing the source in an IDE](#browsing-the-source-in-an-ide) for some tips.

* If you want to build Aviator from the source on a modern computer, to produce a working game disc that can be loaded into a BBC Micro or an emulator, then you want the section on [Building Aviator from the source](#building-aviator-from-the-source).

My hope is that this repository will be useful for those who want to learn more about Aviator and what makes it tick. It is provided on an educational and non-profit basis, with the aim of helping people appreciate the magic of Geoff Crammond's first simulator, which was ground-breaking and deeply impressive for its time.

## Acknowledgements

Aviator was written by Geoffrey J Crammond and is copyright &copy; Acornsoft 1983.

The code on this site has been disassembled from the version released on the [Complete BBC Micro Games Archive at bbcmicro.co.uk](http://bbcmicro.co.uk/game.php?id=39).

The commentary is copyright &copy; Mark Moxon. Any misunderstandings or mistakes in the documentation are entirely my fault.

### A note on licences, copyright etc.

This repository is _not_ provided with a licence, and there is intentionally no `LICENSE` file provided.

According to [GitHub's licensing documentation](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/licensing-a-repository), this means that "the default copyright laws apply, meaning that you retain all rights to your source code and no one may reproduce, distribute, or create derivative works from your work".

The reason for this is that my commentary is intertwined with the original Aviator game code, and the original game is copyright. The whole site is therefore covered by default copyright law, to ensure that this copyright is respected.

Under GitHub's rules, you have the right to read and fork this repository... but that's it. No other use is permitted, I'm afraid.

My hope is that the educational and non-profit intentions of this repository will enable it to stay hosted and available, but the original copyright holders do have the right to ask for it to be taken down, in which case I will comply without hesitation.  I do hope, though, that along with the various other disassemblies and commentaries of Acornsoft's games for the BBC Micro, it will remain viable.

## Browsing the source in an IDE

If you want to browse the source in an IDE, you might find the following useful.

* The most interesting files are in the [main-sources](1-source-files/main-sources) folder:

  * The main game's source code is in the [aviator-source.asm](1-source-files/main-sources/aviator-source.asm) file - this is the motherlode and probably contains all the stuff you're interested in. It produces a file called `AVIA?` that contains the entire game.

  * The game's loader programs are in the [basic-programs](1-source-files/basic-programs) folder - they are, however, completely optional, and it is possible to skip these and run the game using `*RUN AVIA?` or just plain `*AVIA?`.

* It's probably worth skimming through the [notes on terminology and notations](https://aviator.bbcelite.com/about_site/terminology_used_in_this_commentary.html) on the accompanying website, as this explains a number of terms used in the commentary, without which it might be a bit tricky to follow at times (in particular, you should understand the terminology I use for multi-byte numbers).

* The entry point for the [main game code](1-source-files/main-sources/aviator-source.asm) is routine `Entry`, which you can find by searching for `Name: Entry`.

* The source code is designed to be read at an 80-column width and with a monospaced font, just like in the good old days.

I hope you enjoy exploring the inner-workings of Aviator as much as I have.

## Folder structure

There are five main folders in this repository, which reflect the order of the build process.

* [1-source-files](1-source-files) contains all the different source files, such as the main assembler source files, image binaries, BASIC loader programs, boot files and so on.

* [2-build-files](2-build-files) contains build-related scripts, such as the crc32 verification scripts.

* [3-assembled-output](3-assembled-output) contains the output from the assembly process, when the source files are assembled and the results processed by the build files.

* [4-reference-binaries](4-reference-binaries) contains the correct binaries for each release, so we can verify that our assembled output matches the reference.

* [5-compiled-game-discs](5-compiled-game-discs) contains the final output of the build process: an SSD disc image that contains the compiled game and which can be run on real hardware or in an emulator.

## Building Aviator from the source

### Requirements

You will need the following to build Aviator from the source:

* BeebAsm, which can be downloaded from the [BeebAsm repository](https://github.com/stardot/beebasm). Mac and Linux users will have to build their own executable with `make code`, while Windows users can just download the `beebasm.exe` file.

* Python. Both versions 2.7 and 3.x should work.

* Mac and Linux users may need to install `make` if it isn't already present (for Windows users, `make.exe` is included in this repository).

Let's look at how to build Aviator from the source.

### Build targets

There is one main build target available:

* `build` - A version that exactly matches the original binaries

Builds are supported for both Windows and Mac/Linux systems. In all cases the build process is defined in the `Makefile` provided.

Note that the build ends with a warning that there is no `SAVE` command in the source file. You can ignore this, as the source file contains a `PUTFILE` command instead, but BeebAsm still reports this as a warning.

### Windows

For Windows users, there is a batch file called `make.bat` to which you can pass one of the build targets above. Before this will work, you should edit the batch file and change the values of the `BEEBASM` and `PYTHON` variables to point to the locations of your `beebasm.exe` and `python.exe` executables. You also need to change directory to the repository folder (i.e. the same folder as `make.bat`).

All being well, doing the following:

```
make.bat build
```

will produce a file called `aviator-bbcmicro-co-uk.ssd` in the `5-compiled-game-discs` folder that contains the version of the game from bbcmicro.co.uk, which you can then load into an emulator, or into a real BBC Micro using a device like a Gotek.

### Mac and Linux

The build process uses a standard GNU `Makefile`, so you just need to install `make` if your system doesn't already have it. If BeebAsm or Python are not on your path, then you can either fix this, or you can edit the `Makefile` and change the `BEEBASM` and `PYTHON` variables in the first two lines to point to their locations. You also need to change directory to the repository folder (i.e. the same folder as `Makefile`).

All being well, doing the following:

```
make build
```

will produce a file called `aviator-bbcmicro-co-uk.ssd` in the `5-compiled-game-discs` folder that contains the version of the game from bbcmicro.co.uk, which you can then load into an emulator, or into a real BBC Micro using a device like a Gotek.

### Verifying the output

The build process also supports a verification target that prints out checksums of all the generated files, along with the checksums of the files from the original sources.

You can run this verification step on its own, or you can run it once a build has finished. To run it on its own, use the following command on Windows:

```
make.bat verify
```

or on Mac/Linux:

```
make verify
```

To run a build and then verify the results, you can add two targets, like this on Windows:

```
make.bat build verify
```

or this on Mac/Linux:

```
make build verify
```

The Python script `crc32.py` in the `2-build-files` folder does the actual verification, and shows the checksums and file sizes of both sets of files, alongside each other, and with a Match column that flags any discrepancies.

The binaries in the `4-reference-binaries` folder are those extracted from the released version of the game, while those in the `3-assembled-output` folder are produced by the build process. For example, if you don't make any changes to the code and build the project with `make build verify`, then this is the output of the verification process:

```
Results for release: bbcmicro-co-uk
[--originals--]  [---output----]
Checksum   Size  Checksum   Size  Match  Filename
-----------------------------------------------------------
f263f756  19785  f263f756  19785   Yes   AVIA.bin
```

The compiled binary matches the original, so we know we are producing the same final game as the release version.

### Log files

During compilation, details of every step are output in a file called `compile.txt` in the `3-assembled-output` folder. If you have problems, it might come in handy, and it's a great reference if you need to know the addresses of labels and variables for debugging (or just snooping around).

---

_Mark Moxon_
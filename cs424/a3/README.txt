CPSC 424 Assignment 3 template
Instructor: Prof. Alla Sheffer
Template last modified by: Shayan Hoshyari

================== from e8y0b ==================

  I'm using Linux to run the program.
  I've finished all of the tasks.
  For 3.4 I've chosen C1 continuity.
  (implementing this by adding quartic curves)

================================================

First, the example executables can be found as:
  a3_example for Linux
  a3_example.exe for Windows

The code is written in these files:
  vector.h
  pointcanvas.h pointcanvas.cpp
  bezier.h      bezier.cpp
  main.cpp

To build the project using MSVC 2017 simply open a3.sln. All the files
listed below are only used by Visual studio. 
  a3.sln
  a3.vcxproj
  a3.vcxproj.filters
  glut32.dll
  glut32.lib
  glut.def
  glut.h

To build the project on Unix based systems use the Makefile by running
make. In the Makefile there are two options that you have to set. All
the possible options are present and commented out, so you can simply
change them by commenting and un-commenting. However, be carefull not
to introduce trailing blank spaces as they mess up the if-clauses in
the Makefile.

Option 1: Set the OS variable
  OS := Linux, for your own linux
  OS := Linux_ubc_cs, for UBC CS Opensuse 64bit Linux machines
  OS := Mac, for MAC (support not guaranteed)

Option 2: Set the MODE variable
  MODE := opt, to build in optmizied mode (runs fast but no debugging info)
  MODE := dbg, to build in debug mode, (runs slow but has debugging info)
  
Note that you have to install the required packages on your own using
the package manager. On Linux they are GL, GLU, and freeglut. On Mac,
you have to search for them yourself. For CS Linux machines, GL, and
GLUT are installed and we have provided a local build of freeglut
located in Linux_ubc_cs.

Lastly, the following files are used for Unix builds:
  Linux_ubc_cs
  Makefile

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
  OS := Mac, for MAC (support not guaranteed)

Option 2: Set the MODE variable
  MODE := opt, to build in optmizied mode (runs fast but no debugging info)
  MODE := dbg, to build in debug mode, (runs slow but has debugging info)
  
Note that you have to install the required packages on your own using
the package manager. On Linux they are GL, GLU, and freeglut. On Mac,
you have to search for them yourself. For CS Linux machines, GL, and
GLUT are installed and we have provided a local build of freeglut
located in Linux_ubc_cs.

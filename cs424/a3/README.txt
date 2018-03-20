** Usage

Right-clicking the application brings up a menu to control the modes of the program. There are three options under the "Mode" submenu: "Basic", "Subdivision", and "Piecewise". 
- In Basic mode, a Bezier curve is drawn using all the control points on the canvas.
- In Subdivision mode, the Bezier curve is approximated using the subdivision algorithm. The `<` and `>` keys can be used to increase and decrease the subdivision level.
- In Piecewise mode, the control points are interpolated/approximated using piecewise Bezier curves of a chosen degree. The number keys 1-9 can be used to choose the degree of the piecewise curves.
- In Piecewise mode, the continuity of the curves can be set in the "Continuity" menu. There are menu options for C0 and C1 continuity.

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

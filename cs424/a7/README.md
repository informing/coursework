How the GUI works: 

You can see the functionality provided by
the gui in meshview.cpp under the function keyboard().

  - w: Toggle viewing mesh wireframe
  - l: Toggle lighting
  - v: Toggle drawing vertices
  - e: Toggle viewing edges
  - f: Toggle drawing faces
  - <: Reduce subdivision level
  - >: Increase subdivision level
  - q: exit
  - ESC: exit

Building and running the code:

   - If you are on MacOS/Linux, read the Makefile instructions
     carefully before using it.  After choosing the right options in
     the makefile, you should be able to build the code by typing:
     $ make

   - If you are on Windows open a7.vcxproj with Visual Studio 2017.

   - To run the code on Linux use:
     $ ./meshview      meshes/cyl2.obj

   - On Windows, you can run the executable using cmd or
     powershell. First, build the code in Visual studio. Then, change
     directory into the template directory in cmd or
     powershell. Finally, run via
     $ .\a7.exe       meshes\cyl2.obj

   - If you want to directly run from Visual Studio (or use the
     Debugger), you need to pass the mesh address via the Visual
     studio GUI.
       *  Right click on a7 in the solution explorer tab.
       *  From the left side expand Configuration Properties
       *  From the left side select Debugging
       *  Add the text ``meshes/cyl2.obj'' (or the address of any other
          mesh you want to open) to the field Command Arguments.
       *  Now when you execute via Visual studio the mesh file will be
          read by the program.
       *  Note that you must do this separately for debugging and release
          modes.  

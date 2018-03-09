# Please read this:
#
# 1- Set OS variable accordingly. If you are on a lab machines it
# should be Linux_ubc_cs, if you are using your own linux, it should
# be Linux, and finally for mac set it to MAC.
#
# 2- Set MODE. Use opt for optimized mode, and dbg for debugging. 

BIN = bezier
OBJ = main.o pointcanvas.o bezier.o
CXX = g++
RM = rm -rf 

## 
## Set OS accordingly. Make sure there are no trailing spaces
##
OS := Linux
# OS := Linux_ubc_cs
# OS := Mac

## 
## Set MODE accordingly. Make sure there are no trailing spaces
##
# MODE := opt
MODE := dbg

ifeq ("$(OS)","Linux")
  MESSAGE = "Linux Detected"
  LIB = -lGLU -lGL -lglut -lm
  INCLUDE =   
endif
ifeq ("$(OS)","Linux_ubc_cs")
  MESSAGE = "UBC CS LINUX MACHINES that do not have freeglut"
  LIB = -L./Linux_ubc_cs/lib64/ -lGLU -lGL -lglut -lm  
  INCLUDE = -I ./Linux_ubc_cs/include/
endif
ifeq ("$(OS)","Mac")
  MESSAGE =  "MAC support is not guaranteed"
  LIB = -lm -framework OpenGL -framework GLUT
  INCLUDE =   
endif


ifeq ("$(MODE)","dbg")
  CXXFLAGS = -g -Wall -DDEBUG -Wno-deprecated-declarations ${INCLUDE}
  LDFLAGS = -g
endif
ifeq ("$(MODE)","opt")
  CXXFLAGS = -O3 -Wall -DNDEBUG -Wno-deprecated-declarations ${INCLUDE}
  LDFLAGS = 
endif

.cpp.o:
	${CXX} -c ${CXXFLAGS} $< -o $@

${BIN}: ${OBJ}
	@echo ${MESSAGE}
	${CXX} ${LDFLAGS} -o $@ ${OBJ} ${LIB}

clean:
	${RM} ${OBJ} ${BIN}

echo:
	echo ${MODE}
	echo ${OS}
	echo ${MESSAGE}
	echo ${LIB}
	echo ${INCLUDE}
	echo ${CXXFLAGS}
	echo ${LDFLAGS}

Makefile:;

.PHONY: echo 

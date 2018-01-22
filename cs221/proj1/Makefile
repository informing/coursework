upgma : main.o dynmatrix.o
	g++ -Wall -std=c++11 -g main.o dynmatrix.o -o upgma

main.o : main.cc dynmatrix.h
	g++ -Wall -std=c++11 -g -c main.cc

dynmatrix.o : dynmatrix.h dynmatrix.cc
	g++ -Wall -std=c++11 -g -c dynmatrix.cc

clean :
	rm -f dynmatrix.o main.o upgma

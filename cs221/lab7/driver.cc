#include "Hashtable.h"
#include <cstdlib>
#include <ctime>
#include <iostream>

using namespace std;

/*
Q4	(a): 80 / 120
	(b): (key / prime) + prime
	(c): 1901
	(d): Double hashing; depends on the type of key.
*/

void usage(char* argv[]) {
	cerr << "Usage: " << argv[0] << " scheme numberOfKeys sizeOfTable" << endl;
	exit(-1);
}

int main(int argc, char *argv[]) {
	int n, m;
	srand(time(0));

	if (argc == 1) {
		int ht_size = 0, oc_size = 0;
		cout << "Enter the size of your table: ";
		cin >> ht_size;
		oc_size = .8 * ht_size;
		Hashtable L(ht_size), D(ht_size), Q(ht_size);
		for (int i = 0; i < oc_size; i++) {
			L.linsert(rand() + 1);
                        Q.qinsert(rand() + 1);
                        D.dinsert(rand() + 1);
		}
		cout << "With " << oc_size << " keys and size " << ht_size << " (L/Q/D): \n";
		L.printStats();
		Q.printStats();
		D.printStats();
		return 0;
	}
	
	if (argc != 4) {
		usage(argv);
	}
	n = atoi(argv[2]);
	m = atoi(argv[3]);
	Hashtable H(m);
	
	switch(argv[1][0]) {
	case 'l':
		for (int i=0; i<n; ++i) {
			H.linsert(rand() + 1);
		}
		//    H.print();
		cout << "Linear: ";  
		H.printStats();
		break;
	case 'q':
		for (int i=0; i<n; ++i) {
			H.qinsert(rand() + 1);
		}
		//    H.print();
		cout << "Quadratic: ";
		H.printStats();
		break;
	case 'd':
		for (int i=0; i<n; ++i) {
			H.dinsert(rand() + 1);
		}
		//    H.print();
		cout << "Double Hashing: "; 
		H.printStats();
		break;
	default:
		usage(argv);
	}
}


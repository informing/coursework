#include <iostream>

int main(void) {
	int *b = new int;
	*b = 2;
	int *array = new int[4];
	array[3] = -1;
	delete array;
	// What's the problem here?
	//	A. It causes a memory leak
	//	B. We are not allocating the memory correcly
	// How can we fix this?
	//	A. using a for loop
	//	B. delete[] array
	//	C. remove this line
	//	D. using a while loop but not deleting the last element
	return 0;
}

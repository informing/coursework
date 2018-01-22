#include <iostream>

static int array[10];

void fill_array(int first_value, int increment) {
	for(int i = 0; i < 10; i += 1) 
		array[i] = first_value + i * increment;
}

int main(void) {
	fill_array(4, 2);
        for(int i = 0; i < 10; i += 1)
                std::cout << array[i] << " ";
	std::cout << std::endl;
	return 0;
}

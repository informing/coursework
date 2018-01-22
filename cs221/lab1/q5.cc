#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

char randomize (void) {
	static bool init = true;
	if (init) {
		srand (time(NULL));
		init = false;
	}
	return (unsigned char) rand() % 100;
}

int main (void) {
	unsigned char target = 1, entered = 0;
	std::string buffer;

	std::cout << "Input a number from 1 to 100: " << std::endl;
	target = randomize();

	#ifdef DEBUG
	std::cout << (int) target << std::endl;
	#endif

	while (getline(std::cin, buffer)) {
		if (buffer == "q") return 0;

		entered = atoi (buffer.c_str());
		if (entered == target) break;
		else {
			std::cout << "The value entered is incorrect.";
			std::cout << std::endl;
		}
	}
	std::cout << "You are correct!" << std::endl;
	return 0;
}

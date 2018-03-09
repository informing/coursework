#include <iostream>
#include <string>

using namespace std;

int main(void) {
	string expr = "((1+2)*3-4)/7";
	for (int i = 0; i < expr.length(); i += 1) {
		switch (expr[i]) {
			case '(' :
			default :
				break;
		}
        }
	return 0;
}

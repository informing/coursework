#include <iostream>       // std::cout
#include <stack>          // std::stack

using namespace std;

void inohaify(stack<int> &inoha, stack<int> &hanoi) {
	while (!inoha.empty()) {
		int temp = inoha.top();
		inoha.pop();
		if (hanoi.empty() || hanoi.top() > temp) {
			hanoi.push(temp);
		} else {
			while (!hanoi.empty() && hanoi.top() < temp) {
				inoha.push(hanoi.top());
				hanoi.pop();
			}
			hanoi.push(temp);
		}
	}

	/*
	while(!hanoi.empty()) {
	    int w = hanoi.top();
	    std::cout << w << " ";
	    hanoi.pop();
	}
	cout << "\n";
	*/
}

int main(void) {

	int numbers[] = {3, 5, 1, 7, 4};

	stack<int> hanoi;
	stack<int> inoha;

	for (int i = 0; i < 5; i += 1) {
		inoha.push(numbers[i]);
	}

	inohaify(inoha, hanoi);

	return 0;
}

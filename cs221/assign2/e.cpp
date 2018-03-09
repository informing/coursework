#include <iostream>

using namespace std;

class Bear {
    public:
        Bear() { cout << "Growl "; }
        void roar() { cout << "Roar "; }
        ~Bear() { cout << "Stomp stomp stomp"; }
};

int main() {
	int *array = new int[20];
    Bear beary;
    beary.roar();
    cout << " Run!";
delete array;
    return 0;
}

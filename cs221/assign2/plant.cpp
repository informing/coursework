#include <iostream>
using namespace std;

class plant {
    public:
int x;
    plant& operator=(const plant& other)
    {
this->x=other.x;
        std::cout << "copy assignment of A\n";
        //std::swap(n, other.n);
        //std::swap(s1, other.s1);
        return *this;
    }
    //plant& operator=(const plant& other);

    plant(const plant& other)
    {
     	std::cout << "copy of A\n";
        //std::swap(n, other.n);
        //std::swap(s1, other.s1);
        //return *this;
    }
    void call() { cout << "helo\n"; }
    plant() {std::cout << "A\n";}

};

plant * imitater(plant & orig) {
    plant * tater = new plant(orig);
    return tater;
}

int main(void) {
    plant peashooter; 
    plant *repeater;
    repeater = imitater(peashooter);
    //plant threepeater = *repeater;
    //threepeater.call();
    return 0;
}

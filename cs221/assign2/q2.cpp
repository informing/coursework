#include <cstring>
#include <iostream>

using namespace std;

class Coffee {
  public:
    bool awesome;
    void setName(int);
    char *getName() { return name; }
    Coffee() : awesome(true), name(new char[100]) {}
    ~Coffee() {}//if (name) delete[] name;}
  private:
    char *name;
};

void Coffee::setName(int type) {
    strcpy(name, "allo");
}

int main() {
    Coffee latte;
    latte.awesome = true;
latte.setName(1);
    if (latte.awesome) {
    	//Coffee caffelatte(latte);
    cout << latte.getName() << endl;
    }
     //Coffee battle(latte);
    //cout << latte.getName() << endl;
    return 0;
}

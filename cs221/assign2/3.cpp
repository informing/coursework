#include <iostream>

using namespace std;

class MessageBlock {
    public:
        MessageBlock(const string & str):msg(str) {}
        char & operator()(int position) 
            { return msg[msg.length() - position - 1]; }
        char & operator[](int position) 
            { return msg[position]; }
    private:    
        string msg;
};
int main() {
    MessageBlock privet("3apabctbynte");
    for (int i = 0; i < 12; i += 1)
        cout << privet(i);
        // Your answer goes here!
     cout<<endl;
    return 0;
}

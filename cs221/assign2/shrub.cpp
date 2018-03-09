#include <iostream>
#include <stack>

using namespace std;


int foo(std::stack<int> &s) {
    int top = s.top();
    s.pop();
    if (s.empty()) return top;
    else {
        int bar = foo(s);
        s.push(top);
        return bar;
    }
}


void fun(std::stack<int> &s) {
    if (s.empty()) return ;
    int e = foo(s);
    fun(s);
    s.push(e);
}

void foo2(int &bar, int *baz) {
    *baz = bar + *baz;
}

int main(void) {
    int shrub = 10;
    int *bush = &shrub;
std::stack<int> s; 
    for(int i = 0; i < 6; i += 1){
s.push(i+1);}
fun(s);
    for(int i = 1; i < 7; i += 1){
    cout << s.top() << " ";
s.pop();
}
    cout << endl;
    //cout << *bush << " ";
    //foo(shrub, bush);
    //cout << shrub << *bush << endl;
    return 0;
}

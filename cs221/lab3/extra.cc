#include <iostream>
using namespace std;
int a = 7;
int b = 6;
int* c = &b;
int* d = c;

void test( int& x, int y, int*& z, int *w) {
  x++;
  y++;
  z= &a;
  w= &a;
}
int main() {
  test(a,b,c,d); 
  cout << a << " " << b << " " << *c << " " << *d << endl;
  return 0;
}

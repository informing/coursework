#include <iostream>
#include <string>
#include <cassert>

using namespace std;

typedef string Object; // change this if you want to store other type in the deque

// INTERFACE:
class DLL_Deque { // implement Deque using Doubly Linked List

  struct Node {
    Object data;
    Node* next;
    Node* prev;

    Node(const Object& x, Node* n=NULL, Node* p=NULL) : data(x), next(n), prev(p) {}
  };
  Node *left;
  Node *right;
    
public:
  DLL_Deque(); // constructor, creates Deque object
  ~DLL_Deque(); // desctructor, destroys Deque object

  // interface from the lecture:
  void pushL(const Object&);
  void pushR(const Object&);
  Object popL();
  Object popR();
  Object DLL_Deque::popAnywhere(Node *&left, Node *&right, Node *node);
  bool is_empty() const; // this function does not modify Deque object, so it's const

  void removeDuplicates();
  // replace subsequences of identical consecutive elements with one copy
  // Example: if Deque contains "ab", "ba", "cd", "cd", "cd", "ba", "ba", "ab",
  //          after this operation it should contain: "ab", "ba", "cd", "ba", "ab"
};

// IMPLEMENTATION:
DLL_Deque::DLL_Deque() : left(NULL), right(NULL) {}

DLL_Deque::~DLL_Deque() {
  while (!is_empty())
    popL();
}

void DLL_Deque::pushL(const Object& x) {
  if (is_empty())
    left = right = new Node(x);
  else
    left = left->prev = new Node(x,left);
}

void DLL_Deque::pushR(const Object& x) {
  if (is_empty())
    left = right = new Node(x);
  else
    right = right->next = new Node(x,NULL,right);
}

// examined
Object DLL_Deque::popL() {
  assert(!is_empty());
  Object x = left->data;
  left = left->next;
  if (left) {
    delete left->prev;
    left->prev = NULL;
  } else { // the Deque is becoming empty
    delete right;
    right = NULL;
  }
  return x;  
}

// Examined
Object DLL_Deque::popR() {
  assert(!is_empty());
  Object x = right->data;
  right = right->prev;
  if (right) {
    delete right->next;
    right->next = NULL;
  } else { // the Deque is becoming empty
    delete left;
    left = NULL;
  }
  return x;
}

bool DLL_Deque::is_empty() const {
  return left == NULL;
}

void DLL_Deque::removeDuplicates() {
  Node *current = left;
  while (current) {
    Node* repeat = current;
    while (repeat->next && repeat->next->data == current->data) {
      repeat = repeat->next;
    }
    if (repeat != current) {
      while (current->next != repeat->next) {
        Node *dup = current->next;
        current->next = dup->next;
        std::cout << "Deleted: " << dup->data << std::endl;
        delete dup;
      }
      //current->next = repeat->next;
      if (current->next)
	current->next->prev = current;
      else
	right = current;
      //delete repeat;
    }
    current = current->next;
  }
}

Object DLL_Deque::popAnywhere(Node *&left, Node *&right, Node *node) {
  Node *lec = left, *rec = NULL;
  Object data = node->data;
  if (data == left->data) {
    left = left->next;
    left->prev = NULL;
    delete node;
    return data;
  } else if (data == right->data) {
    right = right->prev;
    right->next = NULL;
    delete node;
    return data;
  }
  while (lec && lec->next != node)
    lec = lec->next;
  if (lec->next == node) {
    rec = node->next;
    lec->next = rec;
    rec->prev = lec;
    delete node;
    return data;
  }
}

// CLIENT CODE:
int main() {
  DLL_Deque D;
  string test[] = {"bc","ba","ab","ab","rb","ab","ba","ca"};
  for (unsigned int i=0; i<sizeof(test)/sizeof(test[0]); i++) {
    D.pushL(test[i]);
  }
  //D.removeDuplicates();
  D.popAnywhere(left, right, node);
  while (!D.is_empty())
    cout <<D.popR()<<endl;
}



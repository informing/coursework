#ifndef __TREAP
#define __TREAP
#include <iostream>
#include <cassert>
#include <cstdlib>
#include <string>

struct TreapNode {
  std::string key;
  int value;
  int priority;
  TreapNode* left;
  TreapNode* right;
  // A constructor
  TreapNode () {
    priority = rand();
    left = right = NULL;
  }

  TreapNode (const std::string &k, int v) {
    priority = rand();
    key = k, value = v;
    left = right = NULL;
  }
};

class Treap {
  TreapNode *root;
 private:
  // Some helper functions
  TreapNode *findParent(TreapNode *node);
  void rotateLeft(TreapNode *&node);
  void rotateRight(TreapNode *&node);
 
 public:
  Treap() { // constructor
    srand(time(0));
    root = NULL;
  }

  void insert(const std::string& key, int value);
  int find(const std::string& key);
  // return value for the key if found
  // if not found returns -1

  void print(TreapNode *node, int depth);
  // A little helper function
};

void Treap::print(TreapNode *node, int depth) {
  std::string indent = "";
  if (depth == -1) node = root, depth = 0;
  for (int i = 0; i < depth; i += 1)
    indent += "\t";
  if (node == NULL) {
    std::cout << indent << "nil" << std::endl;
  } else {
    print(node->left, depth+1);
    std::cout << indent << node->key << ":" << node->priority << std::endl;
    print(node->right, depth+1);
  }
}

TreapNode *Treap::findParent(TreapNode *node) {
  TreapNode *parent = root;
  if (node == NULL || node == root)
    return NULL;
  while (parent != NULL) {
    if (parent->left == node || parent->right == node) 
     return parent;
    if (node->key < parent->key) {
      parent = parent->left;
    } else {
      parent = parent->right;
    }
  } 
  return NULL;
}

void Treap::rotateLeft(TreapNode *&w) {
  TreapNode *p = findParent(w), *u = w->right;

  if (p == NULL) {
    root = u;
  } else {
    if (p->left == w) 
      p->left = u;
    else 
      p->right = u;
  }
  w->right = u->left;
  u->left = w;

  w = u;
}

void Treap::rotateRight(TreapNode *&u) {
  TreapNode *p = findParent(u), *w = u->left;
  if (p == NULL) {
    root = w;
  } else {
    if (p->left == u)
      p->left = w;
    else 
      p->right = w;
  }
  u->left = w->right;
  w->right = u;

  u = w;
}

void Treap::insert(const std::string& key, int value) {
  TreapNode *curr = root, *prev = NULL, *node = new TreapNode(key, value);
  if (curr == NULL) {
    // Initialize _root with <k, v>
    root = new TreapNode(key, value);
    return ;
  }

  // Set $curr to the parent node
  while (curr != NULL) {
    prev = curr;
    if (curr->key > key) {
      curr = curr->left;
    } else {
      curr = curr->right;
    }
  }
  curr = prev;

  // Set $curr->left or $curr->right to $node
  if (curr->key > key) {
    curr->left = node;
  } else {
    curr->right = node;
  }

  // Maintain the min-heap property
  //   Invarient: $curr is the parent of $node
  while (curr && (node->priority < curr->priority)) {
    assert(node == curr->left || node == curr->right);
    if (node == curr->left) {
      rotateRight(curr);
    } else {
      rotateLeft(curr);
    }
    node = curr;
    curr = findParent(node);
  }
}

int Treap::find(const std::string& key) {
  TreapNode *curr = root;
  while (curr != NULL) {
    if (curr->key > key) {
      curr = curr->left;
    } else if (curr->key < key) {
      curr = curr->right;
    } else {
      // We've found it!
      break;
    }
  }
  if (curr != NULL && key == curr->key)
    return curr->value;
  // Or maybe we cannot find it
  return -1;
}

#endif

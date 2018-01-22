#include <iostream>
#include <vector>
#include <cstdio>
#include <cassert>

/**
 * A BST node.
 */
struct BNode {
  int key;
  BNode *left;
  BNode *right;
};

static std::vector<int> keys;

struct ANode {       // A Node in an AVL tree.
  int key;           // a word
  int height;        // height of the node
  ANode *left;       // pointer to the left child of the node (or NULL)
  ANode *right;      // pointer to the right child of the node (or NULL)
};

void dump_tree(BNode * r) {
  if( r == NULL ) return;
  dump_tree(r->left);
  keys.push_back(r->key);
  dump_tree(r->right);
}

ANode *build_avl(int start, int end, int d) {
  if (end <= start) return NULL;
  ANode *center = new ANode;
  center->left = build_avl(start, (start + end) / 2 - 1, d + 1);
  center->key = keys[(start + end) / 2];
  center->height = d;
  center->right = build_avl((start + end) / 2 + 1, end, d + 1);
  return center;
}

ANode *bst2avl(BNode *root) {
  dump_tree(root);
  return build_avl(0, keys.size(), 0);
}

int main(void) {
  std::cout << bst2avl(NULL) << std::endl;
  return 0;
}

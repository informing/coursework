#include <iostream>
#include <fstream>
#include <algorithm>
#include "dynmatrix.h"
#include <cassert>
#include <cstring>

using namespace std;

// construct a string representation 

void usage() {
  cerr << "Usage: upgma species.txt" << endl;
}

void print_tree(const char s[], size_t size, int depth=0) {
  int diff = 0;
  bool bracket = false, root = false;
  char *head = new char[size];
  char *tail = new char[size];
  if (s[0] == '(') diff = -1, bracket = true;
  for (size_t i = 0; i < size; i += 1) {
    if (s[i] == '(') diff += 1;
    if (s[i] == ')') diff -= 1;
    if (diff == 0 && s[i] == ',') {
      root = true;
      if (bracket) {
        strncpy(head, s + 1, i - 1);
        strncpy(tail, s + i + 1, size - i - 2);
        head[i - 1] = tail[size - i - 2] = '\0';
        print_tree(head, i - 1, depth + 1);
        for (int j = 0; j < depth; j += 1) 
          cout << "\t";
        cout << "<" << endl;
        print_tree(tail, size - i - 2, depth + 1);
      } else {
        strncpy(head, s, i);
        strncpy(tail, s + i, size - i - 1);
        head[i] = tail[size - i - 1] = '\0';
        print_tree(head, i); 
        for (int j = 0; j < depth; j += 1)
          cout << "\t";
        cout << "<" << endl;
        print_tree(tail, size - i - 1);
      }
    }
  }
  if (root == false) {
    for (int i = 0; i < depth; i += 1) cout << "\t";
    cout << "- " << s << "\n";
  }
  delete head;
  delete tail;
}

double update(ClusterNode *head, int row, int col, double dist) {
  ClusterNode* entry = head;
  DistanceNode* target = NULL;
  while (row--) {
    // cout << "Passing " << entry->name << endl;
    assert(entry->next != NULL);
    entry = entry->next;
  }
  assert(entry != NULL);
  target = entry->column;
  while (col--) {
    assert(target != NULL);
    target = target->nextInColumn;
  }
  if (dist >= 0)
    target->distance = dist;
  return target->distance;
}

void merge(ClusterNode *&head, ClusterNode *&tail, ClusterNode *C, ClusterNode *D) {
  string name = "(" + D->name + "," + C->name + ")";
  ClusterNode *curr = head;
  int pose = 0, posc = 0, posd = 0;
  double dcx, ddx, _c_, _d_, dex;

  addCluster(head, tail, name);
  while (curr != tail) {
    if (curr == C) posc = pose;
    if (curr == D) posd = pose;
    curr = curr->next;
    pose += 1;
  } 
  for (int x = 0; x < pose; x += 1) {
    dcx = update(head, posc, x, -1);
    ddx = update(head, posd, x, -1);
    _c_ = count(C->name.begin(), C->name.end(), ',') + 1;
    _d_ = count(D->name.begin(), D->name.end(), ',') + 1;
    dex = (_c_ * dcx + _d_ * ddx) / (_c_ + _d_);
    update(head, pose, x, dex);
    update(head, x, pose, dex);
  }

  update(head, pose, pose, 0);

  removeCluster(head, tail, C);
  removeCluster(head, tail, D);
}

int main( int argc, char *argv[] ) {
  if( argc != 2 ) {
    usage();
    return 0;
  }

  // let's start with empty DynMatrix:
  ClusterNode* head = NULL; 
  ClusterNode* tail = NULL;

  int n = 0; // number of species
  ifstream fin( argv[1] );
  if( fin.is_open() ) {
    // read species:
    string species;
    while ((fin.peek() != '\n') && (fin >> species)) {
      n++;
      // replace print statemnt by a code that insert a new species into DynMatrix
      addCluster(head, tail, species);
    }
    // read distances:
    for (int i=0; i<n && fin; i++)
      for (int j=0; j<n && fin; j++) {
	double d;
	fin >> d;
        // replace print statemnt by a code that updates distance field of the corresponding DistanceNode
        update(head, i, j, d);
      }
    fin.close();
  }
  // print_matrix(head);

  // implement UPGMA method

  ClusterNode *C, *D;
  findMinimum(head, C, D);
  // cout << C->name << " " << D->name << endl;

  while (head != tail) {
    findMinimum(head, C, D);
    // cout << C->name << " " << D->name << endl;
    merge(head, tail, C, D);
  }
  
  // print the name of the last remaining cluster
  if (head)
    cout << head->name << endl;

  // BONUS (optional): print the tree in a nice way
  print_tree(head->name.c_str(), head->name.length());

  return 0;
}

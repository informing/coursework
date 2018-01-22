#include "dynmatrix.h"
#include <cassert>
#include <algorithm>
#include <iostream>
#include <vector>


void addCluster(ClusterNode *&head,ClusterNode *&tail,const std::string& name)
// adds a cluster (at the tail) and the corresponding row and column to data structure
// distance of all added DistanceNodes should be initialized to 0.0
// at the end, tail should point to the newly added ClusterNode
{
  static int n = -1;
  if (head != NULL) {
    std::vector<DistanceNode *> nrow;
    std::vector<DistanceNode *> ncol;
    DistanceNode *junction = new DistanceNode;
    junction->distance = n--;

    ClusterNode *prev = NULL, *curr = head;
    DistanceNode *prow = NULL, *pcol = NULL;;

    while (curr != NULL) {
      pcol = curr->column;
      while (pcol != NULL && pcol->nextInColumn != NULL)
        pcol = pcol->nextInColumn;
      assert (NULL == pcol->nextInColumn);
      pcol->nextInColumn = new DistanceNode;
      pcol->nextInColumn->distance = 2;
      pcol->nextInColumn->nextInColumn = NULL;
      pcol->nextInColumn->nextInRow = NULL;
      nrow.push_back(pcol->nextInColumn);
      
      prow = curr->row;
      while (prow != NULL && prow->nextInRow != NULL)
        prow = prow->nextInRow;
      assert(prow->nextInRow == NULL);
      prow->nextInRow = new DistanceNode;
      prow->nextInRow->distance = 3;
      prow->nextInRow->nextInColumn = NULL;
      prow->nextInRow->nextInRow = NULL;
      ncol.push_back(prow->nextInRow);

      prev = curr;
      curr = curr->next;
    }

    assert(!ncol.empty() && !nrow.empty());
    // std::cout<<"anyway"<<ncol.size()<<" "<<nrow.size()<<std::endl;

    pcol = ncol.front();
    for (unsigned int i = 1; i < ncol.size(); i += 1) {
      // std::cout << "col " << i << std::endl;
      assert(pcol);
      pcol = pcol->nextInColumn = ncol[i];
    }

    prow = nrow.front();
    for (unsigned int i = 1; i < nrow.size(); i += 1) {
      // std::cout << "row " << i << std::endl;
      assert(prow);
      prow = prow->nextInRow = nrow[i];
    }

    assert (ncol.back() != NULL && nrow.back() != NULL);
    junction->nextInColumn = junction->nextInRow = NULL;
    ncol.back()->nextInColumn = nrow.back()->nextInRow = junction;

    ClusterNode *d = new ClusterNode;
    d->name = name;
    d->next = NULL;
    d->prev = prev;
    prev->next = d;

    d->row = nrow.front(); 
    d->column = ncol.front();
    tail = d;

    nrow.clear();
    ncol.clear();
  } else {
    // std::cout<<" else "<<std::endl;
    
    head = tail = new ClusterNode;
    head->name = name;
    head->next = head->prev = NULL;
    head->row = head->column = new DistanceNode;
    head->row->nextInColumn = head->row->nextInRow = NULL;
    head->row->distance = 0;
  }
}


void print_tree(ClusterNode* head);

void removeCluster(ClusterNode *&head,ClusterNode *&tail,ClusterNode *toBeRemoved)
// removes a cluster pointed to by toBeRemoved and the corresponding row and column
// if toBeRemoved is the first or last cluster then head or tail needs to be updated
{
  ClusterNode *curr = head, *prev = NULL, *next = NULL;
  DistanceNode *dcol = NULL, *drow = NULL;
  DistanceNode *pcol = NULL, *prow = NULL;

  assert (toBeRemoved != NULL);

  // phase 1: mark the distance of all the 'toBeRemoved' nodes as -1 
  dcol = toBeRemoved->column;
  drow = toBeRemoved->row;

  while (dcol != NULL) {
    assert (drow != NULL);
    drow->distance = dcol->distance = -1;
    drow = drow->nextInRow;
    dcol = dcol->nextInColumn;
  }
  assert (NULL == dcol && NULL == drow);
  // std::cout << "Passed p1\n";

  // phase 2: find the nodes with -1 distance and seperate them from the matrix
  while (curr != NULL) {
    if (curr == toBeRemoved) {
      prev = toBeRemoved->prev;
      next = toBeRemoved->next;
      curr = curr->next; continue;
    }

    dcol = curr->column, pcol = NULL;
    // std::cout << "Passed dcol dist: ";
    while (dcol != NULL && dcol->nextInColumn != NULL) {
      if (dcol->distance == -1) {
        // std::cout << "encountered -1 after " << ((pcol == NULL) ? 0 : pcol->distance) <<"\n";
        if (pcol == NULL)
          curr->column = dcol->nextInColumn;
        else
          pcol->nextInColumn = dcol->nextInColumn;
      }
      pcol = dcol;
      dcol = dcol->nextInColumn;
    }
    // std::cout << "\n";

    // print_tree(head);

    drow = curr->row, prow = NULL;
    while (drow != NULL && drow->nextInRow != NULL) {
      if (drow->distance == -1) {
        if (prow == NULL)
          curr->row = drow->nextInRow;
        else
          prow->nextInRow = drow->nextInRow;
      }
      prow = drow;
      drow = drow->nextInRow;
    }
    assert (dcol && drow);
    if (dcol->distance == -1) {
    // std::cout << "asserting...\n";
      pcol->nextInColumn = NULL;
    } 
    if (drow->distance == -1) {
    // std::cout << "asserting...\n";
      prow->nextInRow = NULL;
    }
// print_tree(head);
    curr = curr->next;
  }
  assert (curr == NULL);

  // std::cout << "Passed p2\n";

  // phase 3: remove the designated cluster node
  if (head == toBeRemoved) {
    head = toBeRemoved->next;
    head->prev = NULL;
  } else if (tail == toBeRemoved) {
    tail = toBeRemoved->prev;
    tail->next = NULL;
  } else {
    assert(prev->next && next->prev);
    prev->next = toBeRemoved->next;
    next->prev = toBeRemoved->prev;
  }

  // phase 4: remove the two linked lists in toBeRemoved
  drow = toBeRemoved->row;
  dcol = toBeRemoved->column;
  while (drow != dcol) {
    pcol = dcol, prow = drow;
    dcol = dcol->nextInColumn;
    drow = drow->nextInRow;

    delete pcol;
    delete prow;
  }

  DistanceNode *junction = drow;
  assert (drow == dcol);
  drow = junction->nextInRow;
  dcol = junction->nextInColumn;
  while (dcol != NULL) {
    pcol = dcol, prow = drow;
    dcol = dcol->nextInColumn;
    drow = drow->nextInRow;

    delete pcol;
    delete prow;
  }

  delete junction;
  delete toBeRemoved;
}


void findMinimum(ClusterNode *head,ClusterNode *&C,ClusterNode *&D)
// finds the minimum distance (between two different clusters) in the data structure 
// and returns the two clusters via C and D
{
  double dist = 1000000;
  int counter = 0, col = 0;
  ClusterNode *kust = head, *dust = head;
  assert (kust != NULL);
  while (kust != NULL) {
    DistanceNode *cur = kust->column;
    // std::cout << "Scanning " << kust->name << std::endl;
    for (int i = 0; i < counter; i += 1) {
      if (cur->distance < dist) {
        // std::cout << "dist: " << i << std::endl;
        dist = cur->distance;
        col = i;
        C = kust;
      } else {
        // std::cout << "Skipping row " << i;
        // std::cout << " with dist " << cur->distance << std::endl;
      }
      cur = cur->nextInColumn;
    }
    kust = kust->next;
    counter += 1;
  }
  // std::cout << "This is a " << col << "xn matrix" << std::endl;
  for (int i = 0; i < col; i += 1) {
    dust = dust->next;
  }
  D = dust;
}


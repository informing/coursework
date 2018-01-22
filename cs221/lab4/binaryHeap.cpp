#include <iostream>

using namespace std;

#define Q2

//PRE:  The capacity of the array pointed to by heap is at least size.
//POST: The first size elements of heap are printed to the screen.
void printList(int* heap, int size) {
    for (int i = 0; i < size; i++)
        cout << heap[i] << " ";
    cout << endl;
}

// PRE:  subtrees rooted at leftChild and rightChild of i are heaps.
// POST: subtree rooted at i is a heap.
void swapDown2(int* heap, int i, int size) {
    int leftChild = 2 * i + 1;
    int rightChild = 2 * i + 2;
    int min = i;
    // find who holds smallest element of i and its two children
    if (leftChild < size && heap[leftChild] < heap[min])
        min = leftChild;
    if (rightChild < size && heap[rightChild] < heap[min])
        min = rightChild;
    // if a child holds smallest element, swap i's element to that child
    // and recurse.
    if (min != i) {
        swap(heap[i], heap[min]);
        swapDown2(heap, min, size);
    }
}
/* Yes the algorithm is tail recursive */
void swapDown(int* heap, int i, int size) {
    int min = i;
    if (2 * i < size - 1 && heap[2 * i + 1] < heap[min]) 
        min = 2 * i + 1;
    if (2 * i < size - 2 && heap[2 * i + 2] < heap[min])
        min = 2 * i + 2;

    while (min != i) {
        int leftChild = 2 * min + 1; 
        int rightChild = 2 * min + 2; 
        swap(heap[i], heap[min]);
        i = min; 
        if (leftChild < size && heap[leftChild] < heap[min]) 
            min = leftChild;
        if (rightChild < size && heap[rightChild] < heap[min])
            min = rightChild;
    }
}

// PRE: subtrees rooted at i is heap, the parents of i satisfy the heap order. 
// POST: Both i and the parents of i satisfy the required heap order. 
void swapUp(int* heap, int i) {
    int parent = (i - 1) / 2;
	if (parent > -1 && heap[parent] > heap[i]) {
	    swap(heap[i], heap[parent]);
		swapUp(heap, parent);
	}
}

//PRE: The capacity of the array pointed to by heap is at least size. 
//POST: The first size elements of heap are a heap. 
void heapify(int* heap, int size) {
    for (int i = (size - 2) / 2; i >= 0; i--)
        swapDown(heap, i, size);
}


//PRE:  The capacity of the array pointed to by heap is at least size.
//      node is the index of the root of the current sub-tree and
//      it is at depth d in the whole heap
//POST: The first size elements of heap are printed as a tree
void printHeap(int *heap, int size, int node=0, int d=0) {
    // TODO: put your code here for Questions 1 and 2
#ifdef Q1
    for (int i = 0; i < d; i += 1)
        std::cout << "*";
    std::cout << heap[node] << std::endl;
    if (node * 2 + 1 < size)
        printHeap(heap, size, node * 2 + 1, d + 1);
    if (node * 2 + 2 < size)
        printHeap(heap, size, node * 2 + 2, d + 1);
#else
    int leftChild = 2 * node + 1;
    int rightChild = 2 * node + 2;
    int father = node / 2;
    if (rightChild < size)
        printHeap(heap, size, rightChild, d + 1);
    // print self;
    for (int i = 0; i < d * 2 + 1; i += 1)
        std::cout << " ";
    std::cout << heap[node] << std::endl;

    if (leftChild < size)
        printHeap(heap, size, leftChild, d + 1);
#endif
}

//PRE:  heap points to an array representing a heap
//      key is the value to be removed from the heap
//      size is the number of elements in the heap
//POST: all elements with key value = key have been removed from
//	the heap and size is the new heap size.
void remove(int* heap, int key, int & size) {
    while (size > 0 && heap[size - 1] == key) {
        size -= 1;
    } // preprocessing: O(n)
    for (int i = size - 1; i >= 0; i -= 1) {
        if (key == heap[i]) {
            swap(heap[i], heap[--size]); // O(c)
            if (heap[i] < heap[(i - 1) / 2])
                swapUp(heap, i); // O(lg(n))
            else
                swapDown(heap, i, size);
            // O(lg(n)+c)
        }
    } // O(n.lg(n) + c.n)

    /*
    if (size == 0) {
        delete heap;
    } */
}

//PRE:  heap points to an array representing a heap
//      index denote the location of the element to be removed 
//      from the heap
//      size is the number of elements in the heap
//POST: element at location index have been removed from
//	the heap and size is the new heap size.
void removeByIndex(int* heap, int index, int & size) {
	// std::cout << "Removing " << heap[index] << std::endl;
	swap(heap[index], heap[size - 1]);
	size -= 1;
	if (heap[index] < heap[(index - 1) / 2]) {
		swapUp(heap, index);
	} else {
		swapDown(heap, index, size);
	}
}

//PRE:  heap1 and heap2 contain size1 and size2 elements respectively.
//POST: output a new heap (whose size is size1+size2) containing all
//      the elements in heap1 and heap2 (including duplicates).
int* mergeHeap(int* heap1, int* heap2, int size1, int size2) {
    int *heap = new int[size1 + size2];
    int cur = 0; // O(2)
    while (size1 > 0 || size2 > 0) {
        if (size1 == 0) {
            heap[cur] = heap2[size2 - 1];
            size2 -= 1;
        }
        if (size2 == 0) {
            heap[cur] = heap1[size1 - 1];
            size1 -= 1;
        }
        if (heap1[size1 - 1] < heap2[size2 - 1]) {
            heap[cur] = heap1[size1 - 1];
            size1 -= 1;
        } else {
            heap[cur] = heap2[size2 - 1];
            size2 -= 1;
        }
        swapUp(heap, cur);
        cur += 1;
    } // O((size1+size2)*(lg(size1+size2)+c))
    return heap;
}

int input1[] = {8,3,5,6,2,9,1,7,4,0};
int input2[] = {4,6,1,8,2,3};
int input3[] = {2,2,2,2,2,2,2};
int input4[] = {1,8,2,19,15,3,4,24,21,17,16,11,4,5};

int main() {
    int size1 = sizeof(input1)/sizeof(int);
    int *heap1 = new int[size1];
    for (int i = 0; i < size1; ++i) {
        heap1[i] = input1[i];
    }

    heapify(heap1, size1);
    cout << "heap1: ";
    printList(heap1, size1);
    printHeap(heap1, size1);

    int size2 = sizeof(input2)/sizeof(int);
    int *heap2 = new int[size2];
    for (int i = 0; i < size2; ++i) {
        heap2[i] = input2[i];
    }

    heapify(heap2, size2);
    cout << "heap2: ";
    printList(heap2, size2);
    printHeap(heap2, size2);

    int size3 = sizeof(input3)/sizeof(int);
    int *heap3 = new int[size3];
    for (int i = 0; i < size3; ++i) {
        heap3[i] = input3[i];
    }

    heapify(heap3, size3);
    cout << "heap3: ";
    printList(heap3, size3);
    printHeap(heap3, size3);

    int size4 = sizeof(input4)/sizeof(int);
    int *heap4 = new int[size4];
    for (int i = 0; i < size4; ++i) {
        heap4[i] = input4[i];
    }

    heapify(heap4, size4);
    cout << "heap4: ";
    printList(heap4, size4);
    printHeap(heap4, size4);

    remove(heap1, 0, size1);
    cout << "heap1, remove(0): ";
    printList(heap1, size1);
    printHeap(heap1, size1);

    remove(heap2, 8, size2);
    cout << "heap2, remove(8): ";
    printList(heap2, size2);
    printHeap(heap2, size2);

    remove(heap3, 2, size3);
    cout << "heap3, remove(2): ";
    printList(heap3, size3);
    printHeap(heap3, size3);

    remove(heap3, 2, size3);
    cout << "heap3, remove(2): ";
    printList(heap3, size3);
    printHeap(heap3, size3);

    remove(heap3, 2, size3);
    cout << "heap3, remove(2): ";
    printList(heap3, size3);
    printHeap(heap3, size3);

    remove(heap4, 19, size4);
    cout << "heap4, remove(19): ";
    printList(heap4, size4);
    printHeap(heap4, size4);
    
    removeByIndex(heap4, 3, size4);
    cout << "heap4, removeByIndex(3): ";
    printList(heap4, size4);
    printHeap(heap4, size4);

    int *heap = mergeHeap(heap1, heap2, size1, size2);
    int size = size1 + size2;

    if (heap != NULL) {
        cout << "merged: ";
        printList(heap, size);
        printHeap(heap, size);
        
        remove(heap, 2, size);
        
        cout << "remove(2): ";
        printList(heap, size);
        printHeap(heap, size);
        
        removeByIndex(heap, 0, size);
        
        cout << "removeByIndex(0): ";
        printList(heap, size);
        printHeap(heap, size);
        
        delete[] heap;
    }
    
    delete[] heap1;
    delete[] heap2;
    delete[] heap3;
    delete[] heap4;
    
    return 0;
}

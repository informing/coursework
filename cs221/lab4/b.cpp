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

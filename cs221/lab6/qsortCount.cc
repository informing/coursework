#include <iostream>
#include <ctime>
#include <cstdlib>

int * x;
int comps;

/*
Q5. Answer the following questions in a few short sentences:
  What are the run times for quicksort in 
  A) the average case: O(n*lg(n))
  B) the worst case: O(n^2)
  Why are you unlikely to observe the worst-case run time, in practice?
  > The array has to be in descending order to observe the worst-case
*/

void swap(int & a, int & b) {
	int tmp = a;
	a = b;
	b = tmp;
}

int randint(int a, int b) {
	return a + (rand() % (b - a + 1));
}

void quicksort(int a, int b) {
	if (a >= b) return;
	int p = randint(a,b); // pivot
	swap(x[a], x[p]);
	int m = a;
	int i;
	// in-place partition:
	for (i = a+1; i <= b; i++) {
                comps += 1;
		if (x[i] < x[a])
			swap(x[++m], x[i]);
	}
	swap(x[a],x[m]);
	quicksort(a, m-1);
	quicksort(m+1, b);
}

/*
Q3. Write a new recursive function qc that takes a single parameter n and 
returns the number of comparisons quicksort would perform in sorting an array of size n, 
but doesn’t sort anything. (You’ll call randint to pick a random pivot location.)
*/

int qc(int n) {
	if (n <= 1) return 0;
	int p = randint(0, n);
	// std::cout << "n: " << n << " p: " << p << '\n';
	return n - 1 + qc(p) + qc(n - p - 1);
}

/*
Q4. Write the value, C(n), returned by c(n) as a recurrence relation. 
    (It will have a summation and should look similar to the program, 
    but in mathematical notation.)

float c(int n) {
	if (n <= 1) return 0;
	float sum = 0.0;
	for (int m=1; m <= n; m++)
		sum += n-1 + c(m-1) + c(n-m);
	return sum / n;
}
--------
C(0) = 0
C(1) = 0
C(2) = n - 1 + (2 / n) * (C(0) + C(1))
     = 1 + 1 * 0 = 1
C(3) = 2 + (2 / 3) * (C(0) + ... + C(2))
     = 2 + (2 / 3) * 1 = 8/3
C(4) = 3 + (2 / 4) * (C(0) + ... + C(3))
     = 3 + (11 / 3) / 2 = 29/6
C(5) = 4 + (2 / 5) * (1 + 8/3 + 29/6)
     = 4 + (6 + 16 + 29) / 15 = 4 + 41/15 = 101/15
C(n) = ((n-1)*n + C(0) + ... + C(n-1) + C(n-1) + ... + C(0)) / n
     = n - 1 + (2 / n) * (C(0) + ... + C(n - 1))
*/

#define NN 1000

int main(int argc, char *argv[]) {
	srand(time(0));

	#define Q2
        /*
        Run your program using array size 1000 for 100 repetitions. 
        What is the average number of comparisons? 11,000

        Run your program with a few different choices of NN (array size).
        How does the number of comparisons change with NN? 
          2000 -> 24,800
          3000 -> 39,600
          4000 -> 55,000
          5000 -> 71,200
          O(n*log(n))
        */

        #ifdef Q2
        const int chances = 2;

        for (int j = 1; j <= chances; j += 1) {
          x = new int[NN];
          for (int i=0; i<NN; ++i) {
            x[i] = rand() % NN;	
          }
          quicksort(0, NN - 1);
          // std::cout << "Experiment #" << j << " comps=" << comps << "\n";
          // comps = 0;
          delete[] x;
        }
        std::cout << "Avergae #" << chances << " comps=" << comps / chances << "\n";
        std::cout << "Expected #" << qc(NN) << "\n";

        #else
        x = new int[NN];
	for (int i=0; i<NN; ++i) {
		x[i] = rand() % NN;
	}
	
	quicksort(0, NN-1);
	for (int i=0; i<NN; ++i) {
		std::cout << x[i] << " ";
	}
	std::cout << std::endl;

	delete[] x;
        #endif
	return 0;
}


#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include "treap.h"

using namespace std;

// Replace all characters except letters (A-Z,a-z) in line with ' ',
// except keep '-' or '\'' if they are between letters.
void lowercaseWords(string & line) {
  for( string::iterator it = line.begin(); it != line.end(); ++it ) {
    if( !isalpha(*it) ) {
      if( (*it != '-' && *it != '\'') ||
	  it == line.begin() || it+1 == line.end() ||
	  !isalpha(*(it-1)) || !isalpha(*(it+1)) ) {
	*it = ' ';
      }
    } else {
      *it = tolower(*it);
    }
  }
}

int main(int argc, char *argv[]) {
  Treap treap;

  int r = 0, prev = -1;
  vector<string> words; // word[r] is the r-th word
  vector<int> all_word_ranks; // ranks of all words in the text
  vector<vector<int> > follower_ranks;
  // follower_ranks[r] is a vector of ranks of followers of word[r]

  if( argc < 2 || argc > 3 ) {
    cerr << "Usage: " << argv[0] << " n book.txt" << endl;
    exit(1);
  }

  int n = atoi(argv[1]);
  
  ifstream fin;
  fin.open(argv[2]);
  if( !fin.is_open() ) {
    cerr << "Unable to open " << argv[1] << endl;
    exit(2);
  }

  string line;
  string word;
  while( !fin.eof() ) {
    getline(fin,line);

    lowercaseWords(line);
    istringstream iss(line, istringstream::in);

    while( iss >> word ) {
      int rank = treap.find(word);
      if (rank == -1) {
        // Discovered a new word
        rank = r, r += 1;
        treap.insert(word, rank);
        words.push_back(word);
        // Push an empty vector for the new word
        follower_ranks.push_back(vector<int>());
      }
      // Check if this word has a precursor
      if (prev != -1)
        follower_ranks[prev].push_back(rank);
      all_word_ranks.push_back(rank);
      prev = rank;
    }
  }
  fin.close();

  if (n == 0) {
    for (unsigned i = 0; i < words.size(); i += 1) {
      cout << words[i] << " :";
      for (unsigned j = 0; j < follower_ranks[i].size(); j += 1) {
        cout << " " << words[follower_ranks[i][j]];
      }
      cout << endl;
    }
    // treap.print(NULL, -1);
  } else {
    // A represents the follower sequence we are working on
    vector<int> A = all_word_ranks;
    while (n--) {
      int i = rand() % A.size();
      cout << words[A[i]] << " ";
      // Check if the word has followers
      if (follower_ranks[A[i]].size())
        A = all_word_ranks;
      else 
        A = follower_ranks[A[i]];
    }
    cout << endl;
  }
  return 0;
}

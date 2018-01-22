#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>

struct TreeNode { 
	char name[1000]; 
	TreeNode *left; 
	TreeNode *right; 
};
typedef struct TreeNode TreeNode;

int height(const char *str, int lbs=0, int max=0) {
	if (str[0] == '\0') return max + 1;

	if (str[0] == '(') 
		lbs += 1;
	else if (str[0] == ')')
		lbs -= 1;
	if (lbs > max) max = lbs;
	return height(str+1, lbs, max);
}

const char *treeToString(TreeNode * root) {
	char *repr = NULL;
	if (root == NULL) return "";
	if (root->left == NULL && root->right == NULL)
		return (const char *) root->name;

	repr = (char *) calloc(1000, sizeof(char));

	// return '(' + root->l + ',' + root->r + ')'
	repr[0] = '(';
	strcpy(&repr[strlen(repr)], treeToString(root->left));
	strcpy(&repr[strlen(repr)], ",");
	strcpy(&repr[strlen(repr)], treeToString(root->right));
	strcpy(&repr[strlen(repr)], ")");

	return repr;	
}

#define TN 	TreeNode
#define NNODE	(TreeNode *)calloc(1, sizeof(TreeNode))
TreeNode *construct() {
	TN *root, *rl, *rr, *rll, *rlr, *rrr, *rrl, *rlrr, *rlrl;

	root = NNODE;
	assert(!root->left && !root->right);

	rl = root->left = NNODE;
	rr = root->right = NNODE;
	rll = rl->left = NNODE;
	rrl = rr->left = NNODE;
	rrr = rr->right = NNODE;
	strcpy(rll->name, "chicken");
	strcpy(rrl->name, "zebrafish");
	strcpy(rrr->name, "C.elegans");

	rlr = rl->right = NNODE;
	rlrr = rlr->right = NNODE;
	strcpy(rlrr->name, "mouse");
	rlrl = rlr->left = NNODE;
	strcpy(rlrl->name, "human");

	return root;
}

int main(void) {
	int i = 0;
	const char *tree[] = {
		"((chicken,(human,mouse)),(zebrafish,C.elegans))",
		"(C.elegans,(chicken,(human,(mouse,zebrafish))))",
	};
	TreeNode *an = construct();
	
	printf("%s\n", treeToString(an));

	for (i = 0; i < 2; i += 1) {
		printf("%d\n", height(tree[i], 0, 0));
	}

	return 0;
}

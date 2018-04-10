#include "subdivision.h"
#include "trimesh.h"

#include <cstdlib>
#include <iostream>
#include <cassert>

//
// Public functions
//

Subdivision::Subdivision()
{
    // Default Constructor
}


Subdivision::~Subdivision()
{
    // Destructor
    for (unsigned int i = 1; i < controlMeshes.size(); i += 1) {
        delete controlMeshes[i];
    }
    controlMeshes.clear();
}


void Subdivision::initialize(TriMesh* controlMesh)
{
    // Initializes this subdivision object with a mesh to use as 
    // the control mesh (ie: subdivision level 0).

    controlMeshes.push_back(controlMesh);
}


TriMesh* Subdivision::subdivide(int level)
{
    // Subdivides the control mesh to the given subdivision level.
    // Returns a pointer to the subdivided mesh->

    // If the calling code asks for a level that has already been computed,
    // just return the pre-computed mesh!

    assert (level >= 0);

    if (level < controlMeshes.size()) {
        // std::cout << "level < controlMeshes.size() " << controlMeshes[level] << std::endl;
        return controlMeshes[level];
    }

    while (level >= controlMeshes.size()) {
        // Create a new subdivision mesh for each subdivision level and 
        // store it in memory for later.
        TriMesh * pre_computed = controlMeshes.back();
        controlMeshes.push_back(subdivideOnce(pre_computed));
    }

    return controlMeshes.back();
}

//
// Private Functions
//

TriMesh * Subdivision::subdivideOnce(TriMesh * mesh) {
    isNew.clear();
    isSplit.clear();

    // std::cout << "Subdividing once..." << std::endl;

    TriMesh * subdividedMesh = new TriMesh(*mesh);

    std::vector<TriMesh::Face *> toBeDivided = subdividedMesh->getFaces();

    // mark all vertices in subdividedMesh as old
    for (TriMesh::Vertex * v : subdividedMesh->getVertices()) {
        isNew[v] = false;
    }
    // mark all half-edges in subdividedMesh as not split
    for (TriMesh::HalfEdge * he : subdividedMesh->getEdges()) {
        isSplit[he] = false;
    }

    // while there is an half-edge he from subdividedMesh that is not split yet
    for (auto & kvpair : isSplit) {
        if (kvpair.second == false) {
            splitEdge(kvpair.first, subdividedMesh);
        }
    }

    // std::cout << "Cutting corners..." << std::endl;

    // while there is a non-triangle face mesh from subdividedMesh
    for (TriMesh::Face * f : toBeDivided) {
        // check if face f is a triangle or not
        // std::cout << "Testing face " << f << std::endl;
        testFace(f);
        if (f->edge()->next() == nullptr)
            std::cout << "f->edge() " << f->edge() << std::endl;
        while (countVertices(f) != 3) {
            cutACorner(f, subdividedMesh);
        }
    }

    return subdividedMesh;
}

void Subdivision::testFace(TriMesh::Face * f) {
    assert (f != nullptr);
    TriMesh::HalfEdge * next = f->edge(), * prev = f->edge();
    for (unsigned int i = 0; i < 6; i += 1) {
        next = next->next();
    }
    if (next != f->edge()) {
        std::cout << "Cannot finish traversal for next." << std::endl;
    }
    for (unsigned int i = 0; i < 6; i += 1) {
        prev = prev->prev();
    }
    if (next != f->edge()) {
        std::cout << "Cannot finish traversal for prev." << std::endl;
    }
}

Vector Subdivision::generateNewVertex(TriMesh::HalfEdge * he) {
    TriMesh::Vertex *eight_left, *eight_right, *two_top, *two_btm;
    TriMesh::Vertex *one_top_left, *one_top_right, *one_btm_left, *one_btm_right;

    eight_left = he->origin();
    eight_right = he->twin()->origin();
    two_top = he->next()->twin()->origin();
    two_btm = he->twin()->prev()->origin();
    one_btm_left = he->twin()->next()->twin()->prev()->origin();
    one_top_left = he->prev()->twin()->prev()->origin();
    one_btm_right = he->twin()->prev()->twin()->prev()->origin();
    one_top_right = he->next()->twin()->prev()->origin();

    Vector pos = eight_left->pos() / 2.0 + eight_right->pos() / 2.0;
    pos += (two_btm->pos() / 8.0 + two_top->pos() / 8.0);
    pos -= (one_btm_left->pos() / 16.0 + one_btm_right->pos() / 16.0);
    pos -= (one_top_left->pos() / 16.0 + one_top_right->pos() / 16.0);

    return pos;
}

void Subdivision::splitEdge(TriMesh::HalfEdge *he, TriMesh * mesh) {

    assert(he->twin() != nullptr);
    assert(he->next() != nullptr);
    assert(he->prev() != nullptr);

	Vector pos = generateNewVertex(he);

    // Add new vertex v to mesh
	TriMesh::Vertex *v = mesh->addVertex(pos);
    // Mark v as new, store 'isNew' flag for every vertex
    isNew[v] = true;

    assert (isSplit[he] == false);

    #ifdef DEBUG
    /*
    std::cout << "isSplit[he->twin()] " << isSplit[he->twin()] << std::endl;
    std::cout << "isSplit[he->prev()] " << isSplit[he->prev()] << std::endl;
    std::cout << "isSplit[he->next()] " << isSplit[he->next()] << std::endl;
    std::cout << "he " << he << std::endl;
    std::cout << "he->prev() " << he->prev() << std::endl;
    std::cout << "he->next() " << he->next() << std::endl;
    std::cout << "he->twin() " << he->twin() << std::endl;
    countVertices(he->face());
    */
    #endif

    // Add 2 new halfedges to M
    TriMesh::HalfEdge *he_prev_new, *he_twin_new;
    he_twin_new = mesh->addEdge(he->twin()->origin(), v);
    he_prev_new = mesh->addEdge(he->origin(), v);

    // Adjust the origin of the two old halfedges
    he->origin() = v;
    he->twin()->origin() = v;

    TriMesh::HalfEdge *he_prev_prev = he->prev();
    TriMesh::HalfEdge *he_prev_twin = he->twin();
        assert (he->twin()->next()->prev() == he->twin());

    TriMesh::HalfEdge *adjacent_prev = he->twin()->prev();
    TriMesh::HalfEdge *adjacent_next = he->twin()->next();

    he->prev() = he_prev_new;
    he->twin() = he_twin_new;
    // he->next() remains the same

    he_prev_new->prev() = he_prev_prev;
    he_prev_new->twin() = he_prev_twin;
    he_prev_new->next() = he;

    he_twin_new->twin() = he;
    he_twin_new->next() = he_prev_twin;
    he_twin_new->prev() = adjacent_prev;
    adjacent_prev->next() = he_twin_new;

    he_prev_twin->twin() = he_prev_new;
    // he_prev_twin->next() should remain the same
    assert (he_prev_twin->next() == adjacent_next);
    assert (adjacent_next->prev() == he_prev_twin);
    he_prev_twin->prev() = he_twin_new;

    he_prev_prev->next() = he_prev_new;
    // he->next()->prev() should remain the same
    assert (he->next()->prev() == he);

    assert (he->prev()->twin()->prev()->twin() == he);
    assert (he->twin()->next()->twin()->next() == he);

    // Mark he, he.twin and the new halfedges as already split
    // safe to do since for map::operator[] no iterators or references are invalidated
    isSplit[he] = true;
    isSplit[he_twin_new] = true;
    isSplit[he_prev_new] = true;   
    isSplit[he_prev_twin] = true; 

    #ifdef DEBUG  
    std::cout << "he " << he << std::endl;
    std::cout << "he_twin_new " << he_twin_new << std::endl;
    std::cout << "he_prev_new " << he_prev_new << std::endl;
    std::cout << "he_prev_twin " << he_prev_twin << std::endl;
    #endif
}

unsigned int Subdivision::countVertices(TriMesh::Face * f) const {
    const TriMesh::Vertex *v = f->vertex(0);
    TriMesh::HalfEdge *edge = f->edge()->next();
    int count = 1;
    assert (edge != nullptr); 
    while (v != edge->origin()) {
        count += 1;
        edge = edge->next();
    }
    #ifdef DEBUG
    std::cout << "This face has " << count << " vertices" << std::endl;
    #endif
    return count;
}

void Subdivision::cutACorner(TriMesh::Face * f, TriMesh * mesh) {
    // Add a new halfedge h to mesh
    TriMesh::HalfEdge *hi = f->edge(), *hj = f->edge()->next();
    TriMesh::Vertex *v1 = hi->origin();
    TriMesh::Vertex *v2 = hj->next()->origin();
    TriMesh::HalfEdge *hk = mesh->addEdge(v2, v1), *ht = mesh->addEdge(v1, v2);
    TriMesh::HalfEdge *adjacent_i = hi->prev(), *adjacent_j = hj->next();

    // Mark hk as already split
    isSplit[hk] = true;

    // Add a new face t to M
    TriMesh::Face *t = mesh->addFace(hi, hj, hk);
    
    TriMesh::HalfEdge *sa = t->edge();
    assert (sa->next()->next()->next() == sa);
    assert (sa->prev()->prev()->prev() == sa);

    #ifdef DEBUG
    std::cout << "Current face " << f << " twin face " << t << std::endl;
    #endif

    // Update f.he() if necessary
    f->edge() = adjacent_j;

    // Update all the necessary next, prev, twin, origins
    adjacent_i->next() = ht;
    adjacent_j->prev() = ht;
    hk->next() = hi;
    hk->prev() = hj;
    hk->twin() = ht;
    ht->twin() = hk;
    ht->next() = adjacent_j;
    ht->prev() = adjacent_i;
    
}


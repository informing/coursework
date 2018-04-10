#ifndef _SUBDIVISION_H_
#define _SUBDIVISION_H_

#include "trimesh.h"


//
// A class for performing subdivision operations on a mesh.
//
class Subdivision {

public:

    // Default constructor
    Subdivision();

    // Destructor
    ~Subdivision();

    // Initializes this subdivision object with a mesh to use as 
    // the control mesh (ie: subdivision level 0).
    void initialize(TriMesh* controlMesh);

    // Subdivides the control mesh to the given subdivision level.
    // Returns a pointer to the subdivided mesh.
    TriMesh* subdivide(int level);

private:

    Vector generateNewVertex(TriMesh::HalfEdge * he);

    void splitEdge(TriMesh::HalfEdge * he, TriMesh * mesh);

    unsigned int countVertices(TriMesh::Face * f) const;
    
    void cutACorner(TriMesh::Face *f, TriMesh * mesh);

    TriMesh * subdivideOnce(TriMesh * mesh);

    void testFace(TriMesh::Face * f);

    std::vector<TriMesh *> controlMeshes;

    std::map<TriMesh::Vertex *, bool> isNew;

    std::map<TriMesh::HalfEdge *, bool> isSplit;

};

#endif

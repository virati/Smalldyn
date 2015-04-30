 #ifndef SMALL_KERNEL_H
#define SMALL_KERNEL_H

typedef unsigned int uint;

struct SimParams {
    int gridSize;
    int numCells;
    float worldOrigin;
    float cellSize;

    int numBodies;
    int maxParticlesPerCell;
};

#endif

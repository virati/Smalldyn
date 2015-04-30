#include <cutil_inline.h>
#include <cstdlib>
#include <cstdio>
#include <string.h>

#include "smallsys.h"
#include "smallsys.cuh"
#include "small_kernels.cu"

extern "C" {

void cuda_init(int argc, char **argv) {
    cudaSetDevice( cutGetMaxGflopsDeviceId() );
}

void allocateArray(void **ptr, size_t size) {
    cutilSafeCall(cudaMalloc(ptr, size));
}

void freeArray(void *devPtr) {
    cutilSafeCall(cudaFree(devPtr));
}

void diffuse(uint num_total_particles, float time_step, coord *h_pos) {
	uint numT, numB;
	numT = 10;
	numB = 10;
	printf("yes");
	//d_diff<<<numT,numB>>>(num_total_particles, time_step, h_pos);
}

}

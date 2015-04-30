#ifndef __SMALL_KERNS_C__
#define __SMALL_KERNS_C__

#include <stdio.h>
#include <math.h>
#include "cutil_math.h"
#include "math_constants.h"
#include "small_kernels.cuh"
#include "smalldyn.h"

extern "C" {

__global__ void d_diff(uint N, float d_t, coord *pos_array) {
	uint index = __umul24(blockIdx.x,blockDim.x) + threadIdx.x;
    if (index >= N) return;          // handle case when no. of particles not multiple of block size
    
    volatile float4 pos_data = make_float4(pos_array[index].x,pos_array[index].y, pos_array[index].z, 1.0f);
    float3 pos = make_float3(pos_data.x, pos_data.y, pos_data.z);
    
    //Generate Displacement coord
    pos += make_float3(0.1,0.1,0.1);
    
    pos_array[index].x = pos_data.x;
	pos_array[index].y = pos_data.y;
    pos_array[index].z = pos_data.z;
}

}

#endif

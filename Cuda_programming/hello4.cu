#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void hello_from_gpu()
{
	const int b = blockIdx.x;
	const int tx = threadIdx.x;
	const int ty = threadIdx.y;
	printf("Hello world from block-%d and thread-(%d, %d)!\n", b, tx,ty);


}

int main(void)
{
	const dim3 block_size(2, 4);
	hello_from_gpu << <1, block_size >> > ();
	cudaDeviceSynchronize();
	return 0;
}
#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void hello_from_gpu()
{
	const int bid = blockIdx.x;
	const int tid = threadIdx.x;
	printf("Hello world from block %d and thread %d!\n", bid, tid);

}

int main(void)
{
	hello_from_gpu << <2, 4 >> > ();
	cudaDeviceSynchronize();
	return 0;
}
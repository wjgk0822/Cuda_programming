#include <stdio.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void hello_from_gpu()
{
	printf("Hello world from the GPU!\n");
}

int main(void)
{
	hello_from_gpu<<<1, 1>>>();
	cudaDeviceSynchronize();
	return 0;
}
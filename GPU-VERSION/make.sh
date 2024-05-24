#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Paths
P_Neko="${SCRIPT_DIR}/neko-0.6.1"
P_Neko_Install="${SCRIPT_DIR}/neko-runtime"

# Build Neko
currdir=$PWD
cd ${P_Neko}
make distclean
./regen.sh

FLAGS_GFORTRAN="-O3 -march=znver3 -mtune=znver3 -funroll-loops"
FLAGS_GCC="gcc -O3 -march=znver3 -mtune=znver3 -funroll-loops"
FLAGS_NVCC="-O3 -allow-unsupported-compiler"

./configure FCFLAGS="${FLAGS_GFORTRAN}" CFLAGS="-O3" CC="${FLAGS_GCC}" FC=gfortran LDFLAGS="-L${LAPACK_HOME}/lib -L/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nccl/lib" --with-parmetis=${Parmetis_HOME} --with-metis=${metis_HOME} --with-cuda=${CUDA_HOME} CUDA_ARCH=-arch=sm_80 NVCC=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/bin/nvcc CUDA_CFLAGS="${FLAGS_NVCC}" --enable-device-mpi --with-nccl=/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nccl --prefix=${P_Neko_Install}
rm -rf ${P_Neko_Install}
mkdir -p ${P_Neko_Install}
make -j32 && make -j32 install

# Clean up
cd $currdir
unset P_Neko P_Neko_Install
unset Input_Buildfile
unset currdir


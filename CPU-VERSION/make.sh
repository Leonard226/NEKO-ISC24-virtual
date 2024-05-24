#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Paths
P_Neko="${SCRIPT_DIR}/neko-0.6.1"
P_Neko_Install="${SCRIPT_DIR}/neko-runtime"

# Build Neko
currdir=$PWD
cd ${P_Neko}
make distclean

FLAGS="-O3 -march=znver3 -mtune=znver3 -funroll-loops"

./regen.sh
./configure FCFLAGS="${FLAGS}" CFLAGS="${FLAGS}" LDFLAGS="-L${LAPACK_HOME}/lib" --with-parmetis=${Parmetis_HOME} --with-metis=${metis_HOME} --prefix=${P_Neko_Install}

rm -rf ${P_Neko_Install}
mkdir -p ${P_Neko_Install}
make -j32 && make -j32 install

# Clean up
cd $currdir
unset P_Neko P_Neko_Install
unset Input_Buildfile
unset currdir
unset SCRIPT_DIR


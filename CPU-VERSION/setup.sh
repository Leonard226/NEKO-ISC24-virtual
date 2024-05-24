#!/bin/bash

# Hash code
H_compiler="/uwdf66u"
H_MPI="/g6v3enc"
H_json_fortran="/ke2yvqv"
H_BLAS="/7uhxqk4"
H_Parmetis="/ho7f6py"
H_metis="/xco3qvl"

# Set up
spack unload --all
spack load $H_MPI $H_compiler

currdir=$PWD

spack cd -i ${H_BLAS}
P_BLAS=$PWD

spack cd -i ${H_json_fortran}
P_json_fortran=$PWD

spack cd -i ${H_Parmetis}
P_Parmetis=$PWD

spack cd -i ${H_metis}
P_metis=$PWD

export LD_LIBRARY_PATH=${P_metis}/lib:${P_Parmetis}/lib:${P_BLAS}/lib:${P_json_fortran}/lib64:$LD_LIBRARY_PATH
export LAPACK_HOME=${P_BLAS}
export metis_HOME=${P_metis}
export Parmetis_HOME=${P_Parmetis}

# Clean up
cd $currdir
unset H_json_fortran H_BLAS H_Parmetis H_metis H_compiler H_MPI
unset P_json_fortran P_BLAS P_Parmetis P_metis


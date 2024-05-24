#!/bin/bash

OUTPUT=CPU_INTERACTIVE_07.txt
# hostlist = list of nodes where job is executed
# we select 64 cores per node
h1=094
h2=111
h3=263
h4=313
HOSTLIST="r${h1}:64,r${h2}:64,r${h3}:64,r${h4}:64"

rm -f $P_INPUT/neko

# making 
apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /opt/Rocky9-24.3/CPU/gcc_openmpi/neko-runtime/bin/makeneko /scratch/tgv.f90

# run NEKO and explicitly bind one MPI task to two physical cores
mpirun -n 256 -H ${HOSTLIST} --cpus-per-proc 2 apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /scratch/neko /scratch/tgv_Re1600.case

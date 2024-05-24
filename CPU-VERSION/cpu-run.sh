#!/bin/bash

OUTPUT=CPU_INTERACTIVE_07.txt

h1=094
h2=111
h3=263
h4=313
host_list="r${h1}:64,r${h2}:64,r${h3}:64,r${h4}:64"

rm -f $P_INPUT/neko

apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /opt/Rocky9-24.3/CPU/gcc_openmpi/neko-runtime/bin/makeneko /scratch/tgv.f90

HOSTLIST="r${h1}:64,r${h2}:64,r${h3}:64,r${h4}:64"
mpirun -n 256 -H ${HOSTLIST} --cpus-per-proc 2 apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /scratch/neko /scratch/tgv_Re1600.case

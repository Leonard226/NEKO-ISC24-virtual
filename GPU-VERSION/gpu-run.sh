#!/bin/bash

OUTPUT=GPU_INTERACTIVE_02.txt

rm -f $P_INPUT/neko

apptainer exec --nv --cleanenv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /opt/Rocky9-24.3/GPU/gcc13_openmpi/neko-runtime/bin/makeneko /scratch/tgv.f90

mpirun -n 4 --bind-to none --map-by node --rank-by slot:span --mca btl ^tcp,vader,openib --mca pml ucx --mca rankfile slot=0:0,1:1,2:2,3:3 apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER bash -c 'export CUDA_VISIBLE_DEVICES=$((OMPI_COMM_WORLD_RANK % 4)); /scratch/neko /scratch/tgv_Re1600.case' | tee $OUTPUT


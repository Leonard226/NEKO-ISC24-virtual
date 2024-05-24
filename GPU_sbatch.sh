#!/bin/bash
#SBATCH --job-name=GPU_NEKO
#SBATCH --output=GPU_OUTPUT.txt
#SBATCH --partition=GPU-small
#SBATCH --gres=gpu:4
#SBATCH --ntasks=4
#SBATCH --gpus-per-task=1


export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK


source $PROJECT/ManySpacks/utilsSpack/spack/share/spack/setup-env.sh
spack load openmpi



export APPTAINERENV_PATH=/opt/local/linux-rocky9-zen3/gcc-11.4.1/openmpi-4.1.6-e6snpdbld2inplnt4gygtqsp6msjohmh/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/perl-5.38.0-ygqjkmchhy3tnaezf4ettsdmv4x36bzm/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/xz-5.4.6-opyyxpgi2jnrpui5cgxybmt6dpgmvlm5/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/gcc-13.2.0-uwdf66uq47yolwcmpdl2lqjdybvrpzkl/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/12.3/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/openmpi-4.1.6-e6snpdbld2inplnt4gygtqsp6msjohmh/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/ucx-1.13.1-llzkwdfqamdclrxvbkui4whub37vtjnm/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/gdrcopy-2.4.1-hcgsoe3axpj2iivunruw2bmp4faakf5i/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/check-0.15.2-p6ivc2rng4c65mrkqzn2u6gspm4tugdy/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/slurm-23-11-1-1-san2d3zd7paumutwzhd3xol5y7l4ntgc/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/munge-0.5.15-g6llr57rzqnica27v6w2j4ust6qusxhj/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/libgcrypt-1.10.3-xtyqm5my5mvuhyqqjdai5ofifgmjggtg/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/libgpg-error-1.48-2fjf3mwpwoxhibsen2pum4tzud3otm3d/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/lz4-1.9.4-e3giepoqjjyaxqzsw4muvbrntqojtxhq/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/glib-2.78.3-l7yvzmozpewyjmrcaklt6i77r7vvyzgq/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/perl-5.38.0-ygqjkmchhy3tnaezf4ettsdmv4x36bzm/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/gdbm-1.23-o55ym7hit4pegxtkt4xgvb3d7x2fhxro/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/readline-8.2-rpfbnpte5pj2ec5kdftbkqrdph7564bx/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/berkeley-db-18.1.40-s7qt6byugs6owbyjve6zknxpwrlqgzyx/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/pcre2-10.42-i2lamgmblj746yrmqtczb4vbfrte4cy6/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/elfutils-0.190-olbny572turuykip3xoepcjgjidf7aoi/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/gettext-0.22.4-itf6wdn7ykot7gixqqpiqhqpi5dgws7z/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/bzip2-1.0.8-acgwbjv7x7hmyi4ikqgltjb24p6iefyh/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/pmix-5.0.1-f3ppiqyequ4ylrjiuninkak3hfdutgbh/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/numactl-2.0.14-hynlb2ckezuqndeqm3muxjxj3cmlzlfi/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/libevent-2.1.12-xva65tqv6oekyl5zll2wq6fnrjnnyc25/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/openssl-3.2.1-gyl7sqnhttfwcwaereix3qamx4erav74/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/hwloc-2.9.1-i5ixqsuagpdwkw2swwlxeujacy736hua/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/ncurses-6.4-jfoahaw7c3frtffc25ngp6xljggwyywi/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/libxml2-2.10.3-hvthsy6ubcxgrdetssekjnuoorrralku/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/xz-5.4.6-opyyxpgi2jnrpui5cgxybmt6dpgmvlm5/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/libiconv-1.17-nz4eua3xmjuencyxqhk2zudcust3wdf7/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/12.3/bin:/opt/local/linux-rocky9-zen3/gcc-11.4.1/gcc-13.2.0-uwdf66uq47yolwcmpdl2lqjdybvrpzkl/bin:/root/spack/bin:/root/.local/bin:/root/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/extras/qd/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/mpi/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nvshmem/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nccl/bin:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/profilers/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export APPTAINERENV_LD_LIBRARY_PATH=/opt/local/linux-rocky9-zen3/gcc-11.4.1/metis-5.1.0-4zpm7zdh4z25dxhrfm6buaf73hjwjsbh/lib:/opt/local/linux-rocky9-zen3/gcc-11.4.1/parmetis-4.0.3-pba5rwff2wn2wao35swiorw7bxd24qd7/lib:/opt/local/linux-rocky9-zen3/gcc-11.4.1/openblas-0.3.26-bmqsh44k6jjjtthtddquixdia73ihg5p/lib:/opt/local/linux-rocky9-zen3/gcc-13.2.0/json-fortran-8.3.0-ke2yvqv5gt6v27emgixgmxabyeeumjqn/lib64:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nvshmem/lib:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/comm_libs/nccl/lib:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/math_libs/lib64:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/lib:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/compilers/extras/qd/lib:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/extras/CUPTI/lib64:/opt/nvidia/hpc_sdk/Linux_x86_64/24.3/cuda/lib64:/.singularity.d/libs



P_CONTAINER=/ocean/projects/cis230088p/racklett/neko_containers/NEKO_BRIDGES.sif
P_INPUT=/jet/home/racklett/ISC24/neko/leos_neko/vcontainer_neko/SUBMISSIONS/GPU/run03/tgv


rm -f $P_INPUT/neko

apptainer exec --nv --cleanenv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER /opt/Rocky9-24.3/GPU/gcc13_openmpi/neko-runtime/bin/makeneko /scratch/tgv.f90

mpirun -n 4 --bind-to none    --map-by node --rank-by slot:span    --mca btl ^openib    --mca rankfile slot=0:0,1:1,2:2,3:3    apptainer exec --nv --no-mount home --bind $P_INPUT:/scratch --pwd=/scratch $P_CONTAINER    bash -c 'export CUDA_VISIBLE_DEVICES=$((OMPI_COMM_WORLD_RANK % 4)); /scratch/neko /scratch/tgv_Re1600.case'

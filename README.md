## NEKO-ISC24-Virtual
The International Supercomputing Conference 2024 (ISC24) features a Student Cluster Competition (SCC) where teams from universities around the world compete against each other. This repository focuses on the virtual part of the competition.

The virtual part was open for all teams, the teams were connecting to remote clusters and run HPC applications, performing benchmarks and participate in the given challenges. In total 19 universities from all over the world participated in the virual competition. For the virtual part, the teams competed over Bridges-2 supercomputer provided by Pittsburgh Supercomputing Center (PSC).

Out of the 19 virtual competing teams, our team, Team RACKlette representing ETH Zürich, placed 4th overall. 

## Tasks
For the virtual part, 4 applications were presented, were I was assigned to work on NEKO. 
It is a high-order spectral element flow simulation written in modern fortran, and has many applications in fluid dynamics. In particular the task included: 
_1. Run Neko with the given input  (neko tgv_Re1600.case) on 4 CPU nodes and submit the results to the team’s folder (standard output, field0.f00000, field0.f00001 and field0.nek5000)
2. Run Neko with the given input on 4 GPUs (V100) and submit the results to the team’s folder (see instructions for GPU support above, and the additional information provided with the input file)
3. Run IPM profile or any other MPI profile on 4 nodes, and find the 3 most used MPI calls, show your work in the team interview.
4. Create a visualization short video with Paraview and show it on your team interview _

## Our Approach
Since we needed to run NEKO on the online cluster Bridges-2, which provided various internal configurations, we opted to build a container on one of our clusters named "racklette," which shares similar hardware. A container enables packaging an application and its dependencies into a single environment known as an image. This image can then operate independently of the host operating system. We utilized an empty HPC container provided by NVIDIA and installed the necessary missing packages/software.

In our quest to find the best configuration for NEKO, we experimented with different compilers, namely `gcc`, `aocc`, and `nvhpc`, coupled with various MPI implementations like `openmpi`, `mpich`, and `intel-mpi`. We determined that `gcc` and `openmpi` offered the most optimal scaling and runtime. We have depicted the performance of different builds in the `presentation.pdf`.


In the end we choose the following dependencies: 
- compiler: `gcc`
- mpi: `openmpi`
- blas/lapack: `openblas`
- `json-fortran`
- `metis`, `parmetis`
- `nccl` (for GPU version)

The specific dependencies and versions of each software/package can be found in the `spack.yaml`. 
Additionally, we used hardware specific compiler flags like `-march=znver2 -mtune=znver2` and performance flags like `-O3 -funroll-loops`. 
Multithreaded BLAS/LAPACK implementations don't significantly impact performance, as these libraries are only required at the beginning of the code to invert some matrices. Furthermore, NEKO heavily relies on small matrix multiplications, which are not well-suited for these libraries. Consequently, the developers of NEKO have implemented their own math kernels.

###### CPU Version
For the CPU version, we set the number of MPI tasks per node to 64, and explicitly bound 1 MPI tasks to 2 cores. We have visualized the runtime of NEKO in dependency of the number of MPI tasks per node in the presentation. This results in a nice balance between worklaod per core and communication overhead. We could achieve a total speed up of 430% for the CPU version using the containerized approach. 

###### GPU Version
Here, we made sure that each MPI task is explicitly bound to exaclty one GPU. We also enabled `--enable-device-aware-mpi` option to avoid unnecessary device-host copies. 

Since the container is 36GB large, it wont be shared on this repository. 


# NEKO-ISC24-Virtual
The International Supercomputing Conference 2024 (ISC24) features a Student Cluster Competition (SCC) where teams from universities around the world compete against each other. This repository focuses on the virtual part of the competition.

The virtual part was open for all teams, the teams were connecting to remote clusters and run HPC applications, performing benchmarks and participate in the given challenges. In total 19 universities from all over the world participated in the virual competition. For the virtual part, the teams competed over Bridges-2 supercomputer provided by Pittsburgh Supercomputing Center (PSC).

Out of the 19 virtual competing teams, our team, Team RACKlette representing ETH Zürich, placed 4th overall. 

# Tasks
For the virtual part, 4 applications were tasked, were I was assigned to work on NEKO. 
It is a high-order spectral element flow simulation written in modern fortran, and has many applications in fluid dynamics. In particular the task included: 
1. Run Neko with the given input  (neko tgv_Re1600.case) on 4 CPU nodes and submit the results to the team’s folder (standard output, field0.f00000, field0.f00001 and field0.nek5000)
2. Run Neko with the given input on 4 GPUs (V100) and submit the results to the team’s folder (see instructions for GPU support above, and the additional information provided with the input file)
3. Run IPM profile or any other MPI profile on 4 nodes, and find the 3 most used MPI calls, show your work in the team interview.
4. Create a visualization short video with Paraview and show it on your team interview 

# ABOUT
In this git repository, I will share all the work we did to accomplish the above tasks (excpet the visualization and the MPI profiling). Our approach involved building an HPC container and experimenting with different compilers, MPI implementations, and math libraries. We also varied the number of MPI tasks and could achieve a significant speedup of 430%. 

# io500-singularity

Run `io500` using Singularity or Apptainer on a Slurm cluster.

# Build
A Docker container is automatically built on push by the [Github CI workflow](.github/workflows/build.yml) and uploaded to the GitHub Packages Repository.

# Cluster prerequisites

- A Slurm cluster with the following installed on the login and compute nodes.
- `singularity` or `apptainer`
- `openmpi` or a compatible MPI.

Note all of the above are available from default or EPEL repos on RockyLinuyx 8.7.

# Run
A debug (very short) run can be performed by running:

    sbatch submit.sh

# TODOs
- Parameterise number of mpi processes.
- Setup for a proper run.

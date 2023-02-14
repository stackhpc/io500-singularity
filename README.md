# io500-singularity

Run `io500` using Singularity on a Slurm cluster.

# Build
A Docker container is automatically built on push by the [Github CI workflow](.github/workflows/build.yml) and uploaded to the GitHub Packages Repository.

# Cluster prerequisites

- A Slurm cluster with the following installed on the login and compute nodes.
- `singularity` or `apptainer`
- `openmpi` or a compatible MPI.

Note all of the above are available from default or EPEL repos on RockyLinuyx 8.7.

# Run
A very short debug run can be performed by running:

    $ sbatch submit.sh config-debug-run.ini 

Note this assumes an OpenHPC cluster with the `gnu12` and `openmpi4` module installed.

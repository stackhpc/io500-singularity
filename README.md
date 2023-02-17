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
A very short debug run using 2x processes (probably on a single node) can be performed by running:

    $ sbatch submit.sh config-debug-run.ini

For an [io500-compliant run](https://io500.org/rules-submission) note that the `stonewall` parameter in the .ini file must be changed to 300 and 10x physical nodes must be used (e.g. use `sbatch -N 10 --ntasks-per-node=1`)

Note this assumes an OpenHPC cluster with the `gnu12` and `openmpi4` module installed.

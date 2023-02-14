#!/usr/bin/env bash

#SBATCH --ntasks=2
#SBATCH --exclusive
#SBATCH --partition=compute

IO500_TAG=0487bc7
SINGULARITY=singularity

export UCX_NET_DEVICES=all
echo SLURM_JOB_NODELIST: $SLURM_JOB_NODELIST
echo SLURM_JOB_ID: $SLURM_JOB_ID
echo UCX_NET_DEVICES: $UCX_NET_DEVICES
module load gnu12 openmpi4

${SINGULARITY} exec docker://ghcr.io/stackhpc/io500-singularity:${IO500_TAG} /io500/setup-run.sh ./config-debug-run.ini
timestamp=$(date +%Y.%m.%d-%H.%M.%S)
mpirun -np 2 ${SINGULARITY} exec docker://ghcr.io/stackhpc/io500-singularity:${IO500_TAG} /io500/io500 ./config-debug-run.ini --timestamp $timestamp

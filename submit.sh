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

export SINGULARITY_CMD=singularity
export IO500_CONTAINER_SOURCE="docker://ghcr.io/stackhpc/io500-singularity"
export IO500_CONTAINER_TAG="a106371"

./io500.sh ./config-debug-run.ini

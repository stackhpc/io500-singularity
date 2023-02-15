#!/usr/bin/env bash
# Usage:
#   submit.sh path-to-io500-ini

#SBATCH --ntasks=2
#SBATCH --exclusive
#SBATCH --partition=compute

export UCX_NET_DEVICES=all
export IO500_CONTAINER_TAG="bb942db"
export io500_cmd="singularity exec docker://ghcr.io/stackhpc/io500-singularity:${IO500_CONTAINER_TAG} /io500"

echo SLURM_JOB_NODELIST: $SLURM_JOB_NODELIST
echo SLURM_JOB_ID: $SLURM_JOB_ID
echo UCX_NET_DEVICES: $UCX_NET_DEVICES
module load gnu12 openmpi4

./io500.sh $1

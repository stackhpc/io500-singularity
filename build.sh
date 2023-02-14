#!/usr/bin/env bash
set -x
rm -f io500.tar io500.sif
podman build images/ -t io500
podman save localhost/io500 -o io500.tar
singularity build io500.sif docker-archive://io500.tar

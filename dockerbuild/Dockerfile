FROM rockylinux:8.7

RUN dnf install -y \
    autoconf automake git make mpitests-openmpi \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Add MPI binaries to PATH
ENV PATH=/usr/lib64/openmpi/bin:$PATH

# Do the io500 installation - note this could be cleaned up afterwards!
RUN git clone https://github.com/IO500/io500.git --branch io500-isc22 && rm -rf .git
RUN cd io500 && ./prepare.sh
RUN chmod -R ugo=rwX /io500

# Add io500 binary to path:
ENV PATH=/io500:$PATH

# Don't run benchmarks from the io500.sh script:
RUN sed -i 's/^  run_benchmarks$//' /io500/io500.sh

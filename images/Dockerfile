FROM rockylinux:8.7 AS build

RUN dnf install -y \
    autoconf automake git make openmpi \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Add MPI binaries to PATH
ENV PATH=/usr/lib64/openmpi/bin:$PATH

# Do the io500 installation
RUN git clone https://github.com/IO500/io500.git --branch io500-isc22 && rm -rf .git
RUN cd io500 && ./prepare.sh

FROM rockylinux:8.7

# Install MPI libraries and tests
RUN dnf install -y \
    autoconf automake git make mpitests-openmpi \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Add MPI binaries to PATH
ENV PATH=/usr/lib64/openmpi/bin:$PATH

# Add io500 binary to path:
ENV PATH=/io500:$PATH

# Copy the actual executable
COPY --from=build /io500/io500 /io500
RUN chmod -R ugo=rwX /io500

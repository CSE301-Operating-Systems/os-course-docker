FROM ubuntu:22.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential tools for OS coursework
RUN apt-get update && apt-get install -y \
    # C/C++ compilation
    gcc \
    g++ \
    make \
    cmake \
    # Python
    python3 \
    python3-pip \
    # Debugging & profiling
    gdb \
    valgrind \
    strace \
    ltrace \
    # Man pages
    man-db \
    manpages-dev \
    manpages-posix \
    manpages-posix-dev \
    # Utilities
    vim \
    nano \
    less \
    tree \
    htop \
    git \
    curl \
    # Process inspection
    procps \
    lsof \
    psmisc \
    # IPC tools
    iproute2 \
    iputils-ping \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Default shell
CMD ["/bin/bash"]

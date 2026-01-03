# Use CUDA 12.8 base image
FROM nvidia/cuda:12.8.1-devel-ubuntu24.04

# Path to the OpenArmLab directory
ARG OPENARMLAB_PATH_ARG
ENV OPENARMLAB_PATH=${OPENARMLAB_PATH_ARG}

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    CUDA_HOME=/usr/local/cuda \
    PATH=/root/.pixi/bin:/root/.local/bin:$PATH \
    TZ=Asia/Tokyo

# Install all system dependencies
RUN apt-get update && apt-get install -y \
    autoconf \
    autoconf-archive \
    automake \
    bison \
    build-essential \
    ca-certificates \
    cmake \
    cmake-curses-gui \
    cmake-gui \
    curl \
    dpkg-dev \
    ffmpeg \
    flex \
    freeglut3-dev \
    g++-10 \
    gcc-10 \
    gettext \
    git \
    gperf \
    gpg \
    libatlas-base-dev \
    libceres-dev \
    libcgal-dev \
    libcgal-qt5-dev \
    libdbus-1-3 \
    libegl1 \
    libeigen3-dev \
    libflann-dev \
    libfontconfig1 \
    libfreeimage-dev \
    libfreetype6 \
    libgflags-dev \
    libgl1 \
    libgl1-mesa-dev \
    libgles2-mesa-dev \
    libglew-dev \
    libglfw3-dev \
    libglib2.0-0 \
    libglu1-mesa-dev \
    libgomp1 \
    libgoogle-glog-dev \
    libgtest-dev \
    libjpeg-dev \
    libmetis-dev \
    libnanoflann-dev \
    libopengl0 \
    libopencv-dev \
    libpng-dev \
    libqt5opengl5-dev \
    libsm6 \
    libsqlite3-dev \
    libsuitesparse-dev \
    libtbb-dev \
    libtiff-dev \
    libtool \
    libx11-6 \
    libx11-dev \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libxcb1 \
    libxext-dev \
    libxext6 \
    libxkbcommon-x11-0 \
    libxkbcommon0 \
    libxrender-dev \
    libxrender1 \
    libxt-dev \
    m4 \
    meson \
    pkg-config \
    tar \
    unzip \
    vulkan-tools \
    wget \
    zip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pixi
RUN curl -fsSL https://pixi.sh/install.sh | bash

# Set working directory
WORKDIR ${OPENARMLAB_PATH}

# Set default command to bash
CMD ["/bin/bash"]

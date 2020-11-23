FROM gitpod/workspace-full



RUN apt-get update && apt-get install -y \
 xz-utils \
 curl \
 git \
 make \
 ninja-build \
 cpp-check \
 software-properties-common \
 vim \
 wget \
 && wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && sudo ./llvm.sh

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - &&\
    apt-add-repository "deb https://apt.kitware.com/ubuntu/ bionic main" &&\
    apt-get update &&\
    apt-get install -y cmake

RUN curl -SL https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz \
 | tar -xJC . && \
 mv clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_10 && \
 echo ‘export PATH=/clang_10/bin:$PATH’ >> ~/.bashrc && \
 echo ‘export LD_LIBRARY_PATH=/clang_10/lib:$LD_LIBRARY_PATH’ >> ~/.bashrc
 
 USER gitpod
 
# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && \
#     sudo apt-get install -yq bastet && \
#     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/config-docker/

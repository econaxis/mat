FROM mcr.microsoft.com/vscode/devcontainers/base:buster


RUN apt-get update && apt-get install -y \
 xz-utils \
 curl \
 && rm -rf /var/lib/apt/lists/*
 
# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.148.1/containers/debian/.devcontainer/base.Dockerfile




# ** [Optional] Uncomment this section to install additional packages. **
 RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends build-essential cmake ninja-build
RUN apt-get install clang-format clang-tidy clang-tools clang 

 
USER gitpod

CMD [ “/bin/bash” ]

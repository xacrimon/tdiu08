FROM mcr.microsoft.com/devcontainers/base:debian
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y upgrade && apt-get -y install --no-install-recommends \
    build-essential gnat

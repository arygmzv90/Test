FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install -y wget git make build-essential unzip autoconf automake && \
    /bin/bash /data/install.sh

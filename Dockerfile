FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade && \
    apt-get install -y wget git make build-essential && \
    /bin/bash /data/install.sh

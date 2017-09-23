FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install wget git make build-essential && \
    /bin/bash /data/install.sh

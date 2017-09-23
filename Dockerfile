FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN apt-update && \
    apt-upgrade && \
    apt-get install wget git make build-essential && \
    /bin/bash /data/install.sh

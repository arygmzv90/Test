FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN /bin/bash /data/install.sh

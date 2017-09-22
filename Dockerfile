FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

CMD ["/bin/bash", "-c", "/data/install.sh"]
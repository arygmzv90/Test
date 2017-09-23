FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

CMD ["/bin/bash", "/data/install.sh"]

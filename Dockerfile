FROM sedden/rpi-raspbian-qemu:jessie

COPY install.sh /data/install.sh

RUN chmod +x /data/install.sh

CMD ["/bin/bash", "/data/install.sh"]

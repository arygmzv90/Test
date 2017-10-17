FROM fiorix/crosstool-ng-arm

RUN apt-get updater
RUN apt-get install -y git

RUN curl -s ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.4.1.tar.bz2 | tar -jx -C /usr/src
WORKDIR /usr/src/alsa-lib-1.1.4.1
RUN ct-ng-env ./configure --host=arm-unknown-linux-gnueabi --prefix=/opt/ffmpeg
RUN ct-ng-env make
RUN ct-ng-env make install

RUN git clone git://git.videolan.org/x264 /usr/src/x264
WORKDIR /usr/src/x264
RUN ct-ng-env ./configure --host=arm-unknown-linux-gnueabi --enable-static --cross-prefix='/opt/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-' --extra-cflags='-march=armv6' --extra-ldflags='-march=armv6' --prefix=/opt/ffmpeg
RUN ct-ng-env make
RUN ct-ng-env make install

RUN git clone git://source.ffmpeg.org/ffmpeg.git /usr/src/ffmpeg
WORKDIR /usr/src/ffmpeg
RUN ct-ng-env ./configure --enable-cross-compile --cross-prefix='/opt/x-tools/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-' --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-indev=v4l2 --enable-nonfree --extra-cflags="-I/opt/ffmpeg/include" --extra-ldflags="-L/opt/ffmpeg/lib" --extra-libs=-ldl --prefix=/opt/ffmpeg
RUN ct-ng-env make
RUN ct-ng-env make install

WORKDIR /opt/ffmpeg

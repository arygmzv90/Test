# Docker with ffmpeg-arm
FFMPEG with alsa, h264, hardware acceleration and libv4l support. ARM arquitecture.

I'm Using this (https://github.com/fiorix/ffmpeg-arm) 

## Docker pull command
```sh
docker pull arygmzv90/ffmpeg-raspbian
```

### Status
[![Build Status](https://travis-ci.org/arygmzv90/Test.svg?branch=master)](https://travis-ci.org/arygmzv90/Test)

# Compiling FFMPEG into your Raspberry Pi 3
Configuration guide to install FFMPEG into your Rasperry Pi3 with alsa, mp3, theora, yasm, faac, h264, v4l2 and hardware encoding/decoding support.


```sh
sudo apt-get install build-essential libmp3lame-dev libvorbis-dev libtheora-dev libspeex-dev yasm pkg-config libfaac-dev libopenjpeg-dev libx264-dev autoconf automake libtool git

git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg
cd ffmpeg
mkdir dependencies
cd dependencies/
mkdir output

git clone http://git.videolan.org/git/x264.git
cd x264/
./configure --enable-static --prefix=/home/pi/ffmpeg/dependencies/output/
make -j4     (NOTE: this utilizes 4 threads/cores and is not applicable for Raspberry Pi Zero)
make install
cd ..

wget ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.4.1.tar.bz2
tar xjf alsa-lib-1.1.1.tar.bz2
cd alsa-lib-1.1.1/
./configure --prefix=/home/pi/ffmpeg/dependencies/output
make -j4
make install
cd ..


git clone https://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
./autogen.sh
./configure --enable-shared --enable-static
make -j4
sudo make install
sudo ldconfig
cd ..

cd ..
./configure --prefix=/home/pi/ffmpeg/dependencies/output --enable-gpl --enable-libx264 --enable-nonfree --enable-libfdk_aac --enable-omx --enable-omx-rpi --enable-libv4l2 --extra-cflags="-I/home/pi/ffmpeg/dependencies/output/include" --extra-ldflags="-L/home/pi/ffmpeg/dependencies/output/lib" --extra-libs="-lx264 -lpthread -lm -ldl"
make -j4
make install

```


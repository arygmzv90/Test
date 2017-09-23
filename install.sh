#/bin/bash
sudo apt-get install libtool-bin
mkdir -p "/home/pi/Desktop/sources"
mkdir -p "/home/pi/Desktop/sources/arm"

cd /home/pi/Desktop/sources
wget http://tipok.org.ua/downloads/media/aacplus/libaacplus/libaacplus-2.0.2.tar.gz
tar -xzf libaacplus-2.0.2.tar.gz
cd libaacplus-2.0.2
#./autogen.sh --with-parameter-expansion-string-replace-capable-shell=/bin/bash --enable-static --host=arm-unknown-linux-gnueabi --prefix=/home/pi/Desktop/sources/arm
./autogen.sh --with-parameter-expansion-string-replace-capable-shell=/bin/bash --enable-static --prefix=/home/pi/Desktop/sources/arm
make
sudo make install

cd /home/pi/Desktop/sources
git clone git://git.videolan.org/git/x264.git
cd x264
./configure --enable-static --enable-shared
make
sudo make install

sudo apt-get install git libasound2-dev libav-tools
sudo apt-get install yasm libvpx. libx264. libxcb.
sudo apt-get install libmp3lame-dev libmp3lame0

cd /usr/src
sudo git clone https://git.ffmpeg.org/ffmpeg.git

cd ffmpeg
./configure --enable-gpl --enable-libx264 --enable-mmal --enable-omx-rpi --enable-omx --enable-libxcb --enable-libmp3lame --enable-nonfree
make
ffmpeg --list-hwaccels
#sudo make install
#ldconfig

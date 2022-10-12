#!/bin/bash
cd /root/kernel

if [ ! -d linux ]; then
	git clone --depth 1 --branch mw/rk35/pinenote-next-t1 https://github.com/m-weigand/linux
fi

cd linux
make clean
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- pinenote_defconfig
make -j 2 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- all
test -d pack && rm -r pack
mkdir pack
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=${PWD}/pack modules_install
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_PATH=${PWD}/pack dtbs_install
cp ./arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dtb pack/
cp ./arch/arm64/boot/Image pack/
cd ..
cp -r linux/pack /github/home


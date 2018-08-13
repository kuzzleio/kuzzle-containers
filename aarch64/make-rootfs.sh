#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get install \
  qemu \
  qemu-user-static \
  binfmt-support \
  debootstrap

qemu-debootstrap --arch=arm64 --keyring /usr/share/keyrings/debian-archive-keyring.gpg \
  --variant=buildd --exclude=debfoster stretch debian-arm http://ftp.debian.org/debian

rm -f rootfs.tar.bz2
cd debian-arm
tar -cvjf ../rootfs.tar.bz2 .

cd ..
rm -rf debian-arm

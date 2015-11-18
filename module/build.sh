#!/bin/sh

MOD="clevo-xsm-wmi"
VER="1.0"
PWD=`pwd`

sudo cp -R  . /usr/src/$MOD-$VER
sudo dkms add      -m $MOD -v $VER
sudo dkms build    -m $MOD -v $VER
sudo dkms mkdeb    -m $MOD -v $VER
cp /var/lib/dkms/$MOD/$VER/deb/*.deb .
sudo dkms remove   -m $MOD/$VER --all


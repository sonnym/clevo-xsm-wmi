#!/bin/sh

MOD="clevo-xsm-wmi"
VER="1.0"
PWD=`pwd`

# Copy sources...
ln -s $PWD /usr/src/$MOD-$VER

dkms add      -m $MOD -v $VER
dkms build    -m $MOD -v $VER
dkms mkdeb    -m $MOD -v $VER

#dkms install  -m $MOD -v $VER

modprobe $MOD

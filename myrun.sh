#!/bin/sh

export GDISPLAY=unix/$DISPLAY      # forward X11 display to the host machine
export GUSERNAME=guser        # current user's username
export GUID=1000                # current user's user id
export GGROUP=guser           # current user's primary group name
export GGID=1000                # current user's primary group id
export GHOME=/home/guser                 # current user's home directory
export GSHELL=/bin/bash               # current user's shell
export GRUNXTERM=0                 # start lxtermina, useful in windows
#
# to connect the emulated network to the external world
# we use a tap0 interface inside the docker container
# connected to the GNS3 emulated network through
# a GNS3 Cloud device attached to the tap0 interface
#
export GTAPIP=10.200.1.1           # the tap0 IP address
export GTAPMASK=255.255.255.0      # the tap0 IP netmask
export GTAPNATENABLE=0             # enable NAT on tap0 outgoing traffic (if 1 GROUTE2GNS3 must be 0)
export GNS3NETWORK=10.200.0.0      # IP network used inside the GNS3 emulated network
export GNS3NETMASK=255.255.0.0     # IP netmask used inside the GNS3 emulated network
export GROUTE2GNS3=1               # enable routing from the container eth0 to the emulated network

sudo docker run -h gns3server                     \
                --rm                              \
                --name gns3                       \
                -e DISPLAY=$GDISPLAY              \
                -e GUSERNAME=$GUSERNAME           \
                -e GUID=$GUID                     \
                -e GGROUP=$GGROUP                 \
                -e GGID=$GGID                     \
                -e GHOME=$GHOME                   \
                -e GSHELL=$SHELL                  \
                -e GTAPIP=$GTAPIP                 \
                -e GTAPMASK=$GTAPMASK             \
                -e GTAPNATENABLE=$GTAPNATENABLE   \
                -e GNS3NETWORK=$GNS3NETWORK       \
                -e GNS3NETMASK=$GNS3NETMASK       \
                -e GROUTE2GNS3=$GROUTE2GNS3       \
                -e GRUNXTERM=$GRUNXTERM           \
                --privileged                      \
                -d cgcnets/gcm:gns3

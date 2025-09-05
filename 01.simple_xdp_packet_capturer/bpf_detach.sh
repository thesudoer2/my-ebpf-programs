#!/bin/bash

PROG_OBJ="$1"
PROG_NAME="$2"
PROG_FS_NAME="$3"

set -x

if default_iface=$(ip route | grep default | awk '{print $5}')
then
    sudo bpftool net detach xdp dev "${default_iface}"
    sudo rm -rfv /sys/fs/bpf/${PROG_FS_NAME}
else
    printf "Could not get default interface name\n"
fi

set +x
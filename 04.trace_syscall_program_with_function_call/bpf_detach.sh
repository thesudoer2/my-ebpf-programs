#!/bin/bash

PROG_FS_NAME="$1"

set -x
sudo rm -rfv /sys/fs/bpf/${PROG_FS_NAME}
set +x
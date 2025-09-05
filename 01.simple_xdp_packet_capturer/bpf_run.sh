#!/bin/bash

PROG_OBJ="$1"
PROG_NAME="$2"
PROG_FS_NAME="$3"

# Load the BPF program into the kernel
if output=$(sudo bpftool prog load "${PROG_OBJ}" /sys/fs/bpf/"${PROG_FS_NAME}" type xdp 2>&1)
then
    set -x

    # Get the default network interface
    default_iface=$(ip route | grep default | awk '{print $5}')
    
    sudo bpftool net attach xdp name "$PROG_NAME" dev "${default_iface}"

    set +x
else
    # Print the command output captured in the 'output' variable
    printf "Failed to load BPF program:\n\033[31m%s\033[0m\n" "$output" >&2
    set +x
    exit 1
fi

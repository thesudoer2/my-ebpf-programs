#!/bin/bash

PROG_OBJ="$1"
PROG_FS_NAME="$2"

# Load the BPF program into the kernel
if ! output=$(sudo bpftool prog load "${PROG_OBJ}" /sys/fs/bpf/"${PROG_FS_NAME}" type raw_tracepoint 2>&1)
then
    # Print the command output stored in the 'output' variable
    printf "Failed to load BPF program:\n\033[31m%s\033[0m\n" "$output" >&2
    exit 1
fi

# Variables
BPF_PROG_FS_NAME = trace_syscalls
BPF_SRC = trace_syscalls.c
BPF_OBJ_CLANG = trace_syscalls_clang.o

.PHONY: install_dependencies build_clang clean all

install_dependencies:
	sudo apt install -y libbpf-dev clang

build_clang:
	clang -I/usr/include/$(shell uname -m)-linux-gnu/ -I/usr/$(shell uname -m)-linux-gnu/include/ -c $(BPF_SRC) -target bpf -O2 -g -o $(BPF_OBJ_CLANG)

clean:
	rm -f $(BPF_OBJ_CLANG)

all: build_clang

# BPF detach and clean everything
bpf_detach:
	./bpf_detach.sh $(BPF_PROG_FS_NAME)

# BPF run
bpf_run: bpf_detach
	./bpf_run.sh $(BPF_OBJ_CLANG) $(BPF_PROG_FS_NAME)

.DEFAULT_GOAL := all

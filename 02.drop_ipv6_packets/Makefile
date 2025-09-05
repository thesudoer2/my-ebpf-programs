# Variables
BPF_PROG_FS_NAME = xdp_drop_ipv6
BPF_PROG_NAME = xdp_drop_ipv6
BPF_SRC = drop_ipv6.c
BPF_OBJ_CLANG = drop_ipv6_clang.o

.PHONY: install_dependencies build_clang clean all

install_dependencies:
	sudo apt install -y libbpf-dev clang

build_clang:
	clang -I/usr/include/$(shell uname -m)-linux-gnu/ -I/usr/$(shell uname -m)-linux-gnu/include/ -c $(BPF_SRC) -target bpf -Og -g -o $(BPF_OBJ_CLANG)

clean:
	rm -f $(BPF_OBJ_CLANG)

all: build_clang

# BPF detach and clean everything
bpf_detach:
	./bpf_detach.sh $(BPF_OBJ_CLANG) $(BPF_PROG_NAME) $(BPF_PROG_FS_NAME)

# BPF run
bpf_run: bpf_detach
	./bpf_run.sh $(BPF_OBJ_CLANG) $(BPF_PROG_NAME) $(BPF_PROG_FS_NAME)

.DEFAULT_GOAL := all

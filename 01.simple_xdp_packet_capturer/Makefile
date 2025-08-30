# Variables
BPF_SRC = bpf_xdp_packet_capturer.c
BPF_OBJ_CLANG = bpf_xdp_packet_capturer_clang.o
BPF_OBJ_GCC = bpf_xdp_packet_capturer_gcc.o

.PHONY: install_dependencies build_clang build_gcc clean all

install_dependencies:
	sudo apt install -y libbpf-dev clang gcc-bpf

build_clang:
	clang -I/usr/include/$(shell uname -m)-linux-gnu/ -I/usr/$(shell uname -m)-linux-gnu/include/ -c $(BPF_SRC) -target bpf -Og -g -o $(BPF_OBJ_CLANG)

clean:
	rm -f $(BPF_OBJ_CLANG) $(BPF_OBJ_GCC)

all: build_clang

.DEFAULT_GOAL := all

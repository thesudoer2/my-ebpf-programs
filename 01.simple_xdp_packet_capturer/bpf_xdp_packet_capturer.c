#include <inttypes.h>

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

static uint64_t packet_counter;

SEC("xdp")
int bpf_packet_capturer(void* ctx) {
    (void)ctx;

    bpf_printk("bpf_packet_capturer, packet number: %ld\n", packet_counter);
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "Dual BSD/GPL";
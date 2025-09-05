#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

static __attribute((always_inline))
int get_opcode(struct bpf_raw_tracepoint_args *ctx)
{
    return ctx->args[1];
}

SEC("raw_tp/sys_enter")
int trace_syscalls_enter(struct bpf_raw_tracepoint_args *ctx)
{
	bpf_printk("Hello from eBPF program!\n");
    int opcode = get_opcode(ctx);
    bpf_printk("Syscall ENTER: %d\n", opcode);
    return 0;
}

SEC("raw_tp/sys_exit")
int trace_syscalls_exit(struct bpf_raw_tracepoint_args *ctx)
{
	bpf_printk("Hello from eBPF program!\n");
    int opcode = get_opcode(ctx);
    bpf_printk("Syscall EXIT: %d\n", opcode);
    return 0;
}

static char LICENSE[] SEC("license") = "Dual BSD/GPL";
Perfect — if you’re targeting Linux on x86 or ARM (e.g., via QEMU) and can use assembly mixed with C (glibc), that opens up a lot of interesting systems-level projects. Here are 10 project ideas that involve writing performance-critical or low-level parts in assembly, while handling higher-level logic in C with glibc:

🔧 1. Custom strlen in Assembly
Reimplement strlen() in assembly and benchmark it against glibc's version.

Use rdtsc or clock_gettime for cycle-accurate timing.

Focus: String handling, pointer arithmetic, benchmarking

💬 2. Simple Shell (Partial) with execve
Write a minimal shell in C that can launch programs.

Use inline or external assembly to prepare the argument vector and syscall.

Focus: Syscalls (execve), string tokenization, memory layout

🧮 3. Vectorized Math Library (SSE/NEON)
Write dot_product or vector_add using SIMD instructions in assembly (SSE/AVX for x86, NEON for ARM).

Provide a C wrapper for easy integration.

Focus: SIMD optimization, ABI compliance, FPU/SIMD register use

🧾 4. System Call Wrappers (Without libc)
Write pure assembly wrappers for syscalls like write, open, read, exit, etc.

Optionally use C to build a small standard library on top of them.

Focus: Syscall interface (int 0x80 or svc/syscall), Linux ABI

🔐 5. Memory Inspection Tool
Implement a C program that spawns a child, then inspect its memory using /proc/[pid]/mem and low-level memory access with inline assembly.

Focus: Ptrace (optional), memory layout knowledge, pointer hacking

⏱ 6. High-Resolution Timer Using rdtsc
Use inline assembly to read the TSC (rdtsc) for precise timing.

Compare performance of memcpy, custom loops, etc.

Focus: Timing, performance counters, instruction latency

🔄 7. Fast memcpy or memset
Reimplement memcpy or memset using rep movsb, SIMD, or loop unrolling in assembly.

Benchmark against glibc.

Focus: Optimized memory handling, cache alignment

🎲 8. Inline Assembly Random Number Generator
Use RDRAND (x86) or performance counters to create a random number generator in assembly.

Call it from C to fill buffers or for games.

Focus: CPU instructions, bit manipulation, entropy sources

💡 9. Signal Handling: Custom Assembly Frame Dumper
Set up a signal handler (e.g., SIGSEGV) in C, then use inline assembly to dump CPU registers and stack frame.

Focus: Signal context (ucontext_t), register inspection

🔄 10. Manual Function Return Hijack / Trampoline
Create a function in assembly that replaces the return address to redirect execution (e.g., to a logging or cleanup handler).

Focus: Stack layout, return address manipulation, control flow redirection
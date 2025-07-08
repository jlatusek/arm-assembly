.global _start

.section .data
hello:
    .ascii "Hello, world\n"
len = . - hello

.section .text
_start:
    // write(fd=1, buf=hello, count=len)
    mov     r7, #4          // syscall number for sys_write
    mov     r0, #1          // stdout
    ldr     r1, =hello      // pointer to string
    mov     r2, #len        // length of string
    svc     #0              // make syscall

    // exit(code=0)
    mov     r7, #1          // syscall number for sys_exit
    mov     r0, #0          // exit code
    svc     #0


.syntax unified
.cpu cortex-a9
.thumb
.cpu cortex-a9
.type add, %function
.syntax unified
.code	16

.thumb_func
.global add
add:
    add r0, r0, r1  // r0 = r0 + r1
    bx lr           // return (r0 holds the result)

.thumb_func
.global substract
substract:
    sub r0, r0, r1  // r0 = r0 + r1
    bx lr           // return (r0 holds the result)



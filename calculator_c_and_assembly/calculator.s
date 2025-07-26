.syntax unified
.thumb
.cpu cortex-a7
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
    sub r0, r0, r1
    bx lr


.thumb_func
.global multiply
multiply:
    mul r0, r0, r1
    bx lr

.thumb_func
.global divide
divide:
    sdiv r0, r0, r1
    bx lr


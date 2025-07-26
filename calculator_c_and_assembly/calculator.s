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

.thumb_func
.global calculator
calculator:
  push  {lr}
  ldrb  r2, [r0]
  ldrb  r3, [r0, #1]
  ldrb  r4, [r0, #2]
  sub   r2, r2, #'0'
  sub   r4, r4, #'0'
  mov r0, r2
  mov r1, r4
  cmp r3, #'+'
  beq calculator_add
  cmp r3, #'-'
  beq calculator_substract
  cmp r3, #'*'
  beq calculator_multiply
  cmp r3, #'/'
  beq calculator_divide

calculator_add:
  bl add
  b calulator_end
calculator_substract:
  bl substract
  b calulator_end
calculator_multiply:
  bl multiply
  b calulator_end
calculator_divide:
  bl divide
  b calulator_end

calulator_end:
  pop {lr}
  bx lr
  

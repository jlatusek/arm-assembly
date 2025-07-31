.syntax unified
.thumb
.cpu cortex-a7
.code	16

.extern putc
.extern stdout

.thumb_func
// int parse_string(char *str, unsigned int len, int *a, int *b, char *operator);
// r0 = str
// r1 = len
// r2 = a
// r3 = b
// [sp + 12] = operator (5-ty argument)
.global parse_string
parse_string:
  push {r4, r5, r6, r7, lr} // Zachowujemy rejestry
  add r7, sp, #20
  ldr r7, [r7]
  movs r5, #10
  str r5, [r2]
  movs r5, #20
  str r5, [r3]
  movs r5, #'+'
  str R5, [r7]
  pop {r4, r5, r6, r7, pc}

.global print_string
print_string:
    push {r3, r4, lr}
    ldrb    r0, [r1, #1]!
    ldr     r1, =stdout
    bl      putc
    pop {r3, r4, pc}


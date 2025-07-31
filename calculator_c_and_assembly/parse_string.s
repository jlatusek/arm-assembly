.syntax unified
.thumb
.cpu cortex-a7
.code	16

.thumb_func
// int parse_string(char *str, unsigned int len, int *a, int *b, char *operator);
// r0 = str
// r1 = len
// r2 = a
// r3 = b
// [sp + 12] = operator (5-ty argument)
.global parse_string
parse_string:
  push    {r4, r5, lr} // Zachowujemy rejestry
  movs r5, #10
  str r5, [r2]
  movs r5, #20
  str r5, [r3]
  movs r5, #'+'
  ldr  r4, [sp, #12]   // r4 = pointer to operator
  strb R5, [r4]
  pop {r4, r5, pc}

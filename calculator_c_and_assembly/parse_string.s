.syntax unified
.thumb
.cpu cortex-a7
.code	16

.thumb_func
// int parse_string(char *str, unsigned int len, int *a, int *b, char *operator);
.global parse_string
parse_string:
  push    {r4, r5, lr}        // Zachowujemy rejestry
  // r0 = str
  // r1 = len
  // r2 = a
  // r3 = b
  // [sp + 12] = operator (5-ty argument)
  movs r5, #10
  movs r2, r5
  movs r5, #20
  movs r3, r5
  movs r5, #'+'
  str R5, [sp, #12]
  pop {r4, r5, pc}

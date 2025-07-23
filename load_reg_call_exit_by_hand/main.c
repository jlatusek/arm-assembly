
volatile unsigned int a = 127;

int main();
void _start(void) {
  main();
  // clang-format off
  __asm__ volatile(
    "mov r7, #1;" //  syscall number: exit
    "mov r0, #0;" //  exit code
    "svc #0;"     //  make syscall
  );
  // clang-format on
}

int main() {
  a = a << 3;
  return 0;
}

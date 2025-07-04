#include <stdio.h>

#define GREETING "Hello"

int main(int argc, char *argv[]) {
  printf("%s ", GREETING);
  for (int i = 1; i < argc; i++) {
    printf("%s", argv[i]);
    if (i != argc - 1) {
      printf(", ");
    }
  }

  printf("\n");

  return 0;
}

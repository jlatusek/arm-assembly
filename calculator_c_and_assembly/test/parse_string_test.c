#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int a;

extern int __attribute__((naked)) parse_string(char *str, unsigned int len, int *a, int *b, char *operator);

int main(int argc, char *argv[])
{
    char buffer[256] = "2+2";
    unsigned int len = strlen(buffer);
    int a = 0;
    int b = 0;
    char operator= 0;
    int result;
    parse_string(buffer, len, &a, &b, &operator);
    printf("%d %c %d\n", a, b, operator);

    printf("result: %d\n", result);
    return 0;
}

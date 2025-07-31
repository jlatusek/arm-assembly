#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int a;

extern int __attribute__((naked)) parse_string(char *str, unsigned int len, int *a, int *b, unsigned int *operator);

int main(int argc, char *argv[])
{
    char buffer[256] = "2+2";
    unsigned int len = strlen(buffer);
    int a = 0;
    int b = 0;
    unsigned int operator= 0xAA;
    int result;
    parse_string(buffer, len, &a, &b, &operator);
    printf("%d %d %c\n", a, b, operator);

    printf("result: %d\n", result);
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int a;

extern int __attribute__((naked)) add(int a, int b);
extern int __attribute__((naked)) substract(int a, int b);

int main(int argc, char *argv[])
{
    int aa = atoi(argv[1]);
    char operator= argv[2][0];
    int bb = atoi(argv[3]);
    int result = 0;
    switch (operator)
    {
    case '+':
        result = add(aa, bb);
        break;
    case '-':
        result = substract(aa, bb);
        break;
    }
    printf("result: %d\n", result);
    return 0;
}

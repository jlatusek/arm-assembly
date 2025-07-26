#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned int a;

extern int __attribute__((naked)) add(int a, int b);
extern int __attribute__((naked)) substract(int a, int b);
extern int __attribute__((naked)) multiply(int a, int b);
extern int __attribute__((naked)) divide(int a, int b);
extern int __attribute__((naked)) calculator(char *input, int len);

int main(int argc, char *argv[])
{
    char buffer[256] = {};
    int result = 0;
    printf(">: ");
    if (fgets(buffer, sizeof(buffer), stdin) == NULL)
    {
        printf("Please give me some input next time ;))");
        return -1;
    }
    result = calculator(buffer, strlen(buffer));

    printf("result: %d\n", result);
    return 0;
}

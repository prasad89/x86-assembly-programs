#include <stdio.h>

int a = 10;
int b = 20;
int result;

int main()
{
    asm("pusha\n\t"
        "movl a,%eax\n\t"
        "movl b,%ebx\n\t"
        "imull %ebx,%eax\n\t"
        "movl %eax,result\n\t"
        "popa");

    printf("The result is: %d\n", result);

    return 0;
}
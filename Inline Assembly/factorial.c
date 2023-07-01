#include <stdio.h>

int num = 5;
int one = 1;
int fact;

int main()
{
    asm("pusha\n\t"
        "movl num,%ecx\n\t"
        "movl one,%eax\n\t"
        "lp:\n\t"
        "cmp $1,%ecx\n\t"
        "jz endof\n\t"
        "imull %ecx,%eax\n\t"
        "decl %ecx\n\t"
        "jmp lp\n\t"
        "endof:\n\t"
        "movl %eax,fact\n\t"
        "popa\n\t");

    printf("The factorial is: %d\n", fact);

    return 0;
}
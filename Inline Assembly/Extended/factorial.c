#include <stdio.h>
int main()
{
    int num = 5;
    int fact;

    // asm(
    //     "lp:\n\t"
    //     "cmp $1,%%ecx\n\t"
    //     "jz endof\n\t"
    //     "imull %%ecx,%%eax\n\t"
    //     "decl %%ecx\n\t"
    //     "jmp lp\n\t"
    //     "endof:\n\t"
    //     : "=a"(fact)
    //     : "a"(num), "c"(num - 1));

    asm("lp:\n\t"
        "imull %%ecx,%%eax\n\t"
        "loop lp\n\t"
        : "=a"(fact)
        : "a"(num), "c"(num - 1));

    printf("The factorial is: %d\n", fact);

    return 0;
}
#include <stdio.h>

int main()
{
    int num = 5;
    int fact;

    asm("lp:\n\t"
        "imull %%ecx, %%eax\n\t" // Multiply EAX by ECX and store the result in EAX
        "loop lp\n\t"             // Loop while ECX is not zero, decrementing ECX
        : "=a"(fact)              // Output operand: "=a" means write-only operand
        : "a"(num), "c"(num - 1)   // Input operands: "a" for num, "c" for num - 1
    );

    printf("The factorial is:%d\n", fact);
    return 0;
}

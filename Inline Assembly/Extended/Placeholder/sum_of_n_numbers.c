#include <stdio.h>

int main()
{
    int sum = 0;
    int result = 0;
    int n = 5;
    int zero = 0;

    asm("lp:\n\t"
        "addl %1, %2\n\t"   // Add n to sum
        "decl %1\n\t"       // Decrement n
        "cmpl %1, %3\n\t"   // Compare n with zero
        "jz endof\n\t"      // Jump to endof if n is zero
        "jmp lp\n\t"        // Jump back to lp
        "endof:\n\t"
        "movl %2, %0"       // Move sum to result
        : "=r"(result)       // Output operand: "=r" means write-only operand
        : "r"(n),            // Input operand: "r" means read-only operand
          "r"(sum),          // Input operand
          "r"(zero));        // Input operand

    printf("The sum is:%d\n", result);
    return 0;
}

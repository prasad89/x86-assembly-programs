#include <stdio.h>

int main()
{
    int multiplier = 10;
    int multiplicand = 20;
    int result;

    asm("imull %1, %2\n\t"
        "movl %2, %0"
        : "=r"(result)          // Output operand: "=r" means write-only operand
        : "r"(multiplier),      // Input operand: "r" means read-only operand
          "r"(multiplicand));   // Input operand

    printf("The result is:%d\n", result);
    return 0;
}

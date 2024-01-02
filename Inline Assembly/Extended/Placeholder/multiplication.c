#include <stdio.h>

int main()
{
    int data1 = 10;
    int data2 = 20;
    int result;

    asm("imull %1, %2\n\t"
        "movl %2, %0"
        : "=r"(result)  // Output operand: "=r" means write-only operand
        : "r"(data1),   // Input operand: "r" means read-only operand
          "r"(data2));  // Input operand

    printf("The result is:%d\n", result);
    return 0;
}

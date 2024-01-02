#include <stdio.h>

int a = 10;
int b = 20;
int result;

int main()
{
    asm("pusha\n\t"        // Push general-purpose registers onto the stack
        "movl a, %eax\n\t" // Move the value of 'a' to EAX
        "movl b, %ebx\n\t" // Move the value of 'b' to EBX
        "imull %ebx, %eax\n\t" // Multiply EBX by EAX and store the result in EAX
        "movl %eax, result\n\t" // Move the result in EAX to 'result'
        "popa");            // Pop general-purpose registers from the stack

    printf("The result is:%d\n", result);
    return 0;
}

#include <stdio.h>

int num = 5;
int one = 1;
int fact;

int main()
{
    asm("pusha\n\t"
        "movl num, %ecx\n\t"  // Move the value of num to ECX
        "movl one, %eax\n\t"  // Move the value of one to EAX
        "lp:\n\t"
        "cmp $1, %ecx\n\t"    // Compare ECX with 1
        "jz endof\n\t"        // Jump to endof if ECX is 1
        "imull %ecx, %eax\n\t"// Multiply EAX by ECX and store the result in EAX
        "decl %ecx\n\t"       // Decrement ECX
        "jmp lp\n\t"          // Jump back to lp
        "endof:\n\t"
        "movl %eax, fact\n\t" // Move the value in EAX to fact
        "popa\n\t");           // Restore the registers from the stack

    printf("The factorial is:%d\n", fact);
    return 0;
}

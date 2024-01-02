#include <stdio.h>
#include <string.h>

int main()
{
    char input[10] = {"HELLO\n"};
    int length = strlen(input);
    char output[length];

    asm volatile(
        "reverse:\n\t"
        "std\n\t"             // Set direction flag to reverse string processing
        "lodsb\n\t"           // Load byte from DS:SI to AL and increment SI
        "cld\n\t"             // Clear direction flag to restore normal string processing
        "stosb\n\t"           // Store byte in AL to ES:DI and increment DI
        "loop reverse\n\t"    // Loop until CX becomes zero
        :
        : "S"(input + length - 1), "D"(output), "c"(length) // Input and output operands
    );

    printf("%s\n", output);
    return 0;
}

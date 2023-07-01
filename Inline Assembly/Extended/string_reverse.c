#include <stdio.h>
#include <string.h>

int main()
{
    char input[10] = {"HELLO\n"};
    int length = strlen(input);
    char output[length];

    asm volatile(
        "reverse:\n\t"
        "std\n\t"
        "lodsb\n\t"
        "cld\n\t"
        "stosb\n\t"
        "loop reverse\n\t"
        :
        : "S"(input + length - 1), "D"(output), "c"(length));

    printf("%s\n", output);

    return 0;
}
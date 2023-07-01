// #include <stdio.h>
// int main()
// {
//     int n, i, sum = 0;

//     printf("Enter a positive integer: ");
//     scanf("%d", &n);

//     for (i = 1; i <= n; ++i)
//     {
//         sum += i;
//     }

//     printf("Sum = %d", sum);
//     return 0;
// }

#include <stdio.h>
int main()
{
    int sum = 0;
    int result = 0;
    int n = 5;
    int zero = 0;

    asm("lp:\n\t"
        "addl %1,%2\n\t"
        "decl %1\n\t"
        "cmpl %1,%3\n\t"
        "jz endof\n\t"
        "jmp lp\n\t"
        "endof:\n\t"
        "movl %2,%0"

        : "=r"(result)
        : "r"(n),
          "r"(sum),
          "r"(zero));

    printf("The sum is %d\n", result);
    return 0;
}
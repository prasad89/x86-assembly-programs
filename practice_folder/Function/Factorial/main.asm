section .data
    ip db "%d"
    msg db "Enter number to calculate factorial: "
    op db "Factorial of given number is: %d",10,0
section .bss
    num resd 1

section .text
    global main
    extern printf,scanf,fact

main:
    push msg
    call printf
    add esp,4

    push num
    push ip
    call scanf
    add esp,8

    push dword[num]
    call fact
    add esp,4

    push eax
    push op
    call printf
    add esp,8

terminate:
    ret
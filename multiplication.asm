section .data
    msg db "Multiplication of 5 and 10 is:%d", 10, 0

section .text
    global main
    extern printf

main:
    mov eax, 5
    mov edx, 10
    mul edx
    push eax
    push msg
    call printf
    add esp, 8

terminate:
    ret
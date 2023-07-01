section .data
    msg db "Factorial is: %d",10,0

section .text
    global main
    extern printf,fact

main:
    mov ecx,5

    push ecx
    call fact
    add esp,4

    push eax
    push msg
    call printf
    add esp,8

terminate:
    ret
section .data
    msg db "Reverse of 8989 is:%d", 10, 0

section .text
    global main
    extern printf

main:
    mov eax, 8989
    mov ecx, 10

lp:
    xor edx, edx
    div ecx
    pusha
    push edx
    push msg
    call printf
    add esp, 8
    popa

lp2:
    cmp eax, 0
    jg lp

terminate:
    ret
section .data
    msg db "%d", 10, 0

section .text
    global main
    extern printf

main:
    mov ecx, 1

lp:
    mov edx, 2
    mov eax, ecx
    mul edx
    pusha
    push eax
    push msg
    call printf
    add esp, 8
    popa
    cmp ecx, 10
    jz terminate

lp2:
    inc ecx
    jmp lp

terminate:
    ret
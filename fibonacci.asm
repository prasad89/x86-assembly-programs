section .data
    msg db "Fibonacci of given number is:%d", 0
    num dd 10

section .text
    global main
    extern printf

main:
    mov esi, 0
    mov edi, 1
    push esi
    push msg
    call printf
    add esp, 8
    push edi
    push msg
    call printf
    add esp, 8
    xor ebx, ebx
    mov ebx, esi
    add ebx, edi
    mov ecx, 3

lp:
    cmp ecx, dword[num]
    jg terminate
    pusha
    push ebx
    push msg
    call printf
    add esp, 8
    popa
    mov esi, edi
    mov edi, ebx
    mov ebx, esi
    add ebx, edi
    inc ecx
    jmp lp

terminate:
    ret

section .data
    src db "Reverse me"
    len equ $-src

section .bss
    dest resb len

section .text
    global main

main:
    mov esi, src
    mov edi, dest
    mov ecx, len
    add esi, len
    dec esi

lp:
    std
    lodsb
    cld
    stosb
    loop lp

write:
    mov eax, 4
    mov ebx, 1
    mov ecx, dest
    mov edx, len
    int 0x80

terminate:
    ret

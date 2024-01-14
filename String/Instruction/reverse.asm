section .data
    src db "Reverse me"
    length equ $-src

section .bss
    dest resb length

section .text
    global main

main:
    mov esi, src
    mov edi, dest
    mov ecx, length
    add esi, length
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
    mov edx, length
    int 0x80

terminate:
    ret

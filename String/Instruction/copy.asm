section .data
    src db "Hello World", 10, 0
    length equ $ - src

section .bss
    dest resb length

section .text
    global main

main:
    mov esi, src
    mov edi, dest
    mov ecx, length
    rep movsb

write:
    mov eax, 4
    mov ebx, 1
    mov ecx, dest
    mov edx, length
    int 0x80

terminate:
    ret

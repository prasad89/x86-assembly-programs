section .data
    string db "Reverse me"
    len equ $-string

section .bss
    revrese resb len

section .text
    global main

main:
    mov esi,string
    mov edi,revrese
    mov ecx,len

    add esi,len
    dec esi

lp:
    std
    lodsb
    cld
    stosb
    loop lp

write:
    mov eax,4
    mov ebx,1
    mov ecx,revrese
    mov edx,len
    int 0x80

endof:
    ret
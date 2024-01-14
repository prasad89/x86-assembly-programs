section .data
    string db "This string is going to be reversed.", 0
    length equ $-string

section .bss
    reversed resb length

section .text
    global main
    extern puts

main:
    mov ecx, length
    mov edi, reversed
    mov esi, string
    add edi, ecx
    dec edi
    dec edi

lp:
    xor eax, eax
    mov al, byte[esi]
    mov byte[edi], al
    inc esi
    dec edi
    loop lp

endof:
    push reversed
    call puts
    add esp, 4

terminate:
    ret

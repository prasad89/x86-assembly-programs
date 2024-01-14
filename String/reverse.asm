section .data
    string db "This string is going to be reversed.", 0
    length equ $-string

section .bss
    rev resb length

section .text
    global main
    extern puts

main:
    mov ecx, length
    mov edi, rev
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
    push rev
    call puts
    add esp, 4

terminate:
    ret

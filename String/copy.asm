section .data
    src db "Low Level Assembly Programming", 0
    length equ $-src

section .bss
    dest resb length

section .text
    global main
    extern puts

main:
    mov ecx, length
    xor edx, edx

lp:
    xor eax, eax
    mov al, byte [src + edx]
    mov byte [dest + edx], al
    inc edx
    loop lp

endof:
    push dest
    call puts
    add esp, 4

terminate:
    ret

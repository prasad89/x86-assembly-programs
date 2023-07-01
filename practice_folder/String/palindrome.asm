section .data
    ip db "NITIN"
    len equ $-ip
    true db "Palindrome",0
    false db "Not Palindrome",0

section .text
    global main
    extern puts

main:
    mov esi,ip
    mov edi,ip

    mov ecx,len

    add edi,ecx

    dec edi

lp:
    mov al,byte[esi]
    cmp byte[edi],al

    jnz no 

    inc esi
    dec edi

yes:
    push true
    call puts
    add esp,4

    jmp terminate

no:
    push false
    call puts
    add esp,4

terminate:
    ret
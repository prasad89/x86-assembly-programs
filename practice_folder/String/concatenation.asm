section .data
    string db "LOW LEVEL "
    len_string equ $-string
    concat db "ASSEMBLY PROGRAMMING"
    len_concat equ $-concat

section .bss
    op resb 100 

section .text
    global main
    extern puts

main:
    mov edi,op

    mov esi,string
    mov ecx,len_string

lp:
    mov al,byte[esi]
    mov byte[edi],al

    inc esi
    inc edi
    loop lp

    mov esi,concat
    mov ecx,len_concat

lp2:
    mov al,byte[esi]
    mov byte[edi],al

    inc esi
    inc edi
    loop lp2

print:
    push op
    call puts
    add esp,4

termintae:
    ret
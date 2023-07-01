%macro concatenate 5

        mov edi,%5

        mov esi,%1
        mov ecx,%2
    %%lp:
        mov al,byte[esi]
        mov byte[edi],al

        inc esi
        inc edi

        loop %%lp

        mov esi,%3
        mov ecx,%4
    %%lp2:
        mov al,byte[esi]
        mov byte[edi],al

        inc esi
        inc edi

        loop %%lp2

%endmacro

section .data
    string db "Pune University "
    len_string equ $-string
    concat db "Computer Science Department (PUCSD)"
    len_concat equ $-concat

section .bss
    op resb 100

section .text
    global main
    extern puts

main:
    concatenate string,len_string,concat,len_concat,op

    push op
    call puts
    add esp,4

termiante:
    ret

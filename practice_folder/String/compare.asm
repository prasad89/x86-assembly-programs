section .data
    msg db "Dummy Text",0
    len equ $-msg
    msg2 db "Dummy",0
    msg3 db "Both strings are the same",0
    msg4 db "Both strings are not the same",0

section .text
    global main
    extern puts

main:
    mov esi,msg
    mov edi,msg2

    mov ecx,len
compare:
    mov al,byte[esi]
    cmp byte[edi],al
    jnz notsame

    inc esi
    inc edi
    
    loop compare

same:
    push msg3
    call puts
    add esp,4
    jmp terminate

notsame:
    push msg4
    call puts
    add esp,4

terminate:
    ret
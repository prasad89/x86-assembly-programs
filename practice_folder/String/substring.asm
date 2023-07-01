section .data
    msg db "Dummy Test Text",0
    ; msg2 db "Dummy",0
    ; msg2 db "Mummy",0
    msg2 db "Dimmy",0
    msg3 db "Substring found",0
    msg4 db "Substring not found",0

section .text
    global main
    extern puts

main:
    mov esi,msg

substringinit:
    mov edi,msg2

substring:
    mov al,byte[esi]
    cmp byte[edi],al
    jz compare

    cmp byte[esi],0
    jz notfound

    inc esi
    jmp substring

compare:
    inc esi
    inc edi

    cmp byte[edi],0
    jz found

    cmp byte[esi],0
    jz notfound

    mov al,byte[esi]
    cmp byte[edi],al
    jz compare
    jnz substringinit

found:
    push msg3 
    call puts
    add esp,4
    jmp terminate

notfound:
    push msg4
    call puts
    add esp,4
    
terminate:
    ret
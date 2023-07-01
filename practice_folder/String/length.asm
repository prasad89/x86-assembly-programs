section .data
    msg db "Dummy Text",0
    msg2 db "Length of string is: %d",10,0

section .text
    global main
    extern printf

main:
    mov esi,msg
    
    xor ecx,ecx
length:
    cmp byte[esi],0
    jz printlength

    inc esi
    inc ecx
    
    jmp length

printlength:
    push ecx
    push msg2
    call printf
    add esp,8

terminate:
    ret
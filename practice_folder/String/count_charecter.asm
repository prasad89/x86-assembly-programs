section .data
    msg db "Something is going to count from here...",0
    msg2 db "Count of charecter is: %d",10,0

section .text
    global main
    extern printf

main:
    mov esi,msg

    xor ecx,ecx
count:
    cmp byte[esi],0
    jz printcount

    mov al,' '
    cmp al,byte[esi]
    jnz repeatcount

    inc ecx
    
repeatcount:
    inc esi
    jmp count

printcount:
    push ecx
    push msg2
    call printf
    add esp,8

terminate:
    ret
section .data
    min db "Min:%d",10,0
    max db "Max:%d",10,0
section .text
    global main
    extern printf
main:
    mov esi,144
    mov edi,33

    cmp esi,edi
    cmova edx,edi
    cmovb edx,esi

    cmp esi,edi
    cmova ebx,esi
    cmovb ebx,edi

    push edx
    push min
    call printf
    add esp,8

    push ebx
    push max
    call printf
    add esp,8

terminate:
    ret
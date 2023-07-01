section .data
    op db "%d",10,0

section .text
    global main
    extern printf

main:
    mov eax,8989
    mov ecx,10
    
reverse:
    xor edx,edx

    div ecx

    pusha
    push edx
    push op
    call printf
    add esp,8
    popa

repeat:
    cmp eax,0
    jg reverse

terminate:
    ret
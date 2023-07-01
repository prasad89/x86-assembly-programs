section .data
    op db "%d "
    num dd 10

section .text
    global main
    extern printf

main:
    mov esi,0
    mov edi,1

    push esi
    push op
    call printf
    add esp,8

    push edi
    push op
    call printf
    add esp,8

    xor ebx,ebx

    mov ebx,esi
    add ebx,edi

    mov ecx,3
lp:
    cmp ecx,dword[num]
    jg termintae

    pusha
    push ebx
    push op
    call printf
    add esp,8
    popa

    mov esi,edi
    mov edi,ebx
    mov ebx,esi
    add ebx,edi

    inc ecx
    jmp lp

termintae:
    ret
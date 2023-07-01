section .data
    arr dd 10,20,30,-1
    op db "%d",10,0

section .text
    global main
    extern printf

main:
    mov ebx,arr
    xor ecx,ecx

print:
    mov edx,dword[ebx+ecx*4]

    cmp edx,-1
    jz terminate

    pusha
    push edx
    push op
    call printf
    add esp,8
    popa

    inc ecx
    jmp print

terminate:
    ret
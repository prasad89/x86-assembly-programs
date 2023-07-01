section .data
    arr dd 10,15,20,20,10,5,7,-1
    op db "%d is Occured %d times...",10,0

section .text
    global main
    extern printf

main:
    mov ebx,arr
    mov edi,7

    xor esi,esi
    xor ecx,ecx
lp:
    mov edx,dword[ebx+ecx*4]

    cmp edx,-1
    jz print

    cmp edx,7
    jnz loop_lp

    inc esi

loop_lp:
    inc ecx
    jmp lp

print:
    pusha
    push esi
    push edi
    push op
    call printf
    add esp,12
    popa

terminate:
    ret
section .data
    op db "Addition of given arguments is: %d",10,0
    wrong db "Insufficient number of arguments",10,0

section .text
    global main
    extern printf,atoi

main:
    push ebp
    mov ebp,esp

    mov ecx,[ebp+8]
    cmp ecx,2
    jl insufficient

    dec ecx

    xor esi,esi
sum:
    push ecx

    mov ebx,[ebp+12]

    push dword[ebx+ecx*4]
    call atoi
    add esp,4

    add esi,eax

    pop ecx

    cmp ecx,1
    jz print

    dec ecx
    jmp sum

print:
    push esi
    push op
    call printf
    add esp,8
    jmp terminate

insufficient:
    push wrong
    call printf
    add esp,4

terminate:
    mov esp,ebp
    pop ebp
    ret
section .data
    arr dd 10,20,30,40,50
    op db "%d is the second maximum number in given array..!",10,0

section .text
    global main
    extern printf

main:
    mov esi,-1
    mov edi,-1

    mov ebx,arr

    xor ecx,ecx
max:
    cmp ecx,5
    jz lp

    mov edx,[ebx+ecx*4]

    cmp edx,esi
    jl repeat

    mov esi,edx

repeat:
    inc ecx

    jmp max

lp:
    xor ecx,ecx
max2:
    cmp ecx,5
    jz print

    mov edx,[ebx+ecx*4]

    cmp esi,edx
    jz repeat2

    cmp edx,edi
    
    mov edi,edx

repeat2:
    inc ecx

    jmp max2

print:
    push edi
    push op
    call printf
    add esp,8

terminate:
    ret
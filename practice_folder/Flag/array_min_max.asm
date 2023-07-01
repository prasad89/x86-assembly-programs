section .data
    arr dd 10,2,4,1,70,30,7
    min db "Min: %d",10,0
    max db "Max: %d",10,0

section .text
    global main
    extern printf

main:
    xor ecx,ecx

    mov esi,dword[arr]
    mov edi,dword[arr]

lp:
    mov ebx,arr
    mov eax,4
    mul ecx
    add ebx,eax

    cmp dword[ebx],esi
    cmovb esi,dword[ebx]

    cmp dword[ebx],edi
    cmova edi,dword[ebx]

    inc ecx
    cmp ecx,7
    jl lp

    push esi
    push min
    call printf
    add esp,8

    push edi
    push max
    call printf
    add esp,8

terminate:
    ret
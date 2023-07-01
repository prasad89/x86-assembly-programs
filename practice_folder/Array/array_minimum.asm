section .data
    msg db "Enter size of an array: ",0
    msg2 db "Enter elements of an array",10,0
    ip db "%d",0
    op db "Minimum element from given elements is: %d",10,0

section .bss
    n resd 1
    arr resd 100

section .text
    global main
    extern printf,scanf

main:
    push msg
    call printf
    add esp,4

    push n
    push ip
    call scanf
    add esp,8

    push msg2
    call printf
    add esp,4

    xor ecx,ecx
scan:
    mov ebx,arr
    mov eax,4
    mul ecx
    add ebx,eax

    pusha
    push ebx
    push ip
    call scanf
    add esp,8
    popa

    inc ecx

    cmp ecx,dword[n]
    jl scan

    mov esi,dword[arr]

    xor ecx,ecx
min:
    mov ebx,arr
    mov eax,4
    mul ecx
    add ebx,eax

    cmp dword[ebx],esi
    jnl repeat

    mov esi,dword[ebx]

rep:
    inc ecx

    cmp ecx,dword[n]
    jl min

print:
    push esi
    push op
    call printf
    add esp,8

terminate:
    ret
section .data
    msg db "Enter size of an array: ",0
    msg2 db "Enter elements of an array",10,0
    ip db "%d",0
    op db "%d Element of an array is: %d",10,0

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

    xor ecx,ecx
print:
    mov ebx,arr
    mov eax,4
    mul ecx
    add ebx,eax

    pusha
    push dword[ebx]
    push ecx
    push op
    call printf
    add esp,12
    popa

    inc ecx
    cmp ecx,dword[n]
    jl print

terminate:
    ret
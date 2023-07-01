section .data
    arr1 dd 10,20,30,40,50,-1
    arr2 dd 60,70,80,90,100,-1
    msg db "Addition array of arr1 and arr2 is:",10,0
    op db "%d",10,0

section .bss
    arr3 resd 6

section .text
    global main
    extern printf

main:
    push msg
    call printf
    add esp,4

    xor ecx,ecx
addition:
    mov esi,arr1
    mov edi,arr2
    mov ebx,arr3

    mov eax,4
    mul ecx

    add esi,eax
    add edi,eax
    add ebx,eax

    mov edx,dword[esi]
    add edx,dword[edi]

    mov dword[ebx],edx

    inc ecx

    cmp ecx,5
    jnz addition

    xor ecx,ecx
print:
    mov ebx,arr3
    mov eax,4
    mul ecx
    add ebx,eax

    pusha
    push dword[ebx]
    push op
    call printf
    add esp,8
    popa

    inc ecx

    cmp ecx,5
    jnz print

terminate:
    ret
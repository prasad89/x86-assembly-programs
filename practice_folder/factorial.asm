section .data
    msg db "Enter number: ",0
    ip db "%d",0
    op db "Factorial is: %d",10,0

section .bss
    num resd 1

section .text
    global main
    extern printf,scanf

main:
    push msg
    call printf
    add esp,4

    push num
    push ip
    call scanf
    add esp,8

    mov ecx,dword[num]
    mov eax,1

fact:
    mul ecx

    cmp ecx,1
    jz print

    dec ecx
    jmp fact

print:
    push eax
    push op
    call printf
    add esp,8

terminate:
    ret
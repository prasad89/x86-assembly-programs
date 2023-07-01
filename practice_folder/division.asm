section .data
    op db "Division is: %d and Reminder is: %d",10,0

section .text
    global main
    extern printf

main:
    xor edx,edx
    
    mov eax,10
    mov ecx,3

    div ecx

    push edx
    push eax
    push op
    call printf
    add esp,12

terminate:
    ret
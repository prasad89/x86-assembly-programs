section .data   
    msg db "Enter your name: "
    len_msg equ $-msg
    newl dd 10

section .bss
    name resb 100

section .text
    global main

main:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len_msg
    int 80h

    mov eax,3
    mov ebx,0
    mov ecx,name
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,name
    mov edx,6
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,newl
    mov edx,1
    int 80h

terminate:
    ret
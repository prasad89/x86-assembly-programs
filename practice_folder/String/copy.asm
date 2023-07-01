section .data
    msg db "Dummy Text",0
    len equ $-msg

section .bss
    string resb len
    
section .text
    global main

main:
    mov esi,msg
    mov edi,string

    mov ecx,len
copy:
    mov al,byte[esi]
    mov byte[edi],al

    inc esi
    inc edi

    loop copy

write:
    mov eax,4
    mov ebx,1
    mov ecx,string
    mov edx,len
    int 0x80

terminate:
    ret
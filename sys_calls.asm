; section .data
;     string db "Your string character is:", 0
;     len equ $-string
;     newl db 10

; section .bss
;     n resb 10

; section .text
;     global main

; main:
;     mov eax, 3        ; read syscall
;     mov ebx, 0
;     mov ecx, n
;     int 80h
;     mov eax, 4        ; write syscall
;     mov ebx, 1
;     mov ecx, string
;     mov edx, len
;     int 80h
;     mov eax, 4
;     mov ebx, 1
;     mov ecx, n
;     mov edx, 10
;     int 80h

; terminate:
;     ret



section .data   
    msg db "Enter your name:"
    len equ $-msg
    newl dd 10

section .bss
    name resb 100

section .text
    global main

main:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80
    mov eax, 3
    mov ebx, 0
    mov ecx, name
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 6
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, newl
    mov edx, 1
    int 0x80

terminate:
    ret

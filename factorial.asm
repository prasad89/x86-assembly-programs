; section .data
;     msg db "Factorial of 5 is:%d", 10, 0

; section .text
;     global main
;     extern printf

; main:
;     mov ecx, 5
;     mov eax, 1

; lp:
;     mul ecx
;     cmp ecx, 1
;     jz endof
;     dec ecx
;     jmp lp

; endof:
;     push eax
;     push msg
;     call printf
;     add esp, 8

; terminate:
;     ret



section .data
    msg db "Enter number:", 0
    input db "%d", 0
    factorial db "Factorial is:%d", 10, 0

section .bss
    num resd 1

section .text
    global main
    extern printf, scanf

main:
    push msg
    call printf
    add esp, 4
    push num
    push input
    call scanf
    add esp, 8
    mov ecx, dword[num]
    mov eax, 1

fact:
    mul ecx
    cmp ecx, 1
    jz endof
    dec ecx
    jmp fact

endof:
    push eax
    push factorial
    call printf
    add esp, 8

terminate:
    ret
; section .data
;     array dd 10, 20, 30, 40, 50, -1
;     msg db "Elements of the array are:%d", 10, 0

; section .text
;     global main
;     extern printf

; main:
;     xor ecx, ecx      ; index

; lp:
;     mov ebx, array    ; base address of the array
;     mov eax, 4        ; size of int
;     mul ecx           ; index * size
;     add ebx, eax      ; base + mul result
;     cmp dword [ebx], -1
;     jz terminate
;     pusha
;     push dword [ebx]
;     push msg
;     call printf
;     add esp, 8
;     popa
;     inc ecx
;     jmp lp

; terminate:
;     ret



section .data
    msg db "Enter number of Elements:", 10, 0
    input db "%d", 0
    msg2 db "Element of array is:%d", 10, 0

section .bss
    n resd 1
    array resd 10

section .text
    global main
    extern printf, scanf

main:
    push msg
    call printf
    add esp, 4
    push n
    push input
    call scanf
    add esp, 8
    xor ecx, ecx

scan:
    mov ebx, array
    mov eax, 4
    mul ecx
    add ebx, eax
    pusha
    push ebx
    push input
    call scanf
    add esp, 8
    popa
    inc ecx
    cmp ecx, dword [n]
    jl scan
    xor ecx, ecx

print:
    mov ebx, array
    mov eax, 4
    mul ecx
    add ebx, eax
    pusha
    push dword [ebx]
    push msg2
    call printf
    add esp, 8
    popa
    inc ecx
    cmp ecx, dword [n]
    jl print

terminate:
    ret


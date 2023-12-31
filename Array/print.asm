section .data
    Array dd 10, 20, 30, 40, 50, -1
    msg db "Elements of the array are:%d", 10, 0

section .text
    global main
    extern printf

main:
    xor ecx, ecx      ; index

lp:
    mov ebx, Array    ; base address of the array
    mov eax, 4        ; size of int
    mul ecx           ; index * size
    add ebx, eax      ; base + mul result
    cmp dword [ebx], -1
    jz terminate
    pusha
    push dword [ebx]
    push msg
    call printf
    add esp, 8
    popa
    inc ecx
    jmp lp

terminate:
    ret

section .data
    array dd 10, 20, 30, 40, 50, -1
    msg db "The sum of array elements is:%d", 10, 0

section .text
    global main
    extern printf

main:
    xor ecx, ecx
    xor esi, esi

lp:
    mov ebx, array
    mov eax, 4
    mul ecx
    add ebx, eax
    cmp dword [ebx], -1
    jz endof
    add esi, dword [ebx]
    inc ecx
    jmp lp

endof:
    push esi
    push msg
    call printf
    add esp, 8

terminate:
    ret

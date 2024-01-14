section .data
    num dd 10
    msg db "Divisors of 10 are:%d", 10, 0

section .text
    global main
    extern printf

main:
    mov ecx, dword [num]

lp:
    xor edx, edx
    mov eax, dword [num]
    div ecx
    cmp edx, 0
    jnz lp2
    pusha
    push ecx
    push msg
    call printf
    add esp, 8
    popa

lp2:
    loop lp

terminate:
    ret

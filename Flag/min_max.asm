section .data
    Array dd 10, 30, 1, 100, 50, 20, 40
    max db "Max:%d", 10, 0
    min db "Min:%d", 10, 0

section .text
    global main
    extern printf

main:
    xor ecx, ecx
    mov esi, dword[Array]
    mov edi, dword[Array]

lp:
    mov ebx, Array
    mov eax, 4
    mul ecx
    add ebx, eax
	cmp edi, dword[ebx] ; min
    cmovg edi, dword[ebx]
    cmp esi, dword[ebx] ; max
    cmovl esi, dword[ebx]
    inc ecx
    cmp ecx, 6
    jl lp

endof:
    push esi
    push max
    call printf
    add esp, 8
    push edi
    push min
    call printf
    add esp, 8

terminate:
    ret

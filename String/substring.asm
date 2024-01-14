section .data
    string db "Low Level Assembly Programming - LLAP", 0
    substring db "LLAP", 0
    found db "Substring found", 10, 0
    notfound db "Substring not found", 10, 0

section .text
    global main
    extern printf

main:
    mov esi, string
    mov edi, substring

lp:
    mov al, byte[edi]
    cmp al, byte[esi]
    jnz lp3
    inc esi
    inc edi
    cmp byte[esi], 0
    jz false
    jmp lp

lp2:
    cmp byte[esi], ' '
    jz lp3
    cmp byte[esi], 0
    jz lp3
    inc esi
    jmp lp2

lp3:
    inc esi
    cmp byte[edi], 0
    jz true
    mov edi, substring
    jmp lp

true:
    push found
    call printf
    add esp, 4
    jmp terminate

false:
    push notfound
    call printf
    add esp, 4

terminate:
    ret

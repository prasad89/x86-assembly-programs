section .data
    source db "Low Level Programming", 0
    len equ $ - source

section .bss
    first_string resb len
    second_string resb len
    first_string_count resd 1
    second_string_count resd 1

section .text
    global main

main:
    mov edi, source
    mov al, ' '
    repnz scasb
    mov edx, edi
    mov esi, source
    sub edx, esi
    mov dword[first_string_count], edx
    mov dword[first_string], esi
    mov al, ' '
    repnz scasb
    mov esi, edi
    mov al, 0
    repnz scasb
    mov edx, edi
    sub edx, esi
    mov dword[second_string_count], edx
    mov dword[second_string], esi

write:
    mov eax, 4
    mov ebx, 1
    mov ecx, dword[second_string]
    mov edx, dword[second_string_count]
    int 0x80
    mov eax, 4
    mov ebx, 1
    mov ecx, dword[first_string]
    mov edx, dword[first_string_count]
    int 0x80

terminate:
    ret
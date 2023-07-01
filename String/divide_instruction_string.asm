section .data
    source db "Low Level Programming",0
    len equ $-source
section .bss
    fstring resb len
    sstring resb len
    fcount resd 1
    scount resd 1
section .text
    global main
main:
    mov edi,source

    mov al,' '
    repnz scasb

    mov edx,edi
    mov esi,source
    sub edx,esi
    mov dword[fcount],edx
    mov dword[fstring],esi

    mov al,' '
    repnz scasb

    mov esi,edi

    mov al,0
    repnz scasb

    mov edx,edi
    sub edx,esi
    mov dword[scount],edx
    mov dword[sstring],esi

write:
    mov eax,4
    mov ebx,1
    mov ecx,dword[sstring]
    mov edx,dword[scount]
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,dword[fstring]
    mov edx,dword[fcount]
    int 0x80

endof:
    ret
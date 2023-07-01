%macro palindrome 3
    mov esi,%1
    mov edi,%1

    xor ecx,ecx
    add ecx,%2

    dec ecx
    dec ecx

    add esi,ecx
%%pali:
    mov al,byte[esi]
    cmp byte[edi],al
    jnz %%notpali

    dec esi
    inc edi

    loop %%pali

    mov %3,yes
    jmp %%endof

%%notpali:
    mov %3,no

%%endof:
%endmacro

section .data
    src db "NI3",0
    len equ $-src
    yes db "Given string is a palindrome",0
    no db "Given string is not a palindrome",0

section .text 
    global main
    extern puts

main:
    palindrome src,len,ebx
    push ebx
    call puts
    add esp,4

termiante:
    ret
%macro compare 3
    mov esi,%1
    mov edi,%2

%%cmp: 
    cmp byte[esi],0
    jz %%same

    mov al,byte[esi]
    cmp byte[edi],al
    jnz %%notsame

    inc esi
    inc edi
    jmp %%cmp

%%same:
    mov %3,msg
    jmp %%endof

%%notsame:
    mov %3,msg2

%%endof:
%endmacro

%macro copy 2
    mov esi,%1
    mov edi,%2

%%cp:
    cmp byte[esi],0
    jz %%endof

    mov al,byte[esi]
    mov byte[edi],al

    inc esi
    inc edi
    jmp %%cp

%%endof:
%endmacro

%macro count 2
    mov esi,%1

    xor ecx,ecx
%%cnt:
    cmp byte[esi],0
    jz %%endof

    cmp byte[esi],'m'
    jz %%inccnt

    inc esi
    jmp %%cnt

%%inccnt:
    inc ecx

    inc esi
    jmp %%cnt

%%endof:
    mov %2,ecx
%endmacro

%macro length 2
    mov esi,%1

    xor ecx,ecx
%%len:
    cmp byte[esi],0
    jz %%endof

    inc ecx
    
    inc esi
    jmp %%len

%%endof:
    mov %2,ecx
%endmacro

%macro palindrome 3
    mov esi,%1
    mov edi,%1

    add ecx,%2

    dec ecx
    dec ecx

    add esi,ecx
pali:
    mov al,byte[esi]
    cmp byte[edi],al
    jnz %%notpalin

    dec esi
    inc edi

    loop pali

    mov %3,msg5
    jmp %%endof

%%notpalin:
    mov %3,msg6

%%endof:
%endmacro

%macro reverse 3
    mov esi,%1
    mov edi,%2
    mov ecx,%3

    add edi,ecx

    dec edi
    dec edi

%%rev:
    mov al,byte[esi]
    mov byte[edi],al

    inc esi
    dec edi

    loop %%rev

%%endof:
%endmacro



section .data
    src db "NI3",0
    len equ $-src
    string db "Dummy Text",0
    len2 equ $-string
    msg db "Both string are same",0
    msg2 db "Both string are not same",0
    msg3 db "Count of charecter 'm' is %d",10,0
    msg4 db "Length of string is %d",10,0
    msg5 db "Given string is a palindrome",0
    msg6 db "Given string is not a palindrome",0

section .bss
    dest resb len

section .text 
    global main
    extern puts,printf

main:

    compare src,string,ebx
    push ebx
    call puts
    add esp,4

    copy src,dest
    push dest
    call puts
    add esp,4

    count src,ecx
    push ecx
    push msg3
    call printf
    add esp,8

    length src,ecx
    push ecx
    push msg4
    call printf
    add esp,8

    palindrome src,len,ebx
    push ebx
    call puts
    add esp,4

    reverse src,dest,len
    push dest
    call puts
    add esp,4

termiante:
    ret
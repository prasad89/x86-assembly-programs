section .data
    true db "Strong",10,0
    false db "Not strong",10,0
    num dd 1453

section .text
    global main
    extern printf

main:
    mov eax,dword[num]
    xor esi,esi

    xor edx,edx
div:
    mov ebx,10
    
    div ebx

    push eax

fact:
    mov ecx,edx
    mov eax,1

lp:
    mul ecx

    cmp ecx,1
    jz add

    dec ecx
    jmp lp

add:
    add esi,eax

    pop eax

    cmp eax,0
    jg div

    cmp esi,dword[num]
    jz yes

no:
    push false
    call printf
    add esp,4
    jmp terminate

yes:
    push true
    call printf
    add esp,4

terminate:
    ret
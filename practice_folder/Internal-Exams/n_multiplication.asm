section .data
    msg db "Wrong Input..!",10,0
    op db "%d",10,0

section .text
    global main
    extern printf,atoi

main:
    push ebp
    mov ebp,esp

    mov ecx,[ebp+8]
    cmp ecx,2
    jnz wrong

n:
    mov esi,[ebp+12]
    
    push dword[esi+4]
    call atoi
    add esp,4

    mov esi,eax

    mov ecx,1
multiply:
    mov edx,esi
    mov eax,ecx

    mul edx

    pusha
    push eax
    push op
    call printf
    add esp,8 
    popa

    inc ecx

    cmp ecx,10
    jg terminate
    jmp multiply

wrong:
    push msg
    call printf
    add esp,4

terminate:
    mov esp,ebp
    pop ebp

    ret
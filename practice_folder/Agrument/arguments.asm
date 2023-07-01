section .data
    msg db "Number of arguments are: %d",10,0
    msg2 db "%d number argument is : %s",10,0
    msg3 db "Insufficient arguments",10,0

section .text
    global main
    extern printf
    
main:
    push ebp
    mov ebp,esp

argc:
    mov ecx,[ebp+8] ;argc - count
    cmp ecx,2
    jl insufficient

    push ecx
    push msg
    call printf
    add esp,8

    xor edx,edx
argv:
    push edx
    mov esi,[ebp+12];argv - value

    push dword[esi+edx*4]
    push edx
    push msg2
    call printf
    add esp,12

    pop edx
    inc edx
    cmp edx,5
    jl argv

envp:
    ; mov edi,[ebp+16];envp

    jmp terminate

insufficient:
	push msg3
	call printf
	add esp,4

terminate:
    mov esp,ebp
    pop ebp
    ret
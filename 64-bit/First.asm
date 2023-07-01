section .data
    msg db "Hello %d-bit...",10,0
section .text
    global main
    extern printf
main:
    xor rax,rax
    mov rdi,msg
    mov rsi,32
    mov r8,32
    add rsi,r8
    push rdi
    call printf WRT ..plt
    pop rdi
terminate:
    ret
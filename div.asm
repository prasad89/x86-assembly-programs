section .data
    msg db "Result: %d | Remainder: %d",10,0
section .text
    global main
    extern printf
main:
    mov eax,8999
lp:
    mov edx,0    
    mov ecx,10

    div ecx

    mov esi,edx
    mov edi,eax
    
    pusha
    push esi
    push edi
    push msg
    call printf
    add esp,12
    popa

    cmp edi,0
    jg lp
terminate:
    ret
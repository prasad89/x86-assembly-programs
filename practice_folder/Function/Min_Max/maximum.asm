section .data 
    msg db "Maxmimum number is:%d",10,0
section .text
    global main
    extern printf,max
main:
    mov eax,10
    mov ebx,20
    
    push eax
    push ebx
    call max
    add esp,8

    push eax
    push msg
    call printf
    add esp,8
    
terminate:
    ret
section .data 
    msg db "Minimum number is:%d",10,0
section .text
    global main
    extern printf,min
main:
    mov eax,10
    mov ebx,20
    
    push eax
    push ebx
    call min
    add esp,8

    push eax
    push msg
    call printf
    add esp,8
    
terminate:
    ret
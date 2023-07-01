section .data
    string db "Your string charecter is:",0
    len equ $-string
    newl db 10
section .bss
    n resb 10
section .text
    global main
main:
    ;;readsyscall
    mov eax,3
    mov ebx,0
    mov ecx,n
    int 80h

    ;;writesyscall
    mov eax,4      
    mov ebx,1      
    mov ecx,string      
    mov edx,len         
    int 80h             

    mov eax,4
    mov ebx,1
    mov ecx,n
    mov edx,10
    int 80h

endof:
    ret
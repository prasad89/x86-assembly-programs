section .data
    string db "Your input charecter is:",0
    len equ $-string
    newl db 10
section .bss
    n resb 1
section .text
    global main
main:
    ;;readsyscall
    mov eax,3
    mov ebx,0
    mov ecx,n
    int 80h

    ;;writesyscall
    mov eax,4           ;;syscallno
    mov ebx,1           ;;1st arg
    mov ecx,string      ;;2nd arg
    mov edx,len         ;;3rd arg
    int 80h             ;;int 80h | 0x80

    mov eax,4
    mov ebx,1
    mov ecx,n
    mov edx,1
    int 80h

    mov eax,4
    mov ebx,1
    mov ecx,newl
    mov edx,1
    int 80h

endof:
    ret
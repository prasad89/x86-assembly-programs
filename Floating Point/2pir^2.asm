section .data
    r dq 2.1
    two dd 2
    op db "2PIr^2: %f",10,0

section .bss
    result resq 1

section .text
    global main
    extern printf

main:
    fldpi   ;loads pi value to st0
    ; fld1  ;loads 1 value to st0
    ; fldz  ;loads 0 value to st0
    fld qword[r]
    fmul qword[r]
    fmul st1
    fild dword[two]
    fmul st1

    fstp qword[result]

    fld qword[result]

    sub esp,8
    fstp qword[esp]
    push op
    call printf 	
    add esp,12

terminate:
    ret
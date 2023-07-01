section .data
    a dq 1.9
    b dq 2.7
    ; c dq 3.5
    ; d dq 4.3
    ; e dq 5.2
    ; f dq 1.8
    ; g dq 2.6
    ; h dq 3.4
    op db "Result is: %f",10,0

section .bss
    result resq 1

section .text
    global main
    extern printf

main:
    fld qword[a]
    fld qword[b]
    ; fld qword[c]
    ; fld qword[d]
    ; fld qword[e]
    ; fld qword[f]
    ; fld qword[g]
    ; fld qword[h]

    ; fadd st1,st0    ;;st1=st1+st0
    ; fadd st0,st1    ;;st0=st0+st1

    ; fsub st0,st1    ;;st0=st0-st1
    fsubr st0,st1     ;;st0=st1-st0

    ;fst qword[result] ;;result=st0
    fstp qword[result] ;;result=st0 and pop value from st0

    fld qword[result]

    sub esp,8
    fstp qword[esp]
    push op
    call printf 	
    add esp,12

terminate:
    ret
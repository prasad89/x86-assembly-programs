section .data
    string db "Hi there we have to count VOWELS here...",0
    len equ $-string
    op db "Number of VOWELS in the string is: %d",10,0

section .text
    global main
    extern printf

main:
    mov esi,string
    mov ecx,len
    xor edx,edx

lp:
    cmp byte[esi],0
    jz print
    cmp byte[esi],'A'
    jz inc_cnt
    cmp byte[esi],'E'
    jz inc_cnt
    cmp byte[esi],'I'
    jz inc_cnt
    cmp byte[esi],'O'
    jz inc_cnt
    cmp byte[esi],'U'
    jz inc_cnt
    cmp byte[esi],'a'
    jz inc_cnt
    cmp byte[esi],'e'
    jz inc_cnt
    cmp byte[esi],'i'
    jz inc_cnt
    cmp byte[esi],'o'
    jz inc_cnt
    cmp byte[esi],'u'
    jz inc_cnt

    inc esi
    inc ecx
    jmp lp

inc_cnt:
    inc edx

    inc esi
    inc ecx
    jmp lp
    
print:
    push edx
    push op
    call printf
    add esp,8

termiante:
    ret
section .data
        string db "Spaces are going to count from here so we are giving more and more and more",0
        len equ $-string
        msg db "Space count is: %d",10,0
section .text
        global main
        extern printf
main:
        mov esi,string
        xor ecx,ecx
lp:         
        cmp byte[esi],0
        jz endof
        mov al,' '
        cmp byte[esi],al
        jnz lp2
        inc ecx
lp2:
	inc esi
        jmp lp
endof:
        push ecx
        push msg
        call printf
        add esp,8

        ret
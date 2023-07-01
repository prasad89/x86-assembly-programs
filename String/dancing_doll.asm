section .data
	dance db "DaNcInG dOlL",0
	length equ $-dance
	clear db "clear",0
	
section .bss
	output resb length

section .text
	global main
	extern puts,system
	
main:
	push clear
	call system
	add esp,4

	mov esi,dance
	mov edi,output

lp:
	cmp byte[esi],32
	jz lp3
	cmp byte[esi],97
	jge lp2
	add byte[esi],32
	jmp lp3
	
lp2:
	sub byte[esi],32

lp3:
	mov al,byte[esi]
	mov byte[edi],al
	inc esi
	inc edi

	cmp byte[esi],0
	jnz lp
	push output
	call puts
	add esp,4
	jmp main

endof:
	ret
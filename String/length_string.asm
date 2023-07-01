section .data
	string db "Low Level Assembly Programming",0
	;;len equ $-string
	msg db "Length is:%d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov esi,string
lp:	
	cmp byte[esi],0
	jz endof
	inc ecx
	inc esi
	jmp lp
endof:	
	push ecx
	push msg
	call printf
	add esp,8
	
	ret
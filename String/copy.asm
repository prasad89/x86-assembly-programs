section .data
	string db "Low Level Assembly Programming",0
	len equ $-string
section .bss
	copy resb len
section .text
	global main
	extern puts
main:
	mov ecx,len
	xor edx,edx
lp:
	xor eax,eax
	mov al,byte[string+edx]
	mov byte[copy+edx],al
	inc edx
	loop lp
endof:
	push copy
	call puts
	add esp,4
	
	ret
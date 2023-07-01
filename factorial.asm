section .data
	msg db "Factorial is:%d",10,0
section .text
	global main
	extern printf
main:
	mov ecx,5
	mov eax,1
lp:
	mul ecx
	cmp ecx,1
	jz endof
	dec ecx
	jmp lp
endof:
	push eax
	push msg
	call printf
	add esp,8
	
	ret
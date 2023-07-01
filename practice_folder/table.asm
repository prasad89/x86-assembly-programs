section ..data
	op db "%d",10,0
	
section .text
	global main
	extern printf

main:
	mov ecx,1

table:
	mov edx,2
	mov eax,ecx
	
	mul edx
	
	pusha
	push eax
	push op
	call printf
	add esp,8
	popa
	
	cmp ecx,10
	jz terminate
	
repeat:
	inc ecx
	jmp table	

terminate:
	ret
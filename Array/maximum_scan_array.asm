section .data
	input db "%d",0
	msg db "Enter count required:",0
	msg2 db "Maximum number entered by you is:%d",10,0
	
section .bss
	n resd 1
	Array resd 10
	
section .text
	global main
	extern printf,scanf
	
main:
	push msg
	call printf
	add esp,4
	
	push n	
	push input
	call scanf
	add esp,8
	
	xor ecx,ecx
lp:	
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jl lp
	
	xor ecx,ecx
	xor esi,esi
lp2:	
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	cmp ecx,dword[n]
	jz endof	
	cmp dword[ebx],esi
	jng lp3
	mov esi,dword[ebx]
	
lp3:
	inc ecx
	jmp lp2

endof:	
	push esi
	push msg2
	call printf
	add esp,8
	
	ret
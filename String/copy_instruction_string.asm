section .data
	src db "Hello World",10,0
	len equ $-src

section .bss
	dest resb len

section .text
	global main

main:
	mov esi,src
	mov edi,dest
	mov ecx,len
	
	rep	movsb

write:
	mov eax,4
	mov ebx,1
	mov ecx,dest
	mov edx,len
	int 0x80
	
endof:
	ret
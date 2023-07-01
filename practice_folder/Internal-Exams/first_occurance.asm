section .data
	string db "This is a string contains a...",0
	len equ $-string
	fnd db "a found, eax: %d",10,0
	ntfnd db "a not found, eax: %d",10,0
section .text
	global main
	extern printf
main:
	mov esi,string
	mov ecx,len
	mov al,'a'

lp:
	cmp byte[esi],0
	jz not_found

	cmp byte[esi],al
	jz found

	inc esi
	jmp lp

found:
	mov eax,esi
	push eax
	push fnd
	call printf
	add esp,8
	jmp terminate

not_found:
	mov eax,0
	push eax
	push ntfnd
	call printf
	add esp,8

terminate:
	ret
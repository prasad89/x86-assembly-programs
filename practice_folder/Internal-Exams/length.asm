section .data
	op db "Length of string is: %d",10,0

section .text
	global len
	extern printf

len:
	push ebp
	mov ebp,esp
	
	mov edi,dword[ebp+8]
	
	mov esi,edi
	mov al,0
	repnz scasb

	sub edi,esi
	dec edi

print:
	push edi
	push op
	call printf
	add esp,8

terminate:
	mov esp,ebp
	pop ebp
	ret
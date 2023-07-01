section .data
	Array dd 1000,10,101,20,201,30,301,40,401,50,501,-1
	msg db "Minimum element from given array is:%d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov esi,dword[Array]
lp:	
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	cmp dword[ebx],-1
	jz endof
	cmp dword[ebx],esi
	jnl lp2
	mov esi,dword[ebx]	
lp2:
	inc ecx
	jmp lp
endof:
	push esi
	push msg
	call printf
	add esp,8
	
	ret
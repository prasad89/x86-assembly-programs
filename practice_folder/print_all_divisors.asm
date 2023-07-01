section .data
	num dd 10
	op db "%d",10,0
	
section .text
	global main
	extern printf
	
main:
	mov ecx,dword[num]
lp:
	xor edx,edx
	
	mov eax,dword[num]	
	div ecx
	
	cmp edx,0
	jnz lp2
	
	pusha
	push ecx
	push op
	call printf
	add esp,8
	popa
	
lp2:
	loop lp
	
terminate:
	ret

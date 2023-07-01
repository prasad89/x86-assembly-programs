section .data
	arr dd 10,30,1,100,50,20,40
	max db "Max:%d",10,0
	min db "Min %d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov esi,dword[arr]
	mov edi,dword[arr]
lp:
	mov ebx,arr
	mov eax,4
	mul ecx
	add ebx,eax
	
	;max
	cmp esi,dword[ebx]
	cmovl esi,dword[ebx]
	
	;min
	cmp edi,dword[ebx]
	cmovg edi,dword[ebx]
	
	inc ecx
	cmp ecx,6
	
	jl lp
	
	push esi
	push max
	call printf
	add esp,8
	
	push edi
	push min
	call printf
	add esp,8
endof:
	ret
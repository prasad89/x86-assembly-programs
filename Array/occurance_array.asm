section .data
	Array dd 40,10,20,30,40,10,10,40,50,-1
	msg db "40 Occured %d times",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	xor esi,esi
lp:
	mov ebx, Array
	mov eax,4
	mul ecx
	add ebx,eax
	cmp dword[ebx],-1
	jz endof
	inc ecx
	cmp dword[ebx],40
	jz lp2
	jmp lp
lp2:
	inc esi
	jmp lp
endof:
	push esi
	push msg
	call printf
	add esp,8
	
	ret
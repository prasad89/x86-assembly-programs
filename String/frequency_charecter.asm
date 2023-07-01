section .data
	input db "Enter the string: ",0
	result db "Frequency of %c : %d",10,0
	
section .bss
	string resb 100
	length resd 1
	count resd 255

section .text
	global main
	extern printf,scanf,puts,fread,stdin

main:
	push input
	call printf
	add esp,4
	
	push dword[stdin]
	push 100
	push 1
	push string
	call fread
	add esp,16
	
	dec eax
	mov dword[length],eax
	
	mov esi,string
	mov ecx,dword[length]
	
lp:	
	mov ebx,count
	xor edx,edx
	mov dl,byte[esi]
	xor eax,eax
	mov eax,4
	mul dl
	add ebx,eax
	inc dword[ebx]
	inc esi
	loop lp
	
	mov edi,32
	mov eax,4
	mul edi
	mov ebx,count
	add ebx,eax
	xor ecx,32

lp2:
	cmp dword[ebx],0
	jnz print

lp3:
	add ebx,4
	inc ecx
	cmp ecx,127
	jnz lp2
	jmp endof

print:
	push ecx
	push dword[ebx]
	push ecx
	push result
	call printf
	add esp,12
	pop ecx
	jmp lp3
	
endof:
	xor eax,eax
	ret
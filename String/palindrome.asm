section .data
	msg db "Palindrome",0
	msg2 db "Not A Palindrome",0
	input db "NITIN",0

section .text
	global main
	extern puts

main:
	xor ecx,ecx
	mov edi,input
	
lp:
	cmp byte[edi],0
	jz lp2
	inc ecx
	inc edi
	jmp lp

lp2:
	dec edi
	mov esi,input

lp3:
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz false
	inc esi
	dec edi
	dec ecx
	cmp ecx,0
	jz true
	jmp lp3

true:
	push msg
	call puts
	add esp,4
	jmp endof

false:
	push msg2
	call puts
	add esp,4

endof:
	ret
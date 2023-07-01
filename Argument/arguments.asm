section .data
	msg db "Insufficient Parameters",10,0
	msg2 db "envp [%d] = %s and argv[%d] = %s",10,0
section .text
	global main
	extern printf
main:
	push ebp
	mov ebp,esp

	mov ecx,[ebp+8]
	cmp ecx,2
	jb end

	xor edx,edx
lp:	
	push edx
	mov esi,[ebp+12]	;;argv
	mov edi,[ebp+16]	;;envp
	push dword[esi+edx*4];;argv[i]
	push edx			;;i
	push dword[edi+edx*4];;envp[i]
	push edx			;;i
	push msg2
	call printf
	add esp,20
	pop edx
	inc edx
	cmp edx,5
	jb lp

	jmp terminate

end:
	push msg
	call printf
	add esp,4

terminate:
	mov esp,ebp
	pop ebp
	ret
%macro copy 3
	mov ecx,%1
	mov esi,%2
	mov edi,%3
	rep movsb
%endmacro

section .data
	src db "Dummy Text",0
	len equ $-src

section .bss
	dest resb len

section .text
	global main
	extern puts
	
main:
	copy len,src,dest
	
	push dest
	call puts
	add esp,4
	
terminate:
	ret
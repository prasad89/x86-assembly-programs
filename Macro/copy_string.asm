%macro copy 2
	mov esi,%1
	mov edi,%2
	
%%cp:
	cmp byte[esi],0
	jz %%endof
	
	mov al,byte[esi]
	mov byte[edi],al
	
	inc esi
	inc edi
	
	jmp %%cp

%%endof: 
%endmacro

section .data
	src db "Dummy Text",0
	len equ $-src
	src2 db "New Text",0
	len2 equ $-src	

section .bss
	dest resb len
	dest2 resb len

section .text
	global main
	extern puts
	
main:
	copy src,dest
	copy src2,dest2
	
	push dest
	call puts
	add esp,4
	
	push dest2
	call puts
	add esp,4
	
terminate:
	ret
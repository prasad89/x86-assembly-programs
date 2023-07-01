%macro addition 3
mov eax,%1
mov ebx,%2
add eax,ebx
mov %3,eax
%endmacro

section .data
	op db "Addition of numbers is: %d",10,0
		
section .text
	global main
	extern printf
	
main:
	addition 3,4,ecx
	
	pusha
	push ecx
	push op
	call printf
	add esp,8
	popa
	
terminate:
	ret
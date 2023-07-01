section .data
	input db "%d",0
	msg db "Enter number to print:",0
	msg2 db "Number enterd by you is:%d",10,0
section .bss
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push n	
	push input
	call scanf
	add esp,8
	
	push dword[n]
	push msg2
	call printf
	add esp,8
endof:
	ret
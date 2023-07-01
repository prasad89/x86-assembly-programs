section .data
	msg db "Enter number of Elements: ",10,0
	input db "%d",0
	msg2 db "Sorted array is: %d",10,0

section .bss
	n resd 1
	Array resd 10

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

	xor ecx,ecx
scan:
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax

	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n]
	jl scan

;

	xor ecx,ecx
sort:
	cmp ecx,4
	jz reset

    mov esi,Array

	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax

    add esi,eax
    add esi,4

    mov eax,dword[esi]
    cmp dword[ebx],eax
    jg exchange

	inc ecx
	jmp sort

exchange:
    mov eax,dword[esi]
    xchg dword[ebx],eax
    mov dword[esi],eax

    inc ecx
	jmp sort

;

reset:
	xor ecx,ecx
print:
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax

	pusha
	push dword[ebx]
	push msg2
	call printf
	add esp,8
	popa

	inc ecx
	cmp ecx,dword[n]
	jl print

endof:
	ret
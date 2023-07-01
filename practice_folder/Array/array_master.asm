section .data
    input db "%d",0
    msg db "Enter size of array",10,0
    msg2 db "Size of array is: %d",10,0
    msg3 db "Enter elemets of array",10,0
    msg4 db "Elements of array are: %d",10,0
    msg5 db "Sum of array elemets is: %d",10,0
    msg6 db "Minimum element of array is: %d",10,0
    msg7 db "Maximum element of array is: %d",10,0
    msg8 db "Enter number to search",10,0
    msg9 db "%d : Exist!!!",10,0
    msg10 db "%d : Not exist!!!",10,0

section .bss 
    n resd 1
    array resd 100
    k resd 1

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

    push msg3 
    call printf
    add esp,4

    xor ecx,ecx
scan:   
    mov ebx,array
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

    xor ecx,ecx
print:
    mov ebx,array
    mov eax,4
    mul ecx
    add ebx,eax

    pusha
    push dword[ebx]
    push msg4
    call printf
    add esp,8
    popa

    inc ecx
    cmp ecx,dword[n]
    jl print

    xor ecx,ecx
    xor esi,esi
sum:
    mov ebx,array
    mov eax,4
    mul ecx
    add ebx,eax

    add esi,dword[ebx]

    inc ecx
    cmp ecx,dword[n]
    jl sum

    push esi
    push msg5
    call printf
    add esp,8

    xor ecx,ecx
    mov esi,dword[array]
min:
    mov ebx,array
    mov eax,4
    mul ecx
    add ebx,eax
    
    cmp dword[ebx],esi
    jnl repeatmin
    mov esi,dword[ebx]

repeatmin:
    inc ecx
    cmp ecx,dword[n]
    jl min

    push esi
    push msg6
    call printf
    add esp,8

    xor ecx,ecx
    mov esi,dword[array]
max:
    mov ebx,array
    mov eax,4
    mul ecx
    add ebx,eax

    cmp dword[ebx],esi
    jng repeatmax
    mov esi,dword[ebx]

repeatmax:
    inc ecx
    cmp ecx,dword[n]
    jl max

    push esi
    push msg7
    call printf
    add esp,8

    push msg8
    call printf
    add esp,4

    push k
    push input
    call scanf
    add esp,8

    xor ecx,ecx
    mov esi,dword[k]
occurance:
    mov ebx,array
    mov eax,4
    mul ecx
    add ebx,eax

    cmp dword[ebx],esi
    jz found

    inc ecx
    cmp ecx,dword[n]
    jl occurance

notfound:
    push esi
    push msg10
    call printf
    add esp,8
    jmp terminate

found:
    push esi
    push msg9
    call printf
    add esp,8

terminate:
    ret
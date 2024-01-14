; Fetch first name of student from the given record where Course is MSc and Year is 2017

section .data
    student db "Ramesh Suresh Joshi,M,MSc,2017",0
            db "Sumukhi Dinesh Rajeshwar,F,MSc,2011",0
            db "Rinku Rajnedra Rane,F,MCA,2017",0
            db "Sunil Ashok Wagh,M,MSc,2011",0
            db "Jignesh Raju More,M,MSc,2017",0,-1
    length equ $-student
    course db "MSc"
    year db "2017",0
    newline db 10

section .text
    global main

main:
    mov edi, student

lp:
    mov ecx, length
    mov esi, edi
    mov al, ' '
    repnz scasb
    mov edx, edi
    sub edx, esi
    push esi
    push edx
    mov al, ','
    repnz scasb
    repnz scasb
    mov esi, course
    mov ecx, 3
    repz cmpsb
    jnz lp2
    inc edi
    mov esi, year
    mov ecx, 4
    repz cmpsb
    jnz lp2

    ; Print the found name
    mov eax, 4
    pop edx
    pop ecx
    mov ebx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov edx, 1
    mov ecx, newline
    mov ebx, 1
    int 0x80

lp2:
    mov al, 0
    repnz scasb
    cmp byte[edi], -1
    jz terminate
    add edi, 1
    jnz lp

terminate:
    ret

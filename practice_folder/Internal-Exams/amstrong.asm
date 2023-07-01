section .data
    yes db "Amstrong number",10,0
    no db "Not amstrong number",10,0
    num dd 153
section .text
    global main
    extern printf
main:
    mov eax,dword[num]  ;eax=153(number)
    xor esi,esi         ;esi=0(sum of cube of digits)

    xor edx,edx         ;edx=0(for division)
div:
    mov ebx,10          ;ebx=10(divisor)
    div ebx             ;153/10

    push eax            ;preserve eax=15(remaining number)
    ;endof division
    
cube:
    mov eax,edx         ;eax=3(for multiplication)

    mov ecx,edx         ;ecx=3(multiplier)
    mul ecx             
    mul ecx             ;3*3*3    
    ;endof multiplication

    add esi,eax         ;esi=9(result of multiplication)

    pop eax             ;restore eax=15(remaining number)

    cmp eax,0           
    jg div              ;if eax>0 repeat

    cmp esi,dword[num]  
    jnz false           ;if esi!=num false

true:
    push yes
    call printf
    add esp,4
    jmp terminate

false:
    push no
    call printf
    add esp,4

terminate:
    ret
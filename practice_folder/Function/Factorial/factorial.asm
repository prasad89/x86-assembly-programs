section .text
    global fact

fact:
    push ebp
    mov ebp,esp
    
    mov ecx,[ebp+8]
    mov eax,1
lp:
    mul ecx
    loop lp

return:
    mov esp,ebp
    pop ebp
    ret
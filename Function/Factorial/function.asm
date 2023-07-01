section .text
    global fact

fact:
    push ebp
    mov ebp,esp

    mov ecx,dword[ebp+8]
    mov eax,1

lp:
    mul ecx
    loop lp

    mov dword[ebp-4],eax
    mov eax,dword[ebp-4]

return:
    mov esp,ebp
    pop ebp
    ret
section .text
    global max

max:
    push ebp
    mov ebp,esp
    
    mov eax,dword[ebp+8]
    cmp eax,dword[ebp+12]
    ja return
    
    mov eax,dword[ebp+12]

return:
    mov esp,ebp
    pop ebp
    ret
section .text
    global max

max:
    push ebp
    mov ebp,esp
    ;;enter 0,0
    
    mov dword[ebp-4],0
    mov eax,dword[ebp+8]
    mov ebx,dword[ebp+12]
    cmp eax,ebx
    ja lp
    
    mov dword[ebp-4],ebx
    jmp return

lp:
    mov dword[ebp-4],eax

return:
    mov eax,dword[ebp-4]
    mov esp,ebp
    pop ebp
    ret
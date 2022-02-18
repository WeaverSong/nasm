fun_print_char:
    push rdi
    push rsi
    push rdx
    
    push rax
    
    mov rax, 1
    mov rdi, 1

    mov rdx, 1
    lea rsi, [rsp]
    syscall

    pop rax
    
    pop rdx
    pop rsi
    pop rdi

    ret
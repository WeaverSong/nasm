; Takes rax as the number of errors
fun_exit:
    mov rdi, rax ; number of errors
    mov rax, 60
    syscall
; Takes rax as the number of errors
fun_exit:
    mov rsi, rax ; number of errors
    mov rax, 60 ; '1' is 'SYS_EXIT'
    syscall ; int short for 'interrupt'
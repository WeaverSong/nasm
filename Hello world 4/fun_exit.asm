; Takes rax as the number of errors
fun_exit:
    mov rbx, rax ; number of errors
    mov rax, 1 ; '1' is 'SYS_EXIT'
    int 80h ; int short for 'interrupt'
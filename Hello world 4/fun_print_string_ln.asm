; rax is string location
%include 'fun_print_string.asm'

fun_print_string_ln:
    call fun_print_string
    push rax

    push 0Ah

    mov rax, 1
    mov rdi, 1

    mov rdx, 04h
    lea rsi, [rsp] ; rsi is location to print from. This syntax is used to convert relative to absolute. Needed for stack pointer.
    syscall

    pop rax
    pop rax

    ret
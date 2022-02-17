; rax is string location
%include 'fun_strln.asm'

fun_print_string:

    push rsi ; Used to hold the string location. Copied from rax
    push rdx ; Used to hold the string length. Copied from rax after fun_strln
    push rdi

    mov rsi, rax
    call fun_strln
    mov rdx, rax

    mov rdi, 1 ; 1 = STDOUT
    mov rax, 1 ; 4 = SYS_WRITE
    syscall

    pop rdi
    pop rdx
    pop rsi

    ret
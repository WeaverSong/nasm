; rax is string location
%include 'fun_strln.asm'

fun_print_string:

    push rcx ; Used to hold the string location. Copied from rax
    push rdx ; Used to hold the string length. Copied from rax after fun_strln
    push rbx

    mov rcx, rax
    call fun_strln
    mov rdx, rax

    mov rbx, 1 ; 1 = STDOUT
    mov rax, 4 ; 4 = SYS_WRITE
    int 80h

    pop rbx
    pop rdx
    pop rcx

    ret
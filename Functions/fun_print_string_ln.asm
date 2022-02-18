; rax is string location
%include 'fun_print_string.asm'
%include 'fun_print_char.asm'

fun_print_string_ln:
    call fun_print_string
    
    push rax
    mov rax, 0Ah
    call fun_print_char
    pop rax

    ret
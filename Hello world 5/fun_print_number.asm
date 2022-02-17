%include 'fun_print_string_ln.asm'
%include 'fun_modulus.asm'

; Prints out the number contained in rax
; Add 48 to digits to get the character
fun_print_number:

; Store all the registers we will need
push rbx
mov rbx, 10

push rcx
push rdx

cmp rax, 0
jz skip_divide

push 0
push 10

divide_loop:
    cmp rax, 9
    jle divide_end_loop

    ; Push the result of (rax % 10) + 48 to the stack
    mov rcx, rax
    call fun_modulus
    add rax, 48
    push rax
    mov rax, rcx

    ; Divide rax by 10
    mov rdx, 0 ; High part of dividend
    div rbx ; The quotiant goes in rax, and the remainder in rdx

    jmp divide_loop

skip_divide:
    ; Print out the digit zero

    mov rax, 48
    call fun_print_char

    jmp divide_return

divide_end_loop:
    cmp rax, 0
    jz divide_print_string
    add rax, 48
    push rax

divide_print_string:
    pop rax
    call fun_print_char

    cmp rax, 0
    jz divide_return

    jmp divide_print_string

divide_return:
    ; Put all the registers back
    pop rdx
    pop rcx
    pop rbx
    ret
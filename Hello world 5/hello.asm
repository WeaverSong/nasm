; Basic hello world. Template/example for basic code.
; compile with nasm -felf64 hello.asm
; and ld -o hello hello.o
; Run with just ./hello

; https://filippo.io/linux-syscall-table/

; files to include
%include 'fun_exit.asm'
%include 'fun_print_number.asm'

SECTION .data ; store constants here. Probably not very useful for compiling.
msg     db "Version 5.0", 0h ;assign variable 'msg' to my string, with a line feed character '0Ah'. What does 'db' mean?
msg2    db "Can now print out numbers!", 0h ; '0h' terminates string.
newline db "", 0Ah, 0h

bits 64
SECTION .text ; Typically store the main code of the program here.
global  _start ; Make start a global, so it can be accessed and run from the outside

_start: ; This is where the program starts running

    mov rax, msg
    call fun_print_string_ln ; Prints the string *rax

    mov rax, msg2
    call fun_print_string_ln

    mov rdx, 10

loop_body:
    cmp rdx, 0
    jz end

    mov rax, rdx
    call fun_print_number

    dec rdx
    jmp loop_body

end:
    mov rax, 0
    call fun_exit
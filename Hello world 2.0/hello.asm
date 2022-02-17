; Basic hello world. Template/example for basic code.
; compile with nasm -felf64 hello.asm
; and ld -o hello hello.o
; Run with just ./hello

SECTION .data ; store constants here. Probably not very useful for compiling.
msg     db "Now in 2.0! Better than ever.", 0Ah ;assign variable 'msg' to my string, with a line feed character '0Ah'. What does 'db' mean?

SECTION .text ; Typically store the main code of the program here.
global  _start ; Make start a global, so it can be accessed and run from the outside

_start: ; This is where the program starts running

    ; Create 2 registers pointing to the same place
    mov rbx, msg
    mov rax, rbx ; rax is used for opcalls, but here we're using it for temp storage

nextchar: ; keeps looping until our 2 registers can be used to find the length of the message
    cmp byte [rax], 0 ; 'cmp' is for comparing 2 things. 'byte [<register>]' gets the actual value pointed to by the register. '0' is the character that indicates the end of a string.
    jz  finished ; jump to 'finished' if the previous command returned true
    inc rax ; If the previous command didn't drag us away, we increment 'eax'
    jmp  nextchar ; Jump to 'nextchar', causing us to repeat until we reach the end of the string

finished: ; Run this when we have set up our 2 pointers to get the length of the string
    sub rax, rbx ; Does 'eax -= rbx'. Because of 'nextchar' this results in 'eax' storing the length of the string.
    mov rdx, rax ; rdx is the input for how many chars to write.
    mov rcx, msg ; Input for what string to write from.
    mov rbx, 1 ; 'ebx' is the file to write to. '1' refers to STDOUT here.
    mov rax, 4 ; 'eax' is the opcall to run. '4' is 'SYS_WRITE'
    int 80h ; Actually calls the specified command, with the inputs.

    ; Exit
    mov rbx, 0 ; number of errors
    mov rax, 1 ; '1' is 'SYS_EXIT'
    int 80h
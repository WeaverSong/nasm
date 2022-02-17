; Basic hello world. Template/example for basic code.
; compile with nasm -felf64 hello.asm
; and ld -o hello hello.o
; Run with just ./hello

SECTION .data ; store constants here. Probably not very useful for compiling.
msg     db "Now in 3.0! Uses functions!", 0Ah ;assign variable 'msg' to my string, with a line feed character '0Ah'. What does 'db' mean?

SECTION .text ; Typically store the main code of the program here.
global  _start ; Make start a global, so it can be accessed and run from the outside

_start: ; This is where the program starts running

    mov rax, msg
    call fun_strln ; Assign input 'eax' and then get the length of the string with our function

    mov rdx, rax ; rdx is the input for how many chars to write.
    mov rcx, msg ; Input for what string to write from.
    mov rbx, 1 ; 'rbx' is the file to write to. '1' refers to STDOUT here.
    mov rax, 4 ; 'rax' is the opcall to run. '4' is 'SYS_WRITE'
    int 80h ; Actually calls the specified command, with the inputs.

    ; Exit
    mov rbx, 0 ; number of errors
    mov rax, 1 ; '1' is 'SYS_EXIT'
    int 80h ; int short for 'interrupt'
    ; Because this part exits, functions after it will only be run with 'call'


fun_strln: ; gets the length of the string linked to in 'eax'
    push rbx ; Push the value of 'rbx' onto the stack, so we can safely use rbx for temp storage.
    mov rbx, rax ; copy rax into rbx

nextchar: ; keeps looping until our 2 registers can be used to find the length of the message
    cmp byte [rax], 0 ; 'cmp' is for comparing 2 things. 'byte [<register>]' gets the actual value pointed to by the register. '0' is the character that indicates the end of a string.
    jz  end_strln ; jump to 'finished' if the previous command returned true (Does this differ from 'jmp' only in checking the previous line?)
    inc rax ; If the previous command didn't drag us away, we increment 'eax'
    jmp  nextchar ; Jump to 'nextchar', causing us to repeat until we reach the end of the string

end_strln: ; the ending section of this function
    sub rax, rbx
    pop rbx ; Pop the last value on the stack to rbx - returning it to whatever it was before the function started
    ret ; return to where the function was called
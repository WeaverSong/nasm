; Basic hello world. Template/example for basic code.
; compile with nasm -felf64 hello.asm
; and ld -o hello hello.o
; Run with just ./hello

SECTION .data ; store constants here. Probably not very useful for compiling.
msg     db "Hello world!", 0Ah ;assign variable 'msg' to my string, with a line feed character '0Ah'. What does 'db' mean?

SECTION .text ; Typically store the main code of the program here.
global  _start ; Make start a global, so it can be accessed and run.

_start: ; This is where the program starts running

    ; Write "Hello world!" to the command line, using the msg stored above.
    mov edx, 13 ; move the numbers of bytes to write into 'edx'. Number is equal to characters, including line feed.
    mov ecx, msg ; 'msg' stores the location of the message. Write this into 'ecx'
    mov ebx, 1 ; 'ebx' is the file to write to. '1' refers to STDOUT here.
    mov eax, 4 ; 'eax' is the opcall to run. '4' is 'SYS_WRITE'
    int 80h ; Actually calls the specified command, with the inputs.

    ; Exit
    mov ebx, 0 ; number of errors
    mov eax, 1 ; '1' is 'SYS_EXIT'
    int 80h
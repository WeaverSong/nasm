fun_strln: ; gets the length of the string linked to in 'rax'
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
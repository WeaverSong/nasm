; Takes rax and rbx.
; Divides rax by rbx and returns the remainder of the division in rax.
fun_modulus:
    push rdx
    mov rdx, 0 ; High part of dividend
    div rbx ; The quotiant goes in rax, and the remainder in rdx
    mov rax, rdx
    pop rdx
    ret
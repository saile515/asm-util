global main

%include "include.asm"

section .data
msg: db "Hello world!", 10, 0 ; 10=LF

section .text

main:
    mov rdi, msg
    call print_string
    mov rdi, 18446744073709551615
    call print_int
    
    mov rdi, 0 ; exit code 0
    mov rax, 60 ; exit syscall
    syscall

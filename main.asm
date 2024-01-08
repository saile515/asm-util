global _start

%include "print.asm"

section .data
msg1: db "Hello world!", 10, 0 ; 10=LF
msg2: db "Hello underworld!", 10, 0

section .text

_start:
    mov rdi, msg1
    call print
    mov rdi, msg2
    call print
    
    mov rdi, 0 ; exit code 0
    mov rax, 60 ; exit syscall
    syscall

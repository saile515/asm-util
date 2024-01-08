%ifndef PRINT_ASM
    %define PRINT_ASM
%endif

print:
    call length
    mov rdx, rax
    mov rsi, rdi
    mov rdi, 1
    mov rax, 1
    syscall
    ret

length:
    mov rbx, rdi
    mov rax, 0
    count:
        mov rcx, rbx
        add rcx, rax
        inc rax
        cmp byte [rcx], 0
        jnz count
    sub rax, 1
    ret

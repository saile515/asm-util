%ifndef PRINT_ASM
    %define PRINT_ASM
%endif

                                ; rdi
print:                          ; char* message
    call length                 ; no need to set rdi since print and length share first paramater
    mov rdx, rax                ; set rdx to length of string
    mov rsi, rdi                ; rsi is root of string
    mov rdi, 1                  ; rdi is output stream
    mov rax, 1                  ; write syscall
    syscall
    ret

                                ; rdi
length:                         ; char* string
    mov rbx, rdi                ; rbx is root address of string
    mov rax, 0                  ; rax is character count
    count:
        mov rcx, rbx            ; rcx is current character address 
        add rcx, rax
        inc rax
        cmp byte [rcx], 0       ; check if current character is null
        jnz count
    dec rax                     ; don't count null
    ret

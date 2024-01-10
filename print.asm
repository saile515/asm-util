%ifndef PRINT_ASM
    %define PRINT_ASM

extern malloc, free

                                ; rdi
print_string:                   ; char* string
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
    .count:
        mov rcx, rbx            ; rcx is current character address 
        add rcx, rax
        inc rax
        cmp byte [rcx], 0       ; check if current character is null
        jnz .count
    dec rax                     ; don't count null
    ret

                                ; rdi
print_int:                      ; int number
    call int_to_string
    push rax
    mov rdi, rax
    call print_string
    pop rdi
    call free
    ret

                                ; rdi
int_to_string:                  ; int number
    push rdi
    mov rdi, 21
    call malloc
    mov r8, rax
    mov rbx, 0
    pop rax
    .first_char_of_int:
        mov rdx, 0
        mov rcx, 10 
        div rcx
        add rdx, 48
        mov rcx, 20
        sub rcx, rbx
        add rcx, r8
        mov [rcx], dl
        inc rbx
        cmp rax, 0
        jne .first_char_of_int
    mov rcx, r8
    .trim
        mov rax, r8
        add rax, 21
        sub rax, rbx
        mov dl, [rax]
        mov byte [rcx], dl
        mov byte [rax], 0
        inc rcx
        dec rbx
        cmp rbx, 0
        jne .trim
    mov rax, r8
    ret

%endif

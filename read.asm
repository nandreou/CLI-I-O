section .data

input_len equ 5

section .bss

input resb input_len+1

section .text

global main

main:

push rbp
mov rbp, rsp

call reads
call prints

pop rbp
ret

reads:

section .data
section .bss

.input_buffer resb 1

section .text

push rbp
mov rbp, rsp

xor rbx ,rbx

push r12
mov r12, input

.readc:
mov rax, 0
mov rdi, 1
mov rsi, .input_buffer
mov rdx, 1
syscall

mov al, byte [.input_buffer]
cmp al, byte 0xa
je .done

cmp rbx, input_len
jge .readc

.comparison1:
cmp al, 65
jl .readc
jge .comparison2_1

.comparison2_1:
cmp al, 90
jl .comparison_to_lower
jg .comparison2_2

.comparison2_2:
cmp al, 97
jge .comparison_to_upper
jl .readc

.comparison_to_lower:
cmp al, 90
jle .to_lower

.comparison_to_upper:
cmp al, 97
jge .to_upper

.to_lower:
inc rbx
add al, 32 
mov [r12], al
inc r12
jmp .readc

.to_upper:
inc rbx
sub al, 32 
mov [r12], al
inc r12
jmp .readc

.done:
inc r12
mov [r12], byte 0

pop r12
mov rsp,rbp

mov rsp,rbp
pop rbp
ret

prints:

push rbp
mov rbp, rsp

.func:
mov rax, 1
mov rdi, 1
mov rsi, input
mov rdx, input_len
syscall

mov rsp,rbp
pop rbp
ret

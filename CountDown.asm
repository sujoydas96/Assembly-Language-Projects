segment .bss
num resb 2

segment .text
    global _start

_start:
    
    mov num, 10
    
l1:    
    mov edx, 2
    mov ecx, num
    mov ebx, 1
    mov eax, 4
    int 80h
    
    dec num
    jnz l1
    
    mov eax, 1
    int 80h
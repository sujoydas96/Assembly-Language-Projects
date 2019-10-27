segment .data
message db "The greater number is:", 0xA,0xD
len equ $ - message
num1 dd '10'            ;The first number being tested
num2 dd '25'            ;The second number to be tested
segment .bss
largest resb 2

segment .text
    global _start:

_start:
    mov ecx, [num1]
    cmp ecx, [num2]
    jg _exit
    mov ecx, [num2]
    _exit:

    mov [largest],ecx
    mov edx,len
    mov ecx,message
    mov ebx,1
    mov eax,4
    int 0x80

    mov edx, 2
    mov ecx, largest
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax,1
    int 0x80
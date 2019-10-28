segment .data
message db "Enter the year:", 0xa
len equ $ -message

leapY db "It is a Leap Year",0xa
lenY equ $ -leapY

leapN db "It is not a Leap Year",0xa
lenN equ $ -leapN

segment .bss
year resb 5

segment .text
    global _start

_start:
    mov edx, len
    mov ecx, message
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    mov edx, 5
    mov ecx, year
    mov ebx, 2
    mov eax, 3
    
    
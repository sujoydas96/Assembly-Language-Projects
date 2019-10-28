section .data
ten db '10',0xa
space db ' ', 0xa

section	.bss
num resb 1

section	.text
   global _start        
	
_start:                

   mov edx, 2 
   mov ecx, ten
   mov ebx, 1
   mov eax, 4
   int 0x80
   
   mov edx, 1 
   mov ecx, space
   mov ebx, 1
   mov eax, 4
   int 0x80
   
   mov ecx, 9
   mov eax, '9'
	
l1:
   mov [num], eax
   mov eax, 4
   mov ebx, 1
   push ecx
	
   mov ecx, num        
   mov edx, 2        
   int 0x80
   
   mov edx, 1 
   mov ecx, space
   mov ebx, 1
   mov eax, 4
   int 0x80
	
   mov eax, [num]
   sub eax, '0'
   dec eax
   add eax, '0'
   pop ecx
   loop l1
	
   mov eax,1             
   int 0x80      
section .data

	msg db 'Checking the year: ' , 0xa
    msglen equ $ -msg

	leapYear db ' is a leap year.', 0xa
	leapYearLenght equ $- leapYear

	noLeapYear db ' is not a leap year.', 0xa
    noLeapYearLenght equ $ -noLeapYear

    CheckYear dd '2004'

	section .text

	    global main

main:

	    mov eax, 4           ;msg print
	    mov ebx, 1
	    mov ecx, msg
	    mov edx, msglen
	    int 0x80

        mov eax, 4           ;print year
	    mov ebx, 1
	    mov ecx, CheckYear
	    mov edx, 4
	    int 0x80
	    
        mov eax, CheckYear
        sub eax, '0'

	    mov edx, 0
	    mov ecx, 4      
	    div ecx 

	    cmp edx, 0
	    jne NoLeapYear

	    mov eax, 4
	    mov ebx, 1
	    mov ecx, leapYear
	    mov edx, leapYearLenght
	    int 0x80

	    jmp Exit

NoLeapYear:	         	
	    mov eax, 4
	    mov ebx, 1
	    mov ecx, noLeapYear
	    mov edx, noLeapYearLenght
	    int 0x80

	    jmp Exit
Exit:

	    mov eax, 1
        mov ebx, 0
        int 0x80

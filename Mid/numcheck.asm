.model small
.stack 100h
.data        
a db ?
b db ?
e db 'Enter 1st number: $'
e2 db 'Enter 2nd number: $'
p db 10,13,'1st number is greater$'
q db 10,13,'2nd number is greater$'
eq db 10,13,'Both numbers are equal$'
i db 10,13,'Invalid number$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Get the first number
    mov ah, 9
    lea dx, e
    int 21h

    mov ah, 1
    int 21h   
    mov a, al

    ; Check if input is a valid digit
    cmp a, 30h
    jl invalid_input
    cmp a, 39h
    jg invalid_input

    ; Get the second number
    mov ah, 9
    lea dx, e2
    int 21h

    mov ah, 1
    int 21h  
    mov b, al

    ; Check if input is a valid digit
    cmp b, 30h
    jl invalid_input
    cmp b, 39h
    jg invalid_input

    ; Compare the two numbers
    mov al, a 
    mov bl, b
    cmp al, bl
    je numbers_equal
    ja first_greater
    jb second_greater

first_greater:
    mov ah, 9
    lea dx, p
    int 21h
    jmp exit_program

second_greater:
    mov ah, 9
    lea dx, q
    int 21h
    jmp exit_program

numbers_equal:
    mov ah, 9
    lea dx, eq
    int 21h
    jmp exit_program

invalid_input:
    mov ah, 9
    lea dx, i
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h

main endp
end main

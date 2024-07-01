.model small
.stack 100h
.data
a db ?
b db ?
e db 'Enter two number: $'
ord db 'Correct order is: $'  
i db 'Invalid input$'
nl db 10,13,'$'
.code
main proc
mov ax, @data
mov ds, ax


 ;first number
mov ah, 9
lea dx, e
int 21h

mov ah, 1
int 21h   
mov a, al

; Check digit
cmp a, 30h
jl invalid_input
cmp a, 39h
jg invalid_input
                         
    
                         
;second number
   
mov ah, 1
int 21h  
mov b, al

; Check digit
cmp b, 30h
jl invalid_input
cmp b, 39h
jg invalid_input



; Compare 
mov al, a
cmp al, b  

je numbers_equal
jg first_greater
jl second_greater

first_greater: 
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, ord
int 21h

mov dl, b
mov ah, 2
int 21h
mov dl, a
mov ah, 2
int 21h


jmp exit

second_greater:
mov ah,9     ;nl
lea dx,nl
int 21h 

mov ah, 9
lea dx, ord
int 21h

mov dl, a
mov ah, 2
int 21h
mov dl, b
mov ah, 2
int 21h
jmp exit

numbers_equal:
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, ord
int 21h

mov dl, a
mov ah, 2
int 21h
mov dl, b
mov ah, 2
int 21h
jmp exit

invalid_input:
mov ah, 9
lea dx, i
int 21h

exit:
mov ah, 4Ch
int 21h

main endp
end main

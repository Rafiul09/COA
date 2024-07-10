.model small
.stack 100h
.data
a db ?

e db 'Give an Input: $'
nm db 'Number$'
smalp db 'Small Letter$'
calp db 'Capital Letter$'  
i db 'Invalid input$'
nl db 10,13,'$'
.code
main proc
mov ax, @data
mov ds, ax

 mov cx, 0

 ;first alp
mov ah, 9
lea dx, e
int 21h

mov ah, 1
int 21h   
mov a, al

; Check char

cmp a, 30h
Jl invalid_input

cmp a, 39h
jle num   
jg alp  

num:
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, nm
int 21h
jmp exit

alp:
cmp a, 65
jl invalid_input
cmp a, 90  
JG c_apl
JL sm_apl


sm_apl:
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, calp
int 21h
jmp exit

c_apl:
CMP a,97
JL invalid_input
CMP a,122
JG invalid_input 

mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, smalp
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

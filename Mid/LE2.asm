.model small
.stack 100h
.data

e db 'Enter two number: $'  
op db 10,13,'Options:',10,13, 'A. ADD',10,13, 'S. SUB',10,13,'Enter Your Choice: $'       

ad1 db 'Addition is: $' 
su1 db 'Subtraction is: $'

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
mov bl, al

; Check digit
cmp bl, 30h
jl inv
cmp bl, 39h
jg inv
                         
    
                         
;second number
   
mov ah, 1
int 21h  
mov bh, al

; Check digit
cmp bh, 30h
jl inv
cmp bh, 39h
jg inv


mov ah, 9
lea dx, op
int 21h   

mov ah, 1
int 21h 

cmp al,65
Je Ad      
cmp al,97
je Ad    

cmp al,83
Je Su      
cmp al,115
je Su

jmp inv

Ad:
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, ad1
int 21h
 
add bl, bh     
sub bl, 30h  

mov dl, bl
mov ah, 2
int 21h 
jmp exit

Su:

mov ah,9     ;nl
lea dx,nl
int 21h


mov ah, 9
lea dx, su1
int 21h

sub bl, bh     
add bl, 30h  

mov dl, bl
mov ah, 2
int 21h 
jmp exit


inv:    
mov ah,9     ;nl
lea dx,nl
int 21h
mov ah, 9
lea dx, i
int 21h

exit:
mov ah, 4Ch
int 21h

main endp
end main

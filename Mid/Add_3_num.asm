.model small
.stack 100h
.data

e db 'Enter 3 number: $'  

ad1 db 'Addition is: $' 
 
i db 'Invalid input. Try Again!$'
nl db 10,13,'$'
.code
main proc
mov ax, @data
mov ds, ax


mov ah, 9
lea dx, e
int 21h

;first number  
num1:

mov ah, 1
int 21h   
mov bl, al

; Check digit
cmp al, 30h
jl inv1
cmp al, 39h  
jg inv1 
jl num2


inv1:    
mov ah,9     ;nl
lea dx,nl
int 21h
mov ah, 9
lea dx, i
int 21h  
mov ah,9     ;nl
lea dx,nl
int 21h
jmp num1


num2:

mov ah, 1
int 21h   


; Check digit
cmp al, 30h
jl inv2
cmp al, 39h  
jg inv2
jl add1

inv2:    
mov ah,9     ;nl
lea dx,nl
int 21h
mov ah, 9
lea dx, i
int 21h  
mov ah,9     ;nl
lea dx,nl
int 21h
jmp num2  

add1:  
add bl, al     
sub bl, 30h  

num3:
 

mov ah, 1
int 21h   


; Check digit
cmp al, 30h
jl inv3
cmp al, 39h  
jg inv3
jl res

inv3:    
mov ah,9     ;nl
lea dx,nl
int 21h
mov ah, 9
lea dx, i
int 21h  
mov ah,9     ;nl
lea dx,nl
int 21h
jmp num3


;result 
res:

 
add bl, al     
sub bl, 30h  


mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, ad1
int 21h
  
  
mov dl, bl
mov ah, 2
int 21h 
;jmp exit


exit:
mov ah, 4Ch
int 21h

main endp
end main

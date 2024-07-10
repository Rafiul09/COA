.model small
.stack 100h
.data

e db 'Enter 3 number: $'  
a db ?
b db ?
c db ?       

ad1 db 'Addition is: $' 
 
i db 'Invalid input. Try Again!$'
nl db 10,13,'$'
.code
main proc
mov ax, @data
mov ds, ax

mov cx, 0
mov ah, 9
lea dx, e
int 21h

;first number  
num:

mov ah, 1
int 21h   
;mov bl, al

; Check digit
cmp al, 30h
jl inv
cmp al, 39h  
jg inv

inc cx
cmp cx, 1
je stor  
jg nxt

stor:
mov bl, al
jmp num 

nxt:
 
add bl, al     
sub bl, 30h  

cmp cx,3
jl num


;result
mov ah,9     ;nl
lea dx,nl
int 21h

mov ah, 9
lea dx, ad1
int 21h
  
  
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
mov ah,9     ;nl
lea dx,nl
int 21h
jmp num

exit:
mov ah, 4Ch
int 21h

main endp
end main

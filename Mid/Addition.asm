.model small
.stack 100h
.data 

in1 db 'enter number 1: $'
in2 db 'enter number 2: $'  
pr1 db 'Addition of $'  

pr2 db ' AND $'
pr3 db ' is : $'

nl db 10,13,'$'


.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9     ;disp db enter number 1: 
    lea dx,in1
    int 21h
    
    mov ah,1     ;inp 1
    int 21h
    mov bh,al 
    
    mov ah,2     ;nl
    mov dl,10
    int 21h
    mov dl,13
    int 21h   
    
    mov ah,9     ;disp db  enter number 2: 
    lea dx,in2
    int 21h
    
    mov ah,1     ;inp 2
    int 21h
    mov bl,al
          
    mov ah,9     ;nl
    lea dx,nl
    int 21h
      
    
    mov ah,9     ;disp db Addition of 
    lea dx,pr1
    int 21h
    
    
    
    mov ah,2     ;disp  in1
    mov dl,bh
    int 21h 
       
    
    mov ah,9     ;disp db and
    lea dx,pr2
    int 21h
   
    mov ah,2     ;disp   inp2
    mov dl,bl
    int 21h 
    
    mov ah,9     ;disp db is 
    lea dx,pr3
    int 21h   
    
 
    
    add bh,bl    ;add
    sub bh,30h
    
    mov ah, 2    ;disp res
    mov dl,bh
    int 21h  
    
    mov ah,4ch
    int 21h
    main endp
end main

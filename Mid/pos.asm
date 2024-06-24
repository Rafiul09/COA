
.MODEL small
.STACK 100h
.DATA   
in1 db 'enter value: $'
nl db 10,13,'$'


.CODE
    MAIN PROC  
        
       mov ax,@data
       mov ds,ax  
       
       mov ah,9     ;disp db enter number 1: 
       lea dx,in1
       int 21h 
             
    
       mov ah,1
       int 21h 
       mov bl,al
       cmp bl,30h
       jg pos        
       jl nega
             
       pos:
       mov ah,1
       mov dl,'p'
       int 21h       
       jmp EXIT  
       
       nega:
       mov ah,1
       mov dl,'n'
       int 21h
       jmp EXIT  
       
      
       
    EXIT:     
        MOV AH, 4Ch     
        INT 21h 
           
       
    MAIN ENDP
    
    END MAIN
    
    
    
    
    
    
    
    

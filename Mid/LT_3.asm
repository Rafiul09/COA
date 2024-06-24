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
                
       mov ah,9     ;nl
       lea dx,nl
       int 21h   
       
       cmp al,31h
       je odd      
       cmp al,33h
       je odd
       
       cmp al,32h
       je even       
       cmp al,34h
       je even   
       
       jmp inv
             
       odd:
       mov ah,2
       mov dl,'O'
       int 21h
       
       jmp EXIT  
       
       even:
       mov ah,2
       mov dl,'e'
       int 21h
       jmp EXIT  
       
       inv: 
       
       mov ah,2
       mov dl,'i'
       int 21h
       
    EXIT:     
        MOV AH, 4Ch     
        INT 21h 
           
       
    MAIN ENDP
    
    END MAIN
    
    
    
    
    
    
    
    

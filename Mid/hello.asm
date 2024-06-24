.MODEL small
.STACK 100h
.DATA   
in0 db 'Hello Jan $'  
in1 db 'Bye Jan $'



nl db 10,13,'$'


.CODE
    MAIN PROC  
        
       mov ax,@data
       mov ds,ax  
       mov cx, 10
       
       print:    
       mov ah,9     ;nl
       lea dx,nl
       int 21h   
       mov ah,9    
       lea dx,in0
       int 21h   
       dec cx
       cmp cx,0
       jg print 
       mov ah,9     ;nl
       lea dx,nl
       int 21h
       mov ah,9    
       lea dx,in1
       int 21h  
      
    
    
       
    EXIT:     
        MOV AH, 4Ch     
        INT 21h 
           
       
    MAIN ENDP
    
    END MAIN
    
    
    
    
    
    
    
    

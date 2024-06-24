.MODEL small
.STACK 100h
.DATA   
in0 db 'Options:',10,13, '1. Name',10,13, '2. Depertment',10,13, '3. Semester',10,13, '4. ID',10,13, '5. CGPA',10,13,'Enter Your Choice: $'  
in6 db ' Invalid Choice $'

ot1 db '1. Name: Rafiul $'
ot2 db '2. Depertment: CSE $'
ot3 db '3. Semester: 11th$'
ot4 db '4. ID: 21-44631-1 $'
ot5 db '5. CGPA: 4 $' 


nl db 10,13,'$'


.CODE
    MAIN PROC  
        
       mov ax,@data
       mov ds,ax  
       
       mov ah,9    
       lea dx,in0
       int 21h 
  
       
      
    
       mov ah,1
       int 21h
       
       
       cmp al,31h
       Je nam      
       cmp al,32h
       je dep
       cmp al,33h
       je sem       
       cmp al,34h
       je id
       cmp al,35h
       je cgpa     
       
       jmp inv
             
       nam:  
       mov ah,9     ;nl
       lea dx,nl
       int 21h 
       mov ah,9    
       lea dx,ot1
       int 21h   
       
       
       jmp EXIT  
       
       dep:
       mov ah,9     ;nl
       lea dx,nl
       int 21h 
       mov ah,9    
       lea dx,ot2
       int 21h   
       
       jmp EXIT  
       
       sem: 
       mov ah,9     ;nl
       lea dx,nl
       int 21h 
       mov ah,9    
       lea dx,ot3
       int 21h
            
       jmp EXIT  
       
       id:
       mov ah,9     ;nl
       lea dx,nl
       int 21h 
       mov ah,9    
       lea dx,ot4
       int 21h
            
       jmp EXIT  
       
       cgpa: 
        mov ah,9     ;nl
       lea dx,nl
       int 21h        
       mov ah,9    
       lea dx,ot5
       int 21h  
       
       
        
       
       inv: 
       mov ah,9     ;nl
       lea dx,nl
       int 21h   
       mov ah,9    
       lea dx,in6
       int 21h  
        
       
    EXIT:     
        MOV AH, 4Ch     
        INT 21h 
           
       
    MAIN ENDP
    
    END MAIN
    
    
    
    
    
    
    
    

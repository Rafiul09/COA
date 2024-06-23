.MODEL small
.STACK 100h

.DATA
    ; Define any data variables if needed

.CODE
    MAIN PROC
    
        ; Initialize AL with FFh
        MOV AL, 00FFh   ; Move FFh into AL
        
        ; Increment AL
        INC AL         ; Increment AL by 1
        
       
        
        ; Terminate the program
        MOV AH, 4Ch    ; DOS function: exit program
        INT 21h        ; Call DOS interrupt
        
    MAIN ENDP
    
    END MAIN

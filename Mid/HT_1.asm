.MODEL small
.STACK 100h

.DATA
    ; Define any data variables if needed

.CODE
    MAIN PROC
    
        ; Initialize AX and BX with the values
        MOV AX, 8000h   ; Move 800h into AX
        MOV BX, 0001h   ; Move 0001h into BX
        
        ; Perform the subtraction
        SUB AX, BX      ; Subtract BX from AX
        
        ; Here you can add more instructions if needed
        
        ; Terminate the program
        MOV AH, 4Ch     ; DOS function: exit program
        INT 21h         ; Call DOS interrupt
        
    MAIN ENDP
    
    END MAIN

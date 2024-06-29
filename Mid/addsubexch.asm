.model small
.stack 100h
.data
msgResult db 10,13,'After swapping: $'
output1 db 10,13,'First number: $'
output2 db 10,13,'Second number: $'
num1 db ?   ; Variable to store first number (1 byte)
num2 db ?   ; Variable to store second number (1 byte)

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Initialize AX and BX with ASCII values for '52' and '30'
    mov ax, 3532h   ; '52'
    ; AH = 35h, AL = 32h
    mov bx, 3330h   ; '30'
    ; BH = 33h, BL = 30h

    ; Subtract BL from AH
    sub ah, bl      ; AH = 35h - 30h
    add ah, 30h 
    ; Add BH to AL
    add al, bh      ; AL = 32h + 33h
    sub al, 30h       ;ax= 35h35h
    mov cx, bx      ; Use CX as temporary register
    mov bx, ax
    mov ax, cx

    ; Store back to variables
    mov num1, ah    ; Store AH (first number)
    mov num2, bh    ; Store BH (second number)

    ; Display result
    mov ah, 9
    lea dx, msgResult
    int 21h

    ; Display first number
    mov ah, 9
    lea dx, output1
    int 21h
    mov dl, num1    ; Move num1 into DL (AH)   
    mov ah, 2       ; AH = 2 (DOS function to display character)
    int 21h  
 
    ;---   
     
    mov num1, cl    
    mov ah, 9   
    int 21h
    mov dl, num1      
    mov ah, 2       ; AH = 2 (DOS function to display character)
    int 21h

    ; Display second number
    mov ah, 9
    lea dx, output2
    int 21h
    mov dl, num2    ; Move num2 into DL (BH)
    mov ah, 2       ; AH = 2 (DOS function to display character)
    int 21h
     
     
    ;---
     
    mov num2, bl    
    mov ah, 9   
    int 21h
    mov dl, num2  
    mov ah, 2       ; AH = 2 (DOS function to display character)
    int 21h
     
    ; Terminate program
    mov ah, 4Ch
    int 21h

main endp
end main

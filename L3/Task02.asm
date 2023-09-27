.MODEL SMALL
 
.STACK 100H

.DATA 

;variables  

a db "Please enter first input: $"
b db "Please enter second input: $"
c db "Sum of the two inputs: $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 9
LEA DX, a
INT 21h
MOV AH, 1
INT 21h
MOV BL, AL  

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, b
INT 21h
MOV AH, 1
INT 21h
ADD BL, AL

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, c
INT 21h
MOV AH, 2
MOV DL, BL
SUB DL, 030h
INT 21h
 
;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




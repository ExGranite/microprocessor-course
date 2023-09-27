.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

a db "Enter your 3 initials: $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

;Task 06, Part b, c

MOV AH, 9
LEA DX, a
INT 21h

MOV AH, 1
INT 21h
MOV BL, AL

MOV AH, 1
INT 21h
MOV BH, AL

MOV AH, 1
INT 21h    
MOV CL, AL 

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV DL, BL
INT 21h

MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV DL, BH
INT 21h

MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV DL, CL
INT 21h 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




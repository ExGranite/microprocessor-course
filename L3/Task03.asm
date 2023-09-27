.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

a db "Enter an uppercase letter: $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here
       
;Task 03, Part b       
       
MOV AH, 9
LEA DX, a
INT 21h
MOV AH, 1
INT 21h     

MOV AH, 2
MOV DL, AL
ADD DL, 020h
INT 21h

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




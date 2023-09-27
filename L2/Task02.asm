.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
;enter your code here

;initial values

MOV AL, 5
MOV AH, 10

;swap using maximum 3 registers

MOV BL, AL
MOV AL, AH
MOV AH, BL

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




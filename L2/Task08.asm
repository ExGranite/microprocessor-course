.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
;Enter your code here 

;Task 08, Part 4

MOV AX, 0C2A2h
MOV BX, 0ABCDh 
MUL BX              
MOV BX, 0BEDh
DIV BX

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




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

;Let, X = AX, Y = BH, Z = BL

;setting initial values

MOV AX, 3
MOV BH, 5
MOV BL, 10

;Task 07, Part 3

MUL BH   ;X*Y
DIV BL   ;X*Y/Z 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




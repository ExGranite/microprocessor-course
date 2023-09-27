.MODEL SMALL
 
.STACK 100H

.DATA 

;variables 

e db "Even$"
o db "Odd$"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 1
int 21h
MOV AH , 0
MOV bl ,2

CMP AL, 0 
JE even
    
DIV BL
CMP AH, 0
JE even
    
LEA DX, o 
MOV AH, 9 
INT 21h
JMP exit 
    
even:  
LEA DX,e 
mov AH,9 
int 21h 
    
exit: 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV CX, 100
MOV BX, 5
MOV AX, CX

start:
SUB CX, BX
ADD AX, CX
CMP CX, 5
JG start

 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




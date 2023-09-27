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

MOV CX, 5

start:
MOV AH, 1
INT 21h
loop start 

MOV AH, 2
MOV DL, 0Dh
INT 21h
         
MOV CX, 5

restart:
MOV DX, 78h
INT 21h
loop restart

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




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

MOV AH, 1
INT 21h

CMP AL, 34h
JL printi

CMP AL, 37h
JL printk

CMP AL, 39h
JLE printl

JMP printm

printi:
MOV AH, 2
MOV DL, 069h
INT 21h
JMP exit

printk:
MOV AH, 2
MOV DL, 06Bh
INT 21h 
JMP exit

printl:
MOV AH, 2
MOV DL, 06Ch
INT 21h 
JMP exit

printm:
MOV AH, 2
MOV DL, 06Dh
INT 21h 
JMP exit

exit:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




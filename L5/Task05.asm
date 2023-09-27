.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

space db " $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV BX, 80h

start:

MOV CX, 10

line:

MOV AH, 2
MOV DX, BX
INT 21h
INC BX       

MOV AH, 9
LEA DX, space
INT 21h

CMP BX, 0FFh
JG end

loop line

MOV AH, 2
MOV DX, 0Ah
INT 21h
MOV DX, 0Dh
INT 21h

CMP BX, 0FFh
JL start

end:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




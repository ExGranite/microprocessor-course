.MODEL SMALL
 
.STACK 100H

.DATA 

;variables    
input db "Please input a number: $"
result db 10, 13, "The factor(s) of your input is/are: $"  
sep db ", $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

LEA DX, input
MOV AH, 9
INT 21h
MOV AH, 1
INT 21H

MOV BH, AL
MOV BL, AL

MOV CX, 0

factorloop:
CMP BL, 31h
JL continue
MOV AH, 0
MOV AL, BH
SUB AL, 30h
MOV DL, BL
SUB DL, 30h
DIV DL
CMP AH, 0h
JE push
DEC BL
JMP factorloop

push: 
PUSH BX
INC CX      
DEC BL
JMP factorloop:
           
continue:
LEA DX, result
MOV AH, 9
INT 21h 

MOV AH, 2
POP DX
INT 21h

newloop:
CMP SP, 100h
JE exit 
MOV AH, 9
LEA DX, sep
INT 21h 
MOV AH, 2
POP DX
INT 21h
JMP newloop         
           
exit:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




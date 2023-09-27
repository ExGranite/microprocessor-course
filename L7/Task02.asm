.MODEL SMALL
 
.STACK 100H

.DATA 

;variables
prompt db "Please enter a string: $"
result db 0DH, 0AH, "Your string in reverse order is: $"
crg db 13, "$"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here             

MOV AH, 9
LEA DX, prompt
INT 21h

MOV CX, 0

MOV AH, 1
INT 21h

input:
CMP AL, 0Dh
JE continue
MOV AH, 0
PUSH AX
INC CX
MOV AH, 1
INT 21h
JMP input

continue:

MOV AH, 9
LEA DX, crg
INT 21h
LEA DX, result
INT 21h

print:
MOV AH, 2
POP DX
INT 21h
loop print

 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




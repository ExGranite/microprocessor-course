.MODEL SMALL
 
.STACK 100H

.DATA 

;variables    
prompt db "Please input a number: $" 
result1 db 0DH, 0AH, "All digits are unique!$" 
result2 db 0DH, 0AH, "All digits are not unique!$" 
count dw 0


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

mainLoop:
POP AX     

CMP CX, 1
JE yes       
MOV count, CX
DEC count

loopStart:
CMP count, 0
JE go
POP DX     
CMP DX, AX
JE notUnique
DEC count
JMP loopStart

go:        
SUB SP, CX
SUB SP, CX
ADD SP, 2h
loop mainLoop         
    
yes:
MOV AH, 9
LEA DX, result1
INT 21h
JMP exit    
         
notUnique:
MOV AH, 9
LEA DX, result2
INT 21h
JMP exit

exit:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




.MODEL SMALL
 
.STACK 100H

.DATA 

;variables 

prompt db "Please input 5 numbers: $"
show db "Your input in ascending order is $"
array db 5 dp(?)

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 9
LEA DX, prompt
INT 21H       
       
MOV CX, 5
LEA SI, array

input:
MOV AH, 1
INT 21h
MOV [SI], AL
INC SI 
CMP CX, 1
JE continue
MOV AH, 2
MOV DX, 2Ch
INT 21h
loop input

continue:
    
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h
MOV AH, 9
LEA DX, show
INT 21H    
    
MOV BX, 0h

loop1:

CMP BX, 5h
JE go

MOV AL, array[BX]

MOV SI, BX
INC SI  

loop2:  

CMP SI, 5h
JE break

MOV AH, array[SI]
CMP AL, AH
JG exchange
INC SI 

loop loop2
         
loop loop1         
         
break:
INC BX
JMP loop1

exchange:
XCHG AL, AH 
MOV array[BX], AL
MOV array[SI], AH
INC SI
JMP loop2

go:

MOV CX, 5
LEA SI, array

output:
MOV AH, 2
MOV DL, [SI]
INT 21h
INC SI 
CMP CX, 1
JE end
MOV AH, 2
MOV DX, 2Ch
INT 21h
loop output

end:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




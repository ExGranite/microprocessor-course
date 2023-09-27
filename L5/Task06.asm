.MODEL SMALL
 
.STACK 100H

.DATA 

;variables
prompt db "ENTER A HEX DIGIT: $"
reprompt db "DO YOU WANT TO DO IT AGAIN?$"
answer db "IN DECIMAL IT IS $"
illegal db "ILLEGAL CHARACTER - ENTER 0 .. 9 OR A .. F: $"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

ask:

MOV AH, 9
LEA DX, prompt
INT 21h
MOV AH, 1
INT 21h
MOV BL, AL

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

continue:

JMP test

run:

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, reprompt
INT 21h
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h
MOV AH, 1
INT 21h
MOV CL, AL
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

CMP CL, 079h
JE ask

CMP CL, 059h
JE ask

JMP end

again:

MOV AH, 9
LEA DX, illegal
INT 21h
MOV AH, 1
INT 21h
MOV BL, AL

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JMP continue

test:

CMP BL, 030h
JL again

CMP BL, 039h
JLE ok       

CMP BL, 041h
JE A
CMP BL, 042h
JE B
CMP BL, 043h
JE C
CMP BL, 044h
JE D
CMP BL, 045h
JE E
CMP BL, 046h
JE F
JG again

ok:

MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, BL
INT 21h
JMP run

A:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h
MOV DL, 030h
INT 21h
JMP run

B:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h    
MOV DL, 031h
INT 21h
JMP run

C:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h   
MOV DL, 032h
INT 21h
JMP run

D:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h
MOV DL, 033h
INT 21h
JMP run

E:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h    
MOV DL, 034h
INT 21h
JMP run    

F:     
MOV AH, 9
LEA DX, answer
INT 21h
MOV AH, 2
MOV DL, 031h
INT 21h
MOV DL, 035h
INT 21h
JMP run


end: 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




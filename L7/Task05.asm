.MODEL SMALL
 
.STACK 100H

.DATA 

;variables
prompt db "Please enter your string: $"
result db 0Dh, 0Ah, "The string with letters reversed in each word: $"
count dw 0

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

LEA DX, prompt
MOV AH, 9
INT 21H

MOV CX, 0
MOV AH, 1

input: 
INT 21H 
CMP AL, 0Dh 
JE continue 
PUSH AX 
INC CX 
JMP input 

continue: 
MOV BX, 50h 
XCHG BX, SP 
MOV AX,20h 
PUSH AX 
XCHG BX, SP 
INC count 

loop1: 
POP DX 
XCHG BX, SP 
PUSH DX 
XCHG BX, SP 
INC count 
LOOP loop1 

LEA DX, result 
MOV AH, 9 
INT 21h

MOV CX, count 
MOV count, 0 

MOV AX,20h
PUSH AX 
INC count 

print: 
XCHG BX, SP 
POP DX 
XCHG BX, SP 
CMP DL, 20h
JNE exit 
MOV AH, 2 

loop2: 
POP DX 
INT 21h
DEC count 
JNZ loop2 
MOV DX, 20h

exit: 
PUSH DX 
INC count 
LOOP print 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  





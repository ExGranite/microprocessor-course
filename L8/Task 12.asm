.MODEL SMALL 
 
.STACK 100H

.DATA 

;variables
prompt db "Please enter a string: $"
result db 0DH, 0AH, "Your string in reverse order is: $"
crg db 13, "$"
count dw ?
store dw ?

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

MOV count, CX

MOV AH, 9
LEA DX, crg
INT 21h
LEA DX, result
INT 21h

CALL reverse

JMP extra

MAIN ENDP 

reverse PROC
    POP store
    print:
    CMP count, 0h
    JE exit
    MOV AH, 2
    POP DX
    INT 21h
    DEC count
    JMP print
    exit: 
    PUSH store
    RET
reverse ENDP

extra:
;exit to DOS 
               
MOV AX,4C00H
INT 21H 
     
    END MAIN
             
  




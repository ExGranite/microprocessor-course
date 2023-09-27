.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

a db "Saturday$"
b db "Sunday$"
c db "Monday$"
d db "Tuesday$"
e db "Wedday$"
f db "Thursday$"
g db "Friday$"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 1
INT 21h

CMP AL, 031h
JE printa
         
CMP AL, 032h
JE printb         

CMP AL, 033h
JE printc

CMP AL, 034h
JE printd

CMP AL, 035h
JE printe  

CMP AL, 036h
JE printf  

CMP AL, 036h
JE printg

JMP exit

printa:

MOV AH, 9
LEA DX, a
INT 21h
JMP exit

printb:

MOV AH, 9
LEA DX, b
INT 21h
JMP exit 

printc:

MOV AH, 9
LEA DX, c
INT 21h
JMP exit

printd:

MOV AH, 9
LEA DX, d
INT 21h
JMP exit

printe:

MOV AH, 9
LEA DX, e
INT 21h
JMP exit

printf:

MOV AH, 9
LEA DX, f
INT 21h
JMP exit

printg:

MOV AH, 9
LEA DX, g
INT 21h
JMP exit

exit:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




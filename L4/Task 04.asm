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
          
MOV AL, 1
;MOV AL, 2
;MOV AL, 3          
;MOV AL, 4

CMP AL, 1
JE printo

CMP AL, 3
JE printo

CMP AL, 2
JE printe

CMP AL, 4
JE printe

printo:

MOV AH, 2
MOV DL, 06Fh
INT 21h
JMP exit

printe:

MOV AH, 2
MOV DL, 065h
INT 21h
JMP exit

exit:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
;enter your code here
             
;Let, A = AL, B = AH, C = BL             

;Setting initial value
             
MOV AX, 5   
MOV BX, 10  

;Task 06, Part 3

INC AH        ;B+1
ADD AL, AH    ;A+(B+1)
MOV BL, AL    ;C = A+(B+1)

;Task 06, Part 3

DEC AL        ;A-1
SUB AH, AL    ;B-(A-1)
MOV AL, AH    ;A = B-(A-1)

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




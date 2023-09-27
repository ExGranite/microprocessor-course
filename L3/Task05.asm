.MODEL SMALL
 
.STACK 100H

.DATA 

;variables
            
a db "Please enter a decimal digit less than 10: $"
aa db "Please enter another decimal digit less than 10: $"
b db "The sum of $"
c db " and $"            
d db " is $"
            
.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

;Task 05, Part b, c

MOV AH, 9
LEA DX, a
INT 21h
MOV AH, 1
INT 21h
MOV BL, AL  

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, aa
INT 21h
MOV AH, 1
INT 21h
MOV BH, AL

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, b
INT 21h

MOV AH, 2
MOV DL, BL
INT 21h

MOV AH, 9  
LEA DX, c
INT 21h

MOV AH, 2
MOV DL, BH
INT 21h

MOV AH, 9
LEA DX, d
INT 21h

MOV AH, 2
MOV DL, BL
ADD DL, BH
SUB DL, 030h
INT 21h

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




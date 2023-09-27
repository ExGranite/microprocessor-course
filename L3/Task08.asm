.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

a db "**********$"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

;Task 08

MOV AH, 9
LEA DX, a
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h
       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h       
       
MOV AH, 9
LEA DX, a
INT 21h       

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

max db " is Maximum$"
min db " is Minimum$"

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 1
INT 21h
MOV BH, AL
INT 21h
MOV BL, AL
INT 21h
MOV CL, AL

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

CMP BH, BL
JL p1: ; BH < BL

CMP BL, CL
JL p2 ;bl < cl

;cl is minimum
MOV DL, CL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, min
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JL p3        

      
p3:
;BH is maximum
MOV DL, BH
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, max
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h
 
JMP exit     

p2:
;bl is minimum
MOV DL, BL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, min
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

CMP BH, CL
JL p4

;bh is maximum
MOV DL, BH
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, max
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JMP exit:

p1:;bh<bl

CMP BH, CL
JL FlessthanT

;cl is mimimum
MOV DL, CL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, min
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JMP p5    

FlessthanT:
; bh is minimum
MOV DL, BH
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, min
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

CMP CL, BL
JL p5

;cl is maximum
MOV DL, CL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, max
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JMP exit:

p5:
;bl is maximum
MOV DL, BL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, max
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

JMP exit

p4:
;cl is maximum
MOV DL, CL
MOV AH, 2
INT 21h
MOV AH, 9
LEA DX, max
INT 21h

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

exit:
            

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




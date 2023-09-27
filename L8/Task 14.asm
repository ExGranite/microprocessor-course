.MODEL SMALL 
 
.STACK 100H

.DATA 

;variables

prompt db "Please input 3 numbers: $"
show db 0Ah, 0Dh, "Your maximum input is $"
array db 3 dp(?)   

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here
       
MOV AH, 9
LEA DX, prompt
INT 21H       
       
MOV CX, 3
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

CALL maxNumber      

JMP extra

MAIN ENDP 

maxNumber PROC 
    MOV AH, 9
    LEA DX, show
    INT 21H 

    LEA SI, array 
    MOV BH, [SI]
    INC SI      
    MOV BL, [SI]
    INC SI
    MOV CL, [SI]
    
    MOV AH, 2

    CMP BH, BL
    JL newRoute
    CMP BH, CL
    JL clMax
    MOV DL, BH
    INT 21h
    JMP end

    clMax: 
    MOV DL, CL
    INT 21h
    JMP end

    newRoute:
    CMP BL, CL
    JL clMax
    MOV DL, BL
    INT 21h
    JMP end

    end:            
    RET
maxNumber ENDP    

extra:  

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

    END MAIN 
  




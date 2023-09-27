.MODEL SMALL        

factorial MACRO varA
    MOV AL, varA
    MOV temp, varA
    SUB temp, 30h
    SUB AL, 30h
    loopStart:
    DEC temp
    CMP temp, 0
    JE exit
    MUL temp    
    JMP loopStart
    exit:
    ADD AL, 30h   
ENDM
 
.STACK 100H

.DATA 

;variables   

prompt dw "Please enter a number: $"       
result dw 0Ah, 0Dh, "The factorial of your input is: $"  
temp db ?

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AH, 9
LEA DX, prompt
INT 21h 

MOV AH, 1
INT 21h

MOV AH, 0
MOV BL, AL

MOV AH, 9
LEA DX, result
INT 21h

factorial BL
          
MOV DX, AX
MOV AH, 2
INT 21h         
;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




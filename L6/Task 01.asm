.MODEL SMALL
 
.STACK 100H

.DATA 

;variables   

prompt db "Please enter the length of your name: $"
namePrompt db "Please enter your name: $"
show db "The name you entered is $" 
size dw ? 
array dw size dup(?)

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
SUB AL, 30h

MOV size, AX

MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, namePrompt
INT 21h

MOV AH, 1
MOV CX, size
LEA SI, array

loopInput:
INT 21h
MOV [SI], AX
INC SI
loop loopInput

continue:         
MOV AH, 2
MOV DL, 0Ah
INT 21h
MOV DL, 0Dh
INT 21h

MOV AH, 9
LEA DX, show
INT 21h

MOV AH, 2   
MOV CX, size
LEA SI, array

loopOutput:    
MOV DX, [SI]
INT 21h
INC SI
loop loopOutput

end:

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  




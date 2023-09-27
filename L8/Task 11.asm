.MODEL SMALL        

.STACK 100H

.DATA 

;variables   

prompt dw "Please enter a number: $"       
result dw 0Ah, 0Dh, "The factorial of your input is: $"  
temp db ?    
varA db ?

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
                  
CALL factorial
          
MOV DX, AX
MOV AH, 2
INT 21h      

JMP end 

MAIN ENDP       

factorial PROC
    MOV AL, BL
    MOV temp, BL
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
    RET
factorial ENDP   

end:   

;exit to DOS 
               
MOV AX,4C00H
INT 21H
 
    END MAIN 
  




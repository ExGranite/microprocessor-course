.MODEL SMALL
 
.STACK 100H

.DATA 

;variables

prompt  DB  'ENTER A STRING OF CAPITAL LETTERS: $'
reprompt  DB  0DH,0AH,'THE LONGEST CONSECUTIVELY INCREASING STRING IS: $'
invalid   DB  0DH,0AH,'INVALID DTRING. TRY AGAIN: $'

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here
                           
MOV AH, 9
LEA DX, prompt             
INT 21H

JMP start

again:   
         
MOV AH, 9
LEA DX, invalid
INT 21H

start:                  
                                   
MOV AH, 1               
INT 21H                 

;CMP AL, 0DH             
;JE again                

CMP AL, 41H             
JB again                

CMP AL, 5AH             
JA again                

MOV BL, AL  
MOV BH, AL  
MOV DH, AL  
MOV DL, 1   
MOV CL, 1   

input:      
INT 21H     

CMP AL, 0DH
JE endinput

CMP AL, 41H 
JB again    

CMP AL, 5AH 
JA again    

INC BL      

CMP AL, BL    
JNE check     

INC CL        
JMP input     

check:        

CMP CL, DL    
JLE skip      

MOV DH, BH    
MOV DL, CL    

skip:         

MOV BH, AL    
MOV BL, AL    
MOV CL, 1     
JMP input     

endinput:     

CMP CL, DL    
JLE reskip    

MOV DH, BH    
MOV DL, CL    

reskip:       

MOV BX, DX              

MOV AH, 9           
LEA DX, reprompt    
INT 21H

XOR CX, CX          
MOV CL, BL          

MOV DL, BH          
MOV AH, 2           

output:             
INT 21H             
INC DL              
LOOP output         

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN

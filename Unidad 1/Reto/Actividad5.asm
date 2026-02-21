
@5
D=A 
@i
M=D
@0
D=A // D = acumulador

(LOOP)
@12
D=M
@i 
D=D+M // acumulador = acumulador + contador
M=M-1 // se le va a restar 1 al contador por cada ciclo
@12
M=D
@i 
D=M
@END
D;JEQ
@LOOP

(END)
0;JMP

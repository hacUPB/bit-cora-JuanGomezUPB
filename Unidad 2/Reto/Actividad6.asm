@100
D=A
@arr
M=D
 
@j
M=1

@sum 
M=0
 
(LOOP)
@j
D=M
 
@arr
A=M
M=D 
D=D+1
@j
M=D
 
@10
D=D-A
@SUMA
D;JGT
 
@arr
D=M
D=D+1
M=D
@LOOP
0;JMP

(SUMA)
@sum 
D=M
@arr
A=M
D=D+M

@sum
M=D

@arr        
D=M
M=D-1
D=M
@100
D=D-A 
@SUMA
D;JGE
@END
0;JMP

(END)
0;JMP
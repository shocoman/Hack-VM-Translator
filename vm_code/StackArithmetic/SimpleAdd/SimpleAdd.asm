
// *************** Push(Constant, "7")
// D = mem[ op_type + num ]
@7
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "8")
// D = mem[ op_type + num ]
@8
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Add

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
@R5
M=D

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
@R5
D=M+D

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

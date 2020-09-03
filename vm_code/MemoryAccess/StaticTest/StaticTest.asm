
// *************** Push(Constant, "111")
// D = 111
@111
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "333")
// D = 333
@333
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "888")
// D = 888
@888
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Static, "8")
// mem[ op_type + num ] = D
@16
A=M
D=A
@8
D=D+A
@R5
M=D

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
@R5
A=M
M=D

// *************** Pop(Static, "3")
// mem[ op_type + num ] = D
@16
A=M
D=A
@3
D=D+A
@R5
M=D

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
@R5
A=M
M=D

// *************** Pop(Static, "1")
// mem[ op_type + num ] = D
@16
A=M
D=A
@1
D=D+A
@R5
M=D

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
@R5
A=M
M=D

// *************** Push(Static, "3")
// D = mem[ op_type + num ]
@16
A=M
D=A
@3
A=D+A
D=M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Static, "1")
// D = mem[ op_type + num ]
@16
A=M
D=A
@1
A=D+A
D=M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Sub

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
D=D-M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Static, "8")
// D = mem[ op_type + num ]
@16
A=M
D=A
@8
A=D+A
D=M

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
D=D+M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

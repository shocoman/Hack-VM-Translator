
// *************** Push(Constant, "10")
// D = 10
@10
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Local, "0")
// mem[ op_type + num ] = D
@LCL
A=M
D=A
@0
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

// *************** Push(Constant, "21")
// D = 21
@21
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "22")
// D = 22
@22
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Argument, "2")
// mem[ op_type + num ] = D
@ARG
A=M
D=A
@2
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

// *************** Pop(Argument, "1")
// mem[ op_type + num ] = D
@ARG
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

// *************** Push(Constant, "36")
// D = 36
@36
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(This, "6")
// mem[ op_type + num ] = D
@THIS
A=M
D=A
@6
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

// *************** Push(Constant, "42")
// D = 42
@42
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "45")
// D = 45
@45
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(That, "5")
// mem[ op_type + num ] = D
@THAT
A=M
D=A
@5
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

// *************** Pop(That, "2")
// mem[ op_type + num ] = D
@THAT
A=M
D=A
@2
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

// *************** Push(Constant, "510")
// D = 510
@510
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Temp, "6")
// mem[ op_type + num ] = D
@R5
D=A
@6
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

// *************** Push(Local, "0")
// D = mem[ op_type + num ]
@LCL
A=M
D=A
@0
A=D+A
D=M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(That, "5")
// D = mem[ op_type + num ]
@THAT
A=M
D=A
@5
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

// *************** Push(Argument, "1")
// D = mem[ op_type + num ]
@ARG
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

// *************** Push(This, "6")
// D = mem[ op_type + num ]
@THIS
A=M
D=A
@6
A=D+A
D=M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(This, "6")
// D = mem[ op_type + num ]
@THIS
A=M
D=A
@6
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

// *************** Push(Temp, "6")
// D = mem[ op_type + num ]
@R5
D=A
@6
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

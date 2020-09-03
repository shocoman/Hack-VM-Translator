
// *************** Push(Constant, "3030")
// D = 3030
@3030
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Pointer, "0")
// mem[ op_type + num ] = D
@THIS
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

// *************** Push(Constant, "3040")
// D = 3040
@3040
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(Pointer, "1")
// mem[ op_type + num ] = D
@THAT
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

// *************** Push(Constant, "32")
// D = 32
@32
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(This, "2")
// mem[ op_type + num ] = D
@THIS
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

// *************** Push(Constant, "46")
// D = 46
@46
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Pop(That, "6")
// mem[ op_type + num ] = D
@THAT
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

// *************** Push(Pointer, "0")
// D = mem[ op_type + num ]
@THIS
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

// *************** Push(Pointer, "1")
// D = mem[ op_type + num ]
@THAT
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

// *************** Push(This, "2")
// D = mem[ op_type + num ]
@THIS
A=M
D=A
@2
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

// *************** Push(That, "6")
// D = mem[ op_type + num ]
@THAT
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

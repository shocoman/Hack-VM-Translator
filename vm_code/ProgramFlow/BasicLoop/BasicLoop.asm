
// *************** Push(Constant, "0")
// D = 0
@0
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

// *************** Label("LOOP_START")
(LOOP_START)
// *************** Push(Argument, "0")
// D = mem[ op_type + num ]
@ARG
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

// *************** Push(Argument, "0")
// D = mem[ op_type + num ]
@ARG
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

// *************** Push(Constant, "1")
// D = 1
@1
D=A

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

// *************** Pop(Argument, "0")
// mem[ op_type + num ] = D
@ARG
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

// *************** Push(Argument, "0")
// D = mem[ op_type + num ]
@ARG
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

// *************** IfGoto("LOOP_START")

// POP D
@SP
M=M-1
@SP
A=M
D=M
  
@LOOP_START 
D; JNE
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

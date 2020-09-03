
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

// *************** Pop(That, "0")
// mem[ op_type + num ] = D
@THAT
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

// *************** Pop(That, "1")
// mem[ op_type + num ] = D
@THAT
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

// *************** Push(Constant, "2")
// D = 2
@2
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

// *************** Label("MAIN_LOOP_START")
(MAIN_LOOP_START)
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

// *************** IfGoto("COMPUTE_ELEMENT")

// POP D
@SP
M=M-1
@SP
A=M
D=M
  
@COMPUTE_ELEMENT 
D; JNE
// *************** Goto("END_PROGRAM")
@END_PROGRAM 
0; JMP
// *************** Label("COMPUTE_ELEMENT")
(COMPUTE_ELEMENT)
// *************** Push(That, "0")
// D = mem[ op_type + num ]
@THAT
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

// *************** Push(That, "1")
// D = mem[ op_type + num ]
@THAT
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

// *************** Goto("MAIN_LOOP_START")
@MAIN_LOOP_START 
0; JMP
// *************** Label("END_PROGRAM")
(END_PROGRAM)
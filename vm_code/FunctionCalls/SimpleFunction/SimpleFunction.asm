
//// *************** Function("SimpleFunction.test", "2") ***************
(SimpleFunction.test)
// init locals
D=0
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Local, "0") ***************
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
// 

//// *************** Push(Local, "1") ***************
// D = mem[ op_type + num ]
@LCL
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
// 

//// *************** Add ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
D=D+M

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Not ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

D=!D


// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Argument, "0") ***************
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
// 

//// *************** Add ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
D=D+M

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Argument, "1") ***************
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
// 

//// *************** Sub ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R5
D=D-M

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Return ***************
// backup return address
@LCL
D=M
@5
A=D-A
D=M
@R5
M=D

// save return value to ARG[0]

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@ARG
A=M
M=D

// backup old ARG
@ARG
D=M
@R6
M=D

// restore segments
// SP=LCL[0]
@LCL
D=M
@SP
M=D


// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@THAT  // restore THAT
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@THIS  // restore THIS
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@ARG  // restore ARG
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@LCL  // restore LCL
M=D

// restore SP // SP=ARG[0]
@R6
D=M+1
@SP
M=D

// return from function 
@R5
A=M
0; JMP

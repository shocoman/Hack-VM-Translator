// Bootstrap code
@256    // init SP 
D=A
@SP
M=D


@Sys.init$ret.0 
 D=A 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@LCL        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@ARG        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THIS       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THAT       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

// Reposition ARG = SP-5-nArgs
@SP 
D=M 
@5
D=D-A 
@0 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Sys.init // goto func_name 
0; JMP
(Sys.init$ret.0)

//// *************** Function("Main.fibonacci", "0") ***************
(Main.fibonacci)
// init locals
D=0
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

//// *************** Push(Constant, "2") ***************
// D = 2
@2
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Lt ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
D=D-M
@SUCC_CMP_4
D; JLT
D=0
@AFTER_CMP_4
0; JMP
(SUCC_CMP_4)
D=-1
(AFTER_CMP_4)

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** IfGoto("IF_TRUE") ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 
 
@IF_TRUE 
D; JNE
//// *************** Goto("IF_FALSE") ***************
@IF_FALSE 
0; JMP
//// *************** Label("IF_TRUE") ***************
(IF_TRUE)
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

//// *************** Return ***************
// backup return address
@LCL
D=M
@5
A=D-A
D=M
@R13
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
@R14
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
@R14
D=M+1
@SP
M=D

// return from function 
@R13
A=M
0; JMP

//// *************** Label("IF_FALSE") ***************
(IF_FALSE)
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

//// *************** Push(Constant, "2") ***************
// D = 2
@2
D=A

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

@R13
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
D=D-M

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Main.fibonacci", "1") ***************
@Main.fibonacci$ret.14 
 D=A 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@LCL        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@ARG        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THIS       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THAT       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

// Reposition ARG = SP-5-nArgs
@SP 
D=M 
@5
D=D-A 
@1 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Main.fibonacci // goto func_name 
0; JMP
(Main.fibonacci$ret.14)
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

//// *************** Push(Constant, "1") ***************
// D = 1
@1
D=A

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

@R13
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
D=D-M

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Main.fibonacci", "1") ***************
@Main.fibonacci$ret.18 
 D=A 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@LCL        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@ARG        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THIS       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THAT       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

// Reposition ARG = SP-5-nArgs
@SP 
D=M 
@5
D=D-A 
@1 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Main.fibonacci // goto func_name 
0; JMP
(Main.fibonacci$ret.18)
//// *************** Add ***************

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
M=D

// POP D
 @SP
 M=M-1
 @SP
 A=M
 D=M
// 

@R13
D=D+M

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
@R13
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
@R14
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
@R14
D=M+1
@SP
M=D

// return from function 
@R13
A=M
0; JMP

//// *************** Function("Sys.init", "0") ***************
(Sys.init)
// init locals
D=0
//// *************** Push(Constant, "4") ***************
// D = 4
@4
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Main.fibonacci", "1") ***************
@Main.fibonacci$ret.23 
 D=A 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@LCL        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@ARG        
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THIS       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

@THAT       
 D=M 
 
// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

// Reposition ARG = SP-5-nArgs
@SP 
D=M 
@5
D=D-A 
@1 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Main.fibonacci // goto func_name 
0; JMP
(Main.fibonacci$ret.23)
//// *************** Label("WHILE") ***************
(WHILE)
//// *************** Goto("WHILE") ***************
@WHILE 
0; JMP
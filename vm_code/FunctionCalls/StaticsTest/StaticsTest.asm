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

//// *************** Function("Class1.set", "0") ***************
(Class1.set)
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

//// *************** Pop(Static, "0") ***************
// mem[ op_type + num ] = D
@Class1.0
D=A
@0
D=D+A
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
A=M
M=D

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

//// *************** Pop(Static, "1") ***************
// mem[ op_type + num ] = D
@Class1.1
D=A
@0
D=D+A
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
A=M
M=D

//// *************** Push(Constant, "0") ***************
// D = 0
@0
D=A

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

//// *************** Function("Class1.get", "0") ***************
(Class1.get)
// init locals
D=0
//// *************** Push(Static, "0") ***************
// D = mem[ op_type + num ]
@Class1.0
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

//// *************** Push(Static, "1") ***************
// D = mem[ op_type + num ]
@Class1.1
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

//// *************** Function("Class2.set", "0") ***************
(Class2.set)
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

//// *************** Pop(Static, "0") ***************
// mem[ op_type + num ] = D
@Class2.0
D=A
@0
D=D+A
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
A=M
M=D

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

//// *************** Pop(Static, "1") ***************
// mem[ op_type + num ] = D
@Class2.1
D=A
@0
D=D+A
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
A=M
M=D

//// *************** Push(Constant, "0") ***************
// D = 0
@0
D=A

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

//// *************** Function("Class2.get", "0") ***************
(Class2.get)
// init locals
D=0
//// *************** Push(Static, "0") ***************
// D = mem[ op_type + num ]
@Class2.0
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

//// *************** Push(Static, "1") ***************
// D = mem[ op_type + num ]
@Class2.1
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
//// *************** Push(Constant, "6") ***************
// D = 6
@6
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Constant, "8") ***************
// D = 8
@8
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Class1.set", "2") ***************
@Class1.set$ret.28 
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
@2 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Class1.set // goto func_name 
0; JMP
(Class1.set$ret.28)
//// *************** Pop(Temp, "0") ***************
// mem[ op_type + num ] = D
@R5
D=A
@0
D=D+A
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
A=M
M=D

//// *************** Push(Constant, "23") ***************
// D = 23
@23
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Constant, "15") ***************
// D = 15
@15
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Class2.set", "2") ***************
@Class2.set$ret.32 
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
@2 
D=D-A 
@ARG 
M=D 

// LCL = SP 
@SP 
D=M 
@LCL
M=D 
@Class2.set // goto func_name 
0; JMP
(Class2.set$ret.32)
//// *************** Pop(Temp, "0") ***************
// mem[ op_type + num ] = D
@R5
D=A
@0
D=D+A
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
A=M
M=D

//// *************** Call("Class1.get", "0") ***************
@Class1.get$ret.34 
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
@Class1.get // goto func_name 
0; JMP
(Class1.get$ret.34)
//// *************** Call("Class2.get", "0") ***************
@Class2.get$ret.35 
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
@Class2.get // goto func_name 
0; JMP
(Class2.get$ret.35)
//// *************** Label("WHILE") ***************
(WHILE)
//// *************** Goto("WHILE") ***************
@WHILE 
0; JMP
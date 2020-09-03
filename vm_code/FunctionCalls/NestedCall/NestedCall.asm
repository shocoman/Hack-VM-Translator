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

//// *************** Function("Sys.init", "0") ***************
(Sys.init)
// init locals
D=0
//// *************** Push(Constant, "4000") ***************
// D = 4000
@4000
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "0") ***************
// mem[ op_type + num ] = D
@THIS
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

//// *************** Push(Constant, "5000") ***************
// D = 5000
@5000
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "1") ***************
// mem[ op_type + num ] = D
@THAT
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

//// *************** Call("Sys.main", "0") ***************
@Sys.main$ret.6 
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
@Sys.main // goto func_name 
0; JMP
(Sys.main$ret.6)
//// *************** Pop(Temp, "1") ***************
// mem[ op_type + num ] = D
@R5
D=A
@1
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

//// *************** Label("LOOP") ***************
(LOOP)
//// *************** Goto("LOOP") ***************
@LOOP 
0; JMP
//// *************** Function("Sys.main", "5") ***************
(Sys.main)
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

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Push(Constant, "4001") ***************
// D = 4001
@4001
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "0") ***************
// mem[ op_type + num ] = D
@THIS
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

//// *************** Push(Constant, "5001") ***************
// D = 5001
@5001
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "1") ***************
// mem[ op_type + num ] = D
@THAT
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

//// *************** Push(Constant, "200") ***************
// D = 200
@200
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Local, "1") ***************
// mem[ op_type + num ] = D
@LCL
A=M
D=A
@1
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

//// *************** Push(Constant, "40") ***************
// D = 40
@40
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Local, "2") ***************
// mem[ op_type + num ] = D
@LCL
A=M
D=A
@2
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

//// *************** Pop(Local, "3") ***************
// mem[ op_type + num ] = D
@LCL
A=M
D=A
@3
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

//// *************** Push(Constant, "123") ***************
// D = 123
@123
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Call("Sys.add12", "1") ***************
@Sys.add12$ret.22 
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
@Sys.add12 // goto func_name 
0; JMP
(Sys.add12$ret.22)
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

//// *************** Push(Local, "2") ***************
// D = mem[ op_type + num ]
@LCL
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
// 

//// *************** Push(Local, "3") ***************
// D = mem[ op_type + num ]
@LCL
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
// 

//// *************** Push(Local, "4") ***************
// D = mem[ op_type + num ]
@LCL
A=M
D=A
@4
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

//// *************** Function("Sys.add12", "0") ***************
(Sys.add12)
// init locals
D=0
//// *************** Push(Constant, "4002") ***************
// D = 4002
@4002
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "0") ***************
// mem[ op_type + num ] = D
@THIS
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

//// *************** Push(Constant, "5002") ***************
// D = 5002
@5002
D=A

// PUSH D
 @SP
 A=M
 M=D
 @SP
 M=M+1
// 

//// *************** Pop(Pointer, "1") ***************
// mem[ op_type + num ] = D
@THAT
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

//// *************** Push(Constant, "12") ***************
// D = 12
@12
D=A

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

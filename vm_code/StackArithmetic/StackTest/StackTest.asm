
// *************** Push(Constant, "17")
// D = 17
@17
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "17")
// D = 17
@17
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Eq

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
@SUCC_CMP_3
D; JEQ
D=0
@AFTER_CMP_3
0; JMP
(SUCC_CMP_3)
D=-1
(AFTER_CMP_3)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "17")
// D = 17
@17
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "16")
// D = 16
@16
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Eq

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
@SUCC_CMP_6
D; JEQ
D=0
@AFTER_CMP_6
0; JMP
(SUCC_CMP_6)
D=-1
(AFTER_CMP_6)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "16")
// D = 16
@16
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "17")
// D = 17
@17
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Eq

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
@SUCC_CMP_9
D; JEQ
D=0
@AFTER_CMP_9
0; JMP
(SUCC_CMP_9)
D=-1
(AFTER_CMP_9)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "892")
// D = 892
@892
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "891")
// D = 891
@891
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Lt

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
@SUCC_CMP_12
D; JLT
D=0
@AFTER_CMP_12
0; JMP
(SUCC_CMP_12)
D=-1
(AFTER_CMP_12)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "891")
// D = 891
@891
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "892")
// D = 892
@892
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Lt

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
@SUCC_CMP_15
D; JLT
D=0
@AFTER_CMP_15
0; JMP
(SUCC_CMP_15)
D=-1
(AFTER_CMP_15)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "891")
// D = 891
@891
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "891")
// D = 891
@891
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Lt

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
@SUCC_CMP_18
D; JLT
D=0
@AFTER_CMP_18
0; JMP
(SUCC_CMP_18)
D=-1
(AFTER_CMP_18)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32767")
// D = 32767
@32767
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32766")
// D = 32766
@32766
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Gt

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
@SUCC_CMP_21
D; JGT
D=0
@AFTER_CMP_21
0; JMP
(SUCC_CMP_21)
D=-1
(AFTER_CMP_21)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32766")
// D = 32766
@32766
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32767")
// D = 32767
@32767
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Gt

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
@SUCC_CMP_24
D; JGT
D=0
@AFTER_CMP_24
0; JMP
(SUCC_CMP_24)
D=-1
(AFTER_CMP_24)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32766")
// D = 32766
@32766
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "32766")
// D = 32766
@32766
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Gt

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
@SUCC_CMP_27
D; JGT
D=0
@AFTER_CMP_27
0; JMP
(SUCC_CMP_27)
D=-1
(AFTER_CMP_27)

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "57")
// D = 57
@57
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "31")
// D = 31
@31
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "53")
// D = 53
@53
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

// *************** Push(Constant, "112")
// D = 112
@112
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

// *************** Neg

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
D=!D
D=D+1

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** And

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
D=D&M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Push(Constant, "82")
// D = 82
@82
D=A

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Or

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
D=D|M

// PUSH D
@SP
A=M
M=D
@SP
M=M+1

// *************** Not

// POP D
@SP
M=M-1
@SP
A=M
D=M
 
D=!D


// PUSH D
@SP
A=M
M=D
@SP
M=M+1

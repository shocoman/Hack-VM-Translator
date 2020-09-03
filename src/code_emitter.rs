use crate::parser::{Expression, StackOpType};
use std::string::String;

const TEMP_ADDRESS_NAME: &str = "R13"; // Or mb R13-R15 - general purpose register?
const TEMP_ADDRESS_NAME2: &str = "R14";

const PUSH_D: &str = "\n// PUSH D\n \
                        @SP\n \
                        A=M\n \
                        M=D\n \
                        @SP\n \
                        M=M+1\n// \n";
const POP_D: &str = "\n// POP D\n \
                        @SP\n \
                        M=M-1\n \
                        @SP\n \
                        A=M\n \
                        D=M\n// \n";

fn emit_return_code() -> String {
    // restore ARG, LCL, THIS, THAT
    // put top stack to ARG[0]
    // SP = *ARG
    // jump to ret address
    /*
       // backup RET_ADDR
       @LCL
       D=M
       @5
       A=D-A
       D=M
       @{TMP}
       M=D

       // get ret value to arg[0]
       {POP_D}
       @ARG
       M=D



       // restore segments
       @LCL
       D=M
       @SP
       M=D

       {POP_D}
       @THAT
       M=D
       {POP_D}
       @THIS
       M=D
       {POP_D}
       @ARG
       M=D
       {POP_D}
       @LCL
       M=D

       // restore SP
       @ARG
       D=M+1
       @SP
       M=D

       // return SP
       @{TMP}
       0; JMP
    */

    /*

    // endFrame = LCL // endframe is a temporary variable
    @LCL
    D=M
    @{ENDFRAME}
    M=D

    retAddr = *(endFrame – 5) // gets the return address
    @ENDFRAME

    *ARG = pop() // repositions the return value for the caller
    SP = ARG + 1 // repositions SP of the caller
    THAT = *(endFrame – 1) // restores THAT of the caller
    THIS = *(endFrame – 2) // restores THIS of the caller
    ARG = *(endFrame – 3) // restores ARG of the caller
    LCL = *(endFrame – 4) // restores LCL of the caller
    goto retAddr // goes to the caller’s return address

     */

    return format!(
        "\n\
        // backup return address\n\
        @LCL\n\
        D=M\n\
        @5\n\
        A=D-A\n\
        D=M\n\
        @{TMP}\n\
        M=D\n\n\

        // save return value to ARG[0]\n\
        {POP_D}\n\
        @ARG\n\
        A=M\n\
        M=D\n\n\

        // backup old ARG\n\
        @ARG\n\
        D=M\n\
        @{TMP2}\n\
        M=D\n\n\


        // restore segments\n\
        // SP=LCL[0]\n\
        @LCL\n\
        D=M\n\
        @SP\n\
        M=D\n\n\


        {POP_D}\n\
        @THAT  // restore THAT\n\
        M=D\n\
        {POP_D}\n\
        @THIS  // restore THIS\n\
        M=D\n\
        {POP_D}\n\
        @ARG  // restore ARG\n\
        M=D\n\
        {POP_D}\n\
        @LCL  // restore LCL\n\
        M=D\n\n\

        // restore SP // SP=ARG[0]\n\
        @{TMP2}\n\
        D=M+1\n\
        @SP\n\
        M=D\n\n\

        // return from function \n\
        @{TMP}\n\
        A=M\n\
        0; JMP\n\
    ",
        TMP = TEMP_ADDRESS_NAME,
        TMP2 = TEMP_ADDRESS_NAME2,
        POP_D = POP_D
    );
}

fn emit_function_code(func_name: String, locals_num: String) -> String {
    let locals_num = locals_num.parse::<i32>().unwrap();

    // init locals
    /*
       ({func_name})
       for i in locals_num {
           D=0
           {PUSH_D}
       }
    */

    let mut result = format!(
        "\n({func_name})\n// init locals\nD=0",
        func_name = func_name
    );
    for _ in 0..locals_num {
        result.push_str(format!("{PUSH_D}", PUSH_D = PUSH_D).as_ref())
    }
    result
}

fn emit_call_code(func_name: String, args_num: String, num: i32) -> String {
    let ret_name = format!("{func_name}$ret.{num}", func_name = func_name, num = num);
    // push ARGS
    // push return address
    // push LCL, ARG, THIS, THAT
    // set new ARG address = SP - 5 - args_num
    // set LCL addr

    /*

       @{ret_name} \n D=M \n PUSH_D
       @LCL        \n D=M \n PUSH_D
       @ARG        \n D=M \n PUSH_D
       @THIS       \n D=M \n PUSH_D
       @THAT       \n D=M \n PUSH_D

       @SP \n D=M \n @5 \n D=D-A \n @{args_num} \n D=D-A \n @ARG \n M=D
       @SP \n D=M \n @LCL \n M=D

       ({ret_name})
    */

    return format!(
        "\n\
        @{ret_name} \n D=A \n {PUSH_D}\n\
        @LCL        \n D=M \n {PUSH_D}\n\
        @ARG        \n D=M \n {PUSH_D}\n\
        @THIS       \n D=M \n {PUSH_D}\n\
        @THAT       \n D=M \n {PUSH_D}\n\

        // Reposition ARG = SP-5-nArgs\n\
        @SP \nD=M \n@5\nD=D-A \n@{args_num} \nD=D-A \n@ARG \nM=D \n\n\
        // LCL = SP \n\
        @SP \nD=M \n@LCL\nM=D \n\

        @{func_name} // goto func_name \n\
        0; JMP\n\
        ({ret_name})",
        func_name=func_name,
        ret_name = ret_name,
        args_num = args_num,
        PUSH_D = PUSH_D
    );
}

pub fn emit_bootstrap_code() -> String {
    /*
       // init SP
       @256
       D=A
       @SP
       M=D

       // call sys.init

    */

    format!(
        "// Bootstrap code\n\
            @256    // init SP \n\
            D=A\n\
            @SP\n\
            M=D\n\n\
            {call_sys_init}\n\
            ",
        call_sys_init = emit_call_code("Sys.init".to_string(), "0".to_string(), 0)
    )
}

pub fn emit_code(e: Expression, counter: i32, file_name: String) -> String {

    let write_value_into_d = |mut address: StackOpType, mut offset: String, file_name: String| {
        let address_pointer = match address {
            StackOpType::Temp | StackOpType::Pointer | StackOpType::Static => "",
            _ => "A=M\n",
        };

        if let StackOpType::Pointer = address {
            address = if offset == "0" {
                StackOpType::This
            } else {
                StackOpType::That
            };
            offset = "0".to_string();
        }

        let mut label_name;
        if let StackOpType::Static = address {
            label_name = format!("{}.{}", file_name, offset);
            offset = "0".to_string();
        } else {
            label_name = address.to_string()
        };

        match address {
            StackOpType::Constant => format!(
                "// D = {offset}\n\
                    @{offset}\n\
                    D=A",
                offset = offset
            ),
            _ => format!(
                "// D = mem[ op_type + num ]\n\
                    @{address}\n\
                    {address_pointer}\
                    D=A\n\
                    @{offset}\n\
                    A=D+A\n\
                    D=M",
                address = label_name,
                offset = offset,
                address_pointer = address_pointer,
            ),
        }
    };

    let write_d_in_memory = |mut address: StackOpType, mut offset: String, file_name: String| {
        let address_pointer = match address {
            StackOpType::Temp | StackOpType::Pointer | StackOpType::Static => "",
            _ => "A=M\n",
        };

        if let StackOpType::Pointer = address {
            address = if offset == "0" {
                StackOpType::This
            } else {
                StackOpType::That
            };
            offset = "0".to_string();
        }

        let mut label_name;
        if let StackOpType::Static = address {
            label_name = format!("{}.{}", file_name, offset);
            offset = "0".to_string();
        } else {
            label_name = address.to_string()
        };


        format!(
            "// mem[ op_type + num ] = D\n\
            @{address}\n\
            {address_pointer}\
            D=A\n\
            @{offset}\n\
            D=D+A\n\
            @{tmp}\n\
            M=D\n\
            {POP_D}\n\
            @{tmp}\n\
            A=M\n\
            M=D\n\
            ",
            POP_D = POP_D,
            address = label_name,
            offset = offset,
            address_pointer = address_pointer,
            tmp = TEMP_ADDRESS_NAME,
        )
    };

    let cmp_code = |cmp_type| {
        let compare_type = match cmp_type {
            Expression::Eq => "JEQ",
            Expression::Lt => "JLT",
            Expression::Gt => "JGT",
            _ => unreachable!(),
        };
        format!(
            "{POP_D}\n\
            @{tmp}\n\
            M=D\n\

            {POP_D}\n\

            @{tmp}\n\
            D=D-M\n\

            @SUCC_CMP_{id}\n\
            D; {cmp}\n\
            D=0\n\

            @AFTER_CMP_{id}\n\
            0; JMP\n\

            (SUCC_CMP_{id})\n\
            D=-1\n\

            (AFTER_CMP_{id})\n\
            {PUSH_D}",
            PUSH_D = PUSH_D,
            POP_D = POP_D,
            tmp = TEMP_ADDRESS_NAME,
            cmp = compare_type,
            id = counter
        )
    };

    let neg_not = |op_type| {
        let inc_op = if let Expression::Neg = op_type {
            "D=D+1"
        } else {
            ""
        };

        format!(
            "{POP_D}\n\
             D=!D\n\
             {inc_op}\n\
             {PUSH_D}",
            PUSH_D = PUSH_D,
            POP_D = POP_D,
            inc_op = inc_op
        )
    };

    let binary_op = |op_type| {
        let sign = match op_type {
            Expression::Add => "+",
            Expression::Sub => "-",
            Expression::Or => "|",
            Expression::And => "&",
            _ => unreachable!(),
        };

        format!(
            "{POP_D}\n\
             @{tmp}\n\
             M=D\n\
             {POP_D}\n\
             @{tmp}\n\
             D=D{sign}M\n\
             {PUSH_D}",
            PUSH_D = PUSH_D,
            POP_D = POP_D,
            tmp = TEMP_ADDRESS_NAME,
            sign = sign
        )
    };

    match e {
        Expression::None => unreachable!(),
        Expression::Push(op_type, num) => {
            format!("\n{0}\n{1}", write_value_into_d(op_type, num, file_name), PUSH_D)
        }
        Expression::Pop(op_type, num) => format!("\n{0}", write_d_in_memory(op_type, num, file_name)),
        Expression::Eq | Expression::Gt | Expression::Lt => format!("\n{0}", cmp_code(e)),
        Expression::Add | Expression::Sub | Expression::And | Expression::Or => {
            format!("\n{0}", binary_op(e))
        }

        Expression::Not | Expression::Neg => format!("\n{0}", neg_not(e)),

        Expression::Label(label) => format!("\n({0})", label),
        Expression::Goto(label) => format!("\n@{0} \n0; JMP", label),
        Expression::IfGoto(label) => format!(
            "\n{POP_D} \n@{label} \nD; JNE",
            POP_D = POP_D,
            label = label
        ),

        Expression::Function(func_name, local_vars_num) => {
            emit_function_code(func_name, local_vars_num)
        }
        Expression::Call(func_name, args_num) => emit_call_code(func_name, args_num, counter),
        Expression::Return => emit_return_code(),
    }
}

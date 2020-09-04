use crate::parser::{Expression, StackOpType};
use std::string::String;

const TEMP_ADDRESS_NAME: &str = "R13";
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
        func_name = func_name,
        ret_name = ret_name,
        args_num = args_num,
        PUSH_D = PUSH_D
    );
}

pub fn emit_bootstrap_code() -> String {
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

fn emit_write_into_d(mut address: StackOpType, mut offset: String, file_name: String) -> String {
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

    let label_name;
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
}

fn emit_write_d_into(mut address: StackOpType, mut offset: String, file_name: String) -> String {
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

    let label_name;
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
}

fn emit_compare(cmp_type: Expression, counter: i32) -> String {
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
}

fn emit_negation_or_not(op_type: Expression) -> String {
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
}

fn emit_binary_operation(op_type: Expression) -> String {
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
}

pub fn emit_code(e: Expression, counter: i32, file_name: String) -> String {
    match e {
        Expression::None => unreachable!(),
        Expression::Push(op_type, num) => format!(
            "\n{0}\n{1}",
            emit_write_into_d(op_type, num, file_name),
            PUSH_D
        ),
        Expression::Pop(op_type, num) => {
            format!("\n{0}", emit_write_d_into(op_type, num, file_name))
        }
        Expression::Eq | Expression::Gt | Expression::Lt => {
            format!("\n{0}", emit_compare(e, counter))
        }
        Expression::Add | Expression::Sub | Expression::And | Expression::Or => {
            format!("\n{0}", emit_binary_operation(e))
        }

        Expression::Not | Expression::Neg => format!("\n{0}", emit_negation_or_not(e)),

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

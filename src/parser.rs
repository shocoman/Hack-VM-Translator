#[derive(Debug)]
pub enum StackOpType {
    Local,
    Argument,
    This,
    That,
    Temp,
    Constant,
    Static,
    Pointer,
}

impl StackOpType {
    fn from_str(s: &str) -> Self {
        match s {
            "local" => StackOpType::Local,
            "argument" => StackOpType::Argument,
            "this" => StackOpType::This,
            "that" => StackOpType::That,
            "temp" => StackOpType::Temp,
            "constant" => StackOpType::Constant,
            "static" => StackOpType::Static,
            "pointer" => StackOpType::Pointer,
            _ => unreachable!(),
        }
    }

    pub fn to_string(&self) -> String {
        match self {
            StackOpType::Local => "LCL",       // 1
            StackOpType::Argument => "ARG",    // 2
            StackOpType::This => "THIS",       // 3
            StackOpType::That => "THAT",       // 4
            StackOpType::Temp => "R5",         // 5 - 12
            StackOpType::Static => "16",       // 16 - 255
            StackOpType::Pointer => "Pointer", // 0 -> THIS, 1 -> THAT
            StackOpType::Constant => "Constant",
        }
        .to_string()
    }
}

#[derive(Debug)]
pub enum Expression {
    None,

    Push(StackOpType, String),
    Pop(StackOpType, String),

    Label(String),
    Goto(String),
    IfGoto(String),

    Function(String, String),
    Call(String, String),
    Return,

    Add,
    Sub,
    Neg,

    Eq,
    Lt,
    Gt,
    And,
    Or,
    Not,
}

pub fn parse_expression(expr: String) -> Expression {
    let words_iter = expr.split_ascii_whitespace();
    let words = words_iter.collect::<Vec<_>>();

    match words[..] {
        ["add", ..] => Expression::Add,
        ["sub", ..] => Expression::Sub,
        ["neg", ..] => Expression::Neg,
        ["eq", ..] => Expression::Eq,
        ["lt", ..] => Expression::Lt,
        ["gt", ..] => Expression::Gt,
        ["and", ..] => Expression::And,
        ["or", ..] => Expression::Or,
        ["not", ..] => Expression::Not,

        ["push", op_type, num, ..] => Expression::Push(StackOpType::from_str(op_type), num.to_string()),
        ["pop", op_type, num, ..] => Expression::Pop(StackOpType::from_str(op_type), num.to_string()),

        ["label", label, ..] => Expression::Label(label.to_string()),
        ["if-goto", label, ..] => Expression::IfGoto(label.to_string()),
        ["goto", label, ..] => Expression::Goto(label.to_string()),

        ["function", name, local_vars, ..] => Expression::Function(name.to_string(), local_vars.to_string()),
        ["call", name, arg_vars, ..] => Expression::Call(name.to_string(), arg_vars.to_string()),
        ["return", ..] => Expression::Return,

        _ => Expression::None,
    }
}

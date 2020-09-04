mod code_emitter;
mod parser;
mod file_reader;

use crate::code_emitter::emit_bootstrap_code;
use parser::Expression;
use std::fs::File;
use file_reader::FileReader;
use std::io::Write;

fn run_compilation() {

    let args = std::env::args().collect::<Vec<_>>();
    assert_eq!(args.len(), 3);

    let input_file_path = args[1].clone();
    let output_file_path = args[2].clone();

    let mut reader = FileReader::new(input_file_path.as_ref());
    assert!(!reader.buffers.is_empty());

    let (mut line, mut file_name) = reader.read_line();

    let output_file = File::create(output_file_path).unwrap();
    let mut writer = std::io::BufWriter::new(output_file);

    // write bootstrap code
    writer.write(emit_bootstrap_code().as_ref()).unwrap();

    let mut counter = 0;
    while !line.is_empty() {
        let e = parser::parse_expression(line);
        counter += 1;
        if let Expression::None = e {
        } else {
            let subroutine_name = format!("\n//// *************** {:?} ***************", e);
            let code = code_emitter::emit_code(e, counter, file_name);

            println!("{}", subroutine_name);
            println!("{}", code);

            writer.write(subroutine_name.as_ref()).unwrap();
            writer.write(code.as_ref()).unwrap();
        }
        let new_line = reader.read_line();
        line = new_line.0; file_name = new_line.1;
    }
}

fn main() {
    run_compilation();
}

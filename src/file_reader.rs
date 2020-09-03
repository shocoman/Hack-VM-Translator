use std::fs::File;
use std::io::{BufReader, BufRead};
use std::path::Path;

pub struct FileReader {
    pub buffers: Vec<BufReader<File>>,
    pub file_names: Vec<String>,

}

impl FileReader {
    pub fn new(path: &str) -> Self {
        let is_dir = std::fs::metadata(path).unwrap().is_dir();

        if is_dir {
            let file_names = std::fs::read_dir(path)
                .unwrap()
                .filter(|dir| dir.is_ok())
                .map(|dir| dir.unwrap().path())
                .filter(|path| path.is_file())
                .filter(|path| path.extension().is_some())
                .filter(|path| path.extension().unwrap().to_str().is_some())
                .filter(|path| path.extension().unwrap().to_str().unwrap().ends_with("vm"))
                .collect::<Vec<_>>();



            let mut file_names2 = vec![];
            let mut buf_readers = file_names.iter().map(|path| {

                let file = std::fs::File::open(path).unwrap();
                let name: String = Path::new(path).file_name().unwrap().to_str().unwrap().to_string();

                // let name: String = path.file_name().unwrap().to_str().unwrap().to_string();
                println!("{}", name);
                file_names2.push(name);

                BufReader::new(file)
            }).collect::<Vec<_>>();


            return FileReader {buffers: buf_readers, file_names: file_names2};

        } else {
            let name: String = Path::new(path).file_name().unwrap().to_str().unwrap().to_string();
            let f = File::open(path).unwrap();

            let reader = std::io::BufReader::new(f);

            return FileReader {buffers: vec![reader], file_names: vec![name]}
        }
    }

    pub fn read_line(&mut self) -> (String, String) {
        let mut line = String::new();
        let mut current_name = String::new();

        let len = self.buffers.len();
        for (i, buf_reader) in self.buffers.iter_mut().enumerate() {
            buf_reader.read_line(&mut line);

            if !line.is_empty() || i == len-1 {
                current_name = self.file_names[i].clone().strip_suffix(".vm").unwrap().to_string();
                break;
            }

        }
        if line.len() > 0 && !line.ends_with("\n") {
            line.push_str("\n");
        }
        return (line, current_name);
    }
}


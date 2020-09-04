use std::fs::File;
use std::io::{BufRead, BufReader};
use std::path::Path;

pub struct FileReader {
    pub buffers: Vec<(BufReader<File>, String)>,
}

impl FileReader {
    pub fn new(path: &str) -> Self {
        let is_dir = std::fs::metadata(path).unwrap().is_dir();

        return if is_dir {
            let file_names = Self::get_file_paths_that_end_with(path, "vm");

            let readers = FileReader::get_readers_with_names(file_names);


            FileReader {
                buffers: readers
            }
        } else {
            let name: String = Path::new(path)
                .file_name()
                .unwrap()
                .to_str()
                .unwrap()
                .to_string();
            let f = File::open(path).unwrap();

            let reader = std::io::BufReader::new(f);

            FileReader {
                buffers: vec![(reader, name)]
            }
        };
    }

    fn get_readers_with_names(file_names: Vec<String>) -> Vec<(BufReader<File>, String)> {
        file_names.iter()
            .filter_map(|path| {
                let file = std::fs::File::open(path).unwrap();
                let name: String = Path::new(path).file_name()?.to_str()?.to_string();

                // names.push(name);

                Some((BufReader::new(file), name))
            })
            .collect::<Vec<_>>()
    }

    fn get_file_paths_that_end_with(path: &str, suffix: &str) -> Vec<String> {
        std::fs::read_dir(path)
            .unwrap()
            .filter_map(|mb_entry| mb_entry.ok().and_then(|entry| Some(entry.path())))
            .filter(|path| path.is_file())
            .filter_map(|path| Some(path.file_name()?.to_str()?.to_string()))
            .filter(|path_str| path_str.ends_with(suffix))
            .collect::<Vec<String>>()

        // std::fs::read_dir(path)
        //     .unwrap()
        //     .filter(|dir| dir.is_ok())
        //     .map(|dir| dir.unwrap().path())
        //     .filter(|path| path.is_file())
        //     .filter(|path| path.extension().is_some())
        //     .filter(|path| path.extension().unwrap().to_str().is_some())
        //     .filter(|path| path.extension().unwrap().to_str().unwrap().ends_with(suffix))
        //     .collect::<Vec<_>>()
    }

    pub fn read_line(&mut self) -> (String, String) {
        let mut line = String::new();
        let mut current_name = String::new();

        let len = self.buffers.len();
        for (i, (buf_reader, file_name)) in self.buffers.iter_mut().enumerate() {
            buf_reader.read_line(&mut line).unwrap();

            if !line.is_empty() || i == len - 1 {
                current_name = file_name
                    .clone()
                    .strip_suffix(".vm")
                    .unwrap()
                    .to_string();
                break;
            }
        }
        if line.len() > 0 && !line.ends_with("\n") {
            line.push_str("\n");
        }
        return (line, current_name);
    }
}

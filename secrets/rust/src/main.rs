use std::fs::File;
use std::io::{Write, BufReader, BufRead, Error};
use http::{Request, Response, StatusCode};


fn main() -> Result<(), Error> {
    let path = "/etc/secret/hello";
    //let mut output = File::create(path)?;
    //write!(output, "Rust\n💖\nFun")?;

    let input = File::open(path)?;
    let buffered = BufReader::new(input);

    for line in buffered.lines() {
        println!("hello: {}", line?);
    }

    Ok(())
}


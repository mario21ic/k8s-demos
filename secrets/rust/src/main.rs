use std::io::prelude::*;
use std::net::TcpStream;
use std::net::TcpListener;
use std::fs;


fn main() {
    println!("### start ###");
    let listener = TcpListener::bind("0.0.0.0:8080").unwrap();

    for stream in listener.incoming() {
        let stream = stream.unwrap();
        handle_connection(stream);
    }
}

fn handle_connection(mut stream: TcpStream) {
    let mut buffer = [0; 512];

    stream.read(&mut buffer).unwrap();
    println!("Request: {}", String::from_utf8_lossy(&buffer[..]));

    let get = b"GET / HTTP/1.1\r\n";

    if buffer.starts_with(get) {
        let contents = fs::read_to_string("/etc/secret/hello").unwrap();
        let response = format!("HTTP/1.1 200 OK\r\n\r\n{}", contents);
        stream.write(response.as_bytes()).unwrap();
    } else {
        let response = "HTTP/1.1 404 ERROR\r\n\r\n";
        stream.write(response.as_bytes()).unwrap();
    }

    stream.flush().unwrap();
}

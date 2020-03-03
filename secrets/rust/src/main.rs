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

    let (head, body) = if buffer.starts_with(get) {
        ("HTTP/1.1 200 OK\r\n\r\n", fs::read_to_string("/etc/secret/hello").unwrap())
    } else {
        ("HTTP/1.1 404 NOT FOUND\r\n\r\n", "Error\n".to_string())
    };

    let response = format!("{}Hello: {}", head, body);
    stream.write(response.as_bytes()).unwrap();
    stream.flush().unwrap();
}

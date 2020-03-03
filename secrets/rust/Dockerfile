FROM rust:1-alpine as builder
WORKDIR /app
COPY ./ ./
RUN rustup target add x86_64-unknown-linux-musl &&\
    cargo build --target x86_64-unknown-linux-musl --release &&\
    cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=builder /usr/local/cargo/bin/rust_secret /rust_secret
CMD ["/rust_secret"]

FROM rust:1-alpine

WORKDIR /app
COPY ./ ./
RUN rustc src/main.rs
CMD /app/src/main

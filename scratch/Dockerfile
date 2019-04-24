FROM ubuntu:16.04 as builder

COPY hello.c /

RUN apt-get update && \
    apt-get install build-essential -y && \
    gcc -o /hello -static -nostartfiles /hello.c

FROM scratch
COPY --from=builder /hello /
CMD ["/hello"]

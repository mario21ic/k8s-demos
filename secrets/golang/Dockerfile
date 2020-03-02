FROM golang:1.14-alpine as builder
WORKDIR /app
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /app/main /
ENV hello="from Dockerfile"
CMD ["/main"]

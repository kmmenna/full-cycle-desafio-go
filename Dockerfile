FROM golang:latest AS builder

COPY src/* src/
RUN go build ./src/hello.go


FROM scratch

WORKDIR /app

COPY --from=builder /go/hello /app

ENTRYPOINT [ "/app/hello" ]
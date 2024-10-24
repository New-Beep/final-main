FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum tracker.db *.go ./

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main

CMD ["/main"]
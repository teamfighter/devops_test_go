#Build application stage
FROM golang:1.19.3-alpine AS builder
WORKDIR /app/build
RUN apk add --no-cache git
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o ./application

#Copy build artifacts to target container
FROM golang:1.19.3-alpine
WORKDIR /app
USER nobody
COPY --from=builder --chown=nobody /app/build/application /app/
CMD ["./application"]

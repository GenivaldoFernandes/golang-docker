FROM golang:alpine AS builder

WORKDIR /app

COPY main/main.go /app

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o app main.go

# Stage 2: Use a minimal base image
FROM scratch

COPY --from=builder /app/app /app

CMD ["/app"]

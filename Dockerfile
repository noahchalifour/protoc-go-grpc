# Stage 1: Build stage
FROM golang:latest AS builder

# Install go packages
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install github.com/micro/go-micro/cmd/protoc-gen-micro@latest

# Stage 2: Final stage
FROM alpine:latest

# Install necessary dependencies
RUN apk add --no-cache protobuf 

# Copy go binaries from the builder stage
COPY --from=builder /go/bin/protoc-gen-go /usr/local/bin/protoc-gen-go
COPY --from=builder /go/bin/protoc-gen-micro /usr/local/bin/protoc-gen-micro

# Set the working directory
WORKDIR /proto

# Copy the docker_entrypoint.sh file into the image
COPY docker_entrypoint.sh /

# Entrypoint for generating go files
ENTRYPOINT ["/docker_entrypoint.sh"]
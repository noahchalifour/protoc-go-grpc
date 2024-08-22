# Docker Protoc Generator for Go GRPC

This is a docker image for generating GRPC code in Golang

### Repository Structure

```
|-- Dockerfile                  # The main Dockerfile for the image
|-- docker_entrypoint.sh        # The main script for generating the go files
|-- Makefile                    # The project Makefile
```

### Building the Image

To build the docker image, run the following command:

```
make    # or `make build`
```

### Using the image

To generate the go files, run the following command:

```
docker run -it --rm \
    -v $(pwd)/proto:/proto \
    -v $(pwd)/build:/build \
    protoc-go-grpc:latest /proto /build
```
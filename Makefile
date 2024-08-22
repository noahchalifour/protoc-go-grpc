PACKAGE_NAME ?= protoc-go-grpc
PACKAGE_VERSION ?= latest
PACKAGE_IMAGE_TAG ?= $(PACKAGE_NAME):$(PACKAGE_VERSION)

build:
	docker build -t "$(PACKAGE_IMAGE_TAG)" .
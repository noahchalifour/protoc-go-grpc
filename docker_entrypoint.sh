#!/bin/sh

# Validate the script arguments
if [ $# != 2 ]; then
    echo "Usage: protoc-go-grpc <proto_dir> <output_dir>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# Make sure the output directory exists
mkdir -p $output_dir

# Generate the go files
protoc \
    $PROTOC_ARGS \
    --proto_path $input_dir \
    --go_out $output_dir \
    --go-grpc_out $output_dir \
    $(find $input_dir -iname "*.proto")
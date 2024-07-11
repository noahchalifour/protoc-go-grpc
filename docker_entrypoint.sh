#!/bin/sh

# Validate the script arguments
if [ $# != 2 ]; then
    echo "Usage: protoc-go-micro <proto_dir> <output_dir>"
    exit 1
fi

input_dir="$1"
output_dir="$2"

# Make sure the output directory exists
mkdir -p $output_dir

# Generate the go files
protoc \
    --proto_path $input_dir \
    --go_out $output_dir \
    --go_micro_out $output_dir \
    $(find $input_dir -iname "*.proto")
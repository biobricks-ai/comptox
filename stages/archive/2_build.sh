#!/usr/bin/env bash

# Script to process unzipped files and build parquet files

# Get local path
localpath=$(pwd)
echo "Local path: $localpath"

# Set download path
downloadpath="$localpath/download"
echo "Download path: $downloadpath"

# Create brick directory
brickpath="$localpath/staging"
echo "Brick path: $brickpath"

# Process raw files and create parquet files in parallel
python ./stages/csv2parquet.py $downloadpath $brickpath
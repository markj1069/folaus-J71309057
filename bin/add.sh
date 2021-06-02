#! /usr/bin/env bash

# Build the olslib piece by piece

echo "!-h- $1" >>olflib.f90 # Add the header
cat       "$1" >>olflib.f90 # Add the procedure
echo "!-e- $1" >>olflib.f90 # Add the trailer

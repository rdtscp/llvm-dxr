#!/bin/bash

set -e
set -x

git clone https://github.com/llvm/llvm-project.git /home/llvm-project/
mkdir /home/llvm-project/build/
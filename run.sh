#!/bin/bash
filename=$1
testfile=$2

riscv64-unknown-elf-as -o memset.o $filename
riscv64-unknown-elf-gcc -o test.elf memset.o $testfile

spike pk test.elf
rm *.o 

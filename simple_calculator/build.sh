#!/bin/bash

OUT="out"

mkdir -p $OUT

arm-unknown-linux-gnueabi-as main.s -o $OUT/main.o
arm-unknown-linux-gnueabi-ld $OUT/main.o -o $OUT/main.so

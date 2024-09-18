#!/bin/sh

rm build/$1/$2
mkdir -p build/$1/obj
gnatmake -D build/$1/obj -o build/$1/$2 $1/$2.adb
./build/$1/$2
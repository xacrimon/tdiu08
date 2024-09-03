#!/bin/sh

mkdir -p build/$1
gnatmake -o build/$1/bin $1/$2.adb

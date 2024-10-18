#!/bin/sh

rm build/$1/$2
mkdir -p build/$1/obj
echo $3

if [ $3 -eq 0 ]
then
    echo "build"
    gnatmake -D build/$1/obj -o build/$1/$2 $1/$2.adb
    ./build/$1/$2
elif [ $3 -eq 1 ]
then
    echo "valgrind"
    mkdir -p build/$1/debug
    cd build/$1/debug
    gnatmake -D ../obj -g -o ../$2 ../../../$1/$2.adb
    valgrind --tool=memcheck --leak-check=yes ./../$2
fi
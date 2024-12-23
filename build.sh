#!/bin/bash

rm -r build/$1/

if [ "$3" = ".adb" ]
then
    mkdir -p build/$1/obj
    if [ $4 -eq 0 ]
    then
        gnatmake -D build/$1/obj -o build/$1/$2 $1/$2.adb
        ./build/$1/$2
    elif [ $4 -eq 1 ]
    then
        mkdir -p build/$1/debug
        cd build/$1/debug
        gnatmake -D ../obj -g -o ../$2 ../../../$1/$2.adb
        valgrind --tool=memcheck --leak-check=yes ./../$2
    fi
elif [ "$3" = ".cpp" ]
then
    mkdir -p build/$1
    if [ $4 -eq 0 ]
    then
        cd build/$1
        files=""
        for file in ../../$1/*
        do
            if [ "${file##*.}" = "cpp" ]
            then
                files+=" ${file}"
            fi
        done
        g++ -Wall -Wextra -pedantic $files
        ./a.out
    elif [ $4 -eq 1 ]
    then
        mkdir -p build/$1/debug
        cd build/$1/debug
        g++ -g ../../../$1/$2$3
        valgrind --tool=memcheck --leak-check=yes ./a.out
    fi
fi
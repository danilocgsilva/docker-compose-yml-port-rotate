#!/bin/bash

this_assert() {

    if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
        echo "Cannot proceed. this_assert is missing parameters. You need at least three: the expected, the result and the unittest file to store the result. Check if some argument are blank"
        exit
    fi

    if [ "$1" = "$2" ]; then
        echo Passed
        echo -n "." >> "$3"
    else
        echo Missed
        echo -n "F" >> "$3"
    fi
}



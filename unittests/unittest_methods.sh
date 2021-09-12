#!/bin/bash

this_assert() {
    if [ "$1" = "$2" ]; then
        echo Passed
        echo -n "." >> "$3"
    else
        echo Missed
        echo -n "F" >> "$3"
    fi
}



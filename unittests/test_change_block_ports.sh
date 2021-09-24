#!/bin/bash

source unittest_methods.sh
source ../dcpr

if [ -z $1 ]
then
    DOTFILE=/tmp/docker-mitosis-unittests-$(date +%s).txt
else
    DOTFILE=$1
fi

test_find_ports_starting_line_2() {
    echo '* test_find_ports_starting_line_2'
    RESULTS=$(find_ports_starting_line mocks/mock_fragment_ports_at_2.txt)
    EXPECTED_RESULTS=2

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_find_ports_starting_line_1() {
    echo '* test_find_ports_starting_line_1'
    RESULTS=($(find_ports_starting_line mocks/mock_fragment_ports_at_1.txt))
    EXPECTED_RESULTS=1

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_find_ports_starting_line_0() {
    echo '* test_find_ports_starting_line_0'
    RESULTS=$(find_ports_starting_line mocks/mock_fragment_ports_at_0.txt)
    EXPECTED_RESULTS=0

    this_assert $EXPECTED_RESULTS ${RESULTS[0]} "$1"
}

test_find_ports_starting_line_6() {
    echo '* test_find_ports_starting_line_6'
    RESULTS=$(find_ports_starting_line mocks/mock_fragment_ports_at_6.txt)
    EXPECTED_RESULTS=6

    this_assert $EXPECTED_RESULTS ${RESULTS[0]} "$1"
}

test_find_ports_starting_line_15() {
    echo '* test_find_ports_starting_line_15'
    RESULTS=($(find_ports_starting_line mocks/mock_larger_span_2.txt))
    EXPECTED_RESULTS=15

    this_assert $EXPECTED_RESULTS ${RESULTS[0]} "$1"
}

test_find_ports_starting_line_16() {
    echo '* test_find_ports_starting_line_16'
    RESULTS=($(find_ports_starting_line mocks/mock_larger_span_2_ws.txt))
    EXPECTED_RESULTS=16

    this_assert $EXPECTED_RESULTS ${RESULTS[0]} "$1"
}

test_span_lines_for_ports_1() {
    echo '* test_span_lines_for_ports_1'    

    RESULTS=$(span_lines_for_ports "mocks/mock_fragment_ports_at_2.txt")
    EXPECTED_RESULTS=2

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_span_lines_for_ports_2() {
    echo '* test_span_lines_for_ports_2'

    RESULTS=$(span_lines_for_ports mocks/mock_fragment_ports_at_2.txt)
    EXPECTED_RESULTS=2

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_span_lines_for_ports_3() {
    echo '* test_span_lines_for_ports_3'

    RESULTS=$(span_lines_for_ports mocks/mock_fragment_ports_span_3.txt)
    EXPECTED_RESULTS=3

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_span_lines_for_ports_4() {
    echo '* test_span_lines_for_ports_4'

    RESULTS=$(span_lines_for_ports mocks/mock_fragment_ports_span_4.txt)
    EXPECTED_RESULTS=4

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_span_lines_for_ports_5() {
    echo '* test_span_lines_for_ports_5'

    RESULTS=$(span_lines_for_ports mocks/mock_larger_span_2.txt)
    EXPECTED_RESULTS=2

    this_assert $EXPECTED_RESULTS $RESULTS "$1"
}

test_find_ports_starting_line_2 $DOTFILE
test_find_ports_starting_line_1 $DOTFILE
test_find_ports_starting_line_0 $DOTFILE
test_find_ports_starting_line_6 $DOTFILE
test_find_ports_starting_line_15 $DOTFILE
test_find_ports_starting_line_16 $DOTFILE
test_span_lines_for_ports_1 $DOTFILE
test_span_lines_for_ports_2 $DOTFILE
test_span_lines_for_ports_3 $DOTFILE
test_span_lines_for_ports_4 $DOTFILE
test_span_lines_for_ports_5 $DOTFILE

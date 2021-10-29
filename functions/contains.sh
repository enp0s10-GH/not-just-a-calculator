#!/bin/bash
# - This function checks if @param SUB is in the @param STR - # 
function contains() {
    STR="${1}"
    SUB="${2}"
    if [[ "$STR" == *"$SUB"* ]]; then
        echo 1
    fi
}
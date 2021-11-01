#!/bin/bash
#
# This script contains a function, that returns 1 if the 1. Arg contains the 2. arg

########################################
# This function checks if @param SUB is in the @param STR 
# Returns: 
#   1 if true
#   0 if false
# Arguments:
#   Main String
#   Sub String
########################################
function contains() {
  STR="${1}"
  SUB="${2}"
  if [[ "$STR" == *"$SUB"* ]]; then
    echo 1
  fi
}
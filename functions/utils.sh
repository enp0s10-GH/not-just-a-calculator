#!/bin/bash
#
# This File includes default functions for the script.

########################################
# Prints the help page of the Script (-h)
########################################
function display_help() {
  echo ''
  echo '                            Not Just an Calculator                            '
  echo '<---------------------------------------------------------------------------->'
  echo '[--help] - Shows this page'
  echo '[--version] - Shows this version of the script'
  echo '[-a] - Advanced Calculator for Binary, Decimal, Hexdecimal and Text Converting'
  echo '[-s] - Guided Calculator'
  echo '[-m] - Calculator for fast in and output'
}

########################################
# Prints the Version of the Script
########################################
function display_version(){
  echo ''
  echo '                            Not Just an Calculator                            '
  echo '<---------------------------------------------------------------------------->'
  echo -e "Version: ${Purple}matriqz v1.0.2${Color_Off}"
  echo -e "Author: ${Purple}enforcer${Color_Off}"
}
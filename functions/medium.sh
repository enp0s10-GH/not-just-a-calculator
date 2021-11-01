#!/bin/bash
#
# the function to calculate a one-line string calcultion 

########################################
# Handles the input of the -m parameter
# Returns:
#   Executes the function if the operator was found in the input
#   Error Message if the operator doesnt match
########################################
function medium() {
  clear;
  echo -n -e "${BWhite}Gib deine Rechnung an: ${Purple}"; echo -e -n "${Color_Off}"
  read -r calculation
  calc=$(echo "${calculation}" | tr -d ' ')
  if [[ $(contains "${calc}" "+") == "1" ]]; then
    add
  elif [[ $(contains "${calc}" "-") == "1" ]]; then
    subtract
  elif [[ $(contains "${calc}" "*") == "1" ]]; then
    multiply
  elif [[ $(contains "${calc}" "/") == "1" ]]; then
    divide
  elif [[ $(contains "${calc}" "%") == "1" ]]; then
    mod
  else
    echo -e "${BWhite}Falsche Rechenoperation, Verfügbar sind: ( ${BGreen}+ ${Color_Off}| ${BGreen}- ${Color_Off}| ${BGreen}* {Color_Off}| ${BGreen}/ ${Color_Off}| ${BGreen}% ${BWhite})"; echo -e -n "${Color_Off}"
  fi
}

########################################
# Adding first and second number
# Output:
#   added first and second number
#   Error Message if numbers are not numeric.
########################################
function add() {
  IFS='+'
  read -r -a strarr <<< "${calc}"
  unset IFS
  n1="${strarr[0]}"
  n2="${strarr[1]}"
  if [[ $n1 =~ $re ]] && [[ $n2 =~ $re ]]; then
    echo -e "${BCyan}Calcuation: $n1 + $n2" ; echo -e -n "${Color_Off}"
    clear
    echo -en "\r${BWhite}Das Ergebnis ist: ${Purple}"; echo -n $(( n1 + n2 )); echo -e "${Color_Off}";
  else
    echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)"; echo -e -n "${Color_Off}"; echo -e -n "${Color_Off}"
  fi
}

########################################
# Subtracts first and second number
# Output:
#   Subtracted first and second number
#   Error Message if numbers are not numeric.
########################################
function subtract() {
  IFS='-'
  read -r -a strarr <<< "${calc}"
  unset IFS
  n1="${strarr[0]}"
  n2="${strarr[1]}"
  if [[ $n1 =~ $re ]] && [[ $n2 =~ $re ]]; then
    echo -e "${BCyan}Calcuation: $n1 + $n2" ; echo -e -n "${Color_Off}"
    clear
    echo -en "\r${BWhite}Das Ergebnis ist: ${Purple}"; echo -n $(( n1 - n2 )); echo -e "${Color_Off}";
  else
    echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)"; echo -e -n "${Color_Off}"
  fi
}

########################################
# Multiplies first and second number
# Output:
#   Multiplied first and second number
#   Error Message if numbers are not numeric.
########################################
function multiply() {
  IFS='*'
  read -r -a strarr <<< "${calc}"
  unset IFS
  n1="${strarr[0]}"
  n2="${strarr[1]}"
  if [[ $n1 =~ $re ]] && [[ $n2 =~ $re ]]; then
    echo -e "${BCyan}Calcuation: $n1 + $n2" ; echo -e -n "${Color_Off}"
    clear
    echo -en "\r${BWhite}Das Ergebnis ist: ${Purple}"; echo -n $(( n1 * n2 )); echo -e "${Color_Off}";
  else
    echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)"; echo -e -n "${Color_Off}"
  fi
}

########################################
# Dividing first and second number
# Output:
#   divided first and second number
#   Error Message if numbers are not numeric.
########################################
function divide() {
  IFS='/'
  read -r -a strarr <<< "${calc}"
  unset IFS
  n1="${strarr[0]}"
  n2="${strarr[1]}"
  if [[ $n1 =~ $re ]] && [[ $n2 =~ $re ]]; then
    echo -e "${BCyan}Calcuation: $n1 + $n2" ; echo -e -n "${Color_Off}"
    clear
    echo -en "\r${BWhite}Das Ergebnis ist: ${Purple}"; echo -n $(( n1 / n2 )); echo -e "${Color_Off}";
  else
    echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)"; echo -e -n "${Color_Off}"
  fi
}

########################################
# Mods first and second number
# Output:
#   Mods first and second number
#   Error Message if numbers are not numeric.
########################################
function mod() {
  IFS='%'
  read -r -a strarr <<< "${calc}"
  unset IFS
  n1="${strarr[0]}"
  n2="${strarr[1]}"
  if [[ $n1 =~ $re ]] && [[ $n2 =~ $re ]]; then
    echo -e "${BCyan}Calcuation: $n1 + $n2" ; echo -e -n "${Color_Off}"
    clear
    echo -en "\r${BWhite}Das Ergebnis ist: ${Purple}"; echo -n $(( n1 % n2 )); echo -e "${Color_Off}";
  else
    echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)"; echo -e -n "${Color_Off}"
  fi
}
#!/bin/bash
# - this function will be executed if command parameter equals -s or -simple - #
function simple() {
    clear;
    echo -e -n "${BCyan}Erste Zahl: ${Purple}"; read -r number1; echo -n -e "${Color_Off}";
    echo -e -n "${BCyan}Operator: ${Purple}"; read -r operator; echo -n -e "${Color_Off}";
    echo -e -n "${BCyan}Zweite Zahl: ${Purple}"; read -r number2; echo -n -e "${Color_Off}";
    calculate "${number1}" "${operator}" "${number2}";
}

# - This Function handles the simple calculation method - #
function calculate() {
num1=$1;
op=$2;
num2=$3;
if [[ $num1 =~ $re ]] && [[ $num2 =~ $re ]]
then
case $op in
"+") echo -e -n "${BWhite}Das Ergebnis ist: "; echo -e -n "${BGreen}";echo $((num1+num2)); echo -e -n "${Color_Off}";;
"-") echo -e -n "${BWhite}Das Ergebnis ist: "; echo -e -n "${BGreen}";echo $((num1-num2)); echo -e -n "${Color_Off}";;
"/") echo -e -n "${BWhite}Das Ergebnis ist: "; echo -e -n "${BGreen}";echo $((num1/num2)); echo -e -n "${Color_Off}";;
"*") echo -e -n "${BWhite}Das Ergebnis ist: "; echo -e -n "${BGreen}";echo $((num1*num2)); echo -e -n "${Color_Off}";;
"%") echo -e -n "${BWhite}Das Ergebnis ist: "; echo -e -n "${BGreen}";echo $((num1%num2)); echo -e -n "${Color_Off}";;
*) echo -e "${BWhite}Falsche Rechenoperation ${BRed}${op}${BWhite} Verfügbar sind: ( ${BGreen}+ ${Color_Off}| ${BGreen}- ${Color_Off}| ${BGreen} ${Color_Off}| ${BGreen}/ ${Color_Off}| ${BGreen}% ${BWhite})"; echo -e -n "${Color_Off}";;
esac
else
echo -e "${BRed}Das sind keine Zahlen. ( ͡❛  ͟ʖ ͡❛)" ; echo -e -n "${Color_Off}"
fi
}
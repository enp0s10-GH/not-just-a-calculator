#!/bin/bash
# - function to convert decimal, binary, hexadecimal and ascii. param : -a || -advanced - #
function advanced() {
    clear;
    echo -e "${BWhite}What do you want to convert?";
    echo -e "${BWhite} [${BGreen}1${BWhite}] ${Color_Off}- ${BWhite}Binary";
    echo -e "${BWhite} [${BGreen}2${BWhite}] ${Color_Off}- ${BWhite}Decimal";
    echo -e "${BWhite} [${BGreen}3${BWhite}] ${Color_Off}- ${BWhite}Hexadecimal";
    echo -e "${BWhite} [${BGreen}4${BWhite}] ${Color_Off}- ${BWhite}Text"; echo -e -n "${Color_Off}"
    echo ">---------------------------<"
    echo -e -n "${BWhite} > "; read -r convertfrom;
    if [[ "${convertfrom}" == "1" ]]
    then
        clear
        echo -e "${BCyan}Convert From: Binary"; echo -e -n "${Color_Off}"
        echo -e "${BWhite}Enter your Binary value: ${Purple}"; echo -e -n "${Color_Off}"
        echo -e -n "${BWhite} > "; read -r binary_raw
        binary_value=$(echo "${binary_raw}" | tr -d ' ')
        if [[ $binary_value =~ ^[0-1]+$ ]]
        then
            clear
            echo -e "${BCyan}Convert From: Binary"; echo -e -n "${Color_Off}"
            echo -e "${BCyan}Value: ${binary_raw}"; echo -e -n "${Color_Off}"
            echo -e "${BWhite}and what do you want to convert into?"; echo -e -n "${Color_Off}"
            echo -e "${BWhite} [${BGreen}1${BWhite}] ${Color_Off}- ${BWhite}Decimal"; echo -e -n "${Color_Off}"
            echo -e "${BWhite} [${BGreen}2${BWhite}] ${Color_Off}- ${BWhite}Hexadecimal"; echo -e -n "${Color_Off}"
            echo -e "${BWhite} [${BGreen}3${BWhite}] ${Color_Off}- ${BWhite}Text"; echo -e -n "${Color_Off}"
            echo ">---------------------------<"
            echo -e -n "${BWhite} > "; read -r convert_type
            clear
            echo -e "${BCyan}Convert From: Binary"; echo -e -n "${Color_Off}"
            echo -e "${BCyan}Value: ${binary_raw} "; echo -e -n "${Color_Off}"
            if [[ $convert_type == "1" ]]
            then
                echo -e "${BCyan}Convert Into: Decimal"; echo -e -n "${Color_Off}"
            elif [[ $convert_type == "2" ]]
            then
                echo -e "${BCyan}Convert Into: Hexadecimal"; echo -e -n "${Color_Off}"
            elif [[ $convert_type == "3" ]]
            then
                echo -e "${BCyan}Convert Into: Text"; echo -e -n "${Color_Off}"
            else
                echo -e "${BRed}This is not a valid number. available are 1, 2, and 3"; echo -e -n "${Color_Off}"
            fi
            case "${convert_type}" in
                1) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "$((2#${binary_value}))"; echo -e -n "${Color_Off}" ;;
                2) echo -n -e "${Color_Off}The result is: ${BGreen}";printf '%x\n' "$((2#$binary_value))"; echo -e -n "${Color_Off}" ;;
                3) echo -n -e "${Color_Off}The result is: ${BGreen}";echo "${binary_value}" | perl -lape '$_=pack"(B8)*",@F'; echo -e -n "${Color_Off}" ;;
            esac
        else
            echo -e "${BRed}${binary_raw} is not a valid binary value, try again."; echo -e -n "${Color_Off}"
        fi

elif [[ "${convertfrom}" == "2" ]]
then
    clear
    echo -e "${BCyan}Convert From: Decimal"; echo -e -n "${Color_Off}"
    echo -e "${BWhite}Enter your Decimal value: ${Purple}"; echo -e -n "${Color_Off}"
    echo -e -n "${BWhite} > "; read -r decimal_value
    if [[ "${decimal_value}" =~ $re ]]
    then
        clear
        echo -e "${BCyan}Convert From: Decimal"; echo -e -n "${Color_Off}"
        echo -e "${BCyan}Value: ${decimal_value}"; echo -e -n "${Color_Off}"
        echo -e "${BWhite}and what do you want to convert into?"; echo -e -n "${Color_Off}"
        echo -e "${BWhite} [${BGreen}1${BWhite}] ${Color_Off}- ${BWhite}Binary"; echo -e -n "${Color_Off}"
        echo -e "${BWhite} [${BGreen}2${BWhite}] ${Color_Off}- ${BWhite}Hexadecimal"; echo -e -n "${Color_Off}"
        echo -e "${BWhite} [${BGreen}3${BWhite}] ${Color_Off}- ${BWhite}Text"; echo -e -n "${Color_Off}"
        echo ">---------------------------<"
        echo -e -n "${BWhite} > "; read -r convert_type
        clear
        echo -e "${BCyan}Convert From: Decimal"; echo -e -n "${Color_Off}"
        echo -e "${BCyan}Value: ${decimal_value}"; echo -e -n "${Color_Off}"
        if [[ "${convert_type}" == "1" ]]
        then
            echo -e "${BCyan}Convert Into: Binary"; echo -e -n "${Color_Off}"
        elif [[ "${convert_type}" == "2" ]]
        then
            echo -e "${BCyan}Convert Into: Hexadecimal"; echo -e -n "${Color_Off}"
        elif [[ "${convert_type}" == "3" ]]
        then
            echo -e "${BCyan}Convert Into: Text"; echo -e -n "${Color_Off}"
        else
            echo -e "${BRed}This is not a valid number. available are 1, 2, and 3"; echo -e -n "${Color_Off}"
        fi
        case "${convert_type}" in
            1) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "obase=2;${decimal_value}" | bc; echo -e -n "${Color_Off}" ;;
            2) echo -n -e "${Color_Off}The result is: ${BGreen}"; printf '%x\n' "${decimal_value}"; echo -e -n "${Color_Off}" ;;
            3) echo -n -e "${Color_Off}The result is: ${BGreen}"; printf '%s' "$(printf '\\%03o' "${decimal_value}")"; echo -e -n "${Color_Off}" ;;
        esac
        else
            echo -e "${BRed} ${decimal_value} is not a valid decimal value, try again."
        fi

elif [ "${convertfrom}" == "3" ]
then
    clear
    echo -e "${BCyan}Convert From: Hexadecimal"; echo -e -n "${Color_Off}"
    echo -e "${BWhite}Enter your Hexadecimal value: ${Purple}"; echo -e -n "${Color_Off}"
    echo -e -n "${BWhite} > "; read -r hex_value
    clear
    echo -e "${BCyan}Convert From: Hexadecimal"; echo -e -n "${Color_Off}"
    echo -e "${BCyan}Value: ${hex_value}"; echo -e -n "${Color_Off}"
    echo -e "${BWhite}and what do you want to convert into?"; echo -e -n "${Color_Off}"
    echo -e "${BWhite} [${BGreen}1${BWhite}] ${Color_Off}- ${BWhite}Binary${Color_Off}";
    echo -e "${BWhite} [${BGreen}2${BWhite}] ${Color_Off}- ${BWhite}Decimal${Color_Off}";
    echo -e "${BWhite} [${BGreen}3${BWhite}] ${Color_Off}- ${BWhite}Text${Color_Off}";
    echo ">---------------------------<"
    echo -e -n "${BWhite} > "; read -r convert_type
    clear
    echo -e "${BCyan}Convert From: Hexadecimal"; echo -e -n "${Color_Off}"
    echo -e "${BCyan}Value: ${hex_value}"; echo -e -n "${Color_Off}"
    if [[ "${convert_type}" == "1" ]]
    then
        echo -e "${BCyan}Convert Into: Binary"; echo -e -n "${Color_Off}"
    elif [[ "${convert_type}" == "2" ]]
    then
        echo -e "${BCyan}Convert Into: Decimal"; echo -e -n "${Color_Off}"
    elif [[ "${convert_type}" == "3" ]]
    then
        echo -e "${BCyan}Convert Into: Text"; echo -e -n "${Color_Off}"
    else
        echo -e "${BRed}This is not a valid number. available are 1, 2, and 3"
    fi
    result_hex_text=$(echo "${hex_value}" | xxd -r -p)
    result_hex_bin=$(echo "obase=2; ibase=16; ${hex_value}" | bc )
    if [[ $result_hex_text =~ ^[^[:cntrl:]]*$ ]]
    then
        case "${convert_type}" in
            1) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "$result_hex_bin"; echo -e -n "${Color_Off}";;
            2) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo $((16#${hex_value}));echo -e -n "${Color_Off}";;
            3) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "$result_hex_text"; echo -e -n "${Color_Off}";;
        esac
    else
        echo -e "${BRed}This Hexadecimal Value can not be convertet into an Text."; echo -e -n "${Color_Off}"
    fi
elif [ "${convertfrom}" == "4" ]
then
    clear
    echo -e "${BCyan}Convert From: Text"; echo -e -n "${Color_Off}"
    echo -e "${BWhite}Enter your Text: ${Purple}"; 
    echo -e -n "${BWhite} > "; read -r text
    clear
    echo -e "${BCyan}Convert From: Text"; echo -e -n "${Color_Off}"
    echo -e "${BCyan}Value: ${text}"; echo -e -n "${Color_Off}"
    echo -e "${BWhite}and what do you want to convert into?"; echo -e -n "${Color_Off}"
    echo -e "${BWhite} [${BGreen}1${BWhite}] ${Color_Off}- ${BWhite}Binary"; echo -e -n "${Color_Off}"
    echo -e "${BWhite} [${BGreen}2${BWhite}] ${Color_Off}- ${BWhite}Decimal"; echo -e -n "${Color_Off}"
    echo -e "${BWhite} [${BGreen}3${BWhite}] ${Color_Off}- ${BWhite}Hexadecimal"; echo -e -n "${Color_Off}"
    echo ">---------------------------<"
    echo -e -n "${BWhite} > "; read -r convert_type
    clear
    echo -e "${BCyan}Convert From: Text"; echo -e -n "${Color_Off}"
    echo -e "${BCyan}Value: ${text}"; echo -e -n "${Color_Off}"
    if [[ "${convert_type}" == "1" ]]
    then
        echo -e "${BCyan}Convert Into: Binary"; echo -e -n "${Color_Off}"
    elif [[ "${convert_type}" == "2" ]]
    then
        echo -e "${BCyan}Convert Into: Decimal"; echo -e -n "${Color_Off}"
    elif [[ "${convert_type}" == "3" ]]
    then
        echo -e "${BCyan}Convert Into: Hexadecimal"; echo -e -n "${Color_Off}"
    else
        echo -e "${BRed}This is not a valid number. available are 1, 2, and 3"; echo -e -n "${Color_Off}"
    fi
    case "${convert_type}" in
        1) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "${text}" | perl -lpe '$_=join " ", unpack"(B8)*"';  echo -e -n "${Color_Off}";;
        2) echo -n -e "${Color_Off}The result is: ${BGreen}"; printf '%d' "'${text}"; echo ""; echo -e -n "${Color_Off}";;
        3) echo -n -e "${Color_Off}The result is: ${BGreen}"; echo "${text}" | xxd -ps -c 200; echo -e -n "${Color_Off}";;
    esac

else
    echo -e "${BRed}This is not a valid number. available are 1, 2, 3 and 4."; echo -e -n "${Color_Off}"
fi
}
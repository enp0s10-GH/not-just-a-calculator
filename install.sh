#!/bin/bash
#
# This function moves the all relevant files & directories to /usr/local/bin

BGreen='\033[1;32m' 
Color_Off='\033[0m'
files=$(ls functions)
sleep .5
echo 'Installing NjaC...'

########################################
# copies all files to /usr/local/bin 
########################################
chmod +x ./calculate
sudo cp ./calculate /usr/local/bin
sudo mkdir /usr/local/bin/functions
for FILE in $files; do
  sudo chmod +x functions/"$FILE"
  sudo cp functions/"$FILE" /usr/local/bin/functions
  echo -e "moving ${FILE} to path"
done;
echo -e "${BGreen}Succesfully installed NjaC! :)"; echo -e -n "${Color_Off}"



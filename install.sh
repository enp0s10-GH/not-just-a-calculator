#!/bin/bash

BGreen='\033[1;32m';

files=$(ls functions)
sleep .5
echo "Installing NjaC..." 
chmod +x ./calculate
sudo cp ./calculate /usr/local/bin
sudo mkdir /usr/local/bin/functions
for FILE in $files;
do
sudo chmod +x functions/"$FILE"
sudo cp functions/"$FILE" /usr/local/bin/functions
echo -e "moving ${FILE} to path"
done;
sudo apt-get update -y

echo -e "${BGreen}Succesfully installed NjaC! :)"; echo -e -n "${Color_Off}"



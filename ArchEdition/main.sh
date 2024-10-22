#!/bin/bash

cd ~
clear

printf "
========================================================================================================================
    hello "$USER"
    you execute my-setup porgram! for arch
========================================================================================================================
       "
sleep 5



printf "
========================================================================================================================
    update and upgrade before start
========================================================================================================================\n
      "
sleep 3

sudo pacman -Sy

printf "
========================================================================================================================
    downloading and checking need program software 
========================================================================================================================
     \n"

python3 --version || sudo pacman -S  python3 -y # проверка есть ли python3
git --version && echo "just for knowing the version!"
gcc --version || sudo pacman -S build-essential -y
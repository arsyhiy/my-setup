#!/bin/bash

clear
sleep 1

printf " you execute my-setup program!\n"
sleep 3

printf "updating and upgrading debian based-system!\n"
slep 3

sudo apt update  -y

clear

sudo apt install neofetch -y
neofetch
sleep 10
clear

printf "your name is %-10s\n" "$USER"

python3 --version
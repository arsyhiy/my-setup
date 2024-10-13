#!/bin/bash
TIMEFORMAT="время выполнения %lR" # time сделан чтобы узнать время выполнения скрипта
time {
printf "your name is %-10s\n" "$USER"

clear
sleep 1

printf " you execute my-setup program!\n"
sleep 3

printf "updating and upgrading debian based-system!\n"
slep 3

sudo apt update && upgrade  -y

clear

sudo apt install neofetch -y
neofetch
sleep 10
clear


python3 --version || sudo apt install python3 # проверка есть ли python3
}
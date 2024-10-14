#!/bin/bash

clear

TIMEFORMAT="время выполнения %lR" # time сделан чтобы узнать время выполнения скрипта

time {

printf "
========================================================================================================================
    hello "$USER"
    you execute my-setup porgram! for debian based distribution
========================================================================================================================
       "
sleep 5

printf "
========================================================================================================================
    update and upgrade before start
========================================================================================================================\n
      "
sleep 3
sudo apt update && upgrade  -y

printf "
========================================================================================================================
    downloading and checking need program software 
========================================================================================================================
     \n"

python3 --version || sudo apt install python3 -y # проверка есть ли python3
git --version && echo "just for knowing the version!"
gcc --version || sudo apt install build-essential -y
npm --version && printf "npm version\n"  || sudo apt install npm -y

printf "\n"
printf "downloading for PPA\n"
sudo apt install software-properties-common -y
printf "\n"

printf "checking neovim!\n"
nvim --version ||curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    chmod u+x nvim.appimage \
    ./nvim.appimage --appimage-extract \
    ./squashfs-root/AppRun --version \
    sudo mv squashfs-root / \
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

printf "\n"

printf "check  vscode!\n"
sleep 3
code --version ||sudo apt install software-properties-common apt-transport-https wget -y  \
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - -y \
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y \
    sudo apt update -y \
    sudo apt install code -y \
    printf "vs code is downloaded!\n"
printf "\n"

printf "checking docker!\n"
sleep 3 
docker --version || sudo apt-get install ca-certificates curl \
                    sudo install -m 0755 -d /etc/apt/keyrings \
                    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
                    sudo chmod a+r /etc/apt/keyrings/docker.asc \
                    
                    echo \
                    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
                    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
                    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
                    sudo apt-get update\
                     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

}

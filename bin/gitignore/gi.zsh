#!/bin/bash

function copyIgnore() {
    echo "$(tput setaf 10)Select your ignore file"
    echo "$(tput setaf 10)1. $(tput setaf 15)Unity 3D"
    echo "$(tput setaf 10)2. $(tput setaf 15)Unreal Engine"
    echo "$(tput setaf 10)3. $(tput setaf 15)Node"
    read -p "$(tput setaf 220)Answer: " -n 1 -r
    echo ""
    if [[ $REPLY = "1" ]]; then
        cp ~/.dotfiles/Generic/Custom/gitignore/templates/.gitignore_unity ./.gitignore
        echo
        echo "$(tput setaf 220)Copied Unity3D .gitignore template to project"
    elif [[ $REPLY = "2" ]]; then
        cp ~/.dotfiles/Generic/Custom/gitignore/templates/.gitignore_unreal ./.gitignore
        echo
        echo "$(tput setaf 220)Copied Unreal Engine .gitignore template to project"
    elif [[ $REPLY = "3" ]]; then
        cp ~/.dotfiles/Generic/Custom/gitignore/templates/.gitignore_node ./.gitignore
        echo
        echo "$(tput setaf 220)Copied Node .gitignore template to project"
    else
        echo "$(tput setaf 5)Unknown Selection"
    fi
}

if [ ! -d "./.git" ]; then
    echo "$(tput setaf 5)Invalid git folder"
elif [ -f "./.gitignore" ]; then
    echo "$(tput setaf 5).gitignore file already exists."
    read -p "$(tput setaf 220)Would you like to overwrite? (y/N)" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo
        copyIgnore
    fi
else
    copyIgnore
fi

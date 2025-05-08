#!/bin/bash

check_install() {
    command -v $1 > /dev/null 2>/dev/null
    if [ $? -eq 0 ]; then
	echo "$1 has been installed."
	return 0
    else
	echo "$1 has not been installed!"
	return 1
    fi
}

check_install 7z
if [ $? -eq 0 ]
then
    :
else
    sudo pacman -S unzip 7-zip-full
fi

cd $HOME/Downloads

wget -O dracula.zip https://github.com/dracula/konsole/archive/master.zip

if [ -e "$HOME/Downloads/dracula.zip" ];then
    echo "dracula.zip exist."
    7z x dracula.zip
    cp $HOME/Downloads/konsole-master/Dracula.colorscheme $HOME/.local/share/konsole/
else
    echo "dracula.zip doesn't exist!"
fi

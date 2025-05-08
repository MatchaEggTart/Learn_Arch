#!/bin/bash

# 避免转义字符 $在网址上乱搞
arch="\$arch"

ustc="Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch"
aliyun="Server = https://mirrors.aliyun.com/archlinuxcn/$arch"
tsinghua="Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch"

# WRONG: PATH_TEST="~/Downloads/b.sh"
# RIGHT: PATH_TEST="$HOME/Downloads/b.sh"
PATH_PACMANCONF="/etc/pacman.conf"

echo -e "\n[archlinuxcn]" | sudo tee -a $PATH_PACMANCONF
echo -e "$ustc" | sudo tee -a $PATH_PACMANCONF
echo -e "$aliyun" | sudo tee -a $PATH_PACMANCONF
echo -e "$tsinghua" | sudo tee -a $PATH_PACMANCONF

# echo -e "$tsinghua" | tee -a $PATH_TEST

sudo pacman-key --lsign-key "farseerfc@archlinux.org"

sudo pacman-key --init
 
sudo pacman-key --populate
 
sudo pacman -Syy archlinux-keyring
 
sudo pacman -Syy archlinuxcn-keyring
 
sudo pacman -Syy
 
sudo pacman -Syu

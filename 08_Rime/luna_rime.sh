#!/bin/bash

mkdir ~/.local/share/fcitx5/rime/
# PATH_PROFILE="/etc/profile"

# sudo pacman -S fcitx5 fcitx5-im fcitx5-chinese-addons fcitx5-material-color fcitx5-rime rime-luna-pinyin rime-emoji
sudo pacman -S fcitx5 fcitx5-im fcitx5-chinese-addons fcitx5-rime rime-luna-pinyin rime-emoji

# Fcitx5
# Hyprland、KDE 是 写入 XMODIFIERS=@im=fcitx 到 /etc/environment

# # Fcitx5
# XMODIFIERS=@im=fcitx
# GLFW_IM_MODULE=ibus  # 注意：Kitty有时需要这个来触发输入框架

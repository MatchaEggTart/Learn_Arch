#!/usr/bin/env bash
dir=$(cd $(dirname $0); pwd -P)

paru -S google-chrome
cp $dir/proxy-chrome.desktop $HOME/.local/share/applications/proxy-chrome.desktop
cp $dir/private-chrome.desktop $HOME/.local/share/applications/private-chrome.desktop 
sudo cp $dir/proxy-chrome.png /usr/share/icons/proxy-chrome.png
sudo cp $dir/private-chrome.png /usr/share/icons/private-chrome.png 

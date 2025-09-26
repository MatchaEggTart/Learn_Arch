#!/usr/bin/env bash
dir=$(cd $(dirname $0); pwd -P)

paru -S google-chrome
mkdir -p $HOME/.local/share/applications
# mkdir -p $HOME/.local/share/icons/google-chrome
sudo mkdir -p /usr/share/icons/google-chrome

cp $dir/proxy-chrome.desktop	$HOME/.local/share/applications/proxy-chrome.desktop
cp $dir/private-chrome.desktop	$HOME/.local/share/applications/private-chrome.desktop 
sudo cp $dir/proxy-chrome.png	/usr/share/icons/google-chrome/proxy-chrome.png
sudo cp $dir/private-chrome.png	/usr/share/icons/google-chrome/private-chrome.png 

#!/usr/bin/env bash
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

paru -S google-chrome

proxy_icon="$script_dir/icons/proxy-chrome.png"
proxy_desktop="$script_dir/desktop/proxy-chrome.desktop"
private_icon="$script_dir/icons/private-chrome.png"
private_desktop="$script_dir/desktop/private-chrome.desktop"

icons_target_dir="/usr/share/icons/google-chrome"
desktop_target_dir="$HOME/.local/share/applications"

mkdir -p $desktop_target_dir
cp $proxy_desktop $desktop_target_dir
cp $private_desktop $desktop_target_dir

sudo mkdir -p $icons_target_dir
sudo cp $proxy_icon $icons_target_dir
sudo cp $private_icon $icons_target_dir

# needn't
# mkdir -p $HOME/.local/share/applications
# sudo mkdir -p /usr/share/icons/google-chrome

# cp $dir/proxy-chrome.desktop	$HOME/.local/share/applications/proxy-chrome.desktop
# cp $dir/private-chrome.desktop	$HOME/.local/share/applications/private-chrome.desktop
# sudo cp $dir/proxy-chrome.png	/usr/share/icons/google-chrome/proxy-chrome.png
# sudo cp $dir/private-chrome.png	/usr/share/icons/google-chrome/private-chrome.png

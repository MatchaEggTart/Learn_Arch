#!/usr/bin/env bash
dir=$(cd $(dirname $0); pwd -P)

chmod +x $HOME/Downloads/Chatbox-1.16.3-x86_64.AppImage

sudo mkdir -p /opt/google/chatbox/icons

sudo cp $dir/chatbox.png /opt/google/chatbox/icons

sudo cp $HOME/Downloads/Chatbox-1.16.3-x86_64.AppImage /opt/google/chatbox/

cp $dir/xyz.chatboxapp.app.desktop $HOME/.local/share/applications/xyz.chatboxapp.app.desktop 

# /opt/google/chatbox/Chatbox-1.9.3-x86_64.AppImage 
# /opt/google/chatbox/icons/chatbox.png 

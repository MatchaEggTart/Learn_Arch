#!/bin/bash

check_install() {
    # pacman -Q $1 > /dev/null 2>/dev/null
    if [[ $(pacman -Q $1) ]]; then
        echo "$1 has been installed."
        return 0
    else
        echo "$1 has not been installed!"
        return 1
    fi
}

check_install fuse

dir=$(cd $(dirname $0); pwd -P)

if [ $? -eq 0 ]; then
    :
else
    sudo pacman -S fuse
fi

cd $HOME/Downloads

# wget https://dldir1.qq.com/music/clntupate/linux/AppImage/qqmusic-1.1.8.AppImage

if [ -f "$HOME/Downloads/qqmusic-1.1.8.AppImage" ]; then
    cd $HOME/Downloads

    sudo mkdir -p /opt/tencent/qqmusic/icons

    sudo cp qqmusic-1.1.8.AppImage /opt/tencent/qqmusic

    cd $dir/QQMusic/

    if [ -d "$HOME/.local/share/applications" ]; then
        :
    else
        mkdir -p $HOME/.local/share/applications
    fi

    cp $dir/QQMusic/qqmusic.desktop $HOME/.local/share/applications

    sudo cp -r $dir/QQMusic/icons/qqmusic.png /opt/tencent/qqmusic/icons/

    cd /opt/tencent/qqmusic/

    sudo chmod +x qqmusic-1.1.8.AppImage

else
    echo "Download the qqmusic => ERROR"
fi

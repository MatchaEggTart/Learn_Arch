#!/usr/bin/env bash
dir=$(cd $(dirname $0); pwd -P)
# echo $dir
sudo cp $dir/11_windows /etc/grub.d/11_windows
sudo grub-mkconfig -o /boot/grub/grub.cfg

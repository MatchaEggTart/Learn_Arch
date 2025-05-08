#!/bin/bash

PATH_V="/etc/hostsBackup"

# 检查文件是否存在
if [ -e "$PATH_V" ]; then
    echo "文件已存在"
else
    sudo cp /etc/hosts /etc/hostsBackup
    echo "文件不存在"    
fi

sudo sh -c 'sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts'

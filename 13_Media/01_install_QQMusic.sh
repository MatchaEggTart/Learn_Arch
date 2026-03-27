#!/bin/bash

# 获取脚本所在目录的绝对路径
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# 检查依赖安装
check_install() {
    if pacman -Q "$1" &> /dev/null; then
        echo "$1 已安装"
        return 0
    else
        echo "$1 未安装!"
        return 1
    fi
}

# 检查并安装fuse
if ! check_install fuse; then
    echo "正在安装fuse..."
    sudo pacman -S --noconfirm fuse
fi

# 定义资源文件位置
appimage_source="qqmusic-1.1.8.AppImage"
appimage_company="tencent"
appimage_name="qqmusic"
desktop_file="${script_dir}/$appimage_name/qqmusic.desktop"
icon_file="${script_dir}/$appimage_name/icons/qqmusic.png"
install_dir="/opt/$appimage_company/$appimage_name"
desktop_dir="$HOME/.local/share/applications/qqmusic.desktop"
icon_dir="$install_dir/icons/qqmusic.png"

# 查找AppImage文件
find_appimage() {
    # 在多个位置查找
    local locations=(
        "$script_dir/$appimage_source"       # 脚本所在目录
        "$PWD/$appimage_source"               # 当前工作目录
        "$HOME/Downloads/$appimage_source"     # 用户下载目录
    )
    
    for loc in "${locations[@]}"; do
        if [[ -f "$loc" ]]; then
            echo "$loc"
            return 0
        fi
    done
    
    return 1
}

# 主安装流程
if appimage_path=$(find_appimage); then
    echo "找到AppImage文件: $appimage_path"
    appimage_filename=$(basename "$appimage_path")
    
    # 创建安装目录
    sudo mkdir -p "$install_dir/icons"
    
    # 复制文件
    sudo cp "$appimage_path" "$install_dir/"
    sudo cp "$icon_file" "$install_dir/icons/"
    sudo chmod +x "$install_dir/$appimage_filename"
    
    # 创建桌面文件
    mkdir -p "$HOME/.local/share/applications"
    
    # 替换桌面文件中的路径占位符
    sed -e "s|@INSTALL_DIR@|$install_dir|g" \
        -e "s|@APPIMAGE_FILE@|$appimage_filename|g" \
        -e "s|@ICON_PATH@|$icon_dir|g" \
        "$desktop_file" > "$desktop_dir"
    
    echo "安装完成！桌面快捷方式已创建"
else
    echo "错误：未找到 $appimage_source 文件"
    echo "请将文件放置在以下位置之一："
    echo "1. 脚本所在目录 ($script_dir)"
    echo "2. 当前工作目录 ($PWD)"
    echo "3. 下载目录 ($HOME/Downloads)"
    exit 1
fi

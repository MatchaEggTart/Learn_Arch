#!/bin/bash

# 获取脚本所在目录的绝对路径
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# 检查依赖安装
check_install() {
  if pacman -Q "$1" &>/dev/null; then
    echo "$1 已安装"
    return 0
  else
    echo "$1 未安装!"
    return 1
  fi
}

# 检查并安装fuse2（AppImage 运行时需要 libfuse.so.2）
if ! check_install fuse2; then
  echo "正在安装fuse2..."
  sudo pacman -S --noconfirm fuse2
fi

# 定义资源文件位置
# AppImage 用通配匹配，版本号不写死，避免升级后找不到文件
appimage_glob="Cherry-Studio-*-linux-x64.AppImage"
# appimage_company="google"
appimage_name="cherry-studio"
desktop_file="${script_dir}/$appimage_name/cherry-studio.desktop"
icon_file="${script_dir}/$appimage_name/icons/cherry-studio.png"
install_dir="/opt/$appimage_name"
desktop_dir="$HOME/.local/share/applications/cherry-studio.desktop"
icon_dir="$install_dir/icons/cherry-studio.png"

# 查找AppImage文件
find_appimage() {
  # 在多个位置查找（通配匹配任意版本）
  local locations=(
    "$script_dir"     # 脚本所在目录
    "$PWD"            # 当前工作目录
    "$HOME/Downloads" # 用户下载目录
  )

  local dir f
  for dir in "${locations[@]}"; do
    for f in "$dir"/$appimage_glob; do
      if [[ -f "$f" ]]; then
        echo "$f"
        return 0
      fi
    done
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
    "$desktop_file" >"$desktop_dir"

  echo "安装完成！桌面快捷方式已创建"
else
  echo "错误：未找到匹配 $appimage_glob 的文件"
  echo "请将文件放置在以下位置之一："
  echo "1. 脚本所在目录 ($script_dir)"
  echo "2. 当前工作目录 ($PWD)"
  echo "3. 下载目录 ($HOME/Downloads)"
  exit 1
fi

#!/usr/bin/env bash
# dir=$(cd $(dirname $0); pwd -P)
#
# chmod +x $HOME/Downloads/Chatbox-1.16.4-x86_64.AppImage
#
# sudo mkdir -p /opt/google/chatbox/icons
#
# sudo cp $dir/chatbox.png /opt/google/chatbox/icons
#
# sudo cp $HOME/Downloads/Chatbox-1.16.4-x86_64.AppImage /opt/google/chatbox/
#
# cp $dir/xyz.chatboxapp.app.desktop $HOME/.local/share/applications/xyz.chatboxapp.app.desktop
#
# # /opt/google/chatbox/Chatbox-1.9.3-x86_64.AppImage
# # /opt/google/chatbox/icons/chatbox.png

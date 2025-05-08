# https://linux.weixin.qq.com/
cd $HOME/Downloads

sudo mkdir -p /opt/tencent/wechat/icons

sudo cp $HOME/Downloads/WeChatLinux_x86_64.AppImage /opt/tencent/wechat

sudo cp $HOME/Workspace/Learn_Arch/Weixin/wechat.png /opt/tencent/wechat/icons/

mkdir -p $HOME/.local/share/applications

cp $HOME/Workspace/Learn_Arch/Weixin/wechat.desktop $HOME/.local/share/applications

cd /opt/tencent/wechat

sudo chmod +x WeChatLinux_x86_64.AppImage

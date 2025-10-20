paru -S v2raya

# 订阅机场: 浏览器打开 http://127.0.0.1:2017, 点击导入按钮， 拷贝机场订阅 URL， 点击确定
# 选择服务器： 选择 S.JISUSUB.CC 标签， 选择一个合适的服务器， 然后选择左上角 启动 按钮
# 局域网支持： 选择右上角设置按钮， 打开 开启 IP 转发 和 开启端口分享 两个按钮， 让后续的 proxy-ns 可以对接机场
# 设置端口号： 在设置对话框左下角点击 地址和端口 按钮， 设置 socks5 端口（带分流规则） 为 1080, 并重启 v2raya 服务 sudo systemctl restart v2raya.service
sudo systemctl enable v2raya.service

paru -S proxy-ns

# 以 Emacs 为例, 找到 /usr/share/applications/emacs.desktop 中 Exec 字段， 在字段开头加上 proxy-ns 后， Emacs 启动后就会自动应用代理网络， 包括 Emacs 里启动的所有子进程。 这样就不用为 Emacs 下的各种工具配置代理了， 非常省心。



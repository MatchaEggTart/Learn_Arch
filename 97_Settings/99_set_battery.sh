#!/bin/bash
# echo "" | sudo tee -a /etc/tlp.conf
# echo "RESTORE_DEVICE_STATE_ON_STARTUP=1" | sudo tee -a /etc/tlp.conf
# echo "START_CHARGE_THRESH_BAT1=40" | sudo tee -a /etc/tlp.conf
# echo "STOP_CHARGE_THRESH_BAT1=80" | sudo tee -a /etc/tlp.conf
# sudo systemctl enable tlp.service
# sudo systemctl restart tlp

#!/bin/bash

# 定义配置项及其对应的中文注释
# 这里的配置将确保插电(AC)和电池(BAT)模式下都优先进入“均衡”
declare -A configs
configs=(
    ["PLATFORM_PROFILE_ON_AC"]="balanced # 交流电模式：强制进入均衡模式 (拯救者白灯)"
    ["PLATFORM_PROFILE_ON_BAT"]="balanced # 电池模式：均衡模式 (节能省电)"
    ["CPU_ENERGY_PERF_POLICY_ON_AC"]="balance_performance # AC 性能策略：平衡性能与功耗"
    ["CPU_ENERGY_PERF_POLICY_ON_BAT"]="balance_power # 电池性能策略：优先省电"
    ["RESTORE_DEVICE_STATE_ON_STARTUP"]="1 # 重启后恢复 WiFi/蓝牙 的开关状态"
    ["START_CHARGE_THRESH_BAT1"]="40 # 电池电量低于 40% 开始充电"
    ["STOP_CHARGE_THRESH_BAT1"]="80 # 电池电量达到 80% 停止充电 (保护寿命)"
)

# echo "------------------------------------------------"
# echo "正在修改 /etc/tlp.conf 以适配拯救者均衡模式..."
# echo "------------------------------------------------"

# 循环处理每个配置项
for key in "${!configs[@]}"; do
    value="${configs[$key]}"
    # 检查 key 是否已在文件中（无论是否被注释）
    if sudo grep -q "^#\?$key=" /etc/tlp.conf; then
        # 替换已有行，并加上注释
        sudo sed -i "s|^#\?$key=.*|$key=$value|" /etc/tlp.conf
        echo "已更新: $key"
    else
        # 如果没有则追加到文件末尾
        echo "$key=$value" | sudo tee -a /etc/tlp.conf > /dev/null
        echo "已添加: $key"
    fi
done

# 启动并启用服务
# echo "------------------------------------------------"
# echo "正在应用配置并重启 TLP 服务..."
sudo systemctl enable tlp.service
sudo systemctl restart tlp

# echo "------------------------------------------------"
# echo "配置完成！当前电源状态验证："
# 检查当前生效的平台模式
# sudo tlp-stat -p | grep -E "Mode|Platform Profile|Energy Performance"
# echo "------------------------------------------------"
# echo "提示：如果重启后还是红灯，请确认 KDE 的 '电源管理' 设置中没有开启 '高性能'。"

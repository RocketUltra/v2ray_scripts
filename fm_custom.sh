#!/bin/bash
# Freedom&Money 定制内容

# 修改时区
set_timezone() {
    echo -e "请输入时区信息"
    read -p "时区：" timezone
    timedatectl set-timezone $timezone
    timedatectl set-ntp true
    sudo timedatectl set-local-rtc 0
    echo "系统时区设置完成"
    echo $timezone
}

# 修改端口
update_ports() {
    # 启动防火墙服务
    sudo systemctl start firewalld

    # 修改SSH端口为2222
    sudo sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config

    # 重启SSH服务
    sudo systemctl restart sshd

    # 检查22端口是否开启，如果开启，则禁用22端口
    if sudo firewall-cmd --list-ports | grep -wq "22/tcp"; then
        sudo firewall-cmd --zone=public --remove-port=22/tcp --permanent
    fi

    # 开启v2ray端口
    sudo firewall-cmd --zone=public --add-port=31535/tcp --permanent
    sudo firewall-cmd --zone=public --add-port=31535/udp --permanent

    sudo firewall-cmd --reload
    echo "防火墙已启动，SSH端口已修改为2222，22端口已禁用，31535已启用。"
}

set_timezone
update_ports

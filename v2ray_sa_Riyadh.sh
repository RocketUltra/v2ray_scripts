#!/bin/bash

# 安装v2ray - 沙特利雅得
echo "1
3
31535

" | bash <(curl -s -L https://raw.githubusercontent.com/RocketUltra/v2ray_scripts/master/install.sh)

# 修改时区端口
echo "Asia/Riyadh

" | bash <(curl -s -L https://raw.githubusercontent.com/RocketUltra/v2ray_scripts/master/fm_custom.sh)

# 显示v2ray二维码
v2ray qr
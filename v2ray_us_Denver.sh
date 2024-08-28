#!/bin/bash

# 安装v2ray - 美国丹佛
echo "1
3
31535

" | bash <(curl -s -L https://raw.githubusercontent.com/RocketUltra/v2ray_scripts/master/install.sh)

# 修改时区端口
echo "America/Denver

" | bash <(curl -s -L https://raw.githubusercontent.com/RocketUltra/v2ray_scripts/master/fm_custom.sh)

# 显示v2ray二维码
v2ray qr

# 显示分享链接
v2ray url
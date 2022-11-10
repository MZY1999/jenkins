#!/bin/bash
# Info:Nginx 入口启动脚本
# Date:2022.10.26

nginx_Bin="/usr/local/nginx/sbin/nginx"
${nginx_Bin} -g "daemon off;"

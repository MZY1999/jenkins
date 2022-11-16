#!/bin/bash
# Info:Jenkins 入口启动脚本
# Date:2022.11.10

cd /usr/local/jenkins/
java  -jar jenkins.war --httpPort=8080

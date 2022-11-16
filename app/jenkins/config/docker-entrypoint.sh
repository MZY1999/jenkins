#!/bin/bash
# Info:Jenkins 入口启动脚本
# Date:2022.11.10

JAVA_OPTS="-Djava.awt.headless=true -Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true"
cd /usr/local/jenkins/
java ${JAVA_OPTS} -jar jenkins.war --httpPort=8080

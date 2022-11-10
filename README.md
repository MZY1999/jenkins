# jenkins
# 1 注意事项:
```go
1.容器启动后操作步骤
  - docker cp jenkins-master:/usr/local/jenkins .
    - 如不执行 会导致容器docker compose down后数据丢失。

2.打开如下配置 再次执行down/up -d
  volumes:
    - "./jenkins_data:/usr/local/jenkins"
```

# Jenkins-Master安装注意事项
```go
1.启动容器
  docker compose up -d

2.容器启动后操作步骤
  # 如不执行 会导致容器docker compose down后数据丢失。
  docker cp jenkins-master:/usr/local/jenkins .

3.打开docker-compose.yaml中如下配置
  volumes:
    - "./jenkins:/usr/local/jenkins"

4.再次执行即可
  docker compose down
  docker compose up -d

5.Nginx域名绑定位置
  jenkins/nginx_conf/http_vhosts
```

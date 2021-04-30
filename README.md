# 镜像内容

此镜像引用自：linuxserver/nginx

## 模块版本

Nginx和PHP会跟随linuxserver/nginx一同更新

V2ray版本按照tag号指定

当前版本如下

| 模块  | 版本   |
| ----- | ------ |
| V2Ray | 4.37.3 |
| Nginx | 1.18   |
| PHP   | 7.4    |

## 参数设置

| 参数                | 说明                                     |
| ------------------- | ---------------------------------------- |
| -p 80               | http                                     |
| -p 443              | https                                    |
| -e PUID=1000        | UserID                                   |
| -e PGID=1000        | GroupID                                  |
| -e TZ=Asia/Shanghai | 默认时区Asia/Shanghai                    |
| -v /config          | 包含nginx、php、v2ray、www、keys等文件夹 |

## 使用方法

此镜像主要适用于WS+TLS+NGINX使用

此镜像内部设置了3个网站模板：proxy、reverse、website

如需使用请参考配置要求进行修改。
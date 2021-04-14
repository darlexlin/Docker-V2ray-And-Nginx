FROM linuxserver/nginx

# 环境变量
ENV PUID PGID
ENV TZ Asia/Shanghai

#下载并安装V2ray
WORKDIR /tmp
ARG TAG="v4.37.3"
RUN set -ex && \
    apk add --no-cache wget tzdata openssl ca-certificates --upgrade && \
    mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray && \
#    wget -q -O v2ray.sh "https://raw.githubusercontent.com/v2fly/docker/master/v2ray.sh" && \
    wget -q -O v2ray.zip "https://github.com/v2fly/v2ray-core/releases/download/${TAG}/v2ray-linux-64.zip" && \
    unzip v2ray.zip && \
    chmod +x v2ray v2ctl && \
    mv v2ray v2ctl /usr/bin/ && \
    mv geosite.dat geoip.dat /usr/local/share/v2ray/ && \
    mv config.json /etc/v2ray/config.json && \
    rm -rf /tmp/*

#添加本地文件，赋予root权限
COPY root/ /
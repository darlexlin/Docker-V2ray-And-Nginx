﻿FROM linuxserver/nginx

ENV DEBIAN_FRONTEND noninteractive
ENV PUID=1000 PGID=1000
ENV TZ Asia/Shanghai

WORKDIR /root
COPY start.sh /root/start.sh
RUN wget -q -O v2ray.sh "https://raw.githubusercontent.com/v2fly/docker/master/v2ray.sh"

#安装V2ray
RUN set -ex && \
    apk add --no-cache tzdata openssl ca-certificates --upgrade && \
    mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray && \
    chmod +x /root/v2ray.sh && \
    /root/v2ray.sh

#绑定工作目录
WORKDIR /config

RUN ln -s /etc/v2ray /config/v2ray

VOLUME /config

CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]
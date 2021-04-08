FROM phusion/baseimage:18.04-1.0.0-amd64

ENV DEBIAN_FRONTEND noninteractive
ENV PUID=1000 PGID=1000
ENV TZ Asia/Shanghai

RUN apt-get update -y && \
    apt-get install -y wget tzdata && \
    wget -N --no-check-certificate -q -O install.sh "https://raw.githubusercontent.com/wulabing/V2Ray_ws-tls_bash_onekey/master/install.sh" && chmod +x install.sh && bash install.sh

WORKDIR /config

RUN ln -s /config/nginx /etc/nginx && \
    ln -s /config/v2ray /etc/v2ray && \
    ln -s /config/www /home/wwwroot

VOLUME /config

CMD ["nginx" "-g" "daemon off;"]

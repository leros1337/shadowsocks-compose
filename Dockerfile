# docker build -t ghcr.io/relers/ssserver-rust-v2ray:1.14.3 .
FROM ghcr.io/shadowsocks/ssserver-rust:v1.14.3

LABEL org.opencontainers.image.source https://github.com/relers/shadowsocks-compose

USER root

RUN cd /tmp && \
 TAG=$(wget -qO- https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest | grep tag_name | cut -d '"' -f4) && \
 wget https://github.com/shadowsocks/v2ray-plugin/releases/download/$TAG/v2ray-plugin-linux-amd64-$TAG.tar.gz && \
 tar -xf *.gz && \
 rm *.gz && \
 mv v2ray* /usr/bin/v2ray-plugin && \
 chmod +x /usr/bin/v2ray-plugin

USER nobody

ENTRYPOINT [ "ssserver", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]
# Shadowsocks Compose
Quick bootstrap guide using docker-compose. Root path returns [echoip](https://github.com/mpolden/echoip), SS_PATH gives you ss endpoint. 
Route: Your_Device_SS_Client -> Cloudflare CDN -> Nginx -> SS_Server -> Network   
Thanks to [vanyaindigo](https://github.com/vanyaindigo), [ss-rust](https://github.com/shadowsocks/shadowsocks-rust), [echoip](https://github.com/mpolden/echoip)   

* Any PR welcome

## Requirements

* Domain name ([freenom](https://www.freenom.com/ru/index.html) or [porkbun](https://porkbun.com/) chip .top .xyz), dont forget about NameServers
* VPS 512+mb RAM (arm not tested)
* Google problems
* Opened ports will be 80,443

## Bootstrap

```
sudo -s
apt update
apt install -y docker docker.io docker-compose nano git curl
#Enable BBR
bash <(curl -sL https://gist.githubusercontent.com/duzun/1503ebefbb208b9072ef85b7190364a4/raw/724ed096db887ef7ba80d6685779c433f8f69313/arch_enable_bbr.sh)
git clone git@github.com:Relers/shadowsocks-compose.git
cd shadowsocks-compose
```
**Next:**  
Go to `screenshots` directory, perform 1-4 steps, 5 `Origin Certificate` paste to `mysite.cert`, Private Key to `mysite.key`  
Edit .env file 
```
nano .env

PASSWORD=fuckrkn
DOMAIN=your_domain.tk
SS_PATH=/v2ray
SS_CIPHER=chacha20-ietf-poly1305
DNS=1.1.1.1

ctrl+x
Y
```
Start
```
# Start
docker-compose up -d
# Stop
docker-compose down
# Running containers
docker ps
# Logs
docker logs -f ss-v2ray
```



## Android Client
* Download from gplay [shadowsocks](https://play.google.com/store/apps/details?id=com.github.shadowsocks&hl=ru&gl=US) and [v2ray-plugin](https://play.google.com/store/apps/details?id=com.github.shadowsocks.plugin.v2ray)
* Watch 6-8 screenshots, dont forget change path according to SS_PATH inside .env

## To Do
- [X] Readme
- [ ] Create Github Wiki
- [ ] Faq for windows/linux [v2rayA)](https://github.com/v2rayA/v2rayA) / [tun2socks](https://github.com/xjasonlyu/tun2socks)?
- [ ] [ss-manager](https://github.com/shadowsocks/shadowsocks-manager)
- [ ] Extend echoip (country,geo,e.t.c.)
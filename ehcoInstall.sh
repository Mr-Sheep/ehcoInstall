#/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

packageLink=$(curl -s https://api.github.com/repos/Ehco1996/ehco/releases/latest | grep "browser_download_url.*linux_amd64" | cut -d '"' -f 4 | wget -i -)
packageName=$(curl -s https://api.github.com/repos/Ehco1996/ehco/releases/latest | grep "browser_download_url.*linux_amd64" | cut -d '"' -f 4 | cut -d "/" -f 9)

configURL=$(wget -O "/root/config.json" https://raw.githubusercontent.com/Mr-Sheep/ehcoInstall/master/config.json)
systemd=$(wget -O "/lib/systemd/system/ehco.service" https://raw.githubusercontent.com/Mr-Sheep/ehcoInstall/master/ehco.service )

chmod +x $packageName && mv $packageName /usr/local/bin/ehco
systemctl daemon-reload

if $(ehco -v 2>/dev/null); then
  echo -e "\n ${GREEN} Ehco's installtion process completed ${NC}"
else
  echo -e "\n ${RED} ERROR, try install ehco manually ${NC}"
fi

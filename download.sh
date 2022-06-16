#!/bin/bash
account=`cat /boot/kerktv/account`
church=`cat /boot/kerktv/church`
MD5_PATH="/var/log/kerktv/$account.md5"
if [[ ! -f $MD5_PATH ]]; then
	cd "/home/$USER/kerktv/" && git pull
	wget -O "/home/$USER/loader.png" "https://api.promissa.nl/vid/$account/$church/loader.png"
fi
wget -O "$MD5_PATH" "https://api.promissa.nl/vid/$account/$church/$account.md5"
sed -i "s/$church.mp4/\/home\/$USER\/video\/$church.mp4/" "$MD5_PATH"
md5sum -c "$MD5_PATH" || wget -O "/home/$USER/video/$church.mp4" "https://api.promissa.nl/vid/$account/$church/$church.mp4"
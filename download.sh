#!/bin/bash
account=`cat /boot/kerktv/account`
church=`cat /boot/kerktv/church`
FLAG="/var/log/firstboot.log"
if [[ ! -f $FLAG ]]; then
	wget -O "/home/$USER/loader.png" "https://api.promissa.nl/vid/$account/$church/loader.png" && touch "$FLAG"
fi

wget -O "/var/log/kerktv/$account.md5" "https://api.promissa.nl/vid/$account/$church/$account.md5"
sed -i "s/$church.mp4/\/home\/$USER\/video\/$church.mp4/" "/var/log/kerktv/$account.md5"
md5sum -c "/var/log/kerktv/$account.md5" || wget -O "/home/$USER/video/$church.mp4" "https://api.promissa.nl/vid/$account/$church/$church.mp4"
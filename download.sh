#!/bin/bash
account=`cat /boot/kerktv/account`
church=`cat /boot/kerktv/church`
wget -O /home/marcovantklooster/loader.png "https://api.promissa.nl/vid/$account/$church/loader.png"
wget -O "/home/marcovantklooster/video/$church.mp4" "https://api.promissa.nl/vid/$account/$church/$church.mp4"
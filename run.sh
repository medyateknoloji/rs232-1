#!/bin/bash
sudo rm /boot/cmdline.txt
sudo touch /boot/cmdline.txt
sudo sh -c "echo 'consoleblank=1 logo.nologo dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=84fa8189-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait  quiet   plymouth.ignore-serial-consoles loglevel=1 quiet' >> /boot/cmdline.txt"
sudo python -m pip install pyserial
sudo cp /home/pi/piSignagePro/rs232-1/TVon.py /home/pi/TVon.py
sudo cp /home/pi/piSignagePro/rs232-1/TVoff.py /home/pi/TVoff.py
touch mycron
echo "# m h  dom mon dow   command" >> mycron
echo "@reboot python /home/pi/TVon.py" >> mycron
echo "00 04 * * * sudo reboot" >> mycron
crontab mycron
rm mycron
sudo rm /etc/wpa_supplicant/wpa_supplicant.conf
sudo cp /home/pi/piSignagePro/rs232-1/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
echo "********Islem Tamamlandi.**********"

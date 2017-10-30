#!/bin/bash
echo "Guncelleme basliyor..."
sudo rm /boot/cmdline.txt
echo "cmdline.txt silindi"
sudo touch /boot/cmdline.txt
echo "cmdline.txt olusturuldu"
sudo sh -c "echo 'consoleblank=1 logo.nologo dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=84fa8189-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait  quiet   plymouth.ignore-serial-consoles loglevel=1 quiet' >> /boot/cmdline.txt"
echo "pyserial kutuphanesi kuruluyor..."
sudo python -m pip install pyserial
cp /home/pi/piSignagePro/eRS232/TVon.py /home/pi/TVon.py
cp /home/pi/piSignagePro/eRS232/TVoff.py /home/pi/TVoff.py
echo "Dosyalar kopyalandi..."
echo "crontab ekleniyor..."
touch mycron
echo "# m h  dom mon dow   command" >> mycron
echo "@reboot python /home/pi/TVon.py" >> mycron
echo "00 04 * * * sudo reboot" >> mycron
crontab mycron
rm mycron

# install Lan Messenger:dernière version\Debian amd64:

apt-get update && apt-get upgrade -y
wget https://netcologne.dl.sourceforge.net/project/lanmsngr/1.2.32/lmc_1.2.32_i386.deb
dpkg -add-architecture i386
dpkg -i lmc_1.2.32_i386.deb
apt-get remove libstdc++
apt-get install libstdc++:i386
apt-get install libstdc++6-4.8-dbg:i386
apt-get install libsqlite3-dev:i386
apt-get install libXrender-dev:i386
apt-get install libgstreamer-plugins-base0.10-0:i386
apt-get install libfontconfig:i386
apt-get install libXi-dev:i386
apt-get install libqtcore4:i386
apt-get install libqt4-network:i386
apt-get install libqtgui4:i386
apt-get update
apt-get -f install -y
apt-get upgrade -y

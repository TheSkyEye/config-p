##
## install.sh for Installation logiciel
##
## Made by TheSkyEye
##

#!/bin/sh

##############################################################
#application des mises à jour et modification du sources.list#
##############################################################

# Test que le script est lance en root
if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

cd
mkdir /home/install
cd /home/install

now=$(date +"%d-%m-%Y")
log_file=/home/install/log_script_install-$now.log
touch $log_file
#exec 2>$log_file
noir='\e[0;30m'
gris='\e[1;30m'
rougefonce='\e[0;31m'
rose='\e[1;31m'
vertfonce='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleufonce='\e[0;34m'
bleuclair='\e[1;34m'
violetfonce='\e[0;35m'
violetclair='\e[1;35m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'

webmin_version='1.810/webmin_1.810_all.deb'
webmin_version2='webmin_1.810_all.deb'
veracrypt_version='1.19'

if [ $? == 0 ]
	then echo -e "$noir[$vertfonceOK$noir]"
	else echo -e "$noir[$rougefonceKO$noir]"
	fi


echo "mise à jour du system"
sed -i '/cdrom/d' /etc/apt/sources.list

apt-get update -qq
apt-get upgrade -y

############################
#installation des logiciels#
############################
echo "INSTALLATION DES LOGICIELS"
#ssh
apt-get install ssh -y
#check_error
#emacs
apt-get install emacs -y
#virtualbox
apt-get install virtualbox -y
#chromium
apt-get install chromium-l10n -y
#knockd
apt-get install knockd -y
#audacity
apt-get install audacity -y
#calibre
apt-get install calibre -y
#clamav
apt-get install clamav -y
#clamtk
apt-get install clamtk -y
#qemu
apt-get install qemu -y
#keepassx
apt-get install keepassx -y
#htop
apt-get install htop -y
#valgrind
apt-get install valgrind -y
#tor
apt-get install tor -y
#pip
apt-get install python-pip -y
#handbrake
apt-get install handbrake -y
#uget
apt-get install uget -y
#scribus
apt-get install scribus -y
#gitk
apt-get install gitk -y
#fail2ban
apt-get install fail2ban -y
#filezilla
apt-get install filezilla -y
#wine
apt-get install wine -y
#yasat
apt-get install yasat -y
#psutils
apt-get install psutils -y
#pdfmod
apt-get install pdfmod -y
#aircrack-ng
apt-get install aircrack-ng -y
#nginx
apt-get install nginx -y
#ettercap
apt-get install ettercap-graphical -y
#nodejs
apt-get install nodejs -y
#npm
apt-get install npm -y
#gparted
apt-get install gparted -y
#chkrootkit
apt-get install chkrootkit -y
#vlc
apt-get install vlc -y
#curl
apt-get install curl -y
#lynx
apt-get install lynx -y
#hping3
apt-get install hping3 -y
#yersinia
apt-get install yersinia -y
#sslstrip
apt-get install sslstrip -y
#wifite
apt-get install wifite -y
#arping
apt-get install arping -y
#dnstracer
apt-get install dnstracer -y
#ike-scan
apt-get install ike-scan -y
#netdiscover
apt-get install netdiscover -y
#p0f
apt-get install p0f -y
#pscan
apt-get install pscan -y
#masscan
apt-get install masscan -y
#sslscan
apt-get install sslscan -y
#lynis
apt-get install lynis -y
#siege
apt-get install siege -y
#httrack
apt-get install httrack -y
#cadaver
apt-get install cadaver -y
#tcpdump
apt-get install tcpdump -y
#icmpush
apt-get install icmpush -y
#tcptrack
apt-get install tcpreplay -y
#xprobe
apt-get install xprobe -y
#logcheck
apt-get install logcheck -y
#flawfinder
apt-get install flawfinder -y
#skipfish
apt-get install skipfish -y
#w3af
apt-get install w3af -y
#nbtscan
apt-get install nbtscan -y
#knocker
apt-get install knocker -y
#wapiti
apt-get install wapiti -y
#logwatch
apt-get install logwatch -y
#rkhunter
apt-get install rkhunter -y
#whatweb
apt-get install whatweb -y
#crunch
apt-get install crunch -y
#splint
apt-get install splint -y
#fcrackzip
apt-get install fcrackzip -y
#cmospwd
apt-get install cmospwd -y
#john
apt-get install john -y
#medusa
apt-get install medusa -y
#ophcrack
apt-get install ophcrack -y
#samdump2
apt-get install samdump2 -y
#sipcrack
apt-get install sipcrack -y
#sucrack
apt-get install sucrack -y
#btscanner
apt-get install btscanner -y
#clang
apt-get install clang -y
#flasm
apt-get install flasm -y
#radare2
apt-get install radare2 -y
#dsniff
apt-get install dsniff -y
#darkstat
apt-get install darkstat -y
#mitmproxy
apt-get install mitmproxy -y
#netsniff-ng
apt-get install netsniff-ng -y
#driftnet
apt-get install driftnet -y
#sslsniff
apt-get install sslsniff -y
#tcpflow
apt-get install tcpflow -y
#tcpreplay
apt-get install tcpreplay -y
#iodine
apt-get install iodine -y
#miredo
apt-get install miredo -y
#proxychains
apt-get install proxychains -y
#proxytunnel
apt-get install proxytunnel -y
#ptunnel
apt-get install ptunnel -y
#stunnel4
apt-get install stunnel4 -y
#udptunnel
apt-get install udptunnel -y
#autopsy
apt-get install autopsy -y
#binwalk
apt-get install binwalk -y
#dc3dd
apt-get install dc3dd -y
#dcfldd
apt-get install dcfldd -y
#irpas
apt-get install irpas -y
#dff
apt-get install dff -y
#extundelete
apt-get install extundelete -y
#foremost
apt-get install foremost -y
#galetta
apt-get install galetta -y
#guymager
apt-get install guymager -y
#magicrescue
apt-get install magicrescue -y
#pasco
apt-get install pasco -y
#pev
apt-get install pev -y
#readpst
apt-get install readpst -y
#recoverjpeg
apt-get install recoverjpeg -y
#rifiuti
apt-get install rifiuti -y
#rifiuti2
apt-get install rifiuti2 -y
#safecopy
apt-get install safecopy -y
#scalpel
apt-get install scalpel -y
#scrounge-ntfs
apt-get install scrounge-ntfs -y
#vinetto
apt-get install vinetto -y
#volatility
apt-get install volatility -y
#cutycapt
apt-get install cutycapt -y
#libauthen-pam-perl
apt-get install libauthen-pam-perl -y
#beef
apt-get install beef -y
#python-elixir
apt-get install python-elixir -y
#apt-show-versions
apt-get install apt-show-versions -y
#libio-pty-perl
apt-get install libio-pty-perl -y
#wireshark
apt-get install wireshark -y
#sslh
apt-get install sslh -y
#kismet
apt-get install kismet -y
#macchanger
apt-get install macchanger -y
#blender
#apt-get install blender -y
#sweethome3d
#apt-get install sweethome3d -y
#geogebra
#apt-get install geogebra -y
#phpmyadmin
#apt-get install phpmyadmin -y
#apache2
#apt-get install apache2 -y
	#apachetop
	#apt-get install apachetop -y

apt-get install -f
apt-get autoremove -y

echo "instalation des logicies avec une instalation special"
#atom
wget https://atom.io/download/deb
dpkg -i deb

#metaspoilt
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

#webmin
wget http://netcologne.dl.sourceforge.net/project/webadmin/webmin/$webmin_version
dpkg -i $webmin_version2

#OpenOffice
#wget #http://sourceforge.net/projects/openofficeorg.mirror/files/4.1.2/binaries/fr/Apache_OpenOffice_4.1.2_Linux_x86_install-deb_fr.tar.gz
#wget https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.2/binaries/fr/Apache_OpenOffice_4.1.2_Linux_x86-64_install-deb_fr.tar.gz
#tar xzf Apache_OpenOffice_4.1.2_Linux_x86_install-deb_fr.tar.gz
#cd fr/DEBS/
#dpkg -i *.deb
#cd desktop-integration/
#dpkg -i openoffice4.1-debian-menu*.deb

#veracrypt
wget https://sourceforge.net/projects/veracrypt/files/VeraCrypt%20$veracrypt_version/veracrypt-$veracrypt_version-setup.tar.bz2
tar xjf veracrypt-$veracrypt_version-setup.tar.bz2
./veracrypt-$veracrypt_version-setup-gui-x64

echo "désinstalation des logicels de merde"
#libreoffice
#apt-get remove libreoffice* -y
#Konqueror
apt-get remove Konqueror -y
#iceweasel
apt-get remove iceweasel -y

apt-get install -f
apt-get autoremove -y
apt-get update
apt-get upgrade -y

##############################
#stoper les services inutiles#
##############################
sed -i -e "s/Port\ 22/Port\ 7894/g" /etc/ssh/sshd_config
/etc/init.d/knockd stop
/etc/init.d/nginx stop
/etc/init.d/fail2ban stop
/etc/init.d/clamav-freshclam stop
/etc/init.d/apache2 stop
/etc/init.d/sshd restart

#########################
#configuration du bashrc#
#########################
cd
echo "configuration du bashrc"
echo "" >> .bashrc
echo "alias ifconfig='/sbin/ifconfig'" >> .bashrc
echo "alias ll='ls -l'" >> .bashrc
echo "alias la='ls -A'" >> .bashrc
echo "alias l='ls -CF'" >> .bashrc
echo "alias ne='emacs -nw'" >> .bashrc
echo "alias cl='clear'" >> .bashrc
echo "alias i='apt-get install'" >> .bashrc
echo "alias u='apt-get update'" >> .bashrc
echo "alias up='apt-get upgrade'" >> .bashrc
echo "alias x='exit'" >> .bashrc
echo "alias xx='sudo shutdown now'" >> .bashrc
echo "alias xwx='sudo poweroff'" >> .bashrc
echo "alias scan_network='nmap -v -sn 192.168.1.0/24 | grep -v down | grep -v "Host is up" | grep -v "Parallel DNS resolution" | grep -v "Raw packets sent" | grep -v "Initiating ARP Ping" | grep -v "Completed ARP Ping Scan" | grep -v "Read data files" | grep -v "Scanning 255 hosts" | grep -v "Nmap done" | grep -v "Starting Nmap"'" >> .bashrc
echo 'HISTTIMEFORMAT="%Y/%m/%d %T "' >> .bashrc
source ~/.bashrc

openvas-setup
rkhunter --update
lynis --check-update
	#lynis update check
nikto -update
freshclam
chkrootkit
clamscan
tiger -q
lynis -c -q
	#lynis audit system
#pip install --upgrade pip

echo "##############################"
echo "#L'installation est terminée.#"
echo "##############################"



## JEUX
#apt-get install 0ad


#echo "###############################"
#echo "#   Chnger le thème du GRUB   #"
#echo "###############################"

#wget https://dl.opendesktop.org/api/files/download/id/1460735684/174670-breeze-grub.zip
#unzip 174670-breeze-grub.zip
#mkdir /boot/grub/themes
#mv Breeze /boot/grub/themes/
#echo 'GRUB_THEME="/boot/grub/themes/Breeze/theme.txt"' >> /etc/default/grub
#grub-mkconfig -o /boot/grub/grub.cfg

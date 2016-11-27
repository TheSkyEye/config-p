#!/bin/bash
##
## install.sh for Installation logiciel
##
## Made by TheSkyEye
##


##############################################################
#application des mises à jour et modification du sources.list#
##############################################################

# Test que le script est lance en root
if [ $EUID -ne 0 ]; then
  echo "Le script doit être lancé en root: # sudo $0" 1>&2
  exit 1
fi

# création d'un dossier d'instalation
cd
mkdir /home/install
cd /home/install

# création d'un fichier de log
now=$(date +"%d-%m-%Y")
log_file=/home/install/log_script_install-$now.log
touch $log_file
echo "####################################################################" > $log_file
echo "#                          Debut du script                         #" >> $log_file
echo "####################################################################" >> $log_file
echo "" >> $log_file
echo "--------------------------------------------------------------------" >> $log_file

# Premier parametre: MESSAGE
# Autres parametres: COMMAND
displayandexec() {
  local message=$1
  echo -n "[En cours] $message"
  shift
  echo ">>> $*" >> $log_file 2>&1
  sh -c "$*" >> $log_file 2>&1
  local ret=$?
  if [ $ret -ne 0 ]; then
    echo -e "\r\e[0;30m $message                     \e[0;31m[ERROR]\e[0m "
  else
    echo -e "\r\e[0;30m $message                     \e[0;32m[OK]\e[0m "
  fi
  return $ret
}

# variable globale
webmin_version='1.810/webmin_1.810_all.deb'
webmin_version2='webmin_1.810_all.deb'
veracrypt_version='1.19'
AGI='apt-get install -y'


# suppression du CDROM dans sources.list
displayandexec "suppression du CDROM dans sources.list" "sed -i '/cdrom/d' /etc/apt/sources.list"

echo "       ################################################################"
echo "       #                      MISE A JOUR DU SYSTEM                   #"
echo "       ################################################################"

displayandexec "Mise à jour de la liste des paquets" "apt-get update -y"
displayandexec "Mise à jour des paquets            " "apt-get update -y"

############################
#installation des logiciels#
############################
echo "       ################################################################"
echo "       #                   INSTALLATION DES LOGICIELS                 #"
echo "       ################################################################"

displayandexec "Installation de ssh               " "$AGI ssh"
displayandexec "Installation de emacs             " "$AGI emacs"
displayandexec "Installation de virtualbox        " "$AGI virtualbox"
displayandexec "Installation de chromium          " "$AGI chromium-l10n"
displayandexec "Installation de knockd            " "$AGI knockd"
displayandexec "Installation de audacity          " "$AGI audacity"
displayandexec "Installation de calibre           " "$AGI calibre"
displayandexec "Installation de clamav            " "$AGI clamav"
displayandexec "Installation de clamtk            " "$AGI clamtk"
displayandexec "Installation de qemu              " "$AGI qemu"
displayandexec "Installation de keepassx          " "$AGI keepassx"
displayandexec "Installation de htop              " "$AGI htop"
displayandexec "Installation de valgrind          " "$AGI valgrind"
displayandexec "Installation de python-pip        " "$AGI python-pip"
displayandexec "Installation de handbrake         " "$AGI handbrake"
displayandexec "Installation de uget              " "$AGI uget"
displayandexec "Installation de scribus           " "$AGI scribus"
displayandexec "Installation de gitk              " "$AGI gitk"
displayandexec "Installation de fail2ban          " "$AGI fail2ban"
displayandexec "Installation de filezilla         " "$AGI filezilla"
displayandexec "Installation de wine              " "$AGI wine"
displayandexec "Installation de yasat             " "$AGI yasat"
displayandexec "Installation de psutils           " "$AGI psutils"
displayandexec "Installation de pdfmod            " "$AGI pdfmod"
displayandexec "Installation de aircrack-ng       " "$AGI aircrack-ng"
displayandexec "Installation de nginx             " "$AGI nginx"
displayandexec "Installation de ettercap-graphical" "$AGI ettercap-graphical"
displayandexec "Installation de nodejs            " "$AGI nodejs"
displayandexec "Installation de npm               " "$AGI npm"
displayandexec "Installation de gparted           " "$AGI gparted"
displayandexec "Installation de chkrootkit        " "$AGI chkrootkit"
displayandexec "Installation de vlc               " "$AGI vlc"
displayandexec "Installation de curl              " "$AGI curl"
displayandexec "Installation de lynx              " "$AGI lynx"
displayandexec "Installation de nikto             " "$AGI nikto"
displayandexec "Installation de hping3            " "$AGI hping3"
displayandexec "Installation de yersinia          " "$AGI yersinia"
displayandexec "Installation de sslstrip          " "$AGI sslstrip"
displayandexec "Installation de wifite            " "$AGI wifite"
displayandexec "Installation de arping            " "$AGI arping"
displayandexec "Installation de dnstracer         " "$AGI dnstracer"
displayandexec "Installation de ike-scan          " "$AGI ike-scan"
displayandexec "Installation de netdiscover       " "$AGI netdiscover"
displayandexec "Installation de p0f               " "$AGI p0f"
displayandexec "Installation de pscan             " "$AGI pscan"
displayandexec "Installation de arduino           " "$AGI arduino"
displayandexec "Installation de arpwatch          " "$AGI arpwatch"
displayandexec "Installation de masscan           " "$AGI masscan"
displayandexec "Installation de sslscan           " "$AGI sslscan"
displayandexec "Installation de lynis             " "$AGI lynis"
displayandexec "Installation de siege             " "$AGI siege"
displayandexec "Installation de httrack           " "$AGI httrack"
displayandexec "Installation de cadaver           " "$AGI cadaver"
displayandexec "Installation de tcpdump           " "$AGI tcpdump"
displayandexec "Installation de icmpush           " "$AGI icmpush"
displayandexec "Installation de tcpreplay         " "$AGI tcpreplay"
displayandexec "Installation de xprobe            " "$AGI xprobe"
displayandexec "Installation de logcheck          " "$AGI logcheck"
displayandexec "Installation de flawfinder        " "$AGI flawfinder"
displayandexec "Installation de skipfish          " "$AGI skipfish"
displayandexec "Installation de w3af              " "$AGI w3af"
displayandexec "Installation de nbtscan           " "$AGI nbtscan"
displayandexec "Installation de knocker           " "$AGI knocker"
displayandexec "Installation de wapiti            " "$AGI wapiti"
displayandexec "Installation de logwatch          " "$AGI logwatch"
displayandexec "Installation de rkhunter          " "$AGI rkhunter"
displayandexec "Installation de whatweb           " "$AGI whatweb"
displayandexec "Installation de crunch            " "$AGI crunch"
displayandexec "Installation de splint            " "$AGI splint"
displayandexec "Installation de fcrackzip         " "$AGI fcrackzip"
displayandexec "Installation de cmospwd           " "$AGI cmospwd"
displayandexec "Installation de john              " "$AGI john"
displayandexec "Installation de medusa            " "$AGI medusa"
displayandexec "Installation de ophcrack          " "$AGI ophcrack"
displayandexec "Installation de samdump2          " "$AGI samdump2"
displayandexec "Installation de sipcrack          " "$AGI sipcrack"
displayandexec "Installation de sucrack           " "$AGI sucrack"
displayandexec "Installation de btscanner         " "$AGI btscanner"
displayandexec "Installation de clang             " "$AGI clang"
displayandexec "Installation de flasm             " "$AGI flasm"
displayandexec "Installation de radare2           " "$AGI radare2"
displayandexec "Installation de dsniff            " "$AGI dsniff"
displayandexec "Installation de darkstat          " "$AGI darkstat"
displayandexec "Installation de mitmproxy         " "$AGI mitmproxy"
displayandexec "Installation de driftnet          " "$AGI driftnet"
displayandexec "Installation de sslsniff          " "$AGI sslsniff"
displayandexec "Installation de tcpflow           " "$AGI tcpflow"
displayandexec "Installation de tcpreplay         " "$AGI tcpreplay"
displayandexec "Installation de iodine            " "$AGI iodine"
displayandexec "Installation de miredo            " "$AGI miredo"
displayandexec "Installation de proxychains       " "$AGI proxychains"
displayandexec "Installation de proxytunnel       " "$AGI proxytunnel"
displayandexec "Installation de ptunnel           " "$AGI ptunnel"
displayandexec "Installation de stunnel4          " "$AGI stunnel4"
displayandexec "Installation de udptunnel         " "$AGI udptunnel"
displayandexec "Installation de autopsy           " "$AGI autopsy"
displayandexec "Installation de binwalk           " "$AGI binwalk"
displayandexec "Installation de dc3dd             " "$AGI dc3dd"
displayandexec "Installation de dcfldd            " "$AGI dcfldd"
displayandexec "Installation de dff               " "$AGI dff"
displayandexec "Installation de extundelete       " "$AGI extundelete"
displayandexec "Installation de foremost          " "$AGI foremost"
displayandexec "Installation de guymager          " "$AGI guymager"
displayandexec "Installation de magicrescue       " "$AGI magicrescue"
displayandexec "Installation de pasco             " "$AGI pasco"
displayandexec "Installation de pev               " "$AGI pev"
displayandexec "Installation de readpst           " "$AGI readpst"
displayandexec "Installation de recoverjpeg       " "$AGI recoverjpeg"
displayandexec "Installation de rifiuti           " "$AGI rifiuti"
displayandexec "Installation de rifiuti2          " "$AGI rifiuti2"
displayandexec "Installation de safecopy          " "$AGI safecopy"
displayandexec "Installation de scalpel           " "$AGI scalpel"
displayandexec "Installation de scrounge-ntfs     " "$AGI scrounge-ntfs"
displayandexec "Installation de vinetto           " "$AGI vinetto"
displayandexec "Installation de volatility        " "$AGI volatility"
displayandexec "Installation de cutycapt          " "$AGI cutycapt"
displayandexec "Installation de libauthen-pam-perl" "$AGI libauthen-pam-perl"
displayandexec "Installation de beef              " "$AGI beef"
displayandexec "Installation de python-elixir     " "$AGI python-elixir"
displayandexec "Installation de apt-show-versions " "$AGI apt-show-versions"
displayandexec "Installation de libio-pty-perl    " "$AGI libio-pty-perl"
displayandexec "Installation de wireshark         " "$AGI wireshark"
displayandexec "Installation de sslh              " "$AGI sslh"
displayandexec "Installation de kismet            " "$AGI kismet"
displayandexec "Installation de macchanger        " "$AGI macchanger"
# displayandexec "Installation de blender         " "$AGI blender"
# displayandexec "Installation de sweethome3d     " "$AGI sweethome3d"
# displayandexec "Installation de geogebra        " "$AGI geogebra"
# displayandexec "Installation de phpmyadmin      " "$AGI phpmyadmin"
# displayandexec "Installation de apache2         " "$AGI apache2"
# displayandexec "Installation de apachetop       " "$AGI apachetop"

# # #ssh
# # apt-get install ssh -y
# # #check_error
# # #emacs
# # apt-get install emacs -y
# # #virtualbox
# # apt-get install virtualbox -y
# # #chromium
# # apt-get install chromium-l10n -y
# # #knockd
# # apt-get install knockd -y
# # #audacity
# # apt-get install audacity -y
# # #calibre
# # apt-get install calibre -y
# # #clamav
# # apt-get install clamav -y
# # #clamtk
# # apt-get install clamtk -y
# # #qemu
# # apt-get install qemu -y
# # #keepassx
# # apt-get install keepassx -y
# # #htop
# # apt-get install htop -y
# # #valgrind
# # apt-get install valgrind -y
# # #tor
# # apt-get install tor -y
# # #pip
# # apt-get install python-pip -y
# # #handbrake
# # apt-get install handbrake -y
# #uget
# # apt-get install uget -y
# # #scribus
# # apt-get install scribus -y
# # #gitk
# # apt-get install gitk -y
# # #fail2ban
# # apt-get install fail2ban -y
# # #filezilla
# # apt-get install filezilla -y
# # #wine
# # apt-get install wine -y
# # #yasat
# # apt-get install yasat -y
# # #psutils
# # apt-get install psutils -y
# # #pdfmod
# # apt-get install pdfmod -y
# #aircrack-ng
# apt-get install aircrack-ng -y
# #nginx
# apt-get install nginx -y
# #ettercap
# apt-get install ettercap-graphical -y
# #nodejs
# apt-get install nodejs -y
# #npm
# apt-get install npm -y
# #gparted
# apt-get install gparted -y
# #chkrootkit
# apt-get install chkrootkit -y
# #vlc
# apt-get install vlc -y
# #curl
# apt-get install curl -y
# #lynx
# apt-get install lynx -y
#nikto
# apt-get install nikto -y
# #hping3
# apt-get install hping3 -y
# #yersinia
# apt-get install yersinia -y
# #sslstrip
# apt-get install sslstrip -y
# #wifite
# apt-get install wifite -y
# #arping
# apt-get install arping -y
# #dnstracer
# apt-get install dnstracer -y
# #ike-scan
# apt-get install ike-scan -y
# #netdiscover
# apt-get install netdiscover -y
# #p0f
# apt-get install p0f -y
# #pscan
# apt-get install pscan -y
#arduino
# apt-get install arduino -y
# #arpwatch
# apt-get install arpwatch -y
# #masscan
# apt-get install masscan -y
# #sslscan
# apt-get install sslscan -y
# #lynis
# apt-get install lynis -y
# #siege
# apt-get install siege -y
# #httrack
# apt-get install httrack -y
# #cadaver
# apt-get install cadaver -y
# #tcpdump
# apt-get install tcpdump -y
# #icmpush
# apt-get install icmpush -y
# #tcptrack
# apt-get install tcpreplay -y
# #xprobe
# apt-get install xprobe -y
# #logcheck
# apt-get install logcheck -y
# #flawfinder
# apt-get install flawfinder -y
# #skipfish
# apt-get install skipfish -y
# #w3af
# apt-get install w3af -y
# #nbtscan
# apt-get install nbtscan -y
#knocker
# apt-get install knocker -y
# #wapiti
# apt-get install wapiti -y
# #logwatch
# apt-get install logwatch -y
# #rkhunter
# apt-get install rkhunter -y
# #whatweb
# apt-get install whatweb -y
# #crunch
# apt-get install crunch -y
# #splint
# apt-get install splint -y
# #fcrackzip
# apt-get install fcrackzip -y
# #cmospwd
# apt-get install cmospwd -y
# #john
# apt-get install john -y
# #medusa
# apt-get install medusa -y
# #ophcrack
# apt-get install ophcrack -y
# #samdump2
# apt-get install samdump2 -y
#sipcrack
# apt-get install sipcrack -y
# #sucrack
# apt-get install sucrack -y
# #btscanner
# apt-get install btscanner -y
# #clang
# apt-get install clang -y
# #flasm
# apt-get install flasm -y
# #radare2
# apt-get install radare2 -y
# #dsniff
# apt-get install dsniff -y
# #darkstat
# apt-get install darkstat -y
# #mitmproxy
# apt-get install mitmproxy -y
# #netsniff-ng
# apt-get install netsniff-ng -y
# #driftnet
# apt-get install driftnet -y
# #sslsniff
# apt-get install sslsniff -y
# #tcpflow
# apt-get install tcpflow -y
# #tcpreplay
# apt-get install tcpreplay -y
# #iodine
# apt-get install iodine -y
#miredo
# apt-get install miredo -y
# #proxychains
# apt-get install proxychains -y
# #proxytunnel
# apt-get install proxytunnel -y
# #ptunnel
# apt-get install ptunnel -y
# #stunnel4
# apt-get install stunnel4 -y
# #udptunnel
# apt-get install udptunnel -y
# #autopsy
# apt-get install autopsy -y
# #binwalk
# apt-get install binwalk -y
# #dc3dd
# apt-get install dc3dd -y
# #dcfldd
# apt-get install dcfldd -y
# #irpas
# apt-get install irpas -y
# #dff
# apt-get install dff -y
# #extundelete
# apt-get install extundelete -y
#foremost
# apt-get install foremost -y
# #galetta
# apt-get install galetta -y
# #guymager
# apt-get install guymager -y
# #magiccrescue
# apt-get install magiccrescue -y
# #pasco
# apt-get install pasco -y
# #pev
# apt-get install pev -y
# #readpst
# apt-get install readpst -y
# #recoverjpeg
# apt-get install recoverjpeg -y
# #rifiuti
# apt-get install rifiuti -y
# #rifiuti2
# apt-get install rifiuti2 -y
# #safecopy
# apt-get install safecopy -y
# #scalpel
# apt-get install scalpel -y
# #scrounge-ntfs
# apt-get install scrounge-ntfs -y
# #vinetto
# apt-get install vinetto -y
# #volatility
# apt-get install volatility -y
# #cutycapt
# apt-get install cutycapt -y
# #libauthen-pam-perl
# apt-get install libauthen-pam-perl -y
# #beef
# apt-get install beef -y
# #python-elixir
# apt-get install python-elixir -y
# #apt-show-versions
# apt-get install apt-show-versions -y
# #libio-pty-perl
# apt-get install libio-pty-perl -y
# #wireshark
# apt-get install wireshark -y
#sslh
# apt-get install sslh -y
# #kismet
# apt-get install kismet -y
# #macchanger
# apt-get install macchanger -y

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

displayandexec "Installation des dépendances manquantes" "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"

echo "instalation des logicies avec une instalation special"
#atom
wget -q https://atom.io/download/deb
displayandexec "Installation de atom              " "dpkg -i deb"


#metaspoilt
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

#webmin
wget -q http://netcologne.dl.sourceforge.net/project/webadmin/webmin/$webmin_version
displayandexec "Installation de webmin            " "dpkg -i $webmin_version2"

#OpenOffice
#wget -q  http://sourceforge.net/projects/openofficeorg.mirror/files/4.1.2/binaries/fr/Apache_OpenOffice_4.1.2_Linux_x86_install-deb_fr.tar.gz
#wget -q  https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.2/binaries/fr/Apache_OpenOffice_4.1.2_Linux_x86-64_install-deb_fr.tar.gz
#tar xzf Apache_OpenOffice_4.1.2_Linux_x86_install-deb_fr.tar.gz
#cd fr/DEBS/
#dpkg -i *.deb
#cd desktop-integration/
#dpkg -i openoffice4.1-debian-menu*.deb

#veracrypt
wget -q https://sourceforge.net/projects/veracrypt/files/VeraCrypt%20$veracrypt_version/veracrypt-$veracrypt_version-setup.tar.bz2
tar xjf veracrypt-$veracrypt_version-setup.tar.bz2
./veracrypt-$veracrypt_version-setup-gui-x64

#golismero
#pip install golismero
#ln -s /opt/golismero/golismero.py /usr/bin/golismero

echo "désinstalation des logicels de merde"
#libreoffice
apt-get remove libreoffice* -y
#Konqueror
apt-get remove Konqueror -y
#iceweasel
apt-get remove iceweasel -y

displayandexec "Installation des dépendances manquantes" "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"
displayandexec "Mise à jour de la liste des paquets" "apt-get update -y"
displayandexec "Mise à jour des paquets            " "apt-get update -y"

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
echo "alias h='history'" >> .bashrc
echo "alias ne='emacs -nw'" >> .bashrc
echo "alias cl='clear'" >> .bashrc
echo "alias i='apt-get install'" >> .bashrc
echo "alias u='apt-get update'" >> .bashrc
echo "alias up='apt-get upgrade'" >> .bashrc
echo "alias x='exit'" >> .bashrc
echo "alias xx='sudo shutdown now'" >> .bashrc
echo "alias xwx='sudo poweroff'" >> .bashrc
displayandexec "Configuration du bashrc" "echo 'HISTTIMEFORMAT="%Y/%m/%d %T   "' >> .bashrc"
displayandexec "Réinitialisation du bashrc" "source ~/.bashrc"
#source ~/.bashrc

#openvas-setup
displayandexec "Mise à jour de la base de donnée de rkhunter" "rkhunter --update"
#lynis --check-update
	#lynis update check
displayandexec "Mise à jour de la base de donnée de nikto" "nikto -update"
#nikto -update
displayandexec "Mise à jour de la base de donnée de ClamAV" "freshclam"
#chkrootkit
#clamscan
#tiger -q
#lynis -c -q
	#lynis audit system
#pip install --upgrade pip

echo "--------------------------------------------------------------------" >> $log_file
echo "" >> $log_file
echo "####################################################################" >> $log_file
echo "#                           Fin du script                          #" >> $log_file
echo "####################################################################" >> $log_file

echo ""
echo "       ####################################################################"
echo "       #                    L'installation est terminée                   #"
echo "       ####################################################################"
echo ""



## JEUX
#apt-get install 0ad

#if [ $? -ne 0 ]; then
#  logguer "Processus ${PS} not started"
#  start
#fi


#echo "     ###############################"
#echo "     #   Chnger le thème du GRUB   #"
#echo "     ###############################"

#wget https://dl.opendesktop.org/api/files/download/id/1460735684/174670-breeze-grub.zip
#unzip 174670-breeze-grub.zip
#mkdir /boot/grub/themes
#mv Breeze /boot/grub/themes/
#echo 'GRUB_THEME="/boot/grub/themes/Breeze/theme.txt"' >> /etc/default/grub
#grub-mkconfig -o /boot/grub/grub.cfg



#FONCTIONNE
#apt-get install -y mediainfo > /dev/null
#if [ $? == 0 ]
#	then echo -e "$noir[$vertfonceOK$noir]"
#	else echo -e "$noir[$rougefonceKO$noir]"
#	fi
##if [ $? == 0 ]
##	then echo "     [OK]"
##	else echo "     [KO]"
##	fi

#if [ $? == 0 ]
#	then echo -e "$noir[$vertfonceOK$noir]"
#	else echo -e "$noir[$rougefonceKO$noir]"
#	fi

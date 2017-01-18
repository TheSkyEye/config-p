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
log_file=/var/log/log_script_install-$now.log
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
    echo -e "\r\e[0;30m $message                \e[0;31m[ERROR]\e[0m "
  else
    echo -e "\r\e[0;30m $message                \e[0;32m[OK]\e[0m "
  fi
  return $ret
}

# variable globale
uname -a | grep debian &> /dev/null
if [ $? == 0 ]; then
	version_linux='Debian'
else
	version_linux='other linux'
fi
version_system=$(cat /etc/debian_version)
webmin_version='1.831'
veracrypt_version='1.19'
openoffice_version='4.1.3'
AGI='apt-get install -y'
WGETCONF='--no-check-certificate -q'

clear
echo ""
echo " ________  __                   ______   __                  ________                     "
echo "/        |/  |                 /      \ /  |                /        |                    "
echo "%%%%%%%%/ %% |____    ______  /%%%%%%  |%% |   __  __    __ %%%%%%%%/  __    __   ______  "
echo "   %% |   %%      \  /      \ %% \__%%/ %% |  /  |/  |  /  |%% |__    /  |  /  | /      \ "
echo "   %% |   %%%%%%%  |/%%%%%%  |%%      \ %% |_/%%/ %% |  %% |%%    |   %% |  %% |/%%%%%%  |"
echo "   %% |   %% |  %% |%%    %% | %%%%%%  |%%   %%<  %% |  %% |%%%%%/    %% |  %% |%%    %% |"
echo "   %% |   %% |  %% |%%%%%%%%/ /  \__%% |%%%%%%  \ %% \__%% |%% |_____ %% \__%% |%%%%%%%%/ "
echo "   %% |   %% |  %% |%%       |%%    %%/ %% | %%  |%%    %% |%%       |%%    %% |%%       |"
echo "   %%/    %%/   %%/  %%%%%%%/  %%%%%%/  %%/   %%/  %%%%%%% |%%%%%%%%/  %%%%%%% | %%%%%%%/ "
echo "                                                  /  \__%% |          /  \__%% |          "
echo "                                                  %%    %%/           %%    %%/           "
echo "                                                   %%%%%%/             %%%%%%/            "
echo ""
echo ""
echo "       ################################################################"
echo "       #            LANCEMENT DU SCRIPT DEBIAN_POSTINSTALL            #"
echo "       ################################################################"
echo ""

echo ""
echo "       ================================================================"
echo ""
echo "                   nom du script       : DEBIAN_POSTINSTALL            "
echo "                   auteur              : TheSkyEye                     "
echo "                   version             : 1.0"
echo "                   lancement du script : bash install.sh               "
echo "                   version du système  : "$version_linux $version_system
echo ""
echo "       ================================================================"
echo ""

# suppression du CDROM dans sources.list
displayandexec "suppression du CDROM dans sources.list              " "sed -i '/cdrom/d' /etc/apt/sources.list"

echo ""
echo "       ################################################################"
echo "       #                      MISE A JOUR DU SYSTEM                   #"
echo "       ################################################################"
echo ""

displayandexec "Mise à jour du system                               " "apt-get update && apt-get upgrade -y"

############################
#installation des logiciels#
############################
echo ""
echo "       ################################################################"
echo "       #                   INSTALLATION DES LOGICIELS                 #"
echo "       ################################################################"
echo ""

displayandexec "Installation de ssh                                 " "$AGI ssh"
displayandexec "Installation de emacs                               " "$AGI emacs"
displayandexec "Installation de virtualbox                          " "$AGI virtualbox"
displayandexec "Installation de chromium                            " "$AGI chromium-l10n"
displayandexec "Installation de knockd                              " "$AGI knockd"
displayandexec "Installation de audacity                            " "$AGI audacity"
displayandexec "Installation de calibre                             " "$AGI calibre"
displayandexec "Installation de clamav                              " "$AGI clamav"
displayandexec "Installation de clamtk                              " "$AGI clamtk"
displayandexec "Installation de qemu                                " "$AGI qemu"
displayandexec "Installation de keepassx                            " "$AGI keepassx"
displayandexec "Installation de htop                                " "$AGI htop"
displayandexec "Installation de valgrind                            " "$AGI valgrind"
displayandexec "Installation de python-pip                          " "$AGI python-pip"
displayandexec "Installation de handbrake                           " "$AGI handbrake"
displayandexec "Installation de uget                                " "$AGI uget"
displayandexec "Installation de scribus                             " "$AGI scribus"
displayandexec "Installation de gitk                                " "$AGI gitk"
displayandexec "Installation de fail2ban                            " "$AGI fail2ban"
displayandexec "Installation de filezilla                           " "$AGI filezilla"
displayandexec "Installation de wine                                " "$AGI zip"
displayandexec "Installation de mplayer                             " "$AGI mplayer"
displayandexec "Installation de zip                                 " "$AGI wine"
displayandexec "Installation de yasat                               " "$AGI yasat"
displayandexec "Installation de psutils                             " "$AGI psutils"
displayandexec "Installation de pdfmod                              " "$AGI pdfmod"
displayandexec "Installation de aircrack-ng                         " "$AGI aircrack-ng"
displayandexec "Installation de nginx                               " "$AGI nginx"
displayandexec "Installation de ettercap-graphical                  " "$AGI ettercap-graphical"
displayandexec "Installation de nodejs                              " "$AGI nodejs"
displayandexec "Installation de npm                                 " "$AGI npm"
displayandexec "Installation de gparted                             " "$AGI gparted"
displayandexec "Installation de chkrootkit                          " "$AGI chkrootkit"
displayandexec "Installation de vlc                                 " "$AGI vlc"
displayandexec "Installation de curl                                " "$AGI curl"
displayandexec "Installation de lynx                                " "$AGI lynx"
displayandexec "Installation de nikto                               " "$AGI nikto"
displayandexec "Installation de libav-tools                         " "$AGI libav-tools"
displayandexec "Installation de scapy                               " "$AGI scapy"
displayandexec "Installation de ngrep                               " "$AGI ngrep"
displayandexec "Installation de hydra-gtk                           " "$AGI hydra-gtk"
displayandexec "Installation de hping3                              " "$AGI hping3"
displayandexec "Installation de yersinia                            " "$AGI yersinia"
displayandexec "Installation de sslstrip                            " "$AGI sslstrip"
displayandexec "Installation de arping                              " "$AGI arping"
displayandexec "Installation de dnstracer                           " "$AGI dnstracer"
displayandexec "Installation de ike-scan                            " "$AGI ike-scan"
displayandexec "Installation de netdiscover                         " "$AGI netdiscover"
displayandexec "Installation de p0f                                 " "$AGI p0f"
displayandexec "Installation de pscan                               " "$AGI pscan"
displayandexec "Installation de arduino                             " "$AGI arduino"
displayandexec "Installation de arpwatch                            " "$AGI arpwatch"
displayandexec "Installation de masscan                             " "$AGI masscan"
displayandexec "Installation de sslscan                             " "$AGI sslscan"
displayandexec "Installation de lynis                               " "$AGI lynis"
displayandexec "Installation de siege                               " "$AGI siege"
displayandexec "Installation de httrack                             " "$AGI httrack"
displayandexec "Installation de cadaver                             " "$AGI cadaver"
displayandexec "Installation de tcpdump                             " "$AGI tcpdump"
displayandexec "Installation de icmpush                             " "$AGI icmpush"
displayandexec "Installation de tcpreplay                           " "$AGI tcpreplay"
displayandexec "Installation de xprobe                              " "$AGI xprobe"
displayandexec "Installation de logcheck                            " "$AGI logcheck"
displayandexec "Installation de flawfinder                          " "$AGI flawfinder"
displayandexec "Installation de skipfish                            " "$AGI skipfish"
displayandexec "Installation de w3af                                " "$AGI w3af"
displayandexec "Installation de nbtscan                             " "$AGI nbtscan"
displayandexec "Installation de knocker                             " "$AGI knocker"
displayandexec "Installation de wapiti                              " "$AGI wapiti"
displayandexec "Installation de logwatch                            " "$AGI logwatch"
displayandexec "Installation de rkhunter                            " "$AGI rkhunter"
displayandexec "Installation de whatweb                             " "$AGI whatweb"
displayandexec "Installation de crunch                              " "$AGI crunch"
displayandexec "Installation de splint                              " "$AGI splint"
displayandexec "Installation de fcrackzip                           " "$AGI fcrackzip"
displayandexec "Installation de cmospwd                             " "$AGI cmospwd"
displayandexec "Installation de john                                " "$AGI john"
displayandexec "Installation de medusa                              " "$AGI medusa"
displayandexec "Installation de ophcrack                            " "$AGI ophcrack"
displayandexec "Installation de samdump2                            " "$AGI samdump2"
displayandexec "Installation de sipcrack                            " "$AGI sipcrack"
displayandexec "Installation de sucrack                             " "$AGI sucrack"
displayandexec "Installation de btscanner                           " "$AGI btscanner"
displayandexec "Installation de clang                               " "$AGI clang"
displayandexec "Installation de flasm                               " "$AGI flasm"
displayandexec "Installation de radare2                             " "$AGI radare2"
displayandexec "Installation de dsniff                              " "$AGI dsniff"
displayandexec "Installation de darkstat                            " "$AGI darkstat"
displayandexec "Installation de mitmproxy                           " "$AGI mitmproxy"
displayandexec "Installation de driftnet                            " "$AGI driftnet"
displayandexec "Installation de sslsniff                            " "$AGI sslsniff"
displayandexec "Installation de tcpflow                             " "$AGI tcpflow"
displayandexec "Installation de tcpreplay                           " "$AGI tcpreplay"
displayandexec "Installation de iodine                              " "$AGI iodine"
displayandexec "Installation de miredo                              " "$AGI miredo"
displayandexec "Installation de proxychains                         " "$AGI proxychains"
displayandexec "Installation de proxytunnel                         " "$AGI proxytunnel"
displayandexec "Installation de ptunnel                             " "$AGI ptunnel"
displayandexec "Installation de stunnel4                            " "$AGI stunnel4"
displayandexec "Installation de udptunnel                           " "$AGI udptunnel"
displayandexec "Installation de autopsy                             " "$AGI autopsy"
displayandexec "Installation de binwalk                             " "$AGI binwalk"
displayandexec "Installation de dc3dd                               " "$AGI dc3dd"
displayandexec "Installation de dcfldd                              " "$AGI dcfldd"
displayandexec "Installation de dff                                 " "$AGI dff"
displayandexec "Installation de extundelete                         " "$AGI extundelete"
displayandexec "Installation de foremost                            " "$AGI foremost"
displayandexec "Installation de guymager                            " "$AGI guymager"
displayandexec "Installation de magicrescue                         " "$AGI magicrescue"
displayandexec "Installation de pasco                               " "$AGI pasco"
displayandexec "Installation de pev                                 " "$AGI pev"
displayandexec "Installation de readpst                             " "$AGI readpst"
displayandexec "Installation de recoverjpeg                         " "$AGI recoverjpeg"
displayandexec "Installation de rifiuti                             " "$AGI rifiuti"
displayandexec "Installation de rifiuti2                            " "$AGI rifiuti2"
displayandexec "Installation de safecopy                            " "$AGI safecopy"
displayandexec "Installation de scalpel                             " "$AGI scalpel"
displayandexec "Installation de tcptrace                            " "$AGI tcptrace"
displayandexec "Installation de scrounge-ntfs                       " "$AGI scrounge-ntfs"
displayandexec "Installation de vinetto                             " "$AGI vinetto"
displayandexec "Installation de volatility                          " "$AGI volatility"
displayandexec "Installation de cutycapt                            " "$AGI cutycapt"
displayandexec "Installation de libauthen-pam-perl                  " "$AGI libauthen-pam-perl"
displayandexec "Installation de beef                                " "$AGI beef"
displayandexec "Installation de gddrescue                           " "$AGI gddrescue"
displayandexec "Installation de python-elixir                       " "$AGI python-elixir"
displayandexec "Installation de apt-show-versions                   " "$AGI apt-show-versions"
displayandexec "Installation de libio-pty-perl                      " "$AGI libio-pty-perl"
displayandexec "Installation de automake                            " "$AGI automake"
displayandexec "Installation de autotools-dev                       " "$AGI autotools-dev"
displayandexec "Installation de libltdl-dev                         " "$AGI libltdl-dev"
displayandexec "Installation de python-dev                          " "$AGI python-dev"
displayandexec "Installation de libtool                             " "$AGI libtool"
displayandexec "Installation de python-lxml                         " "$AGI python-lxml"
displayandexec "Installation de python-jsonrpclib                   " "$AGI python-jsonrpclib"
displayandexec "Installation de python-xlsxwriter                   " "$AGI python-xlsxwriter"
displayandexec "Installation de python-slowaes                      " "$AGI python-slowaes"
displayandexec "Installation de python-mechanize                    " "$AGI python-mechanize"
displayandexec "Installation de python-dnspython                    " "$AGI python-dnspython"
displayandexec "Installation de libcurl4-openssl-dev                " "$AGI libcurl4-openssl-dev"
displayandexec "Installation de apache2                             " "$AGI apache2"
displayandexec "Installation de apachetop                           " "$AGI apachetop"
displayandexec "Installation de gcc-4.9-multilib                    " "$AGI gcc-4.9-multilib"
displayandexec "Installation de gcc-multilib                        " "$AGI gcc-multilib"
displayandexec "Installation de libcanberra-gtk-module              " "$AGI gcc-multilib"
displayandexec "Installation de lib32asan1                          " "$AGI lib32asan1"
displayandexec "Installation de lib32atomic1                        " "$AGI lib32atomic1"
displayandexec "Installation de lib32cilkrts5                       " "$AGI lib32cilkrts5"
displayandexec "Installation de lib32gcc-4.9-dev                    " "$AGI lib32gcc-4.9-dev"
displayandexec "Installation de lib32gcc-4.9-dev                    " "$AGI lib32gcc-4.9-dev"
displayandexec "Installation de lib32gcc1                           " "$AGI lib32gcc1"
displayandexec "Installation de lib32gomp1                          " "$AGI lib32gomp1"
displayandexec "Installation de lib32itm1                           " "$AGI lib32itm1"
displayandexec "Installation de lib32quadmath0                      " "$AGI lib32quadmath0"
displayandexec "Installation de lib32stdc++6                        " "$AGI lib32stdc++6"
displayandexec "Installation de lib32ubsan0                         " "$AGI lib32ubsan0"
displayandexec "Installation de libc6-dev-x32                       " "$AGI libc6-dev-x32"
displayandexec "Installation de libc6-i386                          " "$AGI libc6-i386"
displayandexec "Installation de libc6-x32                           " "$AGI libc6-x32"
displayandexec "Installation de libx32asan1                         " "$AGI libx32asan1"
displayandexec "Installation de libx32atomic1                       " "$AGI libx32atomic1"
displayandexec "Installation de libx32cilkrts5                      " "$AGI libx32cilkrts5"
displayandexec "Installation de libx32gcc-4.9-dev                   " "$AGI libx32gcc-4.9-dev"
displayandexec "Installation de libx32gcc1                          " "$AGI libx32gcc1"
displayandexec "Installation de libx32gomp1                         " "$AGI libx32gomp1"
displayandexec "Installation de libx32itm1                          " "$AGI libx32itm1"
displayandexec "Installation de libx32quadmath0                     " "$AGI libx32quadmath0"
displayandexec "Installation de libx32ubsan0                        " "$AGI libx32ubsan0"

########################################
#Configuration des paquets avec debconf#
########################################
#sslh
echo a
echo "sslh	sslh/inetd_or_standalone	select	from inetd" | debconf-set-selections
#wireshark
echo b
echo "wireshark-common	wireshark-common/install-setuid	boolean	false" | debconf-set-selections
#macchanger
echo c
echo "macchanger	macchanger/automatically_run	boolean	false" | debconf-set-selections
#phpmyadmin
echo "phpmyadmin	phpmyadmin/app-password-confirm	password" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/setup-password	password" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/app-pass	password" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/admin-pass	password" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/password-confirm	password" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/internal/skip-preseed	boolean	true" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/remote/port	string" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/dbconfig-install	boolean	false" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/dbconfig-reinstall	boolean	false" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/internal/reconfiguring	boolean	false" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/admin-user	string	root" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/db/dbname	string" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/upgrade-error	select	abort" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/purge	boolean	false" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/install-error	select	abort" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/reconfigure-webserver	multiselect" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/db/app-user	string" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/dbconfig-upgrade	boolean	true" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/missing-db-package-error	select	abort" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/setup-username	string	admin" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/dbconfig-remove	boolean" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/mysql/method	select	unix socket" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/remote/newhost	string" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/database-type	select	mysql" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/upgrade-backup	boolean	true" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/remove-error	select	abort" | debconf-set-selections
echo "phpmyadmin	phpmyadmin/remote/host	select" | debconf-set-selections
#kismet
echo "kismet	kismet/install-users	string	root" | debconf-set-selections
echo "kismet	kismet/install-setuid	boolean	true" | debconf-set-selections
# Solution : installer les paquets manuellement avec les bonnes config. Ensuite installer debconf-utils et faire
# debconf-get-selections | grep nom_du_paquet
# récupérer les infos obtenus et les injecter dans debconf-set-selections comme suit echo "INFO" | debconf-set-selections

displayandexec "Installation de phpmyadmin                          " "$AGI phpmyadmin"
displayandexec "Installation de wireshark                           " "$AGI wireshark"
displayandexec "Installation de sslh                                " "$AGI sslh"
displayandexec "Installation de wifite                              " "$AGI wifite"
displayandexec "Installation de kismet                              " "$AGI kismet"
displayandexec "Installation de macchanger                          " "$AGI macchanger"


# displayandexec "Installation de blender                             " "$AGI blender"
# displayandexec "Installation de sweethome3d                         " "$AGI sweethome3d"
# displayandexec "Installation de geogebra                            " "$AGI geogebra"
#apt-get install tripwire
#apt-get install tiger
#apt-get install libav-tools

displayandexec "Installation des dépendances manquantes             " "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"

echo "###### instalation des logicies avec une instalation special ######"
#installation des applications avec pip
displayandexec "Installation de pefile                              " "pip install pefile"
displayandexec "Installation de dicttoxml                           " "pip install dicttoxml"
displayandexec "Installation de pypdf2                              " "pip install pypdf2"
displayandexec "Installation de olefile                             " "pip install olefile"
displayandexec "Installation de future                              " "pip install future"
displayandexec "Installation de capstone                            " "pip install capstone"

#atom
displayandexec "Installation de atom                                " "cd /home/install/ && wget -q https://atom.io/download/deb && dpkg -i deb"

#metaspoilt
displayandexec "Installation de metaspoilt                          " "cd /home/install/ && curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall"

#webmin
displayandexec "Installation de webmin                              " "cd /home/install/ && wget $WGETCONF https://sourceforge.net/projects/webadmin/files/webmin/$webmin_version/webmin_$webmin_version\_all.deb && dpkg -i webmin_$webmin_version\_all.deb"

#veracrypt
displayandexec "Installation de veracrypt                           " "cd /home/install/ && wget $WGETCONF https://sourceforge.net/projects/veracrypt/files/VeraCrypt%20$veracrypt_version/veracrypt-$veracrypt_version-setup.tar.bz2 && tar xjf veracrypt-$veracrypt_version-setup.tar.bz2 && ./veracrypt-$veracrypt_version-setup-gui-x64"

#golismero
displayandexec "Installation de golismero                           " "pip install golismero && ln -s /opt/golismero/golismero.py /usr/bin/golismero"
## problème de dépendances

#set
displayandexec "Installation de set                                 " "cd /home/install/ && git clone https://github.com/trustedsec/social-engineer-toolkit/ set/ && cd set && python setup.py install"

#backdoor-factory
#cd /home/install/
#git clone https://github.com/secretsquirrel/the-backdoor-factory
#cd the-backdoor-factory
#sudo ./install.sh
#tester un simple python backdoor.py

#truecrack
#apt-get install nvidia-cuda-toolkit
#cd /home/install/
#git clone https://github.com/lvaccaro/truecrack.git
#cd truecrack
#./configure
#make
#make install

#ollydbg
displayandexec "Installation de ollydbg                            " "cd /home/install/ && dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y && apt-get install wine32 -y && mkdir ollydbg/ && cd ollydbg/ && wget -q http://www.ollydbg.de/odbg110.zip && unzip odbg110.zip && mkdir /opt/ollydbg/ && cp /home/install/ollydbg/* /opt/ollydbg/ && touch /usr/bin/ollydbg && echo "wine /opt/ollydbg/OLLYDBG.EXE" >> /usr/bin/ollydbg && chmod a+x /usr/bin/ollydbg"

#Tunna
cd /opt && git clone https://github.com/SECFORCE/Tunna.git

#recon-ng
displayandexec "Installation de recon-ng                            " "cd /opt && git clone https://LaNMaSteR53@bitbucket.org/LaNMaSteR53/recon-ng.git && ln -s /opt/recon-ng/recon-ng /usr/bin/recon-ng"

#sparta
#cd /opt && git clone https://github.com/secforce/sparta.git
#chmod a+x /opt/sparta/sparta
#ln -s /opt/sparta/sparta /usr/bin/sparta
# apt-get install python-qt4
## problème

#patator
displayandexec "Installation de patator                             " "cd /home/install/ && git clone https://github.com/lanjelot/patator.git && mkdir /opt/patator/ && cp patator/patator.py /opt/patator/patator.py && ln -s /opt/patator/patator.py /usr/bin/patator"

echo "############## désinstalation des logicels inutils ##############"
#libreoffice
displayandexec "désinstalation de libreoffice                       " "apt-get remove libreoffice* -y"
#Konqueror
displayandexec "désinstalation de Konqueror                         " "apt-get remove Konqueror* -y"
#iceweasel
displayandexec "désinstalation de iceweasel                         " "apt-get remove iceweasel* -y"

#OpenOffice
displayandexec "Installation de OpenOffice                          " "wget $WGETCONF http://sourceforge.net/projects/openofficeorg.mirror/files/$openoffice_version/binaries/fr/Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz && tar xzf Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz && cd fr/DEBS/ && dpkg -i *.deb && cd desktop-integration/ && dpkg -i openoffice4.1-debian-menu*.deb"

displayandexec "Installation des dépendances manquantes             " "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"
displayandexec "Mise à jour des paquets                             " "apt-get update && apt-get upgrade -y"
displayandexec "Suppression du cache de apt-get                     " "apt-get clean"

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
/etc/init.d/ssh restart

#########################
#configuration du bashrc#
#########################
cd

if grep "^$utilisateur" /etc/passwd > /dev/null; then
    echo "" >> /home/utilisateur/.bashrc
	echo "alias ifconfig='/sbin/ifconfig'" >> /home/utilisateur/.bashrc
	echo "alias ll='ls -l'" >> /home/utilisateur/.bashrc
	echo "alias la='ls -A'" >> /home/utilisateur/.bashrc
	echo "alias l='ls -CF'" >> /home/utilisateur/.bashrc
	echo "alias h='history'" >> /home/utilisateur/.bashrc
	echo "alias ne='emacs -nw'" >> /home/utilisateur/.bashrc
	echo "alias nn='nano -c'" >> /home/utilisateur/.bashrc
	echo "alias cl='clear'" >> /home/utilisateur/.bashrc
	echo "alias i='apt-get install'" >> /home/utilisateur/.bashrc
	echo "alias u='apt-get update'" >> /home/utilisateur/.bashrc
	echo "alias up='apt-get upgrade'" >> /home/utilisateur/.bashrc
	echo "alias x='exit'" >> /home/utilisateur/.bashrc
	echo "alias xx='sudo shutdown now'" >> /home/utilisateur/.bashrc
	echo "alias xwx='sudo poweroff'" >> /home/utilisateur/.bashrc
	echo "alias funradio='mplayer -nocache http://streaming.radio.funradio.fr/fun-1-48-192'" >> .bashrc
	echo 'HISTTIMEFORMAT="%Y/%m/%d %T   "' >> /home/utilisateur/.bashrc
else
    echo "ko"
fi

echo "" >> .bashrc
echo "alias ll='ls -l'" >> .bashrc
echo "alias la='ls -A'" >> .bashrc
echo "alias l='ls -CF'" >> .bashrc
echo "alias h='history'" >> .bashrc
echo "alias ne='emacs -nw'" >> .bashrc
echo "alias nn='nano -c'" >> .bashrc
echo "alias cl='clear'" >> .bashrc
echo "alias i='apt-get install'" >> .bashrc
echo "alias u='apt-get update'" >> .bashrc
echo "alias up='apt-get upgrade'" >> .bashrc
echo "alias x='exit'" >> .bashrc
echo "alias xx='sudo shutdown now'" >> .bashrc
echo "alias xwx='sudo poweroff'" >> .bashrc
echo "alias funradio='mplayer -nocache http://streaming.radio.funradio.fr/fun-1-48-192'" >> .bashrc
displayandexec "Configuration du bashrc                             " "echo 'HISTTIMEFORMAT=\"%Y/%m/%d %T   \"' >> .bashrc"
source /root/.bashrc
displayandexec "Réinitialisation du bashrc                          " "stat /root/.bashrc && stat /home/utilisateur/.bashrc"

displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --update"
displayandexec "Mise à jour de la base de donnée de nikto           " "nikto -update"
displayandexec "Mise à jour de la base de donnée de ClamAV          " "freshclam"
#chkrootkit
#clamscan
#tiger -q
#lynis -c -q
	#lynis audit system
#lynis --check-update
	#lynis update check

touch /opt/sysupdate && chmod a+x /opt/sysupdate && ln -s /opt/sysupdate /usr/bin/sysupdate
touch /opt/gitupdate && chmod a+x /opt/gitupdate && ln -s /opt/gitupdate /usr/bin/gitupdate
echo '#!/bin/bash
# store the current dir
CUR_DIR=$(pwd)
# Find all git repositories and update it to the master latest revision
for i in $(find / -name ".git" | cut -c 2-); do
    echo "";
    echo "\033[33m"+$i+"\033[0m";
    # We have to go to the .git parent directory to call the pull command
    cd /"$i";
    cd ..;
    # finally pull
    git pull origin master;
    # lets get back to the CUR_DIR
    cd $CUR_DIR
done
exit 0' >> /opt/gitupdate

echo '#!/bin/bash
now=$(date +"%d-%m-%Y")
[ -d /var/log/sysupdate ] || mkdir /var/log/sysupdate
log_file=/var/log/sysupdate/update-$now.log
touch $log_file
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
    echo -e "\r\e[0;30m $message                \e[0;31m[ERROR]\e[0m "
  else
    echo -e "\r\e[0;30m $message                \e[0;32m[OK]\e[0m "
  fi
  return $ret
}
displayandexec "mise à jour des paquets debian                      " "apt-get update && apt-get upgrade -y"
displayandexec "mise à jour des paquets de metaspoilt               " "msfupdate"
displayandexec "mise à jour des paquets de lynis                    " "lynis update check"
displayandexec "mise à jour des paquets de pip                      " "pip install --upgrade pip"
displayandexec "mise à jour des repos GIT                           " "bash /opt/gitupdate"
displayandexec "Suppression du cache de apt-get                     " "apt-get clean"
if [ $1 = "-log" ]; then
    cat $log_file | more
else
    exit 0
fi
exit 0' >> /opt/sysupdate

displayandexec "installation du script de mise à jour sysupdate     " "[ -x /opt/sysupdate ]"

rm -rf /home/install

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


for param in "$@"; do
case $param in
	"-s")
		poweroff;;
	"-log")
		cat $log_file | more;;
	"-r")
		reboot;;
	*)
		echo "Invalid option";;
esac
done

exit 0

#if [ $1 = "-s" ]; then
#    poweroff
#else
#    exit 0
#fi

#if [ $1 = "-r" ]; then
#    reboot
#else
#    exit 0
#fi

#if [ $1 = "-log" ]; then
#    cat $log_file | more
#else
#    exit 0
#fi

# no return message of apt
#export DEBIAN_FRONTEND=noninteractive

##!/bin/sh
# 
#echo -n "Etes-vous fatigué ? "
#read on
# 
#case "$on" in
#    oui | o | O | Oui | OUI ) echo "Allez faire du café !";;
#    non | n | N | Non | NON ) echo "Programmez !";;
#    * ) echo "Ah bon ?";;
#esac
#exit 0

#if [ -x /bin/sh ] ; then
#	echo "/bin/sh est exécutable. C'est bien."
#else
#	echo "/bin/sh n'est pas exécutable."
#	echo "Votre système n'est pas normal."
#fi
#OU [ -x /bin/sh ] || echo "/bin/sh n'est pas exécutable."

#Faire la différence entre les paquets installé  de base et les nouveaux paquets
#comm -3 <(sort /home/liste_paquet_installe.txt) <(sort /home/liste_paquet_installe_postscriptinstall.txt)
#cat -n /home/liste_paquet_installe_postscriptinstall.txt

#read -p "Voulez-vous redémarer maintenant ?[O/n] " reponse
#if [[ $reponse = "o" || $reponse = "O" || $reponse = "" ]]; then
#    reboot
#else
#    exit 0
#fi

## JEUX
#apt-get install 0ad

#if [ $? -ne 0 ]; then
#  logguer "Processus ${PS} not started"
#  start
#fi


#echo "       ###############################"
#echo "       #   Chnger le thème du GRUB   #"
#echo "       ###############################"

#wget https://dl.opendesktop.org/api/files/download/id/1460735684/174670-breeze-grub.zip
#unzip 174670-breeze-grub.zip
#mv Breeze /boot/grub/themes/
#mkdir /boot/grub/themes
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

#fmpeg -i fichiervideo.avi -vn -ar 44100 -ac 2 -f wav fichierson.wav
#avconf -i fichiervideo.avi -vn -ar 44100 -ac 2 -f wav fichierson.wav
#avconv -i video.mp4 image%d.png
#ls -1 |grep mkv | awk -F. '{print $1}' | while read entree
# do
#   avconf -i ${entree}.mkv -vn -ar 44100 -ac 2 -f wav ${entree}.wav
# done
#ls -1 |grep mp4 | awk -F. '{print $1}' | while read entree
# do
#   avconf -i ${entree}.mp4 -vn -ar 44100 -ac 2 -f wav ${entree}.wav
# done
#
# 
#ls -1 |grep wmv | awk -F. '{print $1}' | while read entree
# do
#   avconv -y -i ${entree}.wmv -s 1280x720  -threads auto -vcodec mpeg4 -an -qscale 1 -mbd rd -flags +mv4+aic -trellis 2 -cmp 2 -subcmp 2 -g 300 -pass 1 -f rawvideo /dev/null
#   avconv -y -i ${entree}.wmv -s 1280x720 -threads auto -vcodec mpeg4 -qscale 1 -mbd rd -flags +mv4+aic -trellis 2 -cmp 2 -subcmp 2 -g 300 -pass 2 ${entree}.mp4
# done

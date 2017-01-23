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
mkdir /var/log/postinstall
log_file=/var/log/postinstall/log_script_install-$now.log
touch $log_file
install_file=/var/log/postinstall/install_file-$now.log
touch $install_file
echo "####################################################################" > $log_file
echo "#                          Debut du script                         #" >> $log_file
echo "####################################################################" >> $log_file
echo "" >> $log_file
echo "--------------------------------------------------------------------" >> $log_file

# Premier parametre: MESSAGE
# Autres parametres: COMMAND
displayandexec() {
  local message=$1
  echo -n "[En cours] $message" && echo -n "[En cours] $message" >> $install_file
  shift
  echo ">>> $*" >> $log_file 2>&1
  sh -c "$*" >> $log_file 2>&1
  local ret=$?
  if [ $ret -ne 0 ]; then
    echo -e "\r\e[0;30m $message                \e[0;31m[ERROR]\e[0m " && echo -e "\r\e[0;30m $message                \e[0;31m[ERROR]\e[0m " >> $install_file
  else
    echo -e "\r\e[0;30m $message                \e[0;32m[OK]\e[0m " && echo -e "\r\e[0;30m $message                \e[0;32m[OK]\e[0m " >> $install_file
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



############################
#installation des logiciels#
############################
echo ""
echo "       ################################################################"
echo "       #                   INSTALLATION DES LOGICIELS                 #"
echo "       ################################################################"
echo ""

displayandexec "Installation de ssh                                 " "$AGI ssh"
displayandexec "Installation de wine                                " "$AGI zip"
displayandexec "Installation de mplayer                             " "$AGI mplayer"
displayandexec "Installation de zip                                 " "$AGI wine"
displayandexec "Installation de yasat                               " "$AGI yasat"
displayandexec "Installation de psutils                             " "$AGI psutils"
displayandexec "Installation de pdfmod                              " "$AGI pdfmod"
displayandexec "Installation de nodejs                              " "$AGI nodejs"
displayandexec "Installation de npm                                 " "$AGI npm"
displayandexec "Installation de gparted                             " "$AGI gparted"
displayandexec "Installation de chkrootkit                          " "$AGI chkrootkit"
displayandexec "Installation de vlc                                 " "$AGI vlc"
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



echo "###### instalation des logicies avec une instalation special ######"
#installation des applications avec pip
displayandexec "Installation de pefile                              " "pip install pefile"
displayandexec "Installation de dicttoxml                           " "pip install dicttoxml"
displayandexec "Installation de pypdf2                              " "pip install pypdf2"
displayandexec "Installation de olefile                             " "pip install olefile"
displayandexec "Installation de future                              " "pip install future"
displayandexec "Installation de capstone                            " "pip install capstone"







cd /home/install
#RouterSploit
echo "RouterSploit"
apt-get install -y libncurses5-dev
git clone https://github.com/reverse-shell/routersploit.git
cd routersploit
pip install -r requirements.txt
./rsf.py

#Sn1per
echo "Sn1per"
cd /home/install
git clone https://github.com/1N3/Sn1per.git
cd Sn1per/
bash install.sh

#sslstrip
echo "sslstrip"
cd /home/install
git clone https://github.com/moxie0/sslstrip.git
cd sslstrip/
python setup.py install

#sslsniff
echo "sslsniff"
cd /home/install
git clone https://github.com/moxie0/sslsniff.git
cd sslsniff/
./configure
make
make install

#BruteX
echo "BruteX"
cd /home/install
git clone https://github.com/1N3/BruteX.git
cd BruteX/
bash install.sh

#Goohak
echo "Goohak"
cd /home/install
git clone https://github.com/1N3/Goohak.git
cd Goohak/
bash Goohak

#cymothoa
echo "cymothoa"
cd /home/install
git clone https://github.com/jorik041/cymothoa.git
cd cymothoa/

#WiFi-Pumpkin
echo "WiFi-Pumpkin"
cd /home/install
git clone https://github.com/P0cL4bs/WiFi-Pumpkin.git
cd WiFi-Pumpkin
bash installer.sh --install

#Facebrute
echo "Facebrute"
cd /home/install
git clone https://github.com/P0cL4bs/Facebrute.git
cd Facebrute/
#touch /usr/bin/Facebrute && echo "python /opt/Facebrute/Facebrute.py" >> /usr/bin/Facebrute && chmod a+x /usr/bin/Facebrute
touch /usr/bin/Facebrute && echo "python /home/install/Facebrute/Facebrute.py" >> /usr/bin/Facebrute && chmod a+x /usr/bin/Facebrute

#cipherTest
echo "cipherTest"
cd /home/install
git clone https://github.com/OpenSecurityResearch/ciphertest.git
cd ciphertest/
bash cipherTest.sh

#NoobSecToolkit
echo "NoobSecToolkit"
cd /home/install
git clone https://github.com/krintoxi/NoobSec-Toolkit.git 
cd NoobSecToolkit/NoobSec-Toolkit/ 
python NSToolkit.py

#Neet
echo "Neet"
cd /home/install
git clone https://github.com/JonnyHightower/neet.git
cd neet/
bash install.sh

#SCANNER-INURLBR
echo "SCANNER-INURLBR"
cd /home/install
git clone https://github.com/googleinurl/SCANNER-INURLBR.git
cd SCANNER-INURLBR/
chmod +x inurlbr.php
./inurlbr.php

#net-creds
echo "net-creds"
cd /home/install
git clone https://github.com/DanMcInerney/net-creds.git
cd net-creds/
pip install -r requirements.txt
#touch /usr/bin/net-creds && echo "python /opt/net-creds/net-creds.py" >> /usr/bin/net-creds && chmod a+x /usr/bin/net-creds
touch /usr/bin/net-creds && echo "python /home/install/net-creds/net-creds.py" >> /usr/bin/net-creds && chmod a+x /usr/bin/net-creds

#bannerscan
echo "bannerscan"
cd /home/install
git clone https://github.com/az0ne/bannerscan.git
cd bannerscan/
touch /usr/bin/bannerscan && echo "python /home/install/bannerscan/bannerscan.py" >> /usr/bin/bannerscan && chmod a+x /usr/bin/bannerscan
#touch /usr/bin/bannerscan && echo "python /opt/bannerscan/bannerscan.py" >> /usr/bin/bannerscan && chmod a+x /usr/bin/bannerscan

#Spade
echo "Spade"
cd /home/install
apt-get install lib32stdc++6 lib32ncurses5 lib32z1.
git clone https://github.com/suraj-root/spade.git
cd spade/
./spade.py

#infernal-twin
echo "infernal-twin"
cd /home/install
git clone https://github.com/entropy1337/infernal-twin
cd infernal-twin/
python InfernalWireless.py

#isthisipbad
echo "isthisipbad"
cd /home/install
git clone https://github.com/jgamblin/isthisipbad.git
cd isthisipbad/
python isthisipbad.py

#LaZagne
cd /home/install
git clone https://github.com/AlessandroZ/LaZagne.git
cd LaZagne/Linux
python laZagne.py

#Pupy
cd /home/install
git clone https://github.com/n1nj4sec/pupy.git pupy
cd pupy
git submodule init
git submodule update
pip install -r requirements.txt


#pi-hole
cd /home/install
curl -sSL https://install.pi-hole.net | bash

#DiskAnalyser
cd /home/install
git clone https://github.com/zare3/DiskAnalyser.git
cd DiskAnalyser/
make
make install

#pyminifier
cd /home/install
git clone https://github.com/liftoff/pyminifier.git
cd pyminifier/
python setup.py install

#NoSQLMap
cd /home/install
git clone https://github.com/tcstool/NoSQLMap.git
cd NoSQLMap/
python setup.py install

#BDFProxy
cd /home/install
git clone https://github.com/secretsquirrel/BDFProxy.git
cd BDFProxy/
bash install.sh

#EmPyre
cd /home/install
git clone https://github.com/adaptivethreat/EmPyre.git
cd EmPyre/setup/
bash install.sh

#tcpovericmp
cd /home/install
git clone https://github.com/Maksadbek/tcpovericmp.git
cd tcpovericmp/example
./icmpmessenger


#Veil-Evasion
cd /home/install
git clone https://github.com/Veil-Framework/Veil-Evasion.git
cd Veil-Evasion/
cd setup
setup.sh -c

#veil
cd /home/install
git clone https://github.com/Veil-Framework/Veil.git
cd Veil/
bash install.sh

#backdoor-apk
cd /home/install
git clone https://github.com/dana-at-cp/backdoor-apk.git

#IPGeoLocation
cd /home/install
git clone https://github.com/maldevel/IPGeoLocation.git
apt-get install -y python3-pip
pip3 install -r requirements.txt

#PenTestKit
cd /home/install
git clone https://github.com/maldevel/PenTestKit.git
pip install -r requirements.txt
touch /usr/bin/secure-headers-checker && echo "python /home/install/PenTestKit/secure-headers-checker.py" >> /usr/bin/secure-headers-checker && chmod a+x /usr/bin/secure-headers-checker
#touch /usr/bin/secure-headers-checker && echo "python /opt/PenTestKit/secure-headers-checker.py" >> /usr/bin/secure-headers-checker && chmod a+x /usr/bin/secure-headers-checker

#Windows-Exploit-Suggester
cd /home/install
pip install xlrd
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester.git
touch /usr/bin/windows-exploit-suggester && echo "python /home/install/Windows-Exploit-Suggester/windows-exploit-suggester.py" >> /usr/bin/windows-exploit-suggester && chmod a+x /usr/windows-exploit-suggester
#touch /usr/bin/windows-exploit-suggester && echo "python /opt/Windows-Exploit-Suggester/windows-exploit-suggester.py" >> /usr/bin/windows-exploit-suggester && chmod a+x /usr/windows-exploit-suggester

#tcpflow
cd /home/install
apt-get install -y git gcc g++ automake autoconf libpcap-dev libboost-dev libssl-dev zlib1g-dev libcairo2-dev
git clone https://github.com/simsong/tcpflow.git
cd tcpflow/
./configure
make
make install

#Cisco SNMP Enumeration
cd /home/install
git clone https://github.com/nccgroup/cisco-SNMP-enumeration.git
cd cisco-SNMP-enumeration/
bash cisco-SNMP-enumeration

#phpvulhunter
cd /home/install
apt-get install -y nginx
cd /var/www/html
git clone https://github.com/OneSourceCat/phpvulhunter.git
chromium http://127.0.0.1/phpvulhunter/main.php

#bruteforce_py
cd /home/install
git clone https://github.com/rischanlab/bruteforce_py.git
touch /usr/bin/bruteforce_tools && echo "cd /home/install/bruteforce_py/ && ls" >> /usr/bin/bruteforce_tools && chmod a+x /usr/bruteforce_tools
#touch /usr/bin/bruteforce_tools && echo "cd /opt/bruteforce_py/ && ls" >> /usr/bin/bruteforce_tools && chmod a+x /usr/bruteforce_tools

#Install and configure firewall
#apt-get install -y ufw
#echo -e "\nConfiguring firewall...\n"
#ufw default deny incoming
#ufw default allow outgoing
#ufw allow ssh

#sed -i.bak 's/ENABLED=no/ENABLED=yes/g' /etc/ufw/ufw.conf
#chmod 0644 /etc/ufw/ufw.conf


echo "############## désinstalation des logicels inutils ##############"
#libreoffice
displayandexec "désinstalation de libreoffice                       " "apt-get remove libreoffice* -y"
#Konqueror
displayandexec "désinstalation de Konqueror                         " "apt-get remove Konqueror* -y"
#iceweasel
displayandexec "désinstalation de iceweasel                         " "apt-get remove iceweasel* -y"

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
/etc/init.d/sshd stop
/etc/init.d/ssh restart

#########################
#configuration du bashrc#
#########################
cd

if grep "^$utilisateur" /etc/passwd > /dev/null; then
    echo "" >> /home/utilisateur/.bashrc
echo "ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' ne peut etre extrait par ex()" ;;
    esac
  else
    echo "'$1' fichier invalide"
  fi
}" >> /home/utilisateur/.bashrc
	echo 'HISTTIMEFORMAT="%Y/%m/%d %T   "' >> /home/utilisateur/.bashrc
else
    echo "ko"
fi

echo "" >> .bashrc
echo "ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' ne peut etre extrait par ex()" ;;
    esac
  else
    echo "'$1' fichier invalide"
  fi
}" >> .bashrc
displayandexec "Configuration du bashrc                             " "echo 'HISTTIMEFORMAT=\"%Y/%m/%d %T   \"' >> .bashrc"
source /root/.bashrc
displayandexec "Réinitialisation du bashrc                          " "stat /root/.bashrc && stat /home/utilisateur/.bashrc"

displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --update"
displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --versioncheck"
displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --update"
displayandexec "Mise à jour de la base de donnée de ClamAV          " "freshclam"
#chkrootkit
#clamscan
#tiger -q
#lynis -c -q
	#lynis audit system
#lynis --check-update
	#lynis update check


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
	"-v")
		echo $version;;
	"-s")
		poweroff;;
	"-log")
		cat $log_file | more;;
	"-erreur")
		cat $install_file | grep -i error;;
	"-r")
		reboot;;
	*)
		echo "Invalid option";;
esac
done

exit 0

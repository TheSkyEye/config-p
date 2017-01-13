
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
#/var/log/
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
#displayandexec "Installation de phpmyadmin                          " "$AGI phpmyadmin"
#displayandexec "Installation de wireshark                           " "$AGI wireshark"
#displayandexec "Installation de sslh                                " "$AGI sslh"
#displayandexec "Installation de wifite                              " "$AGI wifite"
#displayandexec "Installation de kismet                              " "$AGI kismet"
#displayandexec "Installation de macchanger                          " "$AGI macchanger"
apt-get install -y phpmyadmin
apt-get install -y wireshark
apt-get install -y sslh
apt-get install -y wifite
apt-get install -y kismet
apt-get install -y macchanger

# displayandexec "Installation de blender                             " "$AGI blender"
# displayandexec "Installation de sweethome3d                         " "$AGI sweethome3d"
# displayandexec "Installation de geogebra                            " "$AGI geogebra"
#apt-get install tripwire
#apt-get install tiger
#apt-get install libav-tools

# no return message of apt
#export DEBIAN_FRONTEND=noninteractive

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

#golismero
displayandexec "Installation de golismero                           " "pip install golismero && ln -s /opt/golismero/golismero.py /usr/bin/golismero"
## problème de dépendances

#set
displayandexec "Installation de set                                 " "cd /home/install/ && git clone https://github.com/trustedsec/social-engineer-toolkit/ set/ && cd set && python setup.py install"

#backdoor-factory
cd /home/install/
git clone https://github.com/secretsquirrel/the-backdoor-factory
cd the-backdoor-factory
sudo ./install.sh
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
displayandexec "Installation de ollydbg                            " "cd /home/install/ && dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y && apt-get install wine32 -y && mkdir ollydbg/ && cd ollydbg/ && wget -q http://www.ollydbg.de/odbg110.zip && unzip odbg110.zip && mkdir /opt/ollydbg/ && cp /home/install/ollydbg/* /opt/ollydbg/"
#cd /home/install/
#dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y && apt-get install wine32 -y
#mkdir ollydbg/
#cd ollydbg/
#wget -q http://www.ollydbg.de/odbg110.zip
#unzip odbg110.zip
#mkdir /opt/ollydbg/
#cp /home/install/ollydbg/* /opt/ollydbg/
touch /usr/bin/ollydbg && echo "wine /opt/ollydbg/OLLYDBG.EXE" >> /usr/bin/ollydbg && chmod a+x /usr/bin/ollydbg

#Tunna
cd /opt && git clone https://github.com/SECFORCE/Tunna.git

#recon-ng
displayandexec "Installation de recon-ng                            " "cd /opt && git clone https://LaNMaSteR53@bitbucket.org/LaNMaSteR53/recon-ng.git && ln -s /opt/recon-ng/recon-ng /usr/bin/recon-ng"
#cd /opt && git clone https://LaNMaSteR53@bitbucket.org/LaNMaSteR53/recon-ng.git
#ln -s /opt/recon-ng/recon-ng /usr/bin/recon-ng

#sparta
cd /opt && git clone https://github.com/secforce/sparta.git
chmod a+x /opt/sparta/sparta
ln -s /opt/sparta/sparta /usr/bin/sparta
# apt-get install python-qt4
## problème

#patator
displayandexec "Installation de patator                             " "cd /home/install/ && git clone https://github.com/lanjelot/patator.git && mkdir /opt/patator/ && cp patator/patator.py /opt/patator/patator.py && ln -s /opt/patator/patator.py /usr/bin/patator"

echo "############## désinstalation des logicels inutils ##############"
#libreoffice
displayandexec "désinstalation de libreoffice                       " "apt-get remove libreoffice* -y"
#Konqueror
displayandexec "désinstalation de Konqueror                         " "apt-get remove Konqueror* -y"
#apt-get remove Konqueror -y
#iceweasel
displayandexec "désinstalation de iceweasel                         " "apt-get remove iceweasel* -y"
#apt-get remove iceweasel -y

#OpenOffice
displayandexec "Installation de OpenOffice                          " "wget $WGETCONF http://sourceforge.net/projects/openofficeorg.mirror/files/$openoffice_version/binaries/fr/Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz && tar xzf Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz && cd fr/DEBS/ && dpkg -i *.deb && cd desktop-integration/ && dpkg -i openoffice4.1-debian-menu*.deb"
#wget -q  http://sourceforge.net/projects/openofficeorg.mirror/files/$openoffice_version/binaries/fr/Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz
#tar xzf Apache_OpenOffice_$openoffice_version\_Linux_x86-64_install-deb_fr.tar.gz
#cd fr/DEBS/
#dpkg -i *.deb
#cd desktop-integration/
#dpkg -i openoffice4.1-debian-menu*.deb


displayandexec "Installation des dépendances manquantes             " "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"
displayandexec "Mise à jour des paquets                             " "apt-get update && apt-get upgrade -y"

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

if grep "^$utilisateur" /etc/passwd > /dev/null; then
    echo "" >> /home/utilisateur/.bashrc
	echo "alias ifconfig='/sbin/ifconfig'" >> /home/utilisateur/.bashrc
	echo "alias ll='ls -l'" >> /home/utilisateur/.bashrc
	echo "alias la='ls -A'" >> /home/utilisateur/.bashrc
	echo "alias l='ls -CF'" >> /home/utilisateur/.bashrc
	echo "alias h='history'" >> /home/utilisateur/.bashrc
	echo "alias ne='emacs -nw'" >> /home/utilisateur/.bashrc
	echo "alias nn='nano'" >> /home/utilisateur/.bashrc
	echo "alias cl='clear'" >> /home/utilisateur/.bashrc
	echo "alias i='apt-get install'" >> /home/utilisateur/.bashrc
	echo "alias u='apt-get update'" >> /home/utilisateur/.bashrc
	echo "alias up='apt-get upgrade'" >> /home/utilisateur/.bashrc
	echo "alias x='exit'" >> /home/utilisateur/.bashrc
	echo "alias xx='sudo shutdown now'" >> /home/utilisateur/.bashrc
	echo "alias xwx='sudo poweroff'" >> /home/utilisateur/.bashrc
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
echo "alias nn='nano'" >> .bashrc
echo "alias cl='clear'" >> .bashrc
echo "alias i='apt-get install'" >> .bashrc
echo "alias u='apt-get update'" >> .bashrc
echo "alias up='apt-get upgrade'" >> .bashrc
echo "alias x='exit'" >> .bashrc
echo "alias xx='sudo shutdown now'" >> .bashrc
echo "alias xwx='sudo poweroff'" >> .bashrc
displayandexec "Configuration du bashrc                             " "echo 'HISTTIMEFORMAT=\"%Y/%m/%d %T   \"' >> .bashrc"
source /root/.bashrc
displayandexec "Réinitialisation du bashrc                          " "stat /root/.bashrc && stat /home/utilisateur/.bashrc"
#displayandexec "Réinitialisation du bashrc                          " "source /root/.bashrc"
#source /root/.bashrc

#openvas-setup
displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --update"
#lynis --check-update
	#lynis update check
displayandexec "Mise à jour de la base de donnée de nikto           " "nikto -update"
displayandexec "Mise à jour de la base de donnée de ClamAV          " "freshclam"
#chkrootkit
#clamscan
#tiger -q
#lynis -c -q
	#lynis audit system
#pip install --upgrade pip
#msfupdate
touch /opt/sysupdate && chmod a+x /opt/sysupdate && ln -s /opt/sysupdate /usr/bin/sysupdate && echo "#!/bin/bash
apt-get update && apt-get upgrade -y
msfupdate
lynis update check
pip install --upgrade pip" >> /opt/sysupdate


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

while getopts -s:-log:-r: option
do
case $option in
   -s)
    poweroff
    ;;
  -log)
    cat $log_file | more;;
  -r)
    reboot
    ;;
  *) echo "Invalid option: -$OPTARG"
    ;;
esac
done

exit 0
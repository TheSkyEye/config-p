#!/bin/bash
##
## install.sh for Installation logiciel
##
## Made by TheSkyEye
##


##############################################################
#application des mises à jour et modification du sources.list#
##############################################################


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
displayandexec "Installation de python-pip                          " "$AGI python-pip"
displayandexec "Installation de lib32atomic1                        " "$AGI lib32atomic1"
displayandexec "Installation de lib32cilkrts5                       " "$AGI lib32cilkrts5"
displayandexec "Installation de lib32gcc-4.9-dev                    " "$AGI lib32gcc-4.9-dev"
displayandexec "Installation de rkhunter                            " "$AGI rkhunter"
displayandexec "Installation de lynis                               " "$AGI lynis"
displayandexec "Installation de clamav                              " "$AGI clamav"
displayandexec "Installation de debconf-utils                       " "$AGI debconf-utils"
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

# no return message of apt
#export DEBIAN_FRONTEND=noninteractive

########################################
#Configuration des paquets avec debconf#
########################################
#sslh
echo "sslh	sslh/inetd_or_standalone	select	from inetd" | debconf-set-selections
#wireshark
echo "wireshark-common	wireshark-common/install-setuid	boolean	false" | debconf-set-selections
#macchanger
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
echo "phpmyadmin	phpmyadmin/passwords-do-not-match	error" | debconf-set-selections
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

#apt-get install -y phpmyadmin
#apt-get install -y wireshark
#apt-get install -y sslh
#apt-get install -y wifite
#apt-get install -y kismet
#apt-get install -y macchanger

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

#golismero
displayandexec "Installation de golismero                           " "pip install golismero && ln -s /opt/golismero/golismero.py /usr/bin/golismero"
## problème de dépendances

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


#sparta
cd /opt && git clone https://github.com/secforce/sparta.git
chmod a+x /opt/sparta/sparta
ln -s /opt/sparta/sparta /usr/bin/sparta
# apt-get install python-qt4
## problème


displayandexec "Installation des dépendances manquantes             " "apt-get install -f"
displayandexec "Désinstalation des paquets qui ne sont plus utilisés" "apt-get autoremove -y"
displayandexec "Mise à jour des paquets                             " "apt-get update && apt-get upgrade -y"

##############################
#stoper les services inutiles#
##############################
cat /etc/ssh/sshd_config | grep Port
sed -i -e "s/Port\ 22/Port\ 7894/g" /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep Port
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
displayandexec "Mise à jour de la base de donnée de rkhunter        " "rkhunter --update && rkhunter --update"
#lynis --check-update
	#lynis update check
displayandexec "Mise à jour de la base de donnée de nikto           " "nikto -update && nikto -update"
displayandexec "Mise à jour de la base de donnée de ClamAV          " "freshclam"
#chkrootkit
#clamscan
#tiger -q
#lynis -c -q
	#lynis audit system
#pip install --upgrade pip
#msfupdate


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

while getopts "s:log:r:" option
do
case $option in
    s)
    poweroff
    ;;
   log)
    cat $log_file | more;;
   r)
    reboot
    ;;
  *) echo "Invalid option: -$OPTARG"
    ;;
esac
done

exit 0

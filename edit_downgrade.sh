#!/bin/bash
clear
user=$(logname)
ls -l /etc/bind/named.conf.options
read -p "here we go"
#mise en backup du proprio :
proprio=$(ls -l /etc/bind/named.conf.options | awk '{print $3}')
#modification du ownner pour coller au user sudoers :
chown ${user} /etc/bind/named.conf.options
#modification du fichier :
su ${user} -c "vi /etc/bind/named.conf.options"
#remise du proprio apres modif:
chown ${proprio} /etc/bind/named.conf.options
read -p "mais comment faire cette magie blanche ??"
cat /opt/edit_downgrade.sh
read

#!/bin/bash
clear
echo "droits du fichier a modifier :" 
ls -l /etc/bind/named.conf.options
read '-p le script exécuté :'
cat /opt/edit.sh
read -p 'exploy it'
vi /etc/bind/named.conf.options

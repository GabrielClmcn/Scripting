#!/bin/bash

###
# nm: eta.sh
# descrp: show machine ETA
# date: 02/10/2018
# author: gabrielClmcn
###

varHostN=$(cat /etc/hostname)
IP=$(ip a | sed -n 15p | awk -F ' ' '{print$2}' )
nmVOS=$(cat /etc/redhat-release)
vKernel=$(uname -or)
threeLastPaquet=$(rpm -qa --last | head -n 3)
fiveLast=$(last -n 5 | awk -F ' ' '{print$1}' | head -n 5)
py=$(python -V 2> /tmp/pyVersion | cat /tmp/pyVersion)
sshStatus=$(systemctl is-active sshd)

free -h | awk -F ' ' '{print $3}' | sed -n '2p'
df -h / | awk -F ' ' '{print $5}' | sed -n '2p'

echo "le hostname est $varHostN et l'adresse IP est $IP

nom et version de l'OS :
$nmVOS

version du Kernel :
$vKernel

les 3 derniers paquets installés :
$threeLastPaquet

les 5 derniers utilisateurs connectés sont :
$fiveLast

la commande python est disponible et sa version est : $py

Le service SSH est $sshStatus"

echo "Utilisation CPU : $(sar -u 1 1 | sed -n '4p' | cut -c25-30 )"
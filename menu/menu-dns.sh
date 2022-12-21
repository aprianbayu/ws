#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="DryanZ"
MYIP=$(wget -qO- ipinfo.io/ip);

colornow=$(cat /etc/alexxa/theme/color.conf)
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)

export RED='\033[0;31m';
export GREEN='\033[0;32m';
export ERROR="[${RED}ERROR${NC}]";
export INFO="[${GREEN}INFO${NC}]";


function setdns(){
clear
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box USERS LOGS Menu\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
read -p "    DNS : " setdnss

if [ -z $setdnss ]; then
echo -e ""
echo -e "  ${ERROR} DNS Cannot Be Empty";
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns 
else
echo "$setdnss" > /root/dns
echo -e "    ${INFO} Copy DNS To Resolv.conf";
echo "nameserver $setdnss" > /etc/resolv.conf
sleep 2
echo -e "    ${INFO} Copy DNS To Resolv.conf.d/head";
echo "nameserver $setdnss" > /etc/resolvconf/resolv.conf.d/head
sleep 2
echo -e "    ${INFO} DNS Update Successfully";
fi
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns 
}

function resdns(){
    clear
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box USERS LOGS Menu\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
read -p "    Reset Default DNS [Y/N]: " -e answer
if [[ "$answer" = 'y' ]]; then
dnsfile="/root/dns"
if test -f "$dnsfile"; then
rm /root/dns
fi
echo -e ""
echo -e "    ${INFO} Delete Resolv.conf DNS";
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 2
echo -e "    ${INFO} Delete Resolv.conf.d/head DNS";
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 2
else
echo -e ""
echo -e "   $INFO Operation Cancelled By User"
fi
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-dns 
}

function check-dns(){
    bash <(curl -sSL https://raw.githubusercontent.com/${GitUser}/websocket/main/menu/ceknet.sh)
read -n 1 -s -r -p "   Press any key to back on menu"
menu
}

clear
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text         \e[30m═[\e[$box USERS LOGS Menu\e[30m ]═         \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"

dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e ""
echo -e "     Active DNS : $udns"
echo -e ""
fi
echo -e "    \e[$number (•1)\e[m \e[$below CHANGE DNS\e[m"
echo -e "    \e[$number (•2)\e[m \e[$below RESET DNS\e[m"
echo -e "    \e[$number (•3)\e[m \e[$below CONTENT CEK\e[m"
echo -e "    \e[$number (•4)\e[m \e[$below REBOOT\e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box 00)   MENU                               \e[m"
echo -e "   \e[$line══════════════════════════════════════════\e[m"
echo -e ""
read -rp "        Please Input Number  [1-4 or x] :  "; read opt
case $opt in
01 | 1) clear ; setdns ;;
02 | 2) clear ; resdns ;;
03 | 3) clear ; check-dns ;;
04 | 4) clear ; renewipvps ;;
05 | 5) clear ; useripvps ;;
06 | 6) clear ; $ressee ;;
00 | 0) clear ; menu ;;
*) clear ; menu-dns ;;
esac
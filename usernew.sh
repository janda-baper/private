#!/bin/bash
#Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " Activetime

IP=$(wget -qO- icanhazip.com);
useradd -e `date -d "$Activetime days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====SSH Account Information====" | lolcat
echo -e "Host: $IP" | lolcat
echo -e "Username: $Login " | lolcat
echo -e "Password: $Pass" | lolcat
echo -e "Port OpenSSH: 22"  | lolcat
echo -e "Port Dropbear: 143, 80, 110, 456"  | lolcat
echo -e "Port SSL: 443" | lolcat
echo -e "Port Squid: 3128,8080 (limit to IP SSH)" | lolcat
echo -e "badvpn: badvpn-udpgw port 7100-7300" | lolcat
echo -e "nginx: 81" | lolcat
echo -e "=============================" | lolcat
echo -e "Expiration: $exp" | lolcat
echo -e "=============================" | lolcat
echo -e "Modified by Janda Baper Group" | lolcat
echo -e ""

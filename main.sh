#!/bin/bash
#if you are coping its alright :)
#average-stu
if [[ "$(id -u)" -ne 0 ]]; then
   printf ".:: Please, run this program as root!\n"
   exit 1
fi

printf "\e[1;32m  :: Start Hacking nearby IOT devices :: \e[0m\n"
printf "\n"
printf '\e[1;32m[*] First Find out the devices \e[0m\n'
sleep 5
sudo arp-scan -l
sleep 10
printf '\e[1;32m[*] Now open the Nmap Script \e[0m\n'
bash nmap.sh
fi






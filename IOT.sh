#!/bin/bash
if [[ "$(id -u)" -ne 0 ]]; then
   printf ".:: Please, run this program as root!\n"
   exit 1
fi

python3 IOT.py  

sleep 10

printf '\e[0;32m 1) Intense Scan \e[0m\n'
printf '\e[0;32m 2) Intense Scan, Plus UDP\e[0m\n'
printf '\e[0;32m 3) Intense Scan, all TCP ports\e[0m\n'
printf '\e[0;32m 4) Intense Scan, no ping\e[0m\n'
printf '\e[0;32m 5) Ping scan\e[0m\n'
printf '\e[0;32m 6) Quick Scan\e[0m\n'
printf '\e[0;32m 7) Quick Scan Plus\e[0m\n'
printf '\e[0;32m 8) Quick traceroute\e[0m\n'
printf '\e[0;32m 9) Regular Scan\e[0m\n'
printf '\e[0;32m 10) Slow comprehensive scan\e[0m\n'
printf '\n'
printf ""
printf ""
printf ""


if [[ "$2" -eq "" ]]; then
read -e -p "Number>" scan
else
scan="$2"
fi
if [[ "$1" == "" ]]; then
read -e -p "Target>" target
else
target="$1"
fi


if [[ $scan == '1' ]]
   then
	nmap -v -T4 -A -v $target  -Pn

elif [[ $scan == '2' ]]
    then
	nmap -v -sS -sU -T4 -A -v $target -Pn

elif [[ $scan == '3' ]]
    then
	nmap -v -p 1-65535 -T4 -A -v $target -Pn 

elif [[ $scan == '4' ]]
    then
	nmap -v -T4 -A -v -Pn $target  -Pn

elif [[ $scan == '5' ]]
    then
	nmap -v -sn $target  -Pn

elif [[ $scan == '6' ]]
    then
	nmap -v -T4 -F $target  -Pn

elif [[ $scan == '7' ]]
    then
	nmap -v -v -sV -T4 -O -F --version-light $target  

elif [[ $scan == '8' ]]
    then
	nmap -v -sn --traceroute $target  

elif [[ $scan == '9' ]]
    then
	nmap -v $target  

elif [[ $scan == '10' ]]
    then
	nmap -v -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $target >$target.txt
else
    echo "incorrect number"
fi


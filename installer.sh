#!/bin/bash
#Date March 20th, 2021
#Author moe-aal

req=("avrdude" "arduino" "libusb-dev" "python3" "wget" "figlet" "toilet" "curl")

#colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

#bold
bold=`tput bold`
normal=`tput sgr0`

intro()
{
echo "+--------------------------------------------+"
echo "##############################################"
echo "Developed by moe-aal"
echo "for more information, please visit https://github.com/moe-aal/iMoPlant/"
echo "+--------------------------------------------+"
echo "##############################################"
}

banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}


finish()
{
  echo "+------------------------------------------+"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
echo "|                                          |"
  echo "+------------------------------------------+"
}



progress()
{
echo -ne '#####                     (33%)\r'
sleep 0.5
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
}

intro 
banner "iMoPlanter - Installation"
sleep 3

for i in "${req[@]}" 
	do
		if ! command -v $i &>/dev/null
		then
			echo installing $i ...
			if apt-get install $i -y  > /dev/null
			then
				progress
			else
				echo -e "${RED}Was unable to install $i ${NC}" 
				continue
			fi		
		fi
	done
if ! command -v /usr/bin/arduino-cli &>/dev/null
then

	echo Getting Arduino-cli ...
	curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/usr/bin sh > /dev/null
	progress
fi
sleep 1

if ! command -v /usr/bin/arduino-cli &>/dev/null
	then
		echo -e "${RED}Error Downloading Arduino-cli${NC}\nPlease Do So Manually From ${BLUE}https://arduino.github.io/arduino-cli/latest/installation/${NC} And Then Try Again"
		exit 1
	else
		progress
fi

mkdir -p /root/.arduino15/iMoPlanter
touch /root/.arduino15/iMoPlanter/arduino-cli.yaml
echo "board_manager:" > /root/.arduino15/iMoPlanter/arduino-cli.yaml
echo " additional_urls:" >> /root/.arduino15/iMoPlanter/arduino-cli.yaml
echo " - http://digistump.com/package_digistump_index.json" >> /root/.arduino15/iMoPlanter/arduino-cli.yaml

sleep 2

cp ./package_digistump_index.json /root/.arduino15/package_digistump_index.json
arduino-cli core install digistump:avr
cp ./micronucleus /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/
rm /root/.arduino15/packages/digistump/hardware/avr/1.6.7/libraries/DigisparkKeyboard/usbconfig.h
cp ./usbconfig.h /root/.arduino15/packages/digistump/hardware/avr/1.6.7/libraries/DigisparkKeyboard/usbconfig.h
echo -e "\n\n\n\n\n\n\n"
finish "ALL DONE, THANK YOU!"
#echo -e "\n*** ALL DONE THANK YOU ***"
echo -e "\n${BLUE}\e[1mNow Run ${GREEN}\e[1m./imoplanter.sh <payload.txt>${BLUE}\e[1m To Program Your Charger\e[0m${NC}"
echo -e "\n\n"
#end


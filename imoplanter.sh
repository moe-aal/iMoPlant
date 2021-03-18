#Author: Moe-aal
#Version 0.1
#iMoPlant Flasher

echo -e "\n\n\r"
figlet -c -f smblock iMoPlanter
echo -e "\n\n"

HELP()
{
echo  -e "\nSyntax: ./imoplanter.sh <payload.txt>\n"
echo -e "Version: 0.1\n"
echo -e "For more information about the iMoPlant Cable, visit https://github.com/moe-aal/iMoPlant/"
echo  -e "\nPayloads can be found at https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Payloads\n\r"

}

if [ "$#" -eq 0 ] || [ "$#" -gt 1 ]
then
    HELP
    exit 1
fi


payload=$1
mkdir -p /tmp/iMoUpload/
python3 iMoTranslator.py $1 /tmp/iMoUpload/iMoUpload
arduino-cli compile -b digistump:avr:digispark-tiny /tmp/iMoUpload/iMoUpload.ino
arduino-cli upload -b digistump:avr:digispark-tiny /tmp/iMoUpload/iMoUpload.ino

#Author: https://github.com/moe-aal

echo "+------------------------------------------+"
echo -e "\nDeveloped by moe-aal\n"
echo "+------------------------------------------+"
echo -e "\nBootloader-Flasher\n"
echo "+------------------------------------------+"


help()
{
echo -e "\nSyntax: ./flash-bootloader <arduino port> "
echo -e "\nExample: ./flash-bootloader /dev/ttyACM0 "
echo -e "\nFor more information, visit https://github.com/moe-aal/iMoPlant/\n"
}

if [ $# -eq 0 ] || [ $# -gt 1 ]
then
	help
	exit 1
else
	avrdude  -v -P $1  -c avrisp -p attiny85  -Uflash:w:/Users/m0e/Downloads/micronucleus-master/upgrade/t85_default.hex:i -U lfuse:w:0xe1:m -U hfuse:w:0xdd:m -U efuse:w:0xfe:m -b 19200 
fi
#end

# iMoPlant - Hack Any Computer in Seconds with the iMoPlant Cable


## Installation

1. `git clone https://github.com/moe-aal/iMoPlant.git` </br>
2. `cd iMoPlant/` </br>
3. `chmod 777 *.sh` </br>
4. `sudo ./installer.sh` </br>

## Building the Payload
**Create a new file named *payload.txt* and paste the following to it**</br>
Better yet, **look for Rubber-Ducky Payloads online** and find the payload that suits your needs. <br/>
You can find a handful of payload options here **https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Payloads**.</br>
For **demonstration purposes**, we will use the following payload. </br>
```
DELAY 1000 
GUI r
DELAY 800
ENTER
STRING notepad.exe
DELAY 600
ENTER
STRING You Have Been Hacked!
DELAY 500
ENTER
```
## Uploading the Payload
**Run the following command,** and **then plug in the iMoPlant Cable**. </br>
Note, you will have 59 seconds before the process times out.</br>
`sudo ./imoplanter payload.txt`


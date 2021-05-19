# iMoPlant - Hack Any Computer in Seconds with the iMoPlant Cable

![alt text](https://github.com/moe-aal/iMoPlant/blob/main/images/demo.png)</br>

## Introduction
![alt text](https://github.com/moe-aal/iMoPlant/blob/main/images/1.png)</br>
This may seem as though it is an ordinary iPhone charging cable – (aka lightning cable). Well, it is not! The cable indeed resembles a genuine iPhone lightning cable but that is the idea behind its purpose. This cable, named the iMoPlant, can hack any computer in a matter of seconds. The evil mastermind resides in the connector plug of the USB-A end, within the enclosure, soldered onto the USB pads, where it cannot be seen nor detached. </br>
### How Does it Work?
Inside the USB-A male plug enclosure, there is an implant, a hardware implant. That is, a two-layer, extremely tiny board. The top layer of which has a chip and passive components soldered onto it. The bottom layer, however, has four-pad contacts that are soldered onto the USB. The implant can be programmed to execute various payloads. Once the USB is connected to the target computer, the implant will be powered on and will start executing pre-loaded commands.</br>
![alt text](https://github.com/moe-aal/iMoPlant/blob/main/images/3.png)</br>
Simply put, it acts as a keyboard. A super-fast one. A keyboard that is capable of injecting keystrokes at lightning speed. When plugged into a computer, the iMoPlant Cable will identify itself as a keyboard. As a matter of fact, it will identify itself as a Human Device Interface (HID), which makes it possible to emulate a mouse as well (depending on the code uploaded).


## Installation

1. `git clone https://github.com/moe-aal/iMoPlant.git` </br>
2. `cd iMoPlant/` </br>
3. `chmod 777 *.sh` </br>
4. `sudo ./installer.sh` </br>

## Building the Payload
**Create a new file named *payload.txt* and paste the following to it**.</br>
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
Note, <ins>you will have 59 seconds to plug in the iMoPlant before the process times out.</ins></br></br>
`sudo ./imoplanter payload.txt`

## Execution
Now that the code is uploaded to the iMoPlant, just plug it in the target's machine (a Windows machine in this case), and the code will be executed.<br/>


#!/bin/bash
#set -x
#sudo PyBeacon -i 01234567890123456789012345678901
#sudo PyBeacon -u https://codeNsolder.com

echo $ADVERTISE
echo $URL

if [ "$ADVERTISE" == "TRUE" ]
then
	echo "creating ble beacon with url: $URL"
	hciconfig hci0 leadv 3
	hciconfig hci0 noscan
	PyBeacon -u $URL 2> /dev/null
	sleep 1
else
# Turn off advertising mode
	hciconfig hci0 noleadv
fi

while true; do sleep 5000; done




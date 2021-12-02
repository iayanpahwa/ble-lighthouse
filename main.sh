#!/bin/bash
#set -x

echo $ADVERTISE
echo $BEACON_TYPE
echo $URL
echo $UUID

if [ "$ADVERTISE" == "TRUE" ]
then
	if [ "$BEACON_TYPE" == "URL" ]
	then
		echo "creating ble beacon with url: $URL"
		hciconfig hci0 leadv 3
		hciconfig hci0 noscan
		PyBeacon -u $URL 2> /dev/null
		sleep 1
	elif [ "$BEACON_TYPE" == "UUID" ]
	then
		echo "creating ble beacon with UUID: $UUID"
		hciconfig hci0 leadv 3
		hciconfig hci0 noscan
		PyBeacon -i $UUID 2> /dev/null
	else
		echo "Undefined BEACON_TYPE"
	fi
else
# Turn off advertising mode
	hciconfig hci0 noleadv
fi

while true; do sleep 5000; done

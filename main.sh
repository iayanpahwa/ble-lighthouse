#!/bin/bash
#set -x

echo $ADVERTISE
echo $BEACON_TYPE
echo $URL
echo $UID
echo $RAW

# add hostname to /etc/hosts 
echo $(hostname -I | cut -d\  -f1) $(cat /etc/hostname) | tee -a /etc/hosts

if [ "$ADVERTISE" == "TRUE" ]
then
	if [ "$BEACON_TYPE" == "URL" ]
	then
		# put adaptor in non-connection mode
		hciconfig hci0 leadv 3
		hciconfig hci0 noscan
		PyBeacon -u $URL 2> /dev/null
		sleep 1
	elif [ "$BEACON_TYPE" == "UID" ]
	then
		hciconfig hci0 leadv 3
		hciconfig hci0 noscan
		PyBeacon -i $UID 2> /dev/null
		sleep 1
	elif [ "$BEACON_TYPE" == "RAW" ]
	then	
		echo "creating ble beacon with RAW data: $RAW"
		hciconfig hci0 leadv 3
		hciconfig hci0 noscan
		hcitool -i hci0 cmd 0x08 0x0008 1E 02 01 1A 1A \
		FF 30 00 02 15 63 6F 3F 8F 64 91 4B EE 95 F7 D8 \
		CC 64 A8 63 B5 00 00 00 00 C8
	else
		echo "Undefined BEACON_TYPE"
	fi
else
	# Turn off advertising mode
	echo "beacon broadcast stop!"
	hciconfig hci0 noleadv
fi

while true; do sleep 5000; done

#!/bin/bash

bluetooth_not_found="Bluetoothctl not found" # not found 'bluetooth' in systemctl daemons
bluetooth="" # active or inactive

bluetooth_status=$(systemctl status bluetooth | grep Active | awk '{ print $2 }')

if [ "$bluetooth_status" = "active" ] ; then
	echo "%{F#2193ff}$bluetooth"
elif [ "$bluetooth_status" = "inactive" ] ; then
	echo "%{F#66ffffff}$bluetooth"
fi

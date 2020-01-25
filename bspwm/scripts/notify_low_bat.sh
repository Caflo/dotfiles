#!/bin/bash

# Script executes every 1 minute in polybar --> max retard

BAT_PCT=$(acpi | awk -F ', ' '{print $2}' | sed -e 's/%//')
ADVISED=$(cat advised)

if test $BAT_PCT -lt 25 -a $ADVISED = 1 ; then # Advising only one time
	notify-send "Critical battery level, $REM_TIME"
	echo 1 > advised	
	# TODO Initialize system power saving
fi

# TODO Insert script into bspwm autostart !
	


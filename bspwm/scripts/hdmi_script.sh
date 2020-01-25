#!/bin/bash

HDMI_PORT=$(xrandr -q | egrep "HDMI[1-9] connected" | cut -d' ' -f1)
if [ -n "$HDMI_PORT" ] ; then # found
	xrandr --output $HDMI_PORT --mode 1680x1050 --right-of eDP1
	exit 0
fi
exit 1

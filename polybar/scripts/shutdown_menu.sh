#!/bin/bash

SEL=$(echo -e "Shutdown\nReboot\nLogout" | rofi -dmenu -p "Cosa vuoi fare?" -fullscreen -padding 220)

case "$SEL" in
	"Shutdown")
		systemctl poweroff
		;;	
	"Reboot")
		systemctl reboot
		;;
	"Logout")
		pkill -u "$USER"
		;;
	*)
		exit 0
esac

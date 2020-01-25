#!/bin/sh

player_status=$(playerctl -p spotify status 2> /dev/null)

if [ "$player_status" ]; then
    echo "$(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title) ($(playerctl -p spotify status))"
else
    echo "Spotify non e' aperto"
fi

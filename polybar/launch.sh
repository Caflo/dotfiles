#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Se trovo un hdmi faccio partire l'altra polybar (in ~/.xinitrc invece partira' xrandr)
# questo perche xrandr deve partire quando parte xorg. Se parte qua -> bug

HDMI_PORT=$(xrandr -q | egrep "HDMI[1-9] connected" | cut -d' ' -f1)
if [ -n "$HDMI_PORT" ] ; then # found
    polybar --reload external &
    echo "Polybar (external) launched..." >> ~/.config/polybar/polybars.log
fi

polybar --reload main &
echo "Polybar (main) launched..." > ~/.config/polybar/polybars.log

#feh --bg-scale ~/Immagini/arch_wallpaper_dark.jpg
#feh --bg-scale ~/Immagini/vaporwave2_wallpaper.jpg
feh --bg-scale ~/Immagini/blurred_wallpaper2.jpg

echo "Polybar (bottom) launched..." > ~/.config/polybar/polybars.log
polybar --reload bottom &

# I nomi delle workspace relative ai monitor risultano swappati
# Risoluzione TEMPORANEA (forzando) con
bspc monitor ^1 -d Browsing Editing Coding-1 Coding-2 Spotify Dashboard
bspc monitor ^2 -d 7 8 9 10

# Spawno i conky nella Dashboard
killall -q conky
while pgrep -u $UID -x conky >/dev/null; do sleep 1; done
bspc desktop -f ^6
conky -b -c ~/.config/conky/conkyrc_os_stats.conf &
conky -b -c ~/.config/conky/conkyrc_todo.conf &

# La barra di sotto si bugga all'avvio, risoluzione temporanea restartandola
# Non risolve all'avvio, ma risolve ogni qualvolta si restarta bspwm con bspc wm -r

PID=$(pgrep polybar -la | grep bottom | cut -d ' ' -f1)
kill -9 $PID
polybar --reload bottom &



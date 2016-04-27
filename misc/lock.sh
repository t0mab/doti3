#!/bin/bash
# scrot /tmp/screen.png
# convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
# [[ -f $HOME/Pictures/Icons/lock.png ]] && convert /tmp/screen.png $HOME/Pictures/Icons/lock.png -gravity center -composite -matte /tmp/screen.png
# #dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# i3lock -u -i /tmp/screen.png


scr="tmp/screen.png"
icon="$HOME/Pictures/Icons/lock.png"
fortune=$(fortune -s)

gradientColor='#E84C3D'
font="$HOME/.local/share/fonts/times.ttf"
scrot "$scr"
convert "$scr" -scale 10% -scale 1000%\
    -gravity south-west \
    gradient:none-"$gradientColor" -composite -matte \
    "$icon" -gravity center -composite -matte \
    -gravity center -pointsize 20 -font $font \
    -fill "#EAE4D1" -annotate +0+200 "$fortune" "$scr"
i3lock -ui "$scr"

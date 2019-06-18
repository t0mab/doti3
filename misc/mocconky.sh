#!/bin/sh
MOC=$(mocp -i 2> /dev/null | iconv -c -t utf8)
if [ "$MOC" != "FATAL_ERROR: The server is not running!" ]; then
  ARTIST=$(echo "$MOC" | grep 'Artist:' | sed -e 's/^.*: //')
  SONGTITLE=$(echo "$MOC" | grep 'SongTitle:' | sed -e 's/^.*: //')
  ALBUM=$(echo "$MOC" | grep 'Album:' | sed -e 's/^.*: //')
  STATE=$(echo "$MOC" | grep 'State:' | sed -e 's/^.*: //')
  if [ "$ARTIST" != "" ]; then ARTIST="$ARTIST - "; fi
  if [ "$ALBUM" != "" ]; then ALBUM="($ALBUM)"; fi
  if [ "$STATE" == "PLAY" ]; then
    echo "[  $ARTIST $SONGTITLE $ALBUM ]"
  fi
fi

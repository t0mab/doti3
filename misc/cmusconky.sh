#!/bin/bash
CMUS_REMOTE=$(cmus-remote -Q)
INSTANCE=$(echo -e "$CMUS_REMOTE" | wc -l)

[ $INSTANCE = 1 ] && exit 0

STATUS=$(echo "$CMUS_REMOTE" | grep status | awk '{print $2}' )
TITLE=$(echo "$CMUS_REMOTE" | grep title | cut -d ' ' -f 3- )
ARTIST=$(echo "$CMUS_REMOTE" | grep -m1 artist | cut -d ' ' -f 3- )
STREAM=$(echo "$CMUS_REMOTE" | grep stream | head -n 3 | sort -r | cut -d ' ' -f 2- | head -n 1 )
#cmus-updatepidgin artist "$ARTIST" title "$TITLE"

[ -z "$STREAM" ] && PLAYING="playing : $TITLE by $ARTIST" || PLAYING="radio $TITLE : $STREAM"

if [ "$STATUS" == "stopped" ];then
    echo ""
elif [ "$STATUS" == "paused" ];then
    echo "$PLAYING (paused)" | sed 's|&|&amp;|g'
else
    echo "$PLAYING" | sed 's|&|&amp;|g'
fi

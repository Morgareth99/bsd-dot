#!/bin/bash

cmus=$(cmus-remote -Q | grep status)
case "$cmus" in
"status stop"*)
    echo "No music!"
    ;;
"status paused"*)
    echo "Song paused"
    ;;
'status playing'*)
    title=$(cmus-remote -Q | grep tag\ title\ )
    print="${title:10}"

    artist=$(cmus-remote -Q | grep tag\ artist\ )
    print+=" - ${artist:11}"

    echo "$print"
    ;;
"")
    echo "No music!"
    ;;
esac
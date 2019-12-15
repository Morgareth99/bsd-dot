#!/bin/bash

FONT="scientifica:size=12:antialias=True:hinting=True"
BG='#30343F'
FG='#FFFFFF'
TODAY=$(($(date +%d) + 0))

CAL=$(cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#FFFFFF)^bg(#B58187) \\1 /;
s/(^|[ ])($TODAY)($|[ ])/\\1^bg(#B58187)^fg(#FFFFFF)\\2^fg(#FFFFFF)^bg(#30343F)\\3/")

(
echo "
^fg(#FFFFFF)^fn(scientifica:size=14)Calendar
"

echo "$CAL
"

echo  ""

) | dzen2 -p -x 1190 -y 35 -w 170 -bg $BG -fg $FG -l 12 -sa c -ta c -e 'onstart=uncollapse;button1=exit;button3=exit' -fn "$FONT"






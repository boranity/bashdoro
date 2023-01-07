#!/bin/bash

if [[ $(which mplayer) = "/usr/bin/mplayer" ]]; then
    :
else 
    echo "mplayer not available download manually"
fi

if [[ $(which toilet) = "/usr/bin/toilet" ]]; then
    :
else 
    echo "toilet not available download manually"
fi

read -p "working time (minutes): " duration
duration=$((duration * 60)) 

read -p "break time (minutes): " break_duration
break_duration=$((break_duration * 60)) 

while true; do
    toilet -f mono12 -F metal --gay "Start to work!"
    sleep 1
    while [ $duration -gt 0 ]; do
        clear
        toilet -f mono12 -F metal --gay "$((duration/60)):$((duration%60))"
        duration=$((duration-1))
        sleep 0.8
    done

    notify-send "Your working time has expired!"
    mplayer -endpos 1.5 /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &> /dev/null

    toilet -f mono12 -F metal --gay "Break time!"
    sleep 0.8
    while [ $break_duration -gt 0 ]; do
        clear
        toilet -f mono12 -F metal --gay "$((break_duration/60)):$((break_duration%60))"
        break_duration=$((break_duration-1))
        sleep 1
    done
done

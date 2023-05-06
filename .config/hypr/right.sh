#!/usr/bin/bash
TEMP=/tmp/current_wall
files=(~/.wallpaper/*)
index=$(cat $TEMP)
index=$((index-1))
if [ $index -ge ${#files[@]} ]; then
    index=0
fi
index=$(( ${#files[@]} - 1 ))
echo $index > $TEMP
swww img "${files[$index]}" -t wave --transition-angle 70 --transition-step 255 --transition-fps 144 --transition-duration 3
exit 0
#!/usr/bin/bash
TEMP=/tmp/current_wall
files=(~/.wallpaper/*)
index=$(cat $TEMP)
index=$((index+1))
if [ $index -ge ${#files[@]} ]; then
    index=0
fi
echo $index > $TEMP
echo "${files[$index]}"
x="$(hyprctl cursorpos -j | jq '.x/1920')"
# echo $x
y="$(hyprctl cursorpos -j | jq '(1080-.y)/1080')"
# echo $y
swww img "${files[$index]}" -t grow --transition-pos $x,$y --transition-step 255 --transition-fps 144 --transition-duration 3
exit 0
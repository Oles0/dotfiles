#!/usr/bin/bash
TEMP=/tmp/current_theme
path_code="/home/c3r5b8/.config/Code/User/settings.json"
path_alacritty="/home/c3r5b8/.config/alacritty/alacritty.yml"
path_rofi="/home/c3r5b8/.config/rofi/config.rasi"
theme=$(cat $TEMP)
if [ $theme = "light" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Mauve-Dark"
    gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin-Mocha-Mauve-Cursors'
    sed -i '/workbench.colorTheme/d' $path_code
    sed -i '2i\  "workbench.colorTheme": "Catppuccin Mocha",' $path_code
    sed -i '/catppuccin/d' $path_alacritty
    sed '2i\ '"- ~/.config/alacritty/catppuccin/catppuccin-mocha.yml"'' -i $path_alacritty
    sed -i '/catppuccin/d' $path_rofi
    sed '16i\ '"@theme \"catppuccin-mocha\""'' -i $path_rofi
    echo "dark" > /tmp/current_theme
elif [ $theme = "dark" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Latte-Standard-Mauve-Light"
    gsettings set org.gnome.desktop.interface cursor-theme 'Catppuccin-Latte-Mauve-Cursors'
    sed -i '/workbench.colorTheme/d' $path_code
    sed -i '2i\  "workbench.colorTheme": "Catppuccin Latte",' $path_code
    sed -i '/catppuccin/d' $path_alacritty
    sed '2i\ '"- ~/.config/alacritty/catppuccin/catppuccin-latte.yml"'' -i $path_alacritty
    sed -i '/catppuccin/d' $path_rofi
    sed '16i\ '"@theme \"catppuccin-latte\""'' -i $path_rofi
    echo "light" > /tmp/current_theme
fi

#!/bin/sh
rm /home/ollie/.config/spicetify/Themes/marketplace/color.ini
cp /home/ollie/.cache/wal/color.ini /home/ollie/.config/spicetify/Themes/marketplace/color.ini
spicetify apply
swaync-client --reload-css
rm /home/ollie/.config/starship.toml
cp /home/ollie/.cache/wal/starship.toml /home/ollie/.config/starship.toml
pywalfox update
~/.config/wal/scripts/rofi-theme.sh
rm /home/ollie/Projects/TabletDashboard/static/colors.css
cp /home/ollie/.cache/wal/colors.css /home/ollie/Projects/TabletDashboard/static/colors.css
WALLPAPER_PATH=$(swww query | grep 'image:' | awk -F'image: ' '{print $2}')

# Ensure it was found
if [ -z "$WALLPAPER_PATH" ]; then
    echo "Could not find current wallpaper from swww."
    exit 1
fi

# Copy it to your dashboard directory
cp "$WALLPAPER_PATH" /home/ollie/Projects/TabletDashboard/static/wallpaper.png

echo "Wallpaper copied to dashboard successfully."

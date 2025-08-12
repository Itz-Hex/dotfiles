
#!/bin/bash

THEME="$HOME/.config/rofi/launchers/type-1/style-5.rasi"

CHOICE=$(printf " Shutdown\n Reboot\n Lock + Logout" | rofi -dmenu -p "Power Menu" -theme "$THEME")

case "$CHOICE" in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Lock")
        hyprlock
        ;;
esac

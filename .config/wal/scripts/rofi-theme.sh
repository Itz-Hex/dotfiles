#!/bin/bash
# Generate rofi theme from wal colors

WAL_COLORS="$HOME/.cache/wal/colors.json"
ROFI_THEME="$HOME/.config/rofi/colors/onedark.rasi"

# Read colors from wal cache
bg=$(jq -r '.special.background' "$WAL_COLORS")
bg_alt=$(jq -r '.colors.color8' "$WAL_COLORS")
fg=$(jq -r '.special.foreground' "$WAL_COLORS")
selected=$(jq -r '.colors.color3' "$WAL_COLORS")
active=$(jq -r '.colors.color2' "$WAL_COLORS")
urgent=$(jq -r '.colors.color1' "$WAL_COLORS")

# Generate the theme file
cat > "$ROFI_THEME" <<EOF
* {
    background:     $bg;
    background-alt: $bg_alt;
    foreground:     $fg;
    selected:       $selected;
    active:         $active;
    urgent:         $urgent;
}
EOF

# Optional: reload rofi if running
if pgrep -x "rofi" >/dev/null; then
    pkill -USR1 rofi
fi

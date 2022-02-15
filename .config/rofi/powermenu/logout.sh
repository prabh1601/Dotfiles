#!/usr/bin/env bash

theme="full_alt"
dir="/home/prabh/.config/rofi/powermenu/"
rofi_command="rofi -theme $dir/$theme"
uptime=$(uptime -p | sed -e 's/up //g')

# Random colors
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 6 ))]}"
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

logout=""
yes="Yes"
no="No"
options="$yes\n$no"
rofi_confirm="rofi -theme $dir/confirm_alt"
ans=$(echo -e "$options" | $rofi_confirm -p "$logout" -dmenu -selected-row 0)

if [[ $ans = "Yes" ]]; then
	if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
		openbox --exit
	elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
		bspc quit
	elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
		i3-msg exit
	fi
else
  	exit 0
fi


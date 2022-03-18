#!/usr/bin/env bash

theme="full_rounded"
dir="/home/prabh/.config/rofi/powermenu/"
rofi_command="rofi -theme $dir/$theme"
uptime=$(uptime -p | sed -e 's/up //g')

# Random colors
#styles=($(ls -p --hide="colors.rasi" $dir/styles))
#color="${styles[$(( $RANDOM % 5 ))]}"
#sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

logout=""
yes="Yes"
no="No"
options="$yes\n$no"
ans=$(echo -e "$options" | rofi -theme $dir/confirm_alt -p "$logout" -dmenu -selected-row 0)

if [[ $ans = "Yes" ]]; then
	i3-msg exit
else
  	exit 0
fi


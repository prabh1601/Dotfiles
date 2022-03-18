#!/usr/bin/env bash

theme="full_alt"
dir="$HOME/.config/rofi/powermenu/"
rofi_command="rofi -theme $dir/$theme"
uptime=$(uptime -p | sed -e 's/up //g')

# Random colors
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 3 ))]}"
sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation
confirm_exit() {
	yes="Yes"
	no="No"
	options="$yes\n$no"
  rofi_confirm="rofi -theme $dir/confirm_alt"
	choice=$(echo -e "$options" | $rofi_confirm -p "$chosen" -dmenu -selected-row 0)
	echo $choice
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$logout"
chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"

case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "Yes" ]]; then
			poweroff
		else 
			exit 0
    fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "Yes" ]]; then
			reboot
		else
			exit 0
    fi
        ;;
    $suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "Yes" ]]; then
			# mpc -q pause
			# amixer set Master mute
			$HOME/.scripts/lock.sh
        else
        	exit 0
    fi
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "Yes" ]]; then
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
        ;;
esac

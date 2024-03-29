#!/bin/sh
WM_DESKTOP=$(xdotool getwindowfocus)

if [ $WM_DESKTOP == "4194404" ]; then
	echo " Arch-Desktop "
elif [ $WM_DESKTOP != "1883" ]; then
	WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk 'NF {print $NF}' | sed 's/"/ /g')
	WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | cut -d '=' -f 2 | awk -F\" '{ print $2 }')

	if [ "$WM_CLASS" == 'Enter WM_CLASS value here' ]; then
		echo "Custom Name"
	elif [[ "$WM_NAME" == "WhatsApp" || "$WM_NAME" == "Google Chrome" || "$WM_CLASS" == "Google-chrome" ]]; then
		echo " $WM_NAME "
	elif [[ "$WM_CLASS" == " googlecalendar-nativefier-e22938 " ]]; then
		echo " Google Calendar "
	else 
		echo "$WM_CLASS"
	fi
fi


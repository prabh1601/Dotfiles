#!/bin/sh
i3lock --nofork                 	\
    --ignore-empty-password		\
    --greeter-text="Hello Prabh!"\
    --greeter-font="Calvin and Hobbes" \
    --greeter-size="100" \
    --greeter-color=124559 \
    --greeter-pos="1550:200" \
    \
    --indicator				\
    --bar-indicator			\
    --bar-base-width="10"		\
    --bar-orientation=horizontal	\
    --bar-color=2e3440			\
    --bshl-color=5e81ac          \
    --keyhl-color=a3be8c         \
    --lock-text="Locking Session" \
    \
    --clock				\
    --time-color=eceff4ff		\
    --time-str="%I:%M %p"		\
    --time-font="Calvin and Hobbes"	\
    --time-size=150			\
    --time-pos="1500:875"		\
    --time-color=ef798a \
    \
    --date-color=d8dee9ff		\
    --date-str="%A, %d %B"		\
    --date-color=d14081 \
    --date-font="Calvin and Hobbes"	\
    --date-size=95			\
    --date-pos="tx:1020"	\
    \
    --verif-font="Calvin and Hobbes"	\
    --verif-size=100			\
    --verif-text="Verifying"		\
    --verif-color=172a3a \
    \
    --wrong-font="Calvin and Hobbes"	\
    --wrong-size=100			\
    --wrong-text="Oops! Wrong Password"		\
    --wrong-color=fe6d73 \
    \
    --image=$HOME/Pictures/Wallpaper/lock-wallpaper-edit.png 

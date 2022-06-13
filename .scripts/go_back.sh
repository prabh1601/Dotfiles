str=$(wmctrl -d | grep "*")
idx=${str:0:1}
newStr=$(wmctrl -d | sed -n "$((idx))p")
desk=${newStr: -1}
wmctrl -s $((idx-1))

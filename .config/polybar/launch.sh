#!/bin/bash

# Terminate already running instances of polybar 
killall -q polybar

#Launch Polybar,with our config files
polybar main 2>&1 | tee /tmp/polybar.log & disown

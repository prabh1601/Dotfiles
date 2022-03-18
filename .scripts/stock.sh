#!/bin/sh

#stock=$(curl -s 'https://www.keychron.com/products/keychron-q1-qmk-custom-mechanical-keyboard-knob-version?variant=39799715463257' | grep -o "Available Soon")
stock=$(curl -s 'https://www.keychron.com/products/keychron-q1-qmk-custom-mechanical-keyboard-knob-version?variant=39610589970521' | grep -o "Available Soon")
out_of_stock="Available Soon"

if [[ "$stock" != "$out_of_stock" ]] ; then
 	echo "In Stock!"
	dunstify -u critical "Keychron Q1 Knob Back in stock" "Run Dude! Before it gets out of stock" 
else 
	echo "Out of Stock"
fi

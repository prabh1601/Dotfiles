#!/bin/sh

current=$(grep -A4 -ri 'Headphone Playback Switch' /proc/asound/card*/* | grep "Amp-Out vals")
echo $current > $HOME/.scripts/current.txt
DIFF=$(diff current.txt good.txt)
if [[ "$DIFF" == "" ]]
then
  echo " "
else 
  echo "lamo"
fi
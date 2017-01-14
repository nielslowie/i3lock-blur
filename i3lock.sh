#!/bin/bash

echo i3lock blur script by trionyx
IMAGE=/tmp/i3lock.png
echo taking screenshot...
scrot $IMAGE
echo pixelating...
convert -scale 25% -scale 400% -fill black -colorize 25% $IMAGE $IMAGE
echo calculation position...
dim=$(xdpyinfo | grep  dimensions | awk '{print $2}') 
xdim=$(echo $dim | cut -d'x' -f1)
xloc=$(expr $xdim / 2 - 256 / 2)
ydim=$(echo $dim | cut -d'x' -f2)
yloc=$(expr $ydim / 2 - 256 / 2)
echo placing lock...
convert $IMAGE /usr/local/bin/lock.png -geometry +$xloc+$yloc -composite -matte $IMAGE
i3lock -u -i $IMAGE
rm $IMAGE

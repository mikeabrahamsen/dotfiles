#!/usr/bin/env bash

icon="$HOME/dotfiles/images/lock-icon-light.png"
tmpbg='/tmp/screen.png'

VALUE="60" #brightness value to compare to

scrot -o "$tmpbg"

COLOR=$(convert "$tmpbg" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
    -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');
if [ "$COLOR" -gt "$VALUE" ]; then #white background image and black text
    icon="$HOME/dotfiles/images/lock-icon-dark.png"
    PARAM=(--inside-color=00000000 --ring-color=0000003e \
        --clock \
        -timestr="%H:%M:%S"  \
        --date-str="%A, %m %Y" \
        --line-color=00000000 --keyhl-color=ffffff80 --ringver-color=ffffff00 \
        --separator-color=22222260 --insidever-color=ffffff1c \
        --ringwrong-color=ffffff55 --insidewrong-color=ffffff1c)
else #black
    icon="$HOME/dotfiles/images/lock-icon-light.png"
    PARAM=(--inside-color=ffffff00 --ring-color=ffffff3e \
        --time-color="#ffffff80" \
        --date-color="#ffffff80" \
        --clock \
        -timestr="%H:%M:%S"  \
        --date-str="%A, %m %Y" \
        --line-color=ffffff00 --keyhl-color=00000080 --ringver-color=00000000 \
        --separator-color=22222260 --insidever-color=0000001c \
        --ringwrong-color=00000055 --insidewrong-color=0000001c)
fi


convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"
i3lock "${PARAM[@]}" -i "$tmpbg"

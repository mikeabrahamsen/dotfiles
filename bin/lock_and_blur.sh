#!/usr/bin/env bash

icon="$HOME/dotfiles/images/lock-icon-light.png"
tmpbg='/tmp/screen.png'

VALUE="60" #brightness value to compare to

scrot -o "$tmpbg"

COLOR=$(convert "$tmpbg" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
    -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');
if [ "$COLOR" -gt "$VALUE" ]; then #white background image and black text
    icon="$HOME/dotfiles/images/lock-icon-dark.png"
    PARAM=(--insidecolor=00000000 --ringcolor=0000003e \
        --clock \
        -timestr="%H:%M:%S"  \
        --datestr="%A, %m %Y" \
        --linecolor=00000000 --keyhlcolor=ffffff80 --ringvercolor=ffffff00 \
        --separatorcolor=22222260 --insidevercolor=ffffff1c \
        --ringwrongcolor=ffffff55 --insidewrongcolor=ffffff1c)
else #black
    icon="$HOME/dotfiles/images/lock-icon-light.png"
    PARAM=(--insidecolor=ffffff00 --ringcolor=ffffff3e \
        --timecolor="#ffffff80" \
        --datecolor="#ffffff80" \
        --clock \
        -timestr="%H:%M:%S"  \
        --datestr="%A, %m %Y" \
        --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 \
        --separatorcolor=22222260 --insidevercolor=0000001c \
        --ringwrongcolor=00000055 --insidewrongcolor=0000001c)
fi


convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"
i3lock "${PARAM[@]}" -i "$tmpbg"

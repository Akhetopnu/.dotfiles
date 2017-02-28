PIC=/tmp/i3lock-screenshot.png
# ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -filter_complex "boxblur=5:3" -vframes 1 $PIC -loglevel quiet
ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -vframes 1 -loglevel quiet $PIC
# ffmpeg -f x11grab -vframes 1 -loglevel quiet $PIC
# scrot --multidisp --quality 100 --silent pics.jpeg
convert $PIC -scale 12.5% -scale 800% $PIC
i3lock -i $PIC --insidevercolor=00000000 --insidewrongcolor=00000000 --insidecolor=00000000 --ringvercolor=00000000 --ringwrongcolor=00000000 --ringcolor=00000000 --textcolor=00000000 --separatorcolor=00000000 --keyhlcolor=00000000 --bshlcolor=00000000 -r
rm $PIC

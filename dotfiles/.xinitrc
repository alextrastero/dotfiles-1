#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

for f in /etc/X11/xinit/xinitrc.d/*; do
   [ -x "$f" ] && . "$f"
done
unset f

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

setxkbmap pl & 
setbg &
devmon &
picom -b &
/bin/sh /home/dawid/.local/bin/sbar.sh &

exec dwm

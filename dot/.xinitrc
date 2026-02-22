#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="st"
twm="dwm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# ./.screenlayout/default.sh &
# ./.default.sh &
# feh --bg-fill /home/$USER/.config/bg3.jpg &
./scripts/dwmbar &
# setxkbmap -option 'caps:ctrl_modifier' &
xremap --watch ~/scripts/dot/xremap.yml &
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-1-0 --off --output DP-1-1 --off --output HDMI-1-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off &
feh --bg-fill ~/scripts/screen/bg2.png &
clipmenud &
numlockx &
megasync &
nm-applet &
# mullvad-vpn &
# feh --bg-scale ~/.config/bg3.jpg &
"$twm" 
#"$xclock" -geometry 50x50-1+1 &
#"$xterm" -geometry 80x50+494+51 &
#"$xterm" -geometry 80x20+494-0 &
#exec "$xterm" -geometry 80x66+0+0 -name login
#exec dwm


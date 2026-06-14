xset r rate 200 30

setxkbmap -model br-abnt2 -layout br

xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 60.0 --output HDMI-A-0 --right-of DisplayPort-0 --mode 1920x1080 --rate 60.0

redshift -P -O 2500

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec i3
# exec wayland

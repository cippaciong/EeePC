if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#Load urxvt settings
xrdb -merge ~/.Xresources

#Set $TERMINAL for i3-sensible-terminal
export TERMINAL=termite

#Set $BROWSER for termite and others
export BROWSER=firefox

#Fix QGtkStyle theme detection 
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

#Set Wallpaper
sh ~/.fehbg &

#Start autocutsel
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

### Start the WM ###
DEFAULT_SESSION=i3

case $1 in
subtle)
	exec subtle
	;;
i3)
	exec i3
	;;
*)
	exec $DEFAULT_SESSION
	;;
esac

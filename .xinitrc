#!/usr/local/bin/bash
#-------------------------------#
#  ╻ ╻╻┏┓╻╻╺┳╸┏━┓┏━╸            #
#  ┏╋┛┃┃┗┫┃ ┃ ┣┳┛┃              #
# ╹╹ ╹╹╹ ╹╹ ╹ ╹┗╸┗━╸            #
# by Morgareth                  #
# no login manager since forever#
#-------------------------------#


##----------------------------------------------------------------------------##
## Update Xresources
##----------------------------------------------------------------------------##

xrdb .Xresources 

##----------------------------------------------------------------------------##
## My fonts
##----------------------------------------------------------------------------##

xset fp+ ~/.fonts
#xset fp+ /usr/local/share/fonts/urwfonts
#xset fp+ /usr/local/share/fonts/TrueType
xset fp  rehash

##----------------------------------------------------------------------------##
## General settings
##----------------------------------------------------------------------------##
#x cursor
xsetroot -cursor_name left_ptr&

#typematic delay/ rate
#xset r rate 400 100

#Change blank time to 1 hour
xset s 3600 3600

#no bell
xset b off

# set monitor to sleep
xset s 600 600

##----------------------------------------------------------------------------------------------------------------------##
## Autostart programs + scripts
#
#----------------------------------------------------------------------------------------------------------------------##

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --dpi 96
numlockx on &

(sleep 2s && dunst) &
#compton --config ~/.config/compton.conf -b &> /tmp/compton.log
#redshift -l -18.914608:-48.275380 -g 0.8 -m randr -v  &
#xautolock -detectsleep -time 10 -locker 'betterlockscreen --lock dim' -notify 60 -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 60 seconds'" &
#[ !  -s ~/.config/mpd/pid ] && mpd
#nmpc 

##----------------------------------------------------------------------------##
## startx
##----------------------------------------------------------------------------##

_start_session() {
  session=${1:-openbox}
  case $session in
      bspwm             ) exec bspwm;;
      openbox           ) exec openbox --config-file $XDG_CONFIG_HOME/openbox/rc.xml $@;;
      xmonad            ) exec xmonad;;
      # No known session, try to run it as command
      *) exec "$1";;
  esac
}
_start_session "$@"

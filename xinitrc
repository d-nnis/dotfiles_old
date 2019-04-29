# the custom keymap
xmodmap ~/.Xmodmap &
xbindkeys -v &

xset r rate 250 35 &
#xset s 3600
/usr/bin/nm-applet &
/usr/bin/owncloud &
/opt/urserver/urserver-start --no-manager --no-notify &
sudo -u mpd mpd /home/dennis/.config/mpd/mpd.conf &
/home/dennis/bin/configme.sh &

#exec awesome

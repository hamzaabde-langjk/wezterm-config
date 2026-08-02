#!/usr/bin/env bash
xdotool getactivewindow windowkill

if [ "$1" = "hm" ]; then

	  WEZTERM_MODE="RESIZE"	wezterm &
  elif [ "$1" = "hmz" ]; then 
	  WEZTERM_MODE="TITLE" wezterm &
  else 
	  echo "user fld change bar size"
    
fi
#enter in the terminal hm or hmz for see the change enjoy !
#you can choice what u whent like your name  and make sure you edit ~/.config/wezterm.lua by your local picture
#the format of picture that u can use it is png jpg and gif also  you cant choice video cuase it crash the terminal 
# any problem inbox me my IG: fake ego 

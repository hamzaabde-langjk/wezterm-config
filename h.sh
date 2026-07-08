#!/usr/bin/env bash
xdotool getactivewindow windowkill

if [ "$1" = "hm" ]; then

	  WEZTERM_MODE="RESIZE"	wezterm &
  elif [ "$1" = "hmz" ]; then 
	  WEZTERM_MODE="TITLE" wezterm &
  else 
	  echo "user fld change bar size"
    #killall -q wezterm
fi

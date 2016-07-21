#!/usr/bin/env bash
/usr/bin/setxkbmap -option "ctrl:swapcaps"
xmodmap -e 'clear mod5'
xmodmap -e 'add mod1 = Mode_switch'
xmodmap -e "keysym ISO_Level3_Shift = Alt_L"
xcape -e 'Shift_L=Escape;Shift_R=Escape;Control_R=Return;Control_L=Return'

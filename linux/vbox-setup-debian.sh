#!/bin/bash
sudo apt install build-essential module-assistant
m-a prepare
sudo sh /media/cdrom/VBoxLinuxAdditions.run
sudo adduser enthu vboxsf
sudo adduser root vboxsf

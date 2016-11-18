#!/bin/bash
apt install -y build-essential module-assistant
m-a prepare
sh /media/cdrom/VBoxLinuxAdditions.run
adduser enthu vboxsf
adduser root vboxsf

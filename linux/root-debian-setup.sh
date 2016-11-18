#!/bin/bash

# remove cdrom entries from apt's sources
mv /etc/apt/sources.list /etc/apt/sources.backup
sed '/cdrom/d' /etc/apt/sources.backup > /etc/apt/sources.list

apt update

apt install sudo
adduser enthu sudo

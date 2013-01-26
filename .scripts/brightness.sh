#! /bin/sh
sudo sh -c "echo $1 > /sys/class/backlight/psb-bl/brightness"

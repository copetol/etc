#!/bin/bash

#to speed up ubuntu booting i disable some services

echo "systemctl mask plymouth-start.service"
systemctl mask plymouth-start.service

snap_services=$(systemctl list-unit-files | grep snap | grep enabled | cut -d ' ' -f 1)
for snap_service in $snap_services; do
  cmd="sudo systemctl disable $snap_service"
  echo $cmd
  $cmd
done

echo "systemctl disable apt-daily*"
sudo systemctl disable apt-daily.service
sudo systemctl disable apt-daily.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service

echo "systemctl disable motd-news"
sudo systemctl disable motd-news.service

#switch to runlevel 3
systemctl set-default multi-user.target

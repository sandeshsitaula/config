#!/bin/bash
cd ~/Downloads && ./iris-mini-0.3.8.AppImage  &

while true;
do 
    xsetroot -name "$(date)"

sleep 1m;
done &

#!/bin/bash -e


if [ "$#" -ne 1 ]; then
  echo "pass bus number as argument"
  exit 1;
fi

sudo ls /sys/kernel/debug/usb/usbmon
sudo modprobe usbmon

sudo cat /sys/kernel/debug/usb/usbmon/$1 > output.txt &

while : 
do
  tail output.txt 
done

jobs
sudo kill %l

#!/bin/bash

devaddress="/dev/sda1"

echo Unmounting $devaddress
umount $devaddress

echo Formatting $devaddress
mkfs.ext3 $devaddress

echo Mounting $devaddress to /media/disk
mkdir -p /media/disk/
mount $devaddress /media/disk

echo Flashing tar
tar -xvpf deblink.tar -C /media/disk/

echo Unmounting $devaddress
umount -l $devaddress
rm -rf /media/disk

echo Completed. Please remove the USB disk and insert it into steamlink.
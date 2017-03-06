#!/bin/bash

# This script will help you to setup the GPIO pins being used by the Ethernet & USB switcher on the Low Speed Connector
# By default GPIO pins are set to as output and set to Low
# It is recommended to have this script to run at the OS startup

echo 338 > /sys/class/gpio/export
sleep 1
echo 339 > /sys/class/gpio/export
sleep 1
echo out > /sys/class/gpio/gpio338/direction
echo out > /sys/class/gpio/gpio339/direction
sleep 1
echo 0 > /sys/class/gpio/gpio338/value
echo 0 > /sys/class/gpio/gpio339/value

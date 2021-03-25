#!/bin/bash

#this script is called by 'myscript.service'
sleep 1
sudo python3 /home/pi/Desktop/source_code/mountusb.py
sudo /home/pi/Desktop/rtklib/rtklib_2.4.2/app/str2str/gcc/str2str -in serial://ttyACM0:57600#ubx -out file:///media/usb/$(date +%Y%m%d-%H%M%S).ubx

# using ttyACM0 works, online articles suggest urandom as port but it leads to bloated and corrupt .ubx files

#dmesg | grep tty

#[  262.576998] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now disconnected from ttyUSB0
#[  292.937353] usb 1-1.2: FTDI USB Serial Device converter now attached to ttyUSB0

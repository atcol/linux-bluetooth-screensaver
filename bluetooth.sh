#!/bin/bash

DEVICE=Your device bluetooth 'MAC'
DEV_NAME="The alias/name from hcitool scan"
INTERVAL=5 # in seconds

# The xscreensaver PID
XSS_PID=

# Start xscreensaver if it's not already running
pgrep xscreensaver
if [ $? -eq 1 ]; then
	echo "Starting xscreensaver..."
	xscreensaver &
fi

# Assumes you've already paired and trusted the device
while [ 1 ]; do
	opt=`hcitool name $DEVICE`
	if [ "$opt" = "$DEV_NAME" ]; then
		echo "Device '$opt' found"
		if [ -n "$XSS_PID" ]; then 
			echo "Killing $XSS_PID"
			kill $XSS_PID
			XSS_PID=
		fi
	else
		echo "Can't find device $DEVICE ($DEV_NAME); locking!"
		xscreensaver-command -lock
		XSS_PID=$!
	fi
	sleep $INTERVAL
done

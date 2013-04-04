linux-bluetooth-screensaver
===========================

Lock your linux machine when a given bluetooth device cannot be seen.

## Instructions

1. Pair with your device using bluemon or see [these instructions if necessary](https://help.ubuntu.com/community/BluetoothSetup)

2. Set the device's MAC and Alias/Name at the top of `bluetooth.sh` e.g.:

	DEVICE=00:01:FF:FF:FF:FF

	DEV_NAME="My phone"

3. Run `bluetooth.sh`


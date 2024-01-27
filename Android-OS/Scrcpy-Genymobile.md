# Scrcpy-Genymobile.md

## Websites
* [Genymobile/scrcpy GitHub](https://github.com/Genymobile/scrcpy)
* [guiscrcpy Site](https://guiscrcpy.srev.in/) || [guiscrcpy GitHub](https://github.com/srevinsaju/guiscrcpy)

# Commands

## ADB
* ADB means "Android Debug Bridge"
* Copy file/folder from Phone to PC: `adb pull <source-from-phone> <destination-to-pc>`
* Copy file/folder from PC to Phone: `adb push <source-from-pc> <destination-to-phone>`

# Installation

## Antix-OS

### Install Instructions (Antix-OS)
* Install packages: `sudo apt install scrcpy scrcpy-server adb`
* In Android-Phone turn on "Developer-Mode"
  * Goto "Settings" -> "About phone" -> Press 7 times at "MIUI version". 
  * Goto "Settings" -> "Additional settings" -> "Developer options" -> Turn On "USB debugging"
* Show list of attached devices: `adb devices` <sup>{1}</sup>
* Connect Phone: `scrcpy -s <device-id>` [Get device-id from command: `adb devices`] <sup>{1}</sup>

# References

* Installation
  * {1} [Connection](https://github.com/Genymobile/scrcpy/blob/master/doc/connection.md)
  * {2} [ERROR: "adb push" returned with value 1 #185](https://github.com/Genymobile/scrcpy/issues/185)
  * {3} [Run apps on a hardware device](https://developer.android.com/studio/run/device)

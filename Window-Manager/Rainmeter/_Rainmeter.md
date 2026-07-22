# Commands/Usage

## Autostart

## Coding

* Lines starting with `;` means comment.

* Calculate in `Measure` and show in `Meter`.

* Print variable in `#VariableName#` format.

* In code sequence, second `Meter` displays on top of first `Meter`.

* `!SetOption` means rainmeter's built-in bang command. There are lot of bang commands.

# Rainmeter.md

## Notes

* On windows 10/11, show the desktop by pressing `{Win-D}`.

* Do not install Rainmeter using `scoop` package manager, it shows permission denied error when adding new skin. Rainmeter.ini is not writable inside skin file. <sup>{5}</sup>
  * Also does not show context menu for installing `.rmskin` file.
  * `scoop` package manager installs portable edition of softwares.

* Download `.rmskin` file to install skin automatically by right click.

* Download `.zip`, `.7z` archive file to manually install skin.

## Config PATH

**Rainmeter config file: `Rainmeter.ini`**

* Scoop installation path: `C:\ProgramData\scoop\apps\rainmeter\current\Rainmeter.ini`

**[Default File Locations](https://docs.rainmeter.net/manual/installing-rainmeter/#DefaultFileLocations)**

* Program folder: `C:\Program Files\Rainmeter`

* Skins folder: `C:\Users\YourName\Documents\Rainmeter\Skins`

* Settings and Layouts folder: `C:\Users\YourName\Appdata\Roaming\Rainmeter`

**[Portable Installation](https://docs.rainmeter.net/manual/installing-rainmeter/#PortableInstallation)**

* To run Rainmeter from a single folder, so it can be copied to another computer or run directly from a removable drive, select Portable installation during the install process and browse to the desired installation folder.

* No changes to the Windows Registry or Start menu will be made.

* All program, skins and settings folders and files will remain in the selected program folder.

# Installation

# Configuration

## [Unicode in Rainmeter](https://docs.rainmeter.net/tips/unicode-in-rainmeter/)

* We will refer to this as UTF-16 from here out. NEVER encode any of these files in UTF-8. Rainmeter and the Quote plugin will not be able to properly read them.

* Simply encode the .lua file as UTF-16, and it will work seamlessly when you are using Unicode in the Lua or in Rainmeter. NEVER encode a .lua script file in UTF-8. The Rainmeter implementation of Lua will not be able to properly read it.

* To read an external file which will contain Unicode characters, you should encode the external file as UTF-8 with BOM.

* Anyway, as long as your .lua is encoded in UTF-16, and the external file is encoded in UTF-8, there is nothing special you need to do to read in the file contents in Lua.

* Two file extension: `.ini` (skin) and `.inc` (include) file.

## Always On Top

**[[Rainmeter] section](https://docs.rainmeter.net/manual/settings/rainmeter-section/)**

`NormalStayDesktop`
Default: `1`

This keeps the skins in the correct "Z order" when the Windows "Show Desktop" button is clicked. When `0`, the "Z order" of all the skins might get out of order.

## RSS Reader Skin

* Show news on desktop using RSS reader skin.

# Error and Solution

* [SOLVED: Rainmeter.ini is not writable.](https://forum.rainmeter.net/viewtopic.php?t=28011) <sup>{5}</sup>

# References

* next-sl: {6}

## Websites

* {1}: [rainmeter.net](https://www.rainmeter.net/)
* {2}: [rainmeter/rainmeter GitHub](https://github.com/rainmeter/rainmeter)

**Rainmeter Skins**

* [DeviantArt Rainmeter Skins](https://www.deviantart.com/rainmeter)
* {3}: [visualskins.com => Rainmeter Skins](https://visualskins.com/)

**Collection**

* {4}: [asrma7/GlazeWMWorkspacesPlugin](https://github.com/asrma7/GlazeWMWorkspacesPlugin)

## Error and Solution

* {5}: [SOLVED: Rainmeter.ini is not writable.](https://forum.rainmeter.net/viewtopic.php?t=28011)

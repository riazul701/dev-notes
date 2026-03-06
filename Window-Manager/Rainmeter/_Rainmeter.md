# Commands/Usage

## Config PATH

**[Default File Locations](https://docs.rainmeter.net/manual/installing-rainmeter/#DefaultFileLocations)**

* Program folder: `C:\Program Files\Rainmeter`

* Skins folder: `C:\Users\YourName\Documents\Rainmeter\Skins`

* Settings and Layouts folder: `C:\Users\YourName\Appdata\Roaming\Rainmeter`

**[Portable Installation](https://docs.rainmeter.net/manual/installing-rainmeter/#PortableInstallation)**

* To run Rainmeter from a single folder, so it can be copied to another computer or run directly from a removable drive, select Portable installation during the install process and browse to the desired installation folder.

* No changes to the Windows Registry or Start menu will be made.

* All program, skins and settings folders and files will remain in the selected program folder.

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

* {1} [rainmeter.net](https://www.rainmeter.net/)
* {2} [rainmeter/rainmeter GitHub](https://github.com/rainmeter/rainmeter)
* {3} [visualskins.com => Rainmeter Skins](https://visualskins.com/)

* Collection
  * {4} [asrma7/GlazeWMWorkspacesPlugin](https://github.com/asrma7/GlazeWMWorkspacesPlugin)

## Error and Solution

* {5} [SOLVED: Rainmeter.ini is not writable.](https://forum.rainmeter.net/viewtopic.php?t=28011)

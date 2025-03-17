# Commands

## Configuration

* Generate a default configuration file <sup>{2}</sup>
```
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi
```
* This creates a file called `config.rasi` in the `~/.config/rofi/` folder. You can modify this file to set configuration settings and modify themes. `config.rasi` is the file rofi looks to by default.

## Modes

* `rofi -show window` : Show a list of all the windows and allow switching between them. <sup>{1}</sup>
  * Pressing the `delete-entry` binding (`shift-delete`) will close the window. <sup>{1}</sup>

* `rofi -show windowcd` : Shows a list of the windows on the current desktop and allows switching between them. <sup>{1}</sup>
  * Pressing the `delete-entry` binding (`shift-delete`) will kill the window. <sup>{1}</sup>

* `rofi -show run` : Shows a list of executables in `$PATH` and can launch them (optional in a terminal). <sup>{1}</sup>
  * Pressing the `delete-entry` binding (`shift-delete`) will remove this entry from the run history. <sup>{1}</sup>

* `rofi -show drun` : Same as the run launches, but the list is created from the installed desktop files. <sup>{1}</sup>
  * Pressing the `delete-entry` binding (`shift-delete`) will remove this entry from the run history. <sup>{1}</sup>

* `rofi -show ssh` : Shows a list of SSH targets based on your `ssh` config file, and allows to quickly `ssh` into them. <sup>{1}</sup>

* `rofi -show keys` : Shows a searchable list of key bindings. <sup>{1}</sup>

* `rofi -show script` : Allows custom scripted Modes to be added, see the `rofi-script(5)` manpage for more information. <sup>{1}</sup>

* `rofi -show combi -modes combi -combi-modes "window,drun,run"` : Combines multiple modes in one list. Specify which modes are included with the `-combi-modes` option. <sup>{1}</sup>
  * `!w`, only results from the `window` and `windowcd` modes are shown. <sup>{1}</sup>
  * `!r`, only results from the `drun` and `run` modes are shown. <sup>{1}</sup>

## Configuration
  
* `rofi -help` : Shows rofi help. <sup>{1}</sup>
* `rofi -version` : Shows rofi version. <sup>{1}</sup>
* `rofi -dump-config` : Dump the current active configuration, in rasi format, to stdout and exit. <sup>{1}</sup>

* `rofi-theme-selector` : Select Rofi theme <sup>{1}</sup>
  * Preview themes by hitting `Enter`. <sup>{1}</sup>
  * `Alt-a` to accept the new theme. <sup>{1}</sup>
  * `Escape` to cancel. <sup>{1}</sup>
  * Current theme {{default}} <sup>{1}</sup>

# Rofi.md

## PATH

* Rofi user-level config file path : `~/.config/rofi/config.rasi` <sup>{2}</sup>
* Rofi built-in themes path : `/usr/share/rofi/themes` <sup>{5}</sup>

# Installation

## Antix-OS

* `sudo apt install rofi`

# Configuration

# References

* next-sl: {12}

## Websites

* {1} [Rofi Site](https://davatorium.github.io/rofi/)
* {2} [Rofi GitHub](https://github.com/davatorium/rofi)
* {3} [adi1090x/rofi => Rofi based custom Applets, Launchers & Powermenus](https://github.com/adi1090x/rofi)
* {4} [newmanls/rofi-themes-collection](https://github.com/newmanls/rofi-themes-collection)
* {6} [svenstaro/rofi-calc](https://github.com/svenstaro/rofi-calc)
* {7} [Mange/rofi-emoji](https://github.com/Mange/rofi-emoji)
* {8} [Marco98/rofi-mpc](https://github.com/Marco98/rofi-mpc)
* {9} [lu0/rofi-blurry-powermenu](https://github.com/lu0/rofi-blurry-powermenu)
* {10} [jluttine/rofi-power-menu](https://github.com/jluttine/rofi-power-menu)
* {11} [firecat53/keepmenu => Dmenu/Rofi frontend for Keepass databases](https://github.com/firecat53/keepmenu)

* Collection
  * [davidborzek/spofi](https://github.com/davidborzek/spofi)

## Commands From

## Tutorials

* {5} [Rofi => ArchLinux Wiki](https://wiki.archlinux.org/title/Rofi)

## Guides

* Installation

* Configuration

## YouTube Tutorials

* [How to Setup and Configure Rofi (The Best App Launcher BY Eric Murphy)](https://www.youtube.com/watch?v=TutfIwxSE_s)
* [Make Rofi More Awesome With These Scripts BY The Linux Cast](https://www.youtube.com/watch?v=9yLULFzmg3o)
* [Rofi-Edit - An Easy Way to Open Files for the Keyboard Fumblers Amongst Us! BY OldTechBloke](https://www.youtube.com/watch?v=vztMbO_Ssa0)
* [Rofi Is Like Dmenu But Sucks Less BY DistroTube](https://www.youtube.com/watch?v=a2GWqF32U8Q)

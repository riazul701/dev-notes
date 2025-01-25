# Commands

* [Rofi Documentation](https://davatorium.github.io/rofi/)

* Modes
  * `rofi -show window` : Show a list of all the windows and allow switching between them.
    * Pressing the `delete-entry` binding (`shift-delete`) will close the window.
  * `rofi -show windowcd` : Shows a list of the windows on the current desktop and allows switching between them.
    * Pressing the `delete-entry` binding (`shift-delete`) will kill the window.
  * `rofi -show run` : Shows a list of executables in `$PATH` and can launch them (optional in a terminal).
    * Pressing the `delete-entry` binding (`shift-delete`) will remove this entry from the run history.
  * `rofi -show drun` : Same as the run launches, but the list is created from the installed desktop files.
    * Pressing the `delete-entry` binding (`shift-delete`) will remove this entry from the run history.
  * `rofi -show ssh` : Shows a list of SSH targets based on your `ssh` config file, and allows to quickly `ssh` into them.
  * `rofi -show keys` : Shows a searchable list of key bindings.
  * `rofi -show script` : Allows custom scripted Modes to be added, see the `rofi-script(5)` manpage for more information.
  * `rofi -show combi -modes combi -combi-modes "window,drun,run"` : Combines multiple modes in one list. Specify which modes are included with the `-combi-modes` option.
    * `!w`, only results from the `window` and `windowcd` modes are shown.
    * `!r`, only results from the `drun` and `run` modes are shown.

* Configuration
  * `rofi -help` : Shows rofi help.
  * `rofi -version` : Shows rofi version.
  * `rofi -dump-config` : Dump the current active configuration, in rasi format, to stdout and exit.
  * 

* `rofi-theme-selector` : Select Rofi theme
  * Preview themes by hitting `Enter`.
  * `Alt-a` to accept the new theme.
  * `Escape` to cancel.
  * Current theme {{default}}

# Rofi.md

## Websites

* [Rofi GitHub](https://github.com/davatorium/rofi)
* [adi1090x/rofi => Rofi based custom Applets, Launchers & Powermenus](https://github.com/adi1090x/rofi)
* [newmanls/rofi-themes-collection](https://github.com/newmanls/rofi-themes-collection)
* [svenstaro/rofi-calc](https://github.com/svenstaro/rofi-calc)
* [Mange/rofi-emoji](https://github.com/Mange/rofi-emoji)
* [Marco98/rofi-mpc](https://github.com/Marco98/rofi-mpc)
* [lu0/rofi-blurry-powermenu](https://github.com/lu0/rofi-blurry-powermenu)
* [jluttine/rofi-power-menu](https://github.com/jluttine/rofi-power-menu)
* [firecat53/keepmenu => Dmenu/Rofi frontend for Keepass databases](https://github.com/firecat53/keepmenu)

# Installation

## Antix-OS

* `sudo apt install rofi`

# Configuration



# References

* next-sl: {4}

* Installation

* Configuration

* YouTube Tutorial
  * {1} [How to Setup and Configure Rofi (The Best App Launcher BY Eric Murphy)](https://www.youtube.com/watch?v=TutfIwxSE_s)
  * {2} [Make Rofi More Awesome With These Scripts BY The Linux Cast](https://www.youtube.com/watch?v=9yLULFzmg3o)
  * {3} [Rofi-Edit - An Easy Way to Open Files for the Keyboard Fumblers Amongst Us! BY OldTechBloke](https://www.youtube.com/watch?v=vztMbO_Ssa0)
  * [Rofi Is Like Dmenu But Sucks Less BY DistroTube](https://www.youtube.com/watch?v=a2GWqF32U8Q)

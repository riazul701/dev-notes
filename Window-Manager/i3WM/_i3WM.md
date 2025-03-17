# Commands/Usage

## General

* `i3-config-wizard` : For first time run this command will copy i3 config from `/etc/i3/config` to `$XDG_CONFIG_HOME/i3/config` <sup>{{From i3-config}}</sup>

## i3 executables from `/usr/bin/`

* `i3` is a metapackage, which includes other packages.
  * `sudo apt show i3`
  * `sudo apt install i3`

* `i3`
* `i3bar`
* `i3-config-wizard`
* `i3-dmenu-desktop` : Which only displays applications shipping a `.desktop` file. It is a wrapper around dmenu, so you need that installed. <sup>{{From i3-config}}</sup>
* `i3-dump-log`
* `i3-input`
* `i3lock`
* `i3-migrate-config-to-v4`
* `i3-msg` : Shows i3 related message
* `i3-nagbar` : Used to show prompt with warning/message <sup>{{From i3-config}}</sup>
  * `$mod+Shift+e` : You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.
* `i3-save-tree`
* `i3-sensible-editor`
* `i3-sensible-pager`
* `i3-sensible-terminal` : Start terminal with `$mod + Enter` keybinding <sup>{{From i3-config}}</sup>
* `i3status`
* `i3-with-shmlog`
* `dmenu`
* `dunst`

## i3 Reference Card

* [i3 Reference Card](https://i3wm.org/docs/refcard.html)
  * Throughout this guide, the i3 logo will be used to refer to the configured modifier. This is the `Alt` key (`Mod1`) by default, with `⌘` (`Mod4`) being a popular alternative.

## i3 User’s Guide

* [i3 User’s Guide](https://i3wm.org/docs/userguide.html)

* 4.7. The floating modifier
  * Resize a floating window by pressing the right mouse button on it and moving around while holding it.
  * If you hold the shift button as well, the resize will be proportional (the aspect ratio will be preserved).

## Antix-OS

* `Mod+d -> xkill` : Quickly kill a running application.

# Contents of i3-Window-Manager

## Notes

* `i3lock` need png image <sup>{56}</sup>

## PATH

**Config Paths**

* `~/.config` directory has higher precedence than `/etc` directory

* `~/.config` directory (user-level)
  * i3wm config inside `~/.config` : `~/.config/i3/config`
  * i3status config inside `~/.config` : `~/.config/i3status/config`

* `/etc` directory
  * i3wm config inside `/etc` :  `/etc/i3/config`
  * i3status config inside `/etc` : `/etc/i3status.conf` <sup>{57}</sup>

**Config file location <sup>{33}</sup>**

* By default when i3 is run for the first time a new config file is added to `~/.i3/config` and a dialog asks what the modifier key should be set to.

* The default modifier key is `Alt` and a popular alternative is the `Super` (Windows) key (referred to as `$mod4` in `~/.i3/config`).

* A popular starting point for writing the config file is copying the system config file `/etc/i3/config` to one of the user config locations if one is not already generated.

## Fonts Installation

* [How to Install New Fonts in Ubuntu and Other Linux Distributions](https://itsfoss.com/install-fonts-ubuntu/)
* [SutonnyMJ Regular](https://bengalifonts.net/fonts/sutonnymj-regular)

* Step 1: Create .fonts directory in your home directory
* Step 2: Put fonts files in the .fonts directory

**Alternate Way**

* [Copying Configurations => Fonts](https://github.com/addy-dclxvi/i3-starterpack?tab=readme-ov-file#copying-configurations)

* Create `.local/share/fonts` directory in your home directory
* Put fonts files in the `.local/share/fonts` directory
* Refresh your fontconfig cache `fc-cache -fv` after You copy the font.

## Package Information

* Packages: `i3, i3wm/i3-gaps, i3status/i3blocks, i3lock/i3lock-color, polybar, dmenu, rofi, nitrogen, feh, xrandr, arandr`
* All i3-gaps features will become available with i3 4.22 <sup>{32} {35}</sup>
* Package "suckless-tools" is required for "dmenu".

* Package Introduction
  * Using command: `apt show {{package-name}}`

## `.desktop` File

* `i3-dmenu-desktop` : Which only displays applications shipping a `.desktop` file. It is a wrapper around dmenu, so you need that installed. <sup>{{From i3-config}}</sup>

# Installation

## Antix-OS/Debian

### Instructions (Antix-OS) 

**Install i3 <sup>{1} {2} {3}</sup>**

* Install i3 and associated packages: `sudo apt install i3`
  * `apt show i3`
  * metapackage (i3 window manager, screen locker, menu, statusbar)
  *  This metapackage installs the i3 window manager (`i3-wm`), the `i3lock` screen locker, `i3status` (for system information) and suckless-tools (for `dmenu`).
  * These are all the tools you need to use the i3 window manager efficiently.

* (Not-Required) Install Individual packages: <sup>{2}</sup>
  * `sudo apt install i3 i3-wm i3blocks i3lock i3status dunst suckless-tools`

* `/etc/i3/config` file <sup>{{From `i3-config`}}</sup>
  * automatically start `i3-config-wizard` to offer the user to create a keysym-based config which used their favorite modifier (`alt` or `windows`)
  * `i3-config-wizard` will not launch if there already is a config file in `~/.config/i3/config` (or `$XDG_CONFIG_HOME/i3/config` if set) or `~/.i3/config`.
  * Please remove the following exec line: `exec i3-config-wizard`

* Reboot computer

* In login screen press "F1" to change "Sessiontype" to "i3".
* Disable popup window "Your window manager was not one of the supported window managers. This window is to provide the same function as the Other Desktops menu" <sup>{4}</sup>
  * There is a button at the bottom to disable this screen from popping up each time.

**`pactl` command in `i3` config**

* `bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status`


* `apt show pulseaudio-utils`
  * These tools provide command line access to various features of the PulseAudio sound server. Included tools are:
  * `paplay` - Playback a WAV file via a PulseAudio sink.
  * `pacat` - Cat raw audio data to a PulseAudio sink.
  * `parec` - Cat raw audio data from a PulseAudio source.
  * `pacmd` - Connect to PulseAudio's built-in command line control interface.
  * `pactl` - Send a control command to a PulseAudio server.
  * `padsp` - /dev/dsp wrapper to transparently support OSS applications.
  * `pax11publish` - Store/retrieve PulseAudio default server/sink/source settings in the X11 root window.

* `sudo apt install pulseaudio-utils`

### Commands (Antix-OS)

* Show details of "i3" window manager: `apt show i3` [Version: 4.19.1]
* Close Conky resource monitor: `sudo killall conky`
* Power Management
  * Shutdown/PowerOff PC: `sudo poweroff` <sup>{7}</sup>
  * Reboot/Restart PC: `sudo reboot` <sup>{8}</sup>
  * Halt PC: `sudo halt`
  * Check suspend and hibernate are supported: `pm-is-supported` <sup>{10}</sup>
  * Hibernate PC: `sudo pm-hibernate` <sup>{9} {10}</sup>
  * Suspend/Sleep PC: `sudo pm-suspend` <sup>{10}</sup>
  * LogOut User(PC): `sudo pkill -u $(whoami)` <sup>{11}</sup>

# Error and Solution

* next-error: {{error-4}}

## Installation -> Antix-OS

**{{error-1}} status_command not found**

* Message_1: 
  * Error (shown in status bar): status_command not found or is missing a library dependency (exit 127)

* Solution_1:
  * {30} [i3 Error: Status_command not found (exit 127)](https://www.reddit.com/r/linuxmint/comments/3f9k9s/i3_error_status_command_not_found_exit_127/)
  * Reason: `i3status` is not installed.
  * Install `i3status`: `sudo apt install i3status`

## Usage (Antix-OS)

**{{error-2}} `Alt+Shift+{{key}}` key combination does not work**

* Message_2:
  * I3 keybindings do not recognize shift key
  * `Alt+Shift+j`, `Alt+Shift+k`, `Alt+Shift+l`, `Alt+Shift+;`, `Alt+Shift+c`, `Alt+Shift+r`, `Alt+Shift+e` keyboard shortcuts do not work.

* Solution_2:
  * {31} [I3 keybindings do not recognize shift key](https://www.reddit.com/r/i3wm/comments/fp1apq/i3_keybindings_do_not_recognize_shift_key/)
    * Recently had a similar issue under X11, trying to use Alt+Shift+Arrow to navigate unread messages on different applications. In my case, the (default) X11 keybindings were using Alt+Shift to switch keyboards.
    * If you look at your X11 Keyboard mappings with `setxkbmap -query`, you might get :
    * `options:    grp:alt_shift_toggle,grp_led:scroll`
    * In this case you could use `setxkbmap -option "grp_led:scroll"` to disable the default Alt+Shift behavior. You can also change your keyboard layout with `setxkbmap <layout>` (for example setxkbmap us).
    * Hope this helps you or someone else who may be facing a similar issue.
    * [[Works Perfectly]] This worked for me! I did have to run `setxkbmap -option` before running `setxkbmap -option "grp_led:scroll"` as the remove the `alt_shift_toggle`

  * Antix-OS
    * `setxkbmap` settings are defined in `/etc/default/keyboard` file
      * Problematic line is: `XKBOPTIONS="grp:lalt_lshift_toggle,terminate:ctrl_alt_bksp,grp_led:scroll"`
      * Goto "Control Centre -> System -> Edit Config Files", to see `/etc/default/keyboard` file under `keyboard` tab.
      * Solution
        * Open "Control Centre -> System -> Set System Keyboard Layout -> Hotkeys"
        * Set "Switching to another layout: Both Shift together"

**{{error-3}} `Alt+Space` shows taskbar menu item**

# References

* next-sl: {62}

## Websites

* i3 Window Manager
  * {33} [i3 Tiling Window Manager](https://i3wm.org/)
  * {34} [i3/i3 => Tiling window manager for X11](https://github.com/i3/i3)
  * {35} [Airblader/i3 => All i3-gaps features will become available with i3 4.22](https://github.com/Airblader/i3)
  * {36} [i3 Reference Card](https://i3wm.org/docs/refcard.html)
  * {37} [stav121/i3wm-themer GitHub](https://github.com/stav121/i3wm-themer)
  * {38} [cizordj/i3-themer](https://github.com/cizordj/i3-themer)
  * {56} [addy-dclxvi/i3-starterpack](https://github.com/addy-dclxvi/i3-starterpack)
  * {58} [Justus0405/i3wm-dotfiles](https://github.com/Justus0405/i3wm-dotfiles)

* Status Bar
  * {44} [i3/i3status => status bar for i3bar, dzen2 or xmobar](https://github.com/i3/i3status)
  * {45} [vivien/i3blocks => alternative to i3status, last commit 2 years ago](https://github.com/vivien/i3blocks)
  * {46} [polybar/polybar => status bar](https://github.com/polybar/polybar)

* Lock Screen
  * {47} [i3/i3lock](https://github.com/i3/i3lock)
  * {48} [Raymo111/i3lock-color => alternative to i3lock](https://github.com/Raymo111/i3lock-color)

* Application Launcher
  * {49} [davatorium/rofi => window switcher, application launcher and dmenu replacement](https://github.com/davatorium/rofi)
  * {50} [Dmenu](https://tools.suckless.org/dmenu/)

* Wallpaper Change
  * {42} [feh - wallpaper change](https://github.com/derf/feh) <sup>{19}</sup>
  * {43} [nitrogen - wallpaper change](https://github.com/l3ib/nitrogen) <sup>{19}</sup>

* Screen Resolution Change
  * {51} [Xrandr => RandR (Resize and Rotate). Already installed](https://wiki.gentoo.org/wiki/Xrandr)
  * {52} [arandr => ARandR: Another XRandR GUI](https://christian.amsuess.com/tools/arandr/)

* Others
  * {39} [tobi-wan-kenobi/bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) <sup>{19}</sup>
  * {40} [jgmenu/jgmenu](https://github.com/jgmenu/jgmenu)
  * {41} [Online Colorscheme Configurator for i3, i3status, dmenu](https://thomashunter.name/i3-configurator/)
  * {53} [Software hosted on or related to freedesktop.org](https://www.freedesktop.org/wiki/Software/)
  * {54} [D-Bus](https://www.freedesktop.org/wiki/Software/dbus/)
  * {55} [Power Management Utilities => "pm-utils" package](https://pm-utils.freedesktop.org/wiki/)

* Collection (Important)
  * [dikiaap/dotfiles](https://github.com/dikiaap/dotfiles)
  * [denisse-dev/dotfiles](https://github.com/denisse-dev/dotfiles)
  * [joshpetit/dotfiles](https://github.com/joshpetit/dotfiles)
  
* Collection (Less Important)
  * [stronk-dev/Tokyo-Night-Linux](https://github.com/stronk-dev/Tokyo-Night-Linux)
  * [Keyitdev/dotfiles](https://github.com/Keyitdev/dotfiles)
  * [ishaan26/config_files](https://github.com/ishaan26/config_files)
  * [sdaveas/i3-animated-background](https://github.com/sdaveas/i3-animated-background)
  * [drewtempelmeyer/dotfiles](https://github.com/drewtempelmeyer/dotfiles)
  * [miguelmota/dotfiles](https://github.com/miguelmota/dotfiles)
  * [johackim/dotfiles](https://github.com/johackim/dotfiles)
  * [pitkley/i3nator](https://github.com/pitkley/i3nator)

## Tutorials
  
* {25} [i3 => is a minimalist tiling window manager](https://wiki.gentoo.org/wiki/I3)
* {26} [Polybar => is a fast and easy-to-use status bar](https://wiki.gentoo.org/wiki/Polybar)
* {27} [Desktop environment => is a complete ecosystem of software and resources](https://wiki.gentoo.org/wiki/Desktop_environment)
* {28} [Desktop environment Wiki](https://en.wikipedia.org/wiki/Desktop_environment)
* {29} [Feh => view images and setting the desktop background for tiling window managers](https://wiki.gentoo.org/wiki/Feh)

## Guides

* i3wm/i3-gaps
  * {32} [i3-gaps has been merged with i3](https://www.reddit.com/r/archlinux/comments/101iaya/i3gaps_has_been_merged_with_i3/)

* i3 Installation

  * Antix-OS
    * {30} [i3 Error: Status_command not found (exit 127)](https://www.reddit.com/r/linuxmint/comments/3f9k9s/i3_error_status_command_not_found_exit_127/)
    * {1} [Package: i3 (4.22-2)](https://packages.debian.org/sid/i3)
    * {3} [i3-gaps option now showing while trying to install i3?](https://www.reddit.com/r/i3wm/comments/146s6n4/i3gaps_option_now_showing_while_trying_to_install/)
    * {5} [Cinnamon: Your window manager is not supported!](https://www.antixforum.com/forums/topic/cinnamon-your-window-manager-is-not-supported/)

  * Ubuntu-OS
    * {2} [Install and Setup i3 Windows Manager on Ubuntu 20.04](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/)

* i3status
  * {57} [Where is the i3status config file?](https://unix.stackexchange.com/questions/622923/where-is-the-i3status-config-file)

* Others
  * {22} [RAM Usage of small window managers - a comparison](https://www.reddit.com/r/unixporn/comments/4tfdzu/ram_usage_of_small_window_managers_a_comparison/)
  * {23} [New to awesome: does a window manager replaces a desktop environment?](https://www.reddit.com/r/awesomewm/comments/n1talw/new_to_awesome_does_a_window_manager_replaces_a/)
  * {24} [I compared the RAM use of 15 desktop environments on Ubuntu](https://www.reddit.com/r/xfce/comments/kb0d87/i_compared_the_ram_use_of_15_desktop_environments/)

## Error and Solution

* Usage
  * {31} [I3 keybindings do not recognize shift key](https://www.reddit.com/r/i3wm/comments/fp1apq/i3_keybindings_do_not_recognize_shift_key/)

## YouTube Tutorials

* i3, i3status, i3blocks, Dmenu, Polybar, Rofi
  * [I3wm Config Guide BY Fawzan Fawzi](https://www.youtube.com/playlist?list=PL0rXAycsylvXxyPDT5kGQ5MiHcqrZWv69)
  * [[8a] | i3 Installation & Navigation BY EF - Linux Made Simple](https://www.youtube.com/watch?v=sE3LHJ8lEss)
  * [[8b] | i3 Basic Customization BY EF - Linux Made Simple](https://www.youtube.com/watch?v=lvLExb1SUzM)
  * [[8c] | i3 Step 2 Customization BY EF - Linux Made Simple](https://www.youtube.com/watch?v=0MEm4pj5dpQ)
  * [[8d] | i3 Step 3 Customization BY EF - Linux Made Simple](https://www.youtube.com/watch?v=kuzTkTgAsdg)
  * [[8e] | Polybar on i3 BY EF - Linux Made Simple](https://www.youtube.com/watch?v=cLB008-FJ5o)

* Others
  * {4} [Ubuntu Server is Perfect for a Minimal "Window Manager" Installation BY DistroTube](https://www.youtube.com/watch?v=AHvwxc62lDQ)
  * {15} [Install & Customize i3wm and Polybar - Speedrun BY The Linux Cast](https://www.youtube.com/watch?v=kWRQoLFntQc)
  * {16} [Top 5 BEST Tools for Window Manager Users! BY The Linux Cast](https://www.youtube.com/watch?v=XecZxonyjo0)
  * {17} [Ricing i3wm with a Custom Theme BY The Linux Cast](https://www.youtube.com/watch?v=kd9g87xjx3I)
  * {18} [Best Color Schemes for Linux BY The Linux Cast](https://www.youtube.com/watch?v=6SX3yIQuZ2k)
  * {19} [How to Rice I3 - Customizing i3wm for Noobs BY The Linux Cast](https://www.youtube.com/watch?v=qUJf_ACn6q4)
  * {20} [Turn Your Window Manager Into A Desktop Environment BY DistroTube](https://www.youtube.com/watch?v=FX26s8INUYo)
  * {21} [Get Rid Of That Bloated Desktop Environment And Install Openbox BY DistroTube](https://www.youtube.com/watch?v=T-rQ7iV0agY)
  * [5 Hidden Features of i3WM BY The Linux Cast](https://www.youtube.com/watch?v=PQCggApEl3Y)

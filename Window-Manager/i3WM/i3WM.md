# I3-Window-Manager.md

## Websites
* [i3 Tiling Window Manager](https://i3wm.org/)
* [i3 Window Manager GitHub](https://github.com/i3/i3)
* [i3 Reference Card](https://i3wm.org/docs/refcard.html)
* [stav121/i3wm-themer GitHub](https://github.com/stav121/i3wm-themer)
* [cizordj/i3-themer](https://github.com/cizordj/i3-themer)
* [tobi-wan-kenobi/bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) <sup>{19}</sup>
* [jgmenu/jgmenu](https://github.com/jgmenu/jgmenu)
* [Online Colorscheme Configurator for i3, i3status, dmenu](https://thomashunter.name/i3-configurator/)

## Notes
* Use "dbus-send" to poweroff, restart, suspend, hibernate PC. <sup>{12} {13}</sup>

## Tools/Packages
* [feh - wallpaper change](https://github.com/derf/feh) <sup>{19}</sup>
* [nitrogen - wallpaper change](https://github.com/l3ib/nitrogen) <sup>{19}</sup>

# Installation

## Antix-OS

### Notes (Antix-OS)

* Package "suckless-tools" is required for "dmenu".
* Packages: `i3, i3wm/i3-gaps, i3status/i3blocks, i3lock/i3lock-color, polybar, dmenu, rofi, nitrogen, feh, xrandr, arandr`

### Package Introduction

* Using command: `apt show {{package-name}}`

### Instructions (Antix-OS) <sup>{1} {2} {3}</sup>

* Install i3 and associated packages: `sudo apt install i3`
  * `apt show i3`
  * metapackage (i3 window manager, screen locker, menu, statusbar)
  *  This metapackage installs the i3 window manager (i3-wm), the i3lock screen locker, i3status (for system information) and suckless-tools (for dmenu).
  * These are all the tools you need to use the i3 window manager efficiently.
* (Not-Required) Install Individual packages: <sup>{2}</sup>
  * `sudo apt install i3 i3-wm i3blocks i3lock i3status dunst suckless-tools`

* `/etc/i3/config` file
  * automatically start `i3-config-wizard` to offer the user to create a keysym-based config which used their favorite modifier (`alt` or `windows`)
  * `i3-config-wizard` will not launch if there already is a config file in `~/.config/i3/config` (or `$XDG_CONFIG_HOME/i3/config` if set) or `~/.i3/config`.
  * Please remove the following exec line: `exec i3-config-wizard`

* Reboot computer
* In login screen press "F1" to change "Sessiontype" to "i3".
* Disable popup window "Your window manager was not one of the supported window managers. This window is to provide the same function as the Other Desktops menu" <sup>{4}</sup>
  * There is a button at the bottom to disable this screen from popping up each time.

### Power Management

* [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)

```shellscript
# mode for leave menu
set $leave_menu Leave Menu: (1)Lock, (2)Logout, (3)Suspend, (4)Hibernate, (5)Reboot, (6)Shutdown
mode "$leave_menu" {
    bindsym 1 exec --no-startup-id $myscripts/lock-session.sh, mode "default"
    bindsym 2 exec --no-startup-id i3-msg exit, mode "default"
    bindsym 3 exec --no-startup-id systemctl suspend, mode "default"
    bindsym 4 exec --no-startup-id systemctl hibernate, mode "default"
    bindsym 5 exec --no-startup-id systemctl reboot, mode "default"
    bindsym 6 exec --no-startup-id systemctl poweroff, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Shift+e mode "$leave_menu"
```

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

# Configuration

## Notes

* Config file location
  * By default when i3 is run for the first time a new config file is added to `~/.i3/config` and a dialog asks what the modifier key should be set to.
  * The default modifier key is `Alt` and a popular alternative is the `Super` (Windows) key (referred to as `$mod4` in `~/.i3/config`).
  * A popular starting point for writing the config file is copying the system config file `/etc/i3/config` to one of the user config locations if one is not already generated.

# Error and Solution

* next-error: {{error-3}}

## Installation -> Antix-OS

**{{error-1}} status_command not found**

  * Message_1: 
    * Error (shown in status bar): status_command not found or is missing a library dependency (exit 127)

  * Solution_1:
    * {30} [i3 Error: Status_command not found (exit 127)](https://www.reddit.com/r/linuxmint/comments/3f9k9s/i3_error_status_command_not_found_exit_127/)
    * Reason: `i3status` is not installed.
    * Install `i3status`: `sudo apt install i3status`

## Usage

**{{error-2}} `Alt+Shift+{{key}}` key combination does not work**

  * Message_2:
    * I3 keybindings do not recognize shift key
    * `Alt+Shift+j`, `Alt+Shift+k`, `Alt+Shift+l`, `Alt+Shift+;`, `Alt+Shift+c`, `Alt+Shift+r`, `Alt+Shift+e` keyboard shortcuts do not work.

  * Solution_2:
    * [I3 keybindings do not recognize shift key](https://www.reddit.com/r/i3wm/comments/fp1apq/i3_keybindings_do_not_recognize_shift_key/)
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

# References

* next-sl: {31}

* Tutorials
  * {25} [i3 => is a minimalist tiling window manager](https://wiki.gentoo.org/wiki/I3)
  * {26} [Polybar => is a fast and easy-to-use status bar](https://wiki.gentoo.org/wiki/Polybar)
  * {27} [Desktop environment => is a complete ecosystem of software and resources](https://wiki.gentoo.org/wiki/Desktop_environment)
  * {28} [Desktop environment Wiki](https://en.wikipedia.org/wiki/Desktop_environment)
  * {29} [Feh => view images and setting the desktop background for tiling window managers](https://wiki.gentoo.org/wiki/Feh)

* Guides

* i3 Installation

  * Antix-OS Installation
    * {30} [i3 Error: Status_command not found (exit 127)](https://www.reddit.com/r/linuxmint/comments/3f9k9s/i3_error_status_command_not_found_exit_127/)
    * {1} [Package: i3 (4.22-2)](https://packages.debian.org/sid/i3)
    * {3} [i3-gaps option now showing while trying to install i3?](https://www.reddit.com/r/i3wm/comments/146s6n4/i3gaps_option_now_showing_while_trying_to_install/)
    * {5} [Cinnamon: Your window manager is not supported!](https://www.antixforum.com/forums/topic/cinnamon-your-window-manager-is-not-supported/)

  * Ubuntu-OS
    * {2} [Install and Setup i3 Windows Manager on Ubuntu 20.04](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/)

* Power Management
  * {6} [i3wm and power management](https://www.reddit.com/r/i3wm/comments/2yniv1/i3wm_and_power_management/)
  * {7} [How To Shutdown Linux Using Command Line](https://www.cyberciti.biz/faq/howto-shutdown-linux/)
  * {8} [Reboot Linux System Command](https://www.cyberciti.biz/faq/howto-reboot-linux/)
  * {9} [How to hibernate / real suspend for laptops? No battery use](https://www.antixforum.com/forums/topic/how-to-hibernate-real-suspend-for-laptops-no-battery-use/)
  * {10} [Introduction to Power Management Utilities](https://www.linuxfromscratch.org/blfs/view/11.3/general/pm-utils.html)
  * {11} [How to force user logout in Linux](https://www.simplified.guide/linux/user-force-logout)
  * {12} [How do you shutdown from i3?](https://www.reddit.com/r/i3wm/comments/7ak40z/how_do_you_shutdown_from_i3/)
  * {13} [dotfiles-i3/bin/i3-exit](https://github.com/rynnon/dotfiles-i3/blob/r-gerritpc/bin/i3-exit) <sup>{12}</sup>
  * {14} [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)

* Configuration

* Others
  * {22} [RAM Usage of small window managers - a comparison](https://www.reddit.com/r/unixporn/comments/4tfdzu/ram_usage_of_small_window_managers_a_comparison/)
  * {23} [New to awesome: does a window manager replaces a desktop environment?](https://www.reddit.com/r/awesomewm/comments/n1talw/new_to_awesome_does_a_window_manager_replaces_a/)
  * {24} [I compared the RAM use of 15 desktop environments on Ubuntu](https://www.reddit.com/r/xfce/comments/kb0d87/i_compared_the_ram_use_of_15_desktop_environments/)

* YouTube Tutorials

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

# I3-Window-Manager.md

## Websites
* [i3 Tiling Window Manager](https://i3wm.org/)
* [i3 Window Manager GitHub](https://github.com/i3/i3)
* [i3 Reference Card](https://i3wm.org/docs/refcard.html)
* [stav121/i3wm-themer GitHub](https://github.com/stav121/i3wm-themer)
* [cizordj/i3-themer](https://github.com/cizordj/i3-themer)
* [tobi-wan-kenobi/bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) <sup>{155}</sup>
* [jgmenu/jgmenu](https://github.com/jgmenu/jgmenu)
* [Online Colorscheme Configurator for i3, i3status, dmenu](https://thomashunter.name/i3-configurator/)

## Notes
* Use "dbus-send" to poweroff, restart, suspend, hibernate PC. <sup>{57} {58}</sup>

## Tools/Packages
* [feh - wallpaper change](https://github.com/derf/feh) <sup>{155}</sup>
* [nitrogen - wallpaper change](https://github.com/l3ib/nitrogen) <sup>{155}</sup>

# Installation

## Antix-OS Installation

### Notes (Antix-OS)
* Package "suckless-tools" is required for "dmenu".

### Instructions (Antix-OS) <sup>{1} {2} {3}</sup>
* <sup>{2}</sup> Install required packages: `sudo apt install i3 i3-wm i3blocks i3lock i3status dunst suckless-tools`
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
  * Shutdown/PowerOff PC: `sudo poweroff` <sup>{52}</sup>
  * Reboot/Restart PC: `sudo reboot` <sup>{53}</sup>
  * Halt PC: `sudo halt`
  * Check suspend and hibernate are supported: `pm-is-supported` <sup>{55}</sup>
  * Hibernate PC: `sudo pm-hibernate` <sup>{54} {55}</sup>
  * Suspend/Sleep PC: `sudo pm-suspend` <sup>{55}</sup>
  * LogOut User(PC): `sudo pkill -u $(whoami)` <sup>{56}</sup>

# References

* i3 Installation
  * {1} [Package: i3 (4.22-2)](https://packages.debian.org/sid/i3)
  * {2} [Install and Setup i3 Windows Manager on Ubuntu 20.04](https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/)
  * {3} [i3-gaps option now showing while trying to install i3?](https://www.reddit.com/r/i3wm/comments/146s6n4/i3gaps_option_now_showing_while_trying_to_install/)
  * {4} [Ubuntu Server is Perfect for a Minimal "Window Manager" Installation](https://www.youtube.com/watch?v=AHvwxc62lDQ)
  * {5} [Cinnamon: Your window manager is not supported!](https://www.antixforum.com/forums/topic/cinnamon-your-window-manager-is-not-supported/)

* Power Management
  * {51} [i3wm and power management](https://www.reddit.com/r/i3wm/comments/2yniv1/i3wm_and_power_management/)
  * {52} [How To Shutdown Linux Using Command Line](https://www.cyberciti.biz/faq/howto-shutdown-linux/)
  * {53} [Reboot Linux System Command](https://www.cyberciti.biz/faq/howto-reboot-linux/)
  * {54} [How to hibernate / real suspend for laptops? No battery use](https://www.antixforum.com/forums/topic/how-to-hibernate-real-suspend-for-laptops-no-battery-use/)
  * {55} [Introduction to Power Management Utilities](https://www.linuxfromscratch.org/blfs/view/11.3/general/pm-utils.html)
  * {56} [How to force user logout in Linux](https://www.simplified.guide/linux/user-force-logout)
  * {57} [How do you shutdown from i3?](https://www.reddit.com/r/i3wm/comments/7ak40z/how_do_you_shutdown_from_i3/)
  * {58} [dotfiles-i3/bin/i3-exit](https://github.com/rynnon/dotfiles-i3/blob/r-gerritpc/bin/i3-exit) <sup>{57}</sup>
  * {59} [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)

* Configuration
  * {101}

* YouTube Tutorial
  * {151} [Install & Customize i3wm and Polybar - Speedrun](https://www.youtube.com/watch?v=kWRQoLFntQc)
  * {152} [Top 5 BEST Tools for Window Manager Users!](https://www.youtube.com/watch?v=XecZxonyjo0)
  * {153} [Ricing i3wm with a Custom Theme](https://www.youtube.com/watch?v=kd9g87xjx3I)
  * {154} [Best Color Schemes for Linux](https://www.youtube.com/watch?v=6SX3yIQuZ2k)
  * {155} [How to Rice I3 - Customizing i3wm for Noobs](https://www.youtube.com/watch?v=qUJf_ACn6q4)
  * {156} [Turn Your Window Manager Into A Desktop Environment](https://www.youtube.com/watch?v=FX26s8INUYo)
  * {157} [Get Rid Of That Bloated Desktop Environment And Install Openbox](https://www.youtube.com/watch?v=T-rQ7iV0agY)

* Others
  * [RAM Usage of small window managers - a comparison](https://www.reddit.com/r/unixporn/comments/4tfdzu/ram_usage_of_small_window_managers_a_comparison/)
  * [New to awesome: does a window manager replaces a desktop environment?](https://www.reddit.com/r/awesomewm/comments/n1talw/new_to_awesome_does_a_window_manager_replaces_a/)
  * [I compared the RAM use of 15 desktop environments on Ubuntu](https://www.reddit.com/r/xfce/comments/kb0d87/i_compared_the_ram_use_of_15_desktop_environments/)

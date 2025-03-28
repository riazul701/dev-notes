# Configuration

## `i3 mode` (`i3status` & `i3bar`, `polybar`) Power Management

**Systemctl power management<sup>{59}</sup>**

* `systemctl suspend` : Suspend/Sleep PC
* `systemctl hibernate` : Hibernate PC
* `systemctl reboot` : Reboot/Restart PC
* `systemctl poweroff` : Poweroff/Shutdown PC

**dbus-send power management**

* Use "dbus-send" to poweroff, restart, suspend, hibernate PC. <sup>{12} {13}</sup>

**Use i3 mode to shutdown, logout, etc. <sup>{62}</sup>**

* Menu is shown in `i3status` (`i3bar`), in Polybar this menu is not shown, but keyboard shortcuts work.

* For the most part I use systemctl's commands. Optional keybinding from `bindsym 1` to `bindsym $mod+1` (`Alt+1`)
```shell
# mode for leave menu
set $leave_menu Leave Menu: (1)Lock, (2)Logout, (3)Suspend, (4)Hibernate, (5)Reboot, (6)Shutdown
mode "$leave_menu" {
    #bindsym 1 exec --no-startup-id $myscripts/lock-session.sh, mode "default"
    bindsym 1 exec --no-startup-id i3lock -c 111111, mode "default"
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

* (Just Reference, Don't Use This, Use Above Code) Here is my config. I don't use `i3exit`
```shell
set $sysmenu (l)ock, (L)ogout, (P)oweroff, (R)eboot
mode "$sysmenu" {
    bindsym l exec "i3lock -c 111111", mode "default"
    bindsym Shift+l exec "i3-msg exit", mode "default"
    bindsym Shift+p exec "shutdown now", mode "default"
    bindsym Shift+r exec reboot, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Shift+x mode "$sysmenu"
```
* You need to install `i3lock` for lockscreen to work

**Polybar config to show `i3 mode` <sup>{19}</sup>**

* If you're using `xworkspaces` module in Polybar, you'll have to change that to `i3` module in order to display the mode. Here's the snippet from my configuration : `~/.config/polybar/config.ini`
```shell
[module/i3]
type = internal/i3
#pin-workspaces = true
#strip-wsnumbers = true
#index-sort = true
#enable-click = true
#enable-scroll = false
#wrapping-scroll = false
#reverse-scroll = false
#fuzzy-match = false

label-mode = %mode%
label-mode-padding = 2
label-mode-background = ${colors.alert}

#label-focused = %name%
#label-focused-background = ${colors.background}
#label-focused-underline = ${colors.primary}
#label-focused-padding = 2

#label-unfocused = %index%: %name%
#label-unfocused-padding = 2

#label-urgent = %index%: %name%
#label-urgent-background = ${colors.alert}
#label-urgent-padding = 2
```

## Polybar Power Management

**Polybar power management using "Inter-Process-Messaging" and Polybar "custom/menu" actions <sup>{16} {17} {18}</sup>**

* Polybar config
```shell
[bar/example]
enable-ipc = true

modules-left = xworkspaces xwindow menu-apps

[module/menu-apps]
type = custom/menu

; If true, <label-toggle> will be to the left of the menu items (default).
; If false, it will be on the right of all the items.
expand-right = true

; "menu-LEVEL-N" has the same properties as "label-NAME" with
; the additional "exec" property
;
; Commands will be executed using "/bin/sh -c $COMMAND"

label-open = PW
label-close = X

; Optional item separator
; Default: none
label-separator = |

menu-0-0 = (1)Lock
menu-0-0-exec = i3lock -c 111111
menu-0-1 = (2)Logout
menu-0-1-exec = i3-msg exit
menu-0-2 = (3)Suspend
menu-0-2-exec = systemctl suspend
menu-0-3 = (4)Hibernate
menu-0-3-exec = systemctl hibernate
menu-0-4 = (5)Reboot
menu-0-4-exec = systemctl reboot
menu-0-5 = (6)Shutdown
menu-0-5-exec = systemctl poweroff
```

* `i3WM` config
```shell
polybar-msg action menu-apps open 0 # Open "menu-0"
polybar-msg action menu-apps close 0 # Close "menu-0"
polybar-msg action menu-apps exec 0-1 # Execute "menu-0-1-exec" command
```

## Volume Management

* Use keybinding instead of multimedia key for volume control <sup>{60} {61}</sup>

* Existing multimedia key
```shell
# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status
```

* New keybinding
```shell
bindsym $mod+plus exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym $mod+minus exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
```

## Rofi i3WM Config

* [Justus0405/i3wm-dotfiles](https://github.com/Justus0405/i3wm-dotfiles) <sup>{58}</sup>

```shell
# start rofi (as a multi-use launcher)
bindsym $mod+d exec "rofi -modi drun,run -show drun"
bindsym $mod+o exec "rofi -modi ssh,run -show ssh"
bindsym $mod+p exec "rofi -show calc -modi calc -no-show-match -no-sort"
bindsym Mod1+Tab exec "rofi -modi window,run -show window"

```

## i3WM Nitrogen Wallpaper

**[Nitrogen is not setting the wallpaper when i start i3](https://askubuntu.com/questions/407514/nitrogen-is-not-setting-the-wallpaper-when-i-start-i3) <sup>{15}</sup>**

* for i3 users : `vim ~/.config/i3/config`
* then add the line below to your config : `exec --no-startup-id nitrogen --restore`
* omitting --restore will cause the whole nitrogen app to come up instead of the wallpaper

# Config-i3wm.md

# References

* next-sl: {63}

## Configuration From

* i3WM Config
  * {58} [Justus0405/i3wm-dotfiles](https://github.com/Justus0405/i3wm-dotfiles)

* `i3 mode` (`i3status` & `i3bar`, `polybar`) Power Management
  * {59} [Systemctl power management](https://github.com/Justus0405/i3wm-dotfiles/blob/main/src/config/rofi/powermenu)
  * {62} [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)
  * {19} [Is there a way to use polybar and the mode binding together?](https://www.reddit.com/r/i3wm/comments/wrlf6g/is_there_a_way_to_use_polybar_and_the_mode/)

* Polybar Power Management
  * {16} [Inter-process-messaging](https://polybar.readthedocs.io/en/stable/user/ipc.html)
  * {17} [Actions - Custom Menu](https://polybar.readthedocs.io/en/stable/user/actions.html#custom-menu)
  * {18} [Module: menu](https://github.com/polybar/polybar/wiki/Module:-menu)
  
* Multimedia/Volume Keys
  * {60} [Multimedia Keys in i3](https://bbs.archlinux.org/viewtopic.php?id=221642)

* Wallpaper (Nitrogen)
  * {15} [Nitrogen is not setting the wallpaper when i start i3](https://askubuntu.com/questions/407514/nitrogen-is-not-setting-the-wallpaper-when-i-start-i3)

## Guides

* Sound Volume
  * {61} [volume control doesn't work](https://www.reddit.com/r/i3wm/comments/102ex7h/volume_control_doesnt_work/)

* `i3status` Power Management
  * {6} [i3wm and power management](https://www.reddit.com/r/i3wm/comments/2yniv1/i3wm_and_power_management/)
  * {7} [How To Shutdown Linux Using Command Line](https://www.cyberciti.biz/faq/howto-shutdown-linux/)
  * {8} [Reboot Linux System Command](https://www.cyberciti.biz/faq/howto-reboot-linux/)
  * {9} [How to hibernate / real suspend for laptops? No battery use](https://www.antixforum.com/forums/topic/how-to-hibernate-real-suspend-for-laptops-no-battery-use/)
  * {10} [Introduction to Power Management Utilities](https://www.linuxfromscratch.org/blfs/view/11.3/general/pm-utils.html)
  * {11} [How to force user logout in Linux](https://www.simplified.guide/linux/user-force-logout)
  * {12} [How do you shutdown from i3?](https://www.reddit.com/r/i3wm/comments/7ak40z/how_do_you_shutdown_from_i3/)
  * {13} [dotfiles-i3/bin/i3-exit](https://github.com/rynnon/dotfiles-i3/blob/r-gerritpc/bin/i3-exit) <sup>{12}</sup>
  * {14} [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)

# Configuration

## Power Management

**Systemctl power management<sup>{59}</sup>**

* `systemctl suspend` : Suspend/Sleep PC
* `systemctl hibernate` : Hibernate PC
* `systemctl reboot` : Reboot/Restart PC
* `systemctl poweroff` : Poweroff/Shutdown PC

**dbus-send power management**

* Use "dbus-send" to poweroff, restart, suspend, hibernate PC. <sup>{12} {13}</sup>

**Use i3 mode to shutdown, logout, etc. <sup>{62}</sup>**

```shell
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

# Config-i3wm.md

# References

* next-sl: {63}

## Configuration From

* Power Management
  * {59} [Systemctl power management](https://github.com/Justus0405/i3wm-dotfiles/blob/main/src/config/rofi/powermenu)
  * {62} [Unable to use i3 mode to shutdown, logout, etc.](https://www.reddit.com/r/i3wm/comments/12beaao/unable_to_use_i3_mode_to_shutdown_logout_etc/)

* Multimedia/Volume Keys
  * {60} [Multimedia Keys in i3](https://bbs.archlinux.org/viewtopic.php?id=221642)

## Guides

* Sound Volume
  * {61} [volume control doesn't work](https://www.reddit.com/r/i3wm/comments/102ex7h/volume_control_doesnt_work/)

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

# Configuration

## Important

* The config file requires a `bar section` for each bar you want to define. <sup>{11}</sup>

* (Must) Each module also has its own `module section` and can be added to `modules-left`, `modules-center` or `modules-right` in the bar section to have it display on that bar. <sup>{11}</sup>

* Only a single instance of this (`tray`) module can be active at the same time (across all polybar instances in the same graphical session). <sup>{12}</sup>

## Integrate with `i3-wm`

* [Launching the bar in your wm's bootstrap routine](https://github.com/polybar/polybar/wiki#launching-the-bar-in-your-wms-bootstrap-routine)

* Create an executable file containing the startup logic, for example `$HOME/.config/polybar/launch.sh`:
```shell
#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
```

* Make sure you use the name(s) of the bar(s) from your config.

* Make it executable: `$ chmod +x $HOME/.config/polybar/launch.sh`

* If you are using `bspwm`, add the following line to `bspwmrc`: `$HOME/.config/polybar/launch.sh`

* If you are using `i3`, add the following lines to your configuration: `exec_always --no-startup-id $HOME/.config/polybar/launch.sh`

* and remove these
```shell
bar {
    i3bar_command i3bar
}
```

* The first line executes the startup script; the second disables i3's default bar

## System Tray

**Codes from <sup>{12}</sup>**

* Attention

  * Only a single instance of this module can be active at the same time (across all polybar instances in the same graphical session).
  
  * The way the [system tray protocol](https://specifications.freedesktop.org/systemtray-spec/systemtray-spec-latest.html) works, at most one tray can exist at any time. Polybar will produce a warning if additional tray instances are created. This also applies when another tray application (e.g. `stalonetray`) is active.

* Try with `vlc` media player. Vlc creates system tray

* System Tray Config
```shell
modules-right = systray

; This module is not active by default (to enable it, add it to one of the
; modules-* list above).
; Please note that only a single tray can exist at any time. If you launch
; multiple bars with this module, only a single one will show it, the others
; will produce a warning. Which bar gets the module is timing dependent and can
; be quite random.
; For more information, see the documentation page for this module:
; https://polybar.readthedocs.io/en/stable/user/modules/tray.html

[module/systray]
type = internal/tray

format-margin = 8pt
tray-spacing = 16pt
```

# Config-Polybar.md

# References

## Commands From

* {11} [Where to start](https://github.com/polybar/polybar/wiki#where-to-start)
* {12} [Tray Module](https://polybar.readthedocs.io/en/stable/user/modules/tray.html)

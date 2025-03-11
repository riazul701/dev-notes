# Configuration

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

# Config-Polybar.md

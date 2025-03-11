# Configuration

## 5.16. Volume

```shell
order += "volume master"

volume master {
        format = "♪: %volume"
        format_muted = "♪: muted (%volume)"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
}
```

# i3status.md

## PATH

* By default, i3status looks for configuration files in the following order:
  1. `~/.config/i3status/config` (or `$XDG_CONFIG_HOME/i3status/config` if set)
  2. `/etc/xdg/i3status/config` (or `$XDG_CONFIG_DIRS/i3status/config` if set)
  3. `~/.i3status.conf`
  4. `/etc/i3status.conf`

# References

* next-sl: {2}

## Websites

* {1} [i3status(1)](https://i3wm.org/docs/i3status.html)

# Commands/Usage

* `jgmenu_run` : Shows application menu <sup>{1}</sup>

# Config

## Integrate Jgmenu with i3WM <sup>{3}</sup>

* In i3 it would probably seem most natural to bind a key-combination to jgmenu. For example, like this: `bindsym $mod+z exec jgmenu_run`

* i3 provides no way to access the root window, a right-click can be bound on the status bar like this.
```
bar {
        bindsym button3 exec --no-startup-id jgmenu_run
}
```

# Jgmenu.md

# References

* next-sl: {}

## Websites

* {1} [jgmenu.github.io](https://jgmenu.github.io/)
* {2} [jgmenu/jgmenu GitHub](https://github.com/jgmenu/jgmenu)

## Config From

* {3} [Integrate Jgmenu with i3WM](https://jgmenu.github.io/integration.html#i3)

## YouTube Tutorials

* {4} [Jgmenu: Build The Perfect X11 Menu In Style BY Brodie Robertson](https://www.youtube.com/watch?v=O67CJ8WeGlg)

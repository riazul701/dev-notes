# Commands

* No conky.conf is created automatically. To create the default one, run: <sup>{4}</sup>
```shell
mkdir -p ~/.config/conky
conky -C > ~/.config/conky/conky.conf
```

# Usage

* You can move this (`conky`) window around and resize it by `right-clicking` or `left-clicking` on the window while holding down the `Alt` key. <sup>{4}</sup>
  * This can be accomplished by running Conky with the '-o' parameter, or by adding the following to your conky config file: `own_window = true` <sup>{4}</sup>

# Config

## Integrate with i3WM

**i3WM config file**

* Append this code at i3WM config file `~/.config/i3/config` : `exec_always --no-startup-id conky` 
  * Get this code from Polybar i3WM integration

* [https://bbs.archlinux.org/viewtopic.php?id=220278](Flicker issues with conky and i3 window manager)
  * `exec_always --no-startup-id conky ~/.config/conky.conf`

**Conky config file**

* You can try enabling double-buffer. Conky's double-buffer option uses the X double-buffer extension to provide a flicker-free Conky. This can be done by adding `double_buffer = true` to your conky config file.
  * If problem persists, restart PC.

* Drawing the the root window instead of drawing to it's own window : `own_window = false` <sup>{4}</sup>

# Conky.md

* next-sl: {}

## Websites

* {1} [brndnmtthws/conky](https://github.com/brndnmtthws/conky)
* {2} [Conky Site](https://conky.cc/)
* {3} [Conky Theme](https://www.gnome-look.org/browse?cat=124&ord=latest)

* Conky Configs
  * [Conky Configs](https://github.com/brndnmtthws/conky/wiki/Configs)

## Commands From

* {4} [Conky Git Wiki](https://github.com/brndnmtthws/conky/wiki)

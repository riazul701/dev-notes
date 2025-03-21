# Fonts

* [Polybar Fonts](https://github.com/polybar/polybar/wiki/Fonts) <sup>{1}</sup>

## Notes <sup>{1}</sup>

* Copy font "glyphs"/"icon", do not copy font code (Font-Awesome)

## Icon Fonts <sup>{1}</sup>

* Icons can be provided in the form of text characters. Popular icon fonts include:
  * [FontAwesome](https://fontawesome.com/)
  * [Material icons](https://material.io/icons/)
  * [IcoMoon](https://icomoon.io/app/#/select/library)
  * [Nerd Patched Fonts](https://github.com/ryanoasis/nerd-fonts)

* Some issues around rendering issues with Nerd Fonts are described [here](https://polybar.readthedocs.io/user/fonts/nerd-fonts.html).
  * The monospaced variants of the different Nerd Fonts (all characters have the same width) don't have this issue. However, then you often have the problem that the icons are too small and that their size cannot be set independently of the text.

## Font Commands <sup>{1}</sup>

* `sudo apt install fonts-font-awesome` : Install Font Awesome for Polybar <sup>{2}</sup>

* `fc-list` : List all fonts and their names installed on your system.
  * For example one line in the output could look like this: `/usr/share/fonts/noto/NotoSansMono-Regular.ttf: Noto Sans Mono:style=Regular`
  * If we wanted to add that font to polybar we would need to set: `font-0 = Noto Sans Mono:style=Regular`
  * You need to make sure that you copy the exact name (everything after the file path) otherwise polybar may not be able to match it.

* `fc-list | grep -i awesome` : Note: For some fonts you may need to provide multiple font names, for example the output of this command gives three FontAwesome5 fonts:
```shell
/usr/share/fonts/TTF/fa-brands-400.ttf: Font Awesome 5 Brands,Font Awesome 5 Brands Regular:style=Regular
/usr/share/fonts/TTF/fa-solid-900.ttf: Font Awesome 5 Free,Font Awesome 5 Free Solid:style=Solid
/usr/share/fonts/TTF/fa-regular-400.ttf: Font Awesome 5 Free,Font Awesome 5 Free Regular:style=Regular
```
  * You will likely need all of them.

* `fc-match myfont:weight=bold:size=14` : Test your pattern using `fc-match`, for example
  * If `fc-match` doesn't properly match the name, then polybar won't either, so it's often more convenient to check your font names with `fc-match` first.

## Config Font <sup>{1}</sup>

* NOTE: The `-font` property is a 1-based index of available fonts (which means that `*-font = 1` will use font-0).
```shell
[bar/example]
; font-N = <fontconfig pattern>;<vertical offset>
font-0 = "Tamsyn:pixelsize=12;0"
font-1 = "Roboto:size=11:weight=bold;2"
font-2 = "Noto Sans:size=11;1"

[module/example]
label-active = %token%

; This tells the bar to use Roboto when rendering the label
label-active-font = 2

; Using raw formatting tags, you can mix fonts.
; %{T3} tells the bar to use Noto Sans and %{T-} resets it to default.
label-inactive = %{T3}Inactive%{T-} %time%
```

# Configuration

## Important

* The config file requires a `bar section` for each bar you want to define. <sup>{3}</sup>

* (Must) Each module also has its own `module section` and can be added to `modules-left`, `modules-center` or `modules-right` in the bar section to have it display on that bar. <sup>{3}</sup>

* In "network" module, `label-connected` shows properties of connected network (wired ethernet / wireless wifi : anyone) <sup>{5}</sup>

* Only a single instance of this (`tray`) module can be active at the same time (across all polybar instances in the same graphical session). <sup>{4}</sup>

## Integrate with `i3-wm` <sup>{5}</sup>

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

**Codes from <sup>{4}</sup>**

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

* next-sl: {6}

## Font From

* {1} [Polybar Fonts](https://github.com/polybar/polybar/wiki/Fonts)
* {2} [Font Awesome](http://fontawesome.io) || [fontawesome.com](https://fontawesome.com/)

## Configuration From

* {5} [Polybar GitHub Wiki](https://github.com/polybar/polybar/wiki)
* {3} [Where to start](https://github.com/polybar/polybar/wiki#where-to-start)
* {4} [Tray Module](https://polybar.readthedocs.io/en/stable/user/modules/tray.html)

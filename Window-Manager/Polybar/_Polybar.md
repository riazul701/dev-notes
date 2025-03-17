# Commands/Usage

## Important

* The config file requires a `bar section` for each bar you want to define. <sup>{11}</sup>

* (Must) Each module also has its own `module section` and can be added to `modules-left`, `modules-center` or `modules-right` in the bar section to have it display on that bar. <sup>{11}</sup>

* Only a single instance of this (`tray`) module can be active at the same time (across all polybar instances in the same graphical session). <sup>{12}</sup>

## Commands

* Stop/Kill polybar: `sudo killall polybar` <sup>{9}</sup>
* List all installed fonts: `fc-list` <sup>{8}</sup>
* Check "awesome" font is installed: `fc-list | grep -i awesome` <sup>{8}</sup>

# Polybar.md

## Notes

* Check polybar log in `/tmp/polybar1.log` file, which defined in `$HOME/.config/polybar/launch.sh` script

## PATH

* Polybar user-level config file path : `~/.config/polybar/config.ini` <sup>{5}</sup>

* [Where to start](https://github.com/polybar/polybar/wiki#where-to-start) <sup>{5}</sup>
  * To get started with your own customization, you need to create a configuration file in `~/.config/polybar/config.ini`.
  * You can copy the default config from `/etc/polybar/config.ini` or start from scratch.

* [How to get sample config #348](https://github.com/polybar/polybar/issues/348) <sup>{6}</sup>
  * Polybar has a decent stock config file and it is in directory `/usr/share/doc/polybar/config`
    * `/usr/share/doc/polybar/examples/config.ini`
  * `mkdir -p ~/.config/polybar` : Create config directory
  * `cp /usr/share/doc/polybar/config ~/.config/polybar/config` : Copy example config to $HOME directory

# Fonts

* {8} [Polybar Fonts](https://github.com/polybar/polybar/wiki/Fonts)

## Font-Awesome

* [fontawesome.com](https://fontawesome.com/)

* `apt show fonts-font-awesome`

# References

* next-sl: {13}

## Websites

* {1} [Polybar GitHub](https://github.com/polybar/polybar)
* {2} [polybar-scripts :: This is a community project. We write and collect scripts for polybar!](https://github.com/polybar/polybar-scripts)
* {3} [Awesome-Polybar :: Curated list of Polybar](https://github.com/TiagoDanin/Awesome-Polybar)
* {4} [adi1090x/polybar-themes GitHub](https://github.com/adi1090x/polybar-themes)

## Tutorials

* {10} [Polybar Wiki](https://github.com/polybar/polybar/wiki)

## Commands From

* {11} [Where to start](https://github.com/polybar/polybar/wiki#where-to-start)
* {12} [Tray Module](https://polybar.readthedocs.io/en/stable/user/modules/tray.html)

## Guides

* Polybar Configuration
  * {5} [Where to start](https://github.com/polybar/polybar/wiki#where-to-start)
  * {6} [How to get sample config #348](https://github.com/polybar/polybar/issues/348)
  * {7} [Polybar: "Undefined bar"](https://www.reddit.com/r/i3wm/comments/cs86fy/polybar_undefined_bar/)
  * {8} [Polybar Fonts](https://github.com/polybar/polybar/wiki/Fonts)

* YouTube Tutorial
  * {9} [How to Install and Customize Polybar- Ultimate Polybar Beginner's Guide](https://www.youtube.com/watch?v=tOBDUBEMAKM)
  
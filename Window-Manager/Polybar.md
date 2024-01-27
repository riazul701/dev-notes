# Polybar.md

## Websites
* [Polybar GitHub](https://github.com/polybar/polybar)
* [polybar-scripts :: This is a community project. We write and collect scripts for polybar!](https://github.com/polybar/polybar-scripts)
* [Awesome-Polybar :: Curated list of Polybar](https://github.com/TiagoDanin/Awesome-Polybar)
* [adi1090x/polybar-themes GitHub](https://github.com/adi1090x/polybar-themes)

## Commands (Polybar)
* Stop/Kill polybar: `sudo killall polybar` <sup>{101}</sup>
* List all installed fonts: `fc-list` <sup>{54}</sup>
* Check "awesome" font is installed: `fc-list | grep -i awesome` <sup>{54}</sup>

# Configuration

## Integrate with i3-wm
* [How to get sample config #348](https://github.com/polybar/polybar/issues/348)
  * Polybar has a decent stock config file and it is in directory "/usr/share/doc/polybar/config"
  * Create config directory: `mkdir -p ~/.config/polybar`
  * Copy example config to $HOME directory: `cp /usr/share/doc/polybar/config ~/.config/polybar/config`
* [Where to start](https://github.com/polybar/polybar/wiki)
* [Polybar: "Undefined bar"](https://www.reddit.com/r/i3wm/comments/cs86fy/polybar_undefined_bar/)
  * Create file "$HOME/.config/polybar/launch.sh" and copy contents from [Launching the bar in your wm's bootstrap routine](https://github.com/polybar/polybar/wiki#launching-the-bar-in-your-wms-bootstrap-routine)
    * Uncomment line `# killall -q polybar`
    * Comment line `polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown`
    * Make it executable: `chmod +x $HOME/.config/polybar/launch.sh`
  * Open polybar config: "~/.config/polybar/config"
    * Change text from `[bar/example]` to `[bar/bar1]`
  * Open i3-wm config: "~/.config/i3/config"
    * Add line: `exec_always --no-startup-id $HOME/.config/polybar/launch.sh`
    * Comment/Remove line
    ```shellscript
    bar {
      i3bar_command i3bar
    }
    ```

# References

* Polybar Installation
  * {1}

* Polybar Configuration
  * {51} [Where to start](https://github.com/polybar/polybar/wiki)
  * {52} [How to get sample config #348](https://github.com/polybar/polybar/issues/348)
  * {53} [Polybar: "Undefined bar"](https://www.reddit.com/r/i3wm/comments/cs86fy/polybar_undefined_bar/)
  * {54} [Polybar Fonts](https://github.com/polybar/polybar/wiki/Fonts)

* YouTube Tutorial
  * {101} [How to Install and Customize Polybar- Ultimate Polybar Beginner's Guide](https://www.youtube.com/watch?v=tOBDUBEMAKM)
  
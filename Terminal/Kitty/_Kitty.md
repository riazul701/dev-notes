# Kitty.md

## Notes

* Kitty terminal only supports Linux-OS.

## PATH

* Priority based config file path:
  * Priority-1: Environment variable `KITTY_CONFIG_DIRECTORY`
  * Priority-2: `$XDG_CONFIG_HOME/kitty/kitty.conf`
  * Priority-3: `~/.config/kitty/kitty.conf`
  * Priority-4: `$XDG_CONFIG_DIRS/kitty/kitty.conf` 

* Get information from `kitty --help` command

  > If this option (`kitty --config {{config-file-path}}`) is not specified, config files are searched for in the
  > order: $XDG_CONFIG_HOME/kitty/kitty.conf, ~/.config/kitty/kitty.conf,
  > $XDG_CONFIG_DIRS/kitty/kitty.conf. The first one that exists is used as
  > the config file.
  >
  > If the environment variable KITTY_CONFIG_DIRECTORY is specified, that
  > directory is always used and the above searching does not happen.
  > 
  > If /etc/xdg/kitty/kitty.conf exists, it is merged before (i.e. with
  > lower priority) than any user config files. It can be used to specify
  > system-wide defaults for all users. You can use either - or /dev/stdin
  > to read the config from STDIN.

# References

## Websites

* [sw.kovidgoyal.net/kitty](https://sw.kovidgoyal.net/kitty/)
* [kovidgoyal/kitty GitHub](https://github.com/kovidgoyal/kitty)
* [kovidgoyal/kitty-themes GitHub => Themes for the kitty terminal](https://github.com/kovidgoyal/kitty-themes)

## YouTube Tutorials

* [Kitty Is A Fast And Feature Rich Terminal Emulator BY DistroTube](https://www.youtube.com/watch?v=TTzP2zYJn2k)


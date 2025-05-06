# Commands/Usage

## `dunstify` command

* `dunstify --help` : Shows dunstify help

* `dunstify --appname={{NAME}} "{{Message}}"` : Set the app name of the notification.

* `dunstify --urgency={{low|normal|critical}} "{{Message}}"` : Set the app name of the notification.

* `dunstify --timeout={{TIMEOUT}}` : The time in milliseconds until the notification expires. 1 second = 1000 milliseconds

* `dunstify --serverinfo` : Print server information and exit.

* `dunstify "Progress: " -h int:value:60` : To test if you can see a progress bar, use this command <sup>{1}</sup>

## `notify-send` command

* `apt show libnotify4` <sup>{10} {11}</sup>

* `notify-send "{{title}}" "{{message}}"` : Send notification to `dunst` notification server/daemon <sup>{10}</sup>

* `notify-send -h int:value:42 "Working ..."` : Shows notification with progress bar <sup>{1}</sup>

# Dunst.md

## PATH

* Dunst user-level config file path : `~/.config/dunst/dunstrc` <sup>{16}</sup>
* Dunst global config file path : `/etc/xdg/dunst/dunstrc` <sup>{15}</sup>

# References

* next-sl: {18}

## Websites

* {2} [dunst-project.org](https://dunst-project.org/)
* {3} [dunst-project/dunst GitHub](https://github.com/dunst-project/dunst)
* {4} [dunstify =>A notification tool that is an extension of notify-send, but has more features based around dunst](https://linuxcommandlibrary.com/man/dunstify)

* Dunst Configs
  * {13} [dunst-project/dunst/dunstrc => Dunst GitHub Config](https://github.com/dunst-project/dunst/blob/master/dunstrc)
  * {5} [dunst-project/dunst/contrib/progress-notify.sh => Brightness/Volume progress bar](https://github.com/dunst-project/dunst/blob/master/contrib/progress-notify.sh) <sup>{1}</sup>
  * {6} [Dunst Showcase](https://dunst-project.org/showcase/) <sup>{1}</sup>
    * {7} [Post your riced dunst configs #826](https://github.com/dunst-project/dunst/issues/826) <sup>{1}</sup>
  }
  * {8} [addy-dclxvi/i3-starterpack GitHub => .config/dunst/dunstrc](https://github.com/addy-dclxvi/i3-starterpack/blob/master/.config/dunst/dunstrc)
  * {9} [cizordj/i3-themer GitHub => defaults/dunstrc](https://github.com/cizordj/i3-themer/blob/master/defaults/dunstrc)

## Commands From

* {1} [Dunst Documentation](https://dunst-project.org/documentation/)

## Tutorials

* {15} [dunst - A customizable and lightweight notification-daemon](https://manpages.debian.org/testing/dunst/dunst.1.en.html)
* {16} [Dunst => ArchLinux Wiki](https://wiki.archlinux.org/title/Dunst)
* {17} [Desktop notifications => ArchLinux Wiki](https://wiki.archlinux.org/title/Desktop_notifications)

## Guides

* `notify-send`
  * {11} [Trying To Install Libnotify [closed]](https://askubuntu.com/questions/932747/trying-to-install-libnotify)

## YouTube Tutorials

* [Dunst Adds Desktop Notifications To Your Window Manager BY DistroTube](https://www.youtube.com/watch?v=uf4YcYTnfNE)
* {10} [How To Receive Desktop Notifications With A Window Manager BY Brodie Robertson](https://www.youtube.com/watch?v=NPhELbgYwV8)
* {14} [Dunst: How To Make Your Notifications Actually Look Good BY Brodie Robertson](https://www.youtube.com/watch?v=-Ky9YgvUa40)
* {12} [How to Set Up and Configure Notifications on Arch Linux (with dunst) BY Eric Murphy](https://www.youtube.com/watch?v=XWlbaERuDP4)

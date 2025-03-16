# Commands/Usage

## `dunstify` command

* `dunstify --help` : Shows dunstify help

* `dunstify --appname={{NAME}} "{{Message}}"` : Set the app name of the notification.

* `dunstify --urgency={{low|normal|critical}} "{{Message}}"` : Set the app name of the notification.

* `dunstify --timeout={{TIMEOUT}}` : The time in milliseconds until the notification expires. 1 second = 1000 milliseconds

* `dunstify --serverinfo` : Print server information and exit.

* `dunstify "Progress: " -h int:value:60` : To test if you can see a progress bar, use this command <sup>{1}</sup>

## `notify-send` command

* `notify-send -h int:value:42 "Working ..."` : Shows notification with progress bar <sup>{1}</sup>

# Dunst.md

## Websites

* [dunst-project.org](https://dunst-project.org/)
* [dunst-project/dunst GitHub](https://github.com/dunst-project/dunst)
* [dunstify =>A notification tool that is an extension of notify-send, but has more features based around dunst](https://linuxcommandlibrary.com/man/dunstify)

* Dunst Configs
  * [dunst-project/dunst/contrib/progress-notify.sh => Brightness/Volume progress bar](https://github.com/dunst-project/dunst/blob/master/contrib/progress-notify.sh) <sup>{1}</sup>
  * [Dunst Showcase](https://dunst-project.org/showcase/) <sup>{1}</sup>
    * [Post your riced dunst configs #826](https://github.com/dunst-project/dunst/issues/826) <sup>{1}</sup>
  }
  * [addy-dclxvi/i3-starterpack GitHub => .config/dunst/dunstrc](https://github.com/addy-dclxvi/i3-starterpack/blob/master/.config/dunst/dunstrc)
  * [cizordj/i3-themer GitHub => defaults/dunstrc](https://github.com/cizordj/i3-themer/blob/master/defaults/dunstrc)

# References

* next-sl: {2}

## Commands From

* {1} [Dunst Documentation](https://dunst-project.org/documentation/)

## YouTube Tutorials

* [How to Set Up and Configure Notifications on Arch Linux (with dunst) BY Eric Murphy](https://www.youtube.com/watch?v=XWlbaERuDP4)

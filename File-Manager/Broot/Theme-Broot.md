# Theme-Broot.md

## Websites

## Built-in Theme List

* Check theme/skin list in `~/config/broot/skins` directory
  * catppuccin-macchiato.hjson
  * catppuccin-mocha.hjson
  * dark-blue.hjson
  * dark-gruvbox.hjson
  * dark-orange.hjson
  * native-16.hjson
  * solarized-dark.hjson
  * solarized-light.hjson
  * white.hjson

## Choose Icon Theme

* Config File Location: `~/.config/broot/conf.json`

```hjson
###############################################################
# Icons
# If you want to display icons in broot, uncomment this line
# (see https://dystroy.org/broot/icons for installation and
# troubleshooting)
#
# icon_theme: vscode
```

## Choose Skin Theme

* File Location: `~/.config/broot/conf.json`

```shell
###############################################################
# Imports
#
# While it's possible to have all configuration in one file,
# it's more convenient to split it in several ones.
# Importing also allows to set a condition on the terminal's
# color, which makes it possible to have a different skin
# chosen when your terminal has a light background and when
# it has a light one.
imports: [

    # Verbs are better configured in verbs.hjson. But you
    # can also add another files for your personal verbs
    verbs.hjson

    # This file contains the skin to use when the terminal
    # is dark (or when this couldn't be determined)
    {
        luma: [
            dark
            unknown
        ]
        # (un)comment to choose your preferred skin
        file: skins/dark-blue.hjson
        //file: skins/catppuccin-macchiato.hjson
        //file: skins/catppuccin-mocha.hjson
        //file: skins/dark-gruvbox.hjson
        //file: skins/dark-orange.hjson
        //file: skins/solarized-dark.hjson
    }

    # This skin is imported when your terminal is light
    {
        luma: light
        # (un)comment to choose your preferred skin
        //file: skins/solarized-light.hjson
        file: skins/white.hjson
    }
]
```

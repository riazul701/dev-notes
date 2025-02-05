# Commands

## [kovidgoyal/kitty-themes GitHub](https://github.com/kovidgoyal/kitty-themes) <sup>{1}</sup>

* `kitty +kitten themes` : Show all Kitty terminal themes.
* `kitten themes --reload-in=all {{theme-name}}` : Change Kitty theme. Get "theme-name" from `kitty +kitten themes` command
  * `kitten themes --reload-in=all Tokyo Night` : Activate "Tokyo Night" theme
  * `kitten themes --reload-in=all Dracula` : Activate "Dracula" theme
  * `kitten themes --reload-in=all Catppuccin-Mocha` : Activate "Catppuccin-Mocha" theme
  * `kitten themes --reload-in=all Catppuccin-Macchiato` : Activate "Catppuccin-Macchiato" theme
  * `kitten themes --reload-in=all Catppuccin-Frappe` : Activate "Catppuccin-Frappe" theme
  * `kitten themes --reload-in=all Catppuccin-Latte` : Activate "Catppuccin-Latte" theme

# Theme-Kitty.md

## Websites

* [kovidgoyal/kitty-themes GitHub => Themes for the kitty terminal](https://github.com/kovidgoyal/kitty-themes) <sup>{1}</sup>
* [Changing kitty colors](https://sw.kovidgoyal.net/kitty/kittens/themes/) <sup>{2}</sup>
* [catppuccin/kitty GitHub](https://github.com/catppuccin/kitty) <sup>{3}</sup>

# [catppuccin/kitty GitHub](https://github.com/catppuccin/kitty) <sup>{3}</sup>

## Commands

* `kitty +kitten themes --reload-in=all Catppuccin-Mocha` : Activate "Catppuccin-Mocha" theme
* `kitty +kitten themes --reload-in=all Catppuccin-Macchiato` : Activate "Catppuccin-Macchiato" theme
* `kitty +kitten themes --reload-in=all Catppuccin-Frappe` : Activate "Catppuccin-Frappe" theme
* `kitty +kitten themes --reload-in=all Catppuccin-Latte` : Activate "Catppuccin-Latte" theme

## Usage

* Tip: If you're using Kitty `>0.26.0`, all Catppuccin flavors are already included in Kitty! There's no need to install the base theme.

* Copy the contents of your preferred flavor from [themes/](https://github.com/catppuccin/kitty/blob/main/themes) into your [kitty configuration](https://sw.kovidgoyal.net/kitty/conf/) file (usually `~/.config/kitty/kitty.conf`).
* Save and enjoy!

* Alternatively you can copy all flavor configs into your [kitty theme directory](https://sw.kovidgoyal.net/kitty/kittens/themes/#using-your-own-themes) (usually `~/.config/kitty/themes/`), and then use the themes kitten to select your desired flavor:
`kitty +kitten themes --reload-in=all <optional: theme name>`

* `Catppuccin-Latte`, `Catppuccin-Frappe`, `Catppuccin-Macchiato`, `Catppuccin-Mocha` are their respective names.

## FAQ

* Q: "How can I style the tab bar like the screenshots?"
* A: The config settings for the tab bar are the following:
```shell
tab_bar_min_tabs            1
tab_bar_edge                bottom
tab_bar_style               powerline
tab_powerline_style         slanted
tab_title_template          {title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}
```

* Q: "What font is used in the screenshots?"
* A: The font used in the screenshots is [Fira Code](). The following stylistic alternatives and ligatures are set:
`+cv02 +cv05 +cv09 +cv14 +ss04 +cv16 +cv31 +cv25 +cv26 +cv32 +cv28 +ss10 +zero +onum`

* Q: "Which fetch is used in the screenshots?"
* A: It's [pfetch with kitties](https://github.com/andreasgrafen/pfetch-with-kitties) — a slightly modified version of [pfetch](https://github.com/dylanaraps/pfetch) which adds the ASCII Kitty.

# References

* next-sl: {4}

## Websites

* {1} [kovidgoyal/kitty-themes GitHub => Themes for the kitty terminal](https://github.com/kovidgoyal/kitty-themes)
* {2} [Changing kitty colors](https://sw.kovidgoyal.net/kitty/kittens/themes/)
* {3} [catppuccin/kitty GitHub](https://github.com/catppuccin/kitty)

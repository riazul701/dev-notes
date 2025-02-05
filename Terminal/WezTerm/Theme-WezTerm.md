# Theme-WezTerm.md

## Websites

* [catppuccin/wezterm GitHub](https://github.com/catppuccin/wezterm)
* [folke/tokyonight.nvim GitHub](https://github.com/folke/tokyonight.nvim)

## Notes

* Tested on WezTerm terminal
  * Tree themes are very similar: "Tokyo Night", "Catppuccin Mocha" and "Dracula"
  * "Tokyo Night" is darker than "Catppuccin Mocha"
  * "Catppuccin Mocha" is darker than "Dracula"

# General Way

## [Color Scheme](https://wezfurlong.org/wezterm/config/appearance.html#color-scheme)

* WezTerm ships with over 700 color schemes available from iTerm2-Color-Schemes, base16, Gogh and terminal.sexy and a couple of other locations.

* You can select a color scheme with a line like this:
```shell
local wezterm = require 'wezterm'
local config = {}

--config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Catppuccin Mocha'
--config.color_scheme = 'Dracula'
--config.color_scheme = 'Catppuccin Macchiato'
--config.color_scheme = 'Catppuccin Frappe'
--config.color_scheme = 'Catppuccin Latte'

return config
```
* Reload configuration: `SUPER+r` OR `CTRL+SHIFT+R`

# [catppuccin/wezterm GitHub](https://github.com/catppuccin/wezterm)

## Usage

* Catppuccin is now [included in WezTerm](https://wezfurlong.org/wezterm/colorschemes/c/index.html#catppuccin-frappe).
* Edit your `wezterm.lua`.
* Set `color_scheme` to your preferred flavor.
```shell
return {
  -- ...your existing config
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
}
```
* (Optional) To enable syncing with your OS theme, use `wezterm.gui.get_appearance()`
```shell
local wezterm = require "wezterm"

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

return {
  -- ...your existing config
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
```

## FAQ

* Q: "How can I set custom color overrides?"
* A: Use [wezterm.color.get_builtin_schemes()](https://wezfurlong.org/wezterm/config/lua/wezterm.color/get_builtin_schemes.html) like this:
```shell
local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

return {
  color_schemes = {
    ["OLEDppuccin"] = custom,
  },
  color_scheme = "OLEDppuccin",
}
```

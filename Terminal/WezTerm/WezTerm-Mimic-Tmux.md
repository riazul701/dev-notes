# Wezterm-Mimic-Tmux.md

## Websites

* [Make Wezterm Mimic Tmux](https://dev.to/lovelindhoni/make-wezterm-mimic-tmux-5893)
  * [mrjones2014/smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim)
* [How to switch from Tmux to WezTerm](https://www.florianbellmann.com/blog/switch-from-tmux-to-wezterm)
* [My config to replace tmux completely #2329](https://github.com/wez/wezterm/discussions/2329)
* [Session management in Wezterm (without tmux)](https://fredrikaverpil.github.io/blog/2024/10/20/session-management-in-wezterm-without-tmux/)

# [Make Wezterm Mimic Tmux](https://dev.to/lovelindhoni/make-wezterm-mimic-tmux-5893)

* I have been using the Alacritty + Tmux setup for a while, and it's one of those things I would call "that just stuck".

* My setup is so minimal that I could happily live with just a terminal and an emulator. I need to manage a lot of processes, like running an npm server, editing a couple of Neovim buffers, overseeing a Docker image build, etc. This is where Tmux comes in handy, and life has been good ever since.

* A month ago, I came across [WezTerm](https://wezfurlong.org/wezterm/), a new GPU-accelerated, cross-platform terminal emulator written in Rust (and I’m not a Rust fanboy, for real!). It piqued my interest, so I decided to give it a try.

* Wezterm matched my expectations. It's feels fast and looks modern, with support for ligatures, tab + pane support and image rendering out of the box, something I have been sorely missing out in Alacritty.

* In my opinion, the biggest selling point of WezTerm is its full customization through Lua. The documentation is robust for a project of its maturity, and with sensible Lua defaults, the configuration process feels almost zen.

* I’m tired of working with the domain-specific configuration languages of Tmux and Kitty, so I thought, why not make WezTerm mimic Tmux as much as possible?

* So, I sat down for an hour and came up with the configuration below. There are numerous keybindings based on my personal preferences, so feel free to modify them to suit your needs.

## The configuration

* Wezterm's config lives as .wezterm.lua in our home directory.

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- our config overrides goes in here
return config
```

* So let's do some basic config

```lua
config.font_size = 16

config.window_decorations = "RESIZE"

config.window_frame = {
    font_size = 13.0,
}

config.window_padding = {
    top = 10,
    bottom = 10,
    left = 10,
    right = 10,
}

config.term = "xterm-256color"
```

* We changed the font size, window padding, and set the window_decorations as "RESIZE" which disables the title bar but enable the resizable border.

* Setting term as "xterm-256color" allow wezterm to utilize 256 colors for text output

* Also, I would like to launch wezterm in fullscreen mode by default.

```lua
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)
```

* Alright, now the niceties are done, let's make wezterm mimic tmux.

## Leader Key

* We will be setting up a leader key in wezterm, just like we have one in tmux. Our Leader Key here, is CTRL + A. You can use anything you feel comfortable.

```lua
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
```

## Splitting Panes

* We will add keybindings to split panes horizontally and vertically.

```lua
local action = wezterm.action
config.keys = {
    {
        key = "-",
        mods = "LEADER",
        action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },

    {
        key = "\\",
        mods = "LEADER",
        action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
}
```

* Triggering LEADER + \ will split panes horizontally while LEADER + - will split panes vertically.

## Adjusting pane size

* Let's add some keybindings to adjust a pane's size

```lua
config.keys = {
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Down", 5 }),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Up", 5 }),
    },
        {
        key = "m",
        mods = "LEADER",
        action = action.TogglePaneZoomState,
    }
}
```

* I used Vim motions to adjust the size of the focused pane. Pressing CTRL + SHIFT + h|j|k|l will increase the pane's size by 5 units in the corresponding Vim motion direction.

* Additionally, pressing LEADER + m will zoom the pane to take up the full window. Clicking it again will return the pane to its previous state.

## Tab configuration

* We will be using wezterm tabs as an equivalent to tmux windows.

```lua
config.key = {
    {
        key = "c",
        mods = "LEADER",
        action = action.SpawnTab("CurrentPaneDomain"),
    },

    {
        key = "p",
        mods = "LEADER",
        action = action.ActivateTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER",
        action = action.ActivateTabRelative(1),
    }
}
```

* The keybinding LEADER + c will create a new tab, while LEADER + p and LEADER + n will shift the focus to the previous tab and the next tab, respectively.

```lua
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = action.ActivateTab(i - 1),
    })
end
```

* This loop would add keybindings which will allow us to activate a specific tab by its number from 1 to 9. For instance, if I am on the fifth tab and I need to go to the first tab, I can just click LEADER + 1.

## Setup VI Mode

* The VI mode, or copy mode, allows you to copy content in your terminal using Vim keybindings.

```lua
config.key = {
    { key = "[", mods = "LEADER", action = action.ActivateCopyMode },
}
```

* With this configuration, WezTerm will enter VI mode when you trigger LEADER + [. You can now navigate WezTerm like a Vim buffer, selecting and yanking lines using Vim keybindings. Pressing CTRL + C will exit VI mode.

## Navigating between nvim splits and wezterm splits

* Neovim split or a WezTerm split. If it's a Neovim split, the keypress will be passed to it; if it's a normal WezTerm split, WezTerm will take control.

* To make this work, you should install the [smart-splits](https://github.com/mrjones2014/smart-splits.nvim) plugin for neovim, with the this [configuration](https://github.com/lovelindhoni/dotfiles/blob/main/.config/nvim/lua/lovelin/plugins/smart-splits.lua)

```lua
local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(key)
    return {
        key = key,
        mods = "CTRL",
        action = wezterm.action_callback(function(win, pane)
            if pane:Get_users_vars().IS_NVIM == "true" then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = "CTRL" },
                }, pane)
            else
                win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
        end),
    }
end

config.keys = {
    split_nav("h"),
    split_nav("j"),
    split_nav("k"),
    split_nav("l"),
}
```

* Now we can navigate through neovim splits and wezterm panes seamlessly using CTRL + h|j|k|l.

* Here is how the whole configuration should look like

```lua
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

local config = wezterm.config_builder()

config.term = "xterm-256color"

local direction_keys = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}

local function split_nav(key)
    return {
        key = key,
        mods = "CTRL",
        action = wezterm.action_callback(function(win, pane)
            if pane:Get_users_vars().IS_NVIM == "true" then
                -- pass the keys through to vim/nvim
                win:perform_action({
                    SendKey = { key = key, mods = "CTRL" },
                }, pane)
            else
                win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
            end
        end),
    }
end

config.font_size = 16

config.window_decorations = "RESIZE"

config.window_padding = {
    top = 10,
    bottom = 10,
    left = 10,
    right = 10,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

local action = wezterm.action

config.keys = {
    {
        key = "\\",
        mods = "LEADER",
        action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    split_nav("h"),
    split_nav("j"),
    split_nav("k"),
    split_nav("l"),
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Left", 5 }),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Right", 5 }),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Down", 5 }),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = action.AdjustPaneSize({ "Up", 5 }),
    },
    {
        key = "-",
        mods = "LEADER",
        action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "m",
        mods = "LEADER",
        action = action.TogglePaneZoomState,
    },
    { key = "[", mods = "LEADER", action = action.ActivateCopyMode },
    {
        key = "c",
        mods = "LEADER",
        action = action.SpawnTab("CurrentPaneDomain"),
    },

    {
        key = "p",
        mods = "LEADER",
        action = action.ActivateTabRelative(-1),
    },
    {
        key = "n",
        mods = "LEADER",
        action = action.ActivateTabRelative(1),
    },
}

for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        action = action.ActivateTab(i - 1),
    })
end

return config
```

## Conclusion

* WezTerm is cool! I was able to ditch the overhead of Tmux by using WezTerm. While it may not match all of Tmux's capabilities, it works perfectly for my simple use cases. There’s much more to explore in WezTerm’s configuration, which you can find on their official [website](https://wezfurlong.org/wezterm/config/files.html). Here is my [dotfiles](https://github.com/lovelindhoni/dotfiles) in case if you want to peek. See ya!

* Cover Image from [wezfurlong.org/wezterm](https://wezfurlong.org/wezterm/)

# References

## Guides

* [Is there a tmux-like equivalent for windows?](https://www.reddit.com/r/tmux/comments/l580mi/is_there_a_tmuxlike_equivalent_for_windows/)
  * [prabirshrestha/dotfiles/.config/wezterm/wezterm.lua => GitHub](https://github.com/prabirshrestha/dotfiles/blob/main/.config/wezterm/wezterm.lua)

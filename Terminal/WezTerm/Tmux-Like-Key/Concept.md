# Concept-WezTerm.md

# Concept

> ChatGPT Question
> 
> Setup wezterm exactly like tmux

If your goal is to make **WezTerm behave as much like tmux as possible**, it's important to know that they serve different roles:

* **tmux** = terminal multiplexer (persistent sessions, detach/reattach, panes, windows)
* **WezTerm** = terminal emulator with built-in multiplexing

WezTerm can replicate **most of the everyday tmux workflow**, though it cannot perfectly replace tmux's remote session persistence.

***## 1. Use Ctrl+b as the leader key***

```lua
local wezterm = require 'wezterm'

local config = {}

config.leader = {
  key = "b",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}
```

This gives you the familiar `Ctrl+b` prefix.

---

***## 2. tmux-style pane splitting***

```lua
config.keys = {
  {
    key = '"',
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "%",
    mods = "LEADER|SHIFT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
}
```

Just like tmux:

```
Ctrl+b "
Ctrl+b %
```

---

***## 3. Vim/tmux pane navigation***

```lua
{
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Left",
},
{
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Down",
},
{
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Up",
},
{
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection "Right",
},
```

Now:

```
Ctrl+b h
Ctrl+b j
Ctrl+b k
Ctrl+b l
```

---

***## 4. Resize panes***

```lua
{
    key = "H",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Left", 5 },
},
{
    key = "L",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Right", 5 },
},
{
    key = "K",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Up", 5 },
},
{
    key = "J",
    mods = "LEADER|SHIFT",
    action = wezterm.action.AdjustPaneSize { "Down", 5 },
},
```

Equivalent to:

```
Ctrl+b Shift+h
```

etc.

---

***## 5. Close pane***

```lua
{
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane {
        confirm = true,
    },
},
```

Like:

```
Ctrl+b x
```

---

***## 6. New tabs (tmux windows)***

```lua
{
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab "CurrentPaneDomain",
},
```

Equivalent:

```
Ctrl+b c
```

---

***## 7. Switch tabs***

```lua
{
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
},
{
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
},
```

Equivalent:

```
Ctrl+b n
Ctrl+b p
```

---

***## 8. Numbered tabs***

```lua
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i - 1),
  })
end
```

Like:

```
Ctrl+b 1
Ctrl+b 2
...
```

---

***## 9. Rename tab***

```lua
{
    key = ",",
    mods = "LEADER",
    action = wezterm.action.PromptInputLine {
        description = "Rename Tab",
        action = wezterm.action_callback(function(window, pane, line)
            if line then
                window:active_tab():set_title(line)
            end
        end),
    },
},
```

Equivalent:

```
Ctrl+b ,
```

---

***## 10. Rotate panes***

```lua
{
    key = "o",
    mods = "LEADER",
    action = wezterm.action.RotatePanes "Clockwise",
},
```

---

***## 11. Copy mode***

```lua
{
    key = "[",
    mods = "LEADER",
    action = wezterm.action.ActivateCopyMode,
},
```

Equivalent:

```
Ctrl+b [
```

---

***## 12. Mouse off (optional)***

```lua
config.disable_default_mouse_bindings = true
```

Similar to disabling tmux mouse support.

---

***## 13. tmux-like appearance***

```lua
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
```

This gives a more minimal look similar to tmux.

---

***## 14. Scrollback***

```lua
config.scrollback_lines = 100000
```

---

***## 15. Full example***

```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.leader = {
  key = "b",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.scrollback_lines = 100000

config.keys = {
  { key='"', mods="LEADER|SHIFT", action=wezterm.action.SplitVertical{domain="CurrentPaneDomain"} },
  { key="%", mods="LEADER|SHIFT", action=wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"} },

  { key="h", mods="LEADER", action=wezterm.action.ActivatePaneDirection("Left") },
  { key="j", mods="LEADER", action=wezterm.action.ActivatePaneDirection("Down") },
  { key="k", mods="LEADER", action=wezterm.action.ActivatePaneDirection("Up") },
  { key="l", mods="LEADER", action=wezterm.action.ActivatePaneDirection("Right") },

  { key="H", mods="LEADER|SHIFT", action=wezterm.action.AdjustPaneSize{"Left",5} },
  { key="J", mods="LEADER|SHIFT", action=wezterm.action.AdjustPaneSize{"Down",5} },
  { key="K", mods="LEADER|SHIFT", action=wezterm.action.AdjustPaneSize{"Up",5} },
  { key="L", mods="LEADER|SHIFT", action=wezterm.action.AdjustPaneSize{"Right",5} },

  { key="x", mods="LEADER", action=wezterm.action.CloseCurrentPane{confirm=true} },
  { key="c", mods="LEADER", action=wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key="n", mods="LEADER", action=wezterm.action.ActivateTabRelative(1) },
  { key="p", mods="LEADER", action=wezterm.action.ActivateTabRelative(-1) },
  { key="[", mods="LEADER", action=wezterm.action.ActivateCopyMode },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
```

The main feature WezTerm cannot fully match is **tmux's persistent sessions**. If you need to disconnect from a machine and later reattach to the exact same running shell processes (especially over SSH), you'll still want to run tmux on the remote machine. For local development, however, WezTerm's built-in tabs, panes, leader key, copy mode, and workspace support can provide a workflow that's very close to using tmux.


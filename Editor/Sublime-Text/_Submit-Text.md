# Sublime Text Editor

## Notes

## Keyboard Shortcuts
* Anix Operating System  
  * "Ctrl+space" -> Open App Selector
  * Free "Ctrl+spce" keyboard shortcut, because it is used for IDE/Editor auto-completion.
  * Open program "Add Key (Add Key)"
  * Remove Item/Line: "Ctrl+space"
  * Add Item/Line: First Key: "Control"; Second Key: "Super" (Windows-Key); Third Key: "space"; Command: "app-select"
  * Restart PC

## Guides

# VIM

## Vintage - VIM Mode

* [Vintage Mode](https://www.sublimetext.com/docs/vintage.html)

* Vintage mode in Sublime Text is a built-in package that provides vi/vim-style command mode editing.

## NeoVintageous

* [NeoVintageous => Vim Emulator for Sublime Text](https://neovintageous.github.io/)
* [NeoVintageous/NeoVintageous GitHub](https://github.com/NeoVintageous/NeoVintageous)
* [SublimeText/Origami GitHub => Some window commands, such as `CTRL-w s`, `CTRL-w v`, `CTRL-w ]`, require it](https://github.com/SublimeText/Origami)

# LunarVim Like Keybindings

## ChatGPT: "lunarvim like keybindings in sublime text"

* You want to get LunarVim-like keybindings in Sublime Text — essentially the modal, leader-key-driven, which-key-style experience from LunarVim inside Sublime.

* Here’s what you can do:

**1. Modal Editing in Sublime Text**

* By default, Sublime Text isn’t modal like Vim/LunarVim, but you can add Vim emulation:

* [Vintageous](https://github.com/guillermooo/Vintageous)
  * Adds Vim-style modal editing to Sublime Text.
    * Supports Normal, Insert, Visual modes
    * Keybindings like `d w`, `y y`, etc.
  * Enable Vintageous after installing via Package Control:
    * `Preferences → Package Settings → Vintageous → Settings`
    * Enable Vintageous and disable Vintage (the built-in Vim emulation)

**2. Leader Key and Which-key Popup**

* LunarVim uses a leader key (usually Space) to open menus showing available keybindings.

* Sublime doesn’t have a native which-key plugin, but you can approximate:

* Leader key mapping:
  * Sublime supports multi-key bindings via its `.sublime-keymap` files. For example:
```json
[
  { "keys": ["space", "f"], "command": "show_overlay", "args": {"overlay": "goto", "text": ""} },
  { "keys": ["space", "b"], "command": "switch_to_file" }
]
```
  * No dynamic which-key popup, but you can use these to simulate leader sequences.

**3. Keybinding Helpers**

* [KeybindingsHelper](https://packagecontrol.io/packages/KeybindingsHelper)
  * Shows available keybindings in a popup. Not exactly which-key, but helps discoverability.

* [BoundKeys](https://packagecontrol.io/packages/BoundKeys)
  * Lets you search and view keybindings.

**4. Example: Basic leader-key setup**

* Add a `Default (YourOS).sublime-keymap` file in your User folder with something like:
```json
[
  {
    "keys": ["space", "w"],
    "command": "save"
  },
  {
    "keys": ["space", "q"],
    "command": "close_window"
  },
  {
    "keys": ["space", "f"],
    "command": "show_overlay",
    "args": {"overlay": "goto", "text": ""}
  }
]
```
  * This makes `space` your leader key for commands like save, quit, file open.

**5. Summary**

| Feature               | Status in Sublime             | How to get it                      |
| --------------------- | ----------------------------- | ---------------------------------- |
| Modal editing         | No (by default)               | Vintageous plugin                  |
| Leader key support    | Partial (multi-key bindings)  | Custom sublime-keymap              |
| Which-key popup       | No (static keymap tools only) | KeybindingsHelper (static popup)   |
| Full LunarVim mimicry | No                            | Partial (modal + leader key combo) |

* If you want, I can help you write a full keybinding config or suggest specific Vintageous commands to get closer to LunarVim’s feel!

# References

## Websites

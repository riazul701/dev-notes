# LunarVim-Like-Keybind.md

# Concept

> ChatGPT Question: 
> 
> neovim's which-key like feature in sublime-text

Sublime Text doesn't have a built-in equivalent to Neovim's WhichKey popup (the menu that appears after pressing a leader key and shows available keybindings). However, there are a few ways to get similar functionality:

***### Option 1: Use key chords + Command Palette (closest built-in approach)***

Sublime supports multi-key sequences/chords such as:

```json
{
    "keys": ["ctrl+k", "ctrl+c"],
    "command": "toggle_comment"
}
```

or your own custom leader-like mappings:

```json
{
    "keys": ["ctrl+space", "f"],
    "command": "prompt_open_file"
}
```

Sublime natively supports these key sequences, but it does **not** show a popup of available continuations after the first key is pressed. ([docs.sublimetext.io][1])

---

***### Option 2: Vintage/Vintageous (for Vim users)***

If you're using Vim emulation:

* Built-in `Vintage`
* Community plugin `Vintageous`

you can define leader-key mappings similar to Vim/Neovim.

However, they still don't provide a true WhichKey-style popup menu by default.

---

***### Option 3: Custom plugin (closest actual WhichKey experience)***

Sublime's Python API allows plugins to:

1. Capture a prefix key (e.g. `Space`).
2. Show a quick panel (`window.show_quick_panel()`).
3. Display available key groups such as:

```text
f → Files
g → Git
b → Buffers
p → Projects
```

4. Execute the chosen command.

This is how most people emulate WhichKey in Sublime.

A minimal workflow could be:

```text
Space
 ├─ f → Open File
 ├─ g → Git Actions
 ├─ b → Switch Buffer
 └─ p → Project Commands
```

using Sublime's Quick Panel as the popup UI.

---

***### Option 4: Consider a Vim-oriented editor***

If WhichKey is a major part of your workflow, editors such as:

* Neovim
* Visual Studio Code (with VSCodeVim + WhichKey extensions)
* Helix

have much stronger support for discoverable keybinding systems.

---

If you're using Sublime Text 4, I can show you a small plugin (~50 lines) that creates a real leader-key popup similar to WhichKey using the Quick Panel.

[1]: https://docs.sublimetext.io/reference/key_bindings.html?utm_source=chatgpt.com "Key Bindings | Sublime Text Community Documentation"

====================================================================================

> ChatGPT Question: 
> 
> can show you a small plugin (~50 lines) that creates a real leader-key popup similar to WhichKey using the Quick Panel

Here's a minimal Sublime Text plugin that gives you a WhichKey-like popup using the Quick Panel.

***### 1. Create the plugin***

Open **Tools → Developer → New Plugin...** and replace the contents with:

```python
import sublime
import sublime_plugin


LEADER_MAP = {
    "f": ("Open File", "prompt_open_file"),
    "p": ("Command Palette", "show_overlay"),
    "b": ("Switch Buffer", "switch_file"),
    "n": ("New File", "new_file"),
}


class WhichKeyCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.keys = list(LEADER_MAP.keys())

        items = [
            [k, LEADER_MAP[k][0]]
            for k in self.keys
        ]

        self.window.show_quick_panel(
            items,
            self.on_done
        )

    def on_done(self, index):
        if index == -1:
            return

        key = self.keys[index]
        _, command = LEADER_MAP[key]

        if command == "show_overlay":
            self.window.run_command(
                command,
                {"overlay": "command_palette"}
            )
        else:
            self.window.run_command(command)
```

Save it as:

```text
Packages/User/which_key.py
```

---

***### 2. Bind a leader key***

Open **Preferences → Key Bindings** and add:

```json
[
    {
        "keys": ["ctrl+space"],
        "command": "which_key"
    }
]
```

Now pressing:

```text
Ctrl+Space
```

shows:

```text
f    Open File
p    Command Palette
b    Switch Buffer
n    New File
```

Selecting an item executes the command.

---

***### 3. Add nested groups (more WhichKey-like)***

You can extend it to support menus:

```python
LEADER_MAP = {
    "f": {
        "o": ("Open File", "prompt_open_file"),
        "r": ("Recent Files", "open_recent_file")
    },
    "b": {
        "n": ("Next Buffer", "next_view"),
        "p": ("Previous Buffer", "prev_view")
    }
}
```

Then after choosing `f`, a second Quick Panel appears showing:

```text
fo   Open File
fr   Recent Files
```

This gets much closer to Neovim's WhichKey behavior.

---

***### 4. Make it feel even more like WhichKey***

Common leader layout:

```python
LEADER_MAP = {
    "f": ("Files", None),
    "g": ("Git", None),
    "b": ("Buffers", None),
    "w": ("Windows", None),
    "p": ("Projects", None),
}
```

When `Ctrl+Space` is pressed, the popup immediately reminds you of all available prefixes, which is the main productivity benefit of WhichKey: discoverability of keybindings without memorizing everything.

Sublime doesn't currently have a mature, widely-used WhichKey package comparable to Neovim's `which-key.nvim`, so a Quick Panel–based plugin like this is generally the simplest approach.

===================================================================================

> ChatGPT Question: 
> 
> use only space botton, not Ctrl+Space

You can bind **Space** directly, but there's a catch:

* In normal Sublime Text editing, pressing `Space` inserts a space character.
* A key binding on `["space"]` will override normal typing everywhere it is active.

A better approach is to make Space act as a leader key only in a specific context, such as Vim mode (`Vintage`/`Vintageous`) normal mode.

Example:

```json
{
    "keys": ["space"],
    "command": "which_key",
    "context":
    [
        { "key": "setting.command_mode", "operand": true }
    ]
}
```

This means:

* Normal editing: `Space` types a space.
* Command/normal mode: `Space` opens your WhichKey menu.

If you want Space to work globally as a leader key (like Neovim), use:

```json
{
    "keys": ["space"],
    "command": "which_key"
}
```

but then you won't be able to type spaces normally, which makes Sublime nearly unusable for text editing.

If you're using **Vintageous**, I can show you how to create a true Vim-style `<leader>` hierarchy:

```text
<Space> f o   Open File
<Space> f r   Recent Files
<Space> b n   Next Buffer
<Space> b p   Previous Buffer
<Space> p     Command Palette
```

with multi-level menus that feel much closer to `which-key.nvim`.

===================================================================================

> ChatGPT Question: 
> 
> with Vintageous, create multi-level menus that feel much closer to which-key.nvim

If you're using **NeoVintageous** (recommended over the older Vintageous), you can make **Space** your leader key exactly like Neovim. NeoVintageous supports `mapleader` and `<Leader>` mappings. ([NeoVintageous][1])

Open your `.neovintageousrc`:

```text
Command Palette → NeoVintageous: Open neovintageousrc file
```

Then add:

```vim
let mapleader=<space>

" Files
nnoremap <Leader>ff :PromptOpenFile<CR>
nnoremap <Leader>fp :ShowOverlay overlay=command_palette<CR>

" Buffers
nnoremap <Leader>bn :NextView<CR>
nnoremap <Leader>bp :PrevView<CR>

" Projects
nnoremap <Leader>ps :GotoSymbolInProject<CR>

" Sidebar
nnoremap <Leader>e :Neovintageous action=toggle_side_bar<CR>
```

NeoVintageous allows `<Leader>` to be replaced by whatever `mapleader` is set to, including Space. ([NeoVintageous][1])

So you'll get:

```text
<Space> f f   Open File
<Space> f p   Command Palette
<Space> b n   Next Buffer
<Space> b p   Previous Buffer
<Space> p s   Project Symbols
<Space> e     Toggle Sidebar
```

***### For a WhichKey popup***

Combine this with the custom `WhichKeyCommand` plugin from earlier and map:

```json
{
    "keys": [" "],
    "command": "which_key",
    "context": [
        { "key": "setting.command_mode", "operand": true }
    ]
}
```

The `command_mode` context makes Space behave as a leader only in NeoVintageous normal mode, while still inserting spaces in insert mode. This follows the same modal workflow as Neovim. ([sublimetext.com][2])

If you'd like, I can also show a complete Neovim-style setup with:

* `<Space> f` → file group
* `<Space> b` → buffer group
* `<Space> g` → Git group
* `<Space> w` → window group

and a hierarchical popup that closely mimics `which-key.nvim`.

[1]: https://neovintageous.github.io/reference/key-mapping?utm_source=chatgpt.com "Key mapping | NeoVintageous Docs"
[2]: https://www.sublimetext.com/docs/vintage.html?utm_source=chatgpt.com "Vintage Mode"

==================================================================================

> ChatGPT Question: 
> 
> create a hierarchical popup that closely mimics which-key.nvim

To get something very close to `which-key.nvim` in **NeoVintageous**, use:

1. **Space as leader**
2. **A custom plugin that shows nested Quick Panels**
3. **NeoVintageous mappings that execute the same commands**

---

***## 1. Install NeoVintageous***

Install NeoVintageous from Package Control if you haven't already.

Then open your `.neovintageousrc` and add:

```vim
let mapleader=<space>
```

---

***## 2. Create the WhichKey plugin***

Create:

```text
Packages/User/which_key.py
```

with:

```python
import sublime
import sublime_plugin

MENU = {
    "f": {
        "name": "Files",
        "items": {
            "f": ("Open File", "prompt_open_file"),
            "r": ("Recent Files", "open_recent_file"),
            "p": ("Command Palette", "show_overlay")
        }
    },

    "b": {
        "name": "Buffers",
        "items": {
            "n": ("Next Buffer", "next_view"),
            "p": ("Previous Buffer", "prev_view")
        }
    },

    "w": {
        "name": "Windows",
        "items": {
            "s": ("Split", "new_pane"),
            "c": ("Close Pane", "destroy_pane")
        }
    },

    "p": {
        "name": "Project",
        "items": {
            "s": ("Project Symbols", "goto_symbol_in_project")
        }
    }
}


class WhichKeyCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.groups = list(MENU.keys())

        items = [
            [k, MENU[k]["name"]]
            for k in self.groups
        ]

        self.window.show_quick_panel(
            items,
            self.group_selected
        )

    def group_selected(self, index):
        if index == -1:
            return

        group = self.groups[index]
        self.group = MENU[group]

        self.commands = list(
            self.group["items"].keys()
        )

        items = []

        for key in self.commands:
            title, _ = self.group["items"][key]
            items.append(
                [f"{group}{key}", title]
            )

        self.window.show_quick_panel(
            items,
            self.command_selected
        )

    def command_selected(self, index):
        if index == -1:
            return

        key = self.commands[index]

        title, command = (
            self.group["items"][key]
        )

        if command == "show_overlay":
            self.window.run_command(
                command,
                {"overlay": "command_palette"}
            )
        else:
            self.window.run_command(command)
```

---

***## 3. Bind Space in NeoVintageous normal mode***

Open **Preferences → Key Bindings** and add:

```json
{
    "keys": ["space"],
    "command": "which_key",
    "context": [
        {
            "key": "setting.command_mode",
            "operand": true
        }
    ]
}
```

This means:

* Normal mode → Space opens WhichKey
* Insert mode → Space inserts a space

---

***## 4. Match the same mappings in NeoVintageous***

In `.neovintageousrc`:

```vim
let mapleader=<space>

" Files
nnoremap <leader>ff :PromptOpenFile<CR>
nnoremap <leader>fp :ShowOverlay overlay=command_palette<CR>

" Buffers
nnoremap <leader>bn :NextView<CR>
nnoremap <leader>bp :PrevView<CR>

" Project
nnoremap <leader>ps :GotoSymbolInProject<CR>
```

---

***## Result***

Pressing:

```text
<Space>
```

shows:

```text
f  Files
b  Buffers
w  Windows
p  Project
```

Selecting **f** shows:

```text
ff  Open File
fr  Recent Files
fp  Command Palette
```

Selecting **b** shows:

```text
bn  Next Buffer
bp  Previous Buffer
```

So the workflow becomes:

```text
<Space> → f → f
<Space> → b → n
<Space> → p → s
```

which is about as close as Sublime Text can get to Neovim's `which-key.nvim` without writing a more advanced plugin that displays a floating popup automatically after the first key in a leader sequence.

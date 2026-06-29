# LunarVim-Like-Keybind.md

# Concept

> ChatGPT Question: 
> 
> how to configure Zed to feel exactly like Neovim (leader keys + Telescope-style workflow)

You can get **very close to a Neovim + Telescope workflow in Zed**, but it won’t be identical because Zed doesn’t expose a plugin system like Neovim. What you *can* do is recreate the same **leader-key mental model + fuzzy finder workflow** using keybindings.

Here’s a practical setup.

---

***# 🧠 Goal: Neovim-style Zed setup***

We want:

* `<Space>` as leader key
* Telescope-style pickers:

  * files
  * grep
  * symbols
  * buffers
  * commands
* fast navigation like LazyVim

---

***# ⚙️ Step 1 — Enable Vim mode***

In Zed:

Go to settings:

```json
{
  "vim_mode": true
}
```

---

***# 🔑 Step 2 — Set up Leader Key system***

Zed doesn’t have a true “leader key engine”, but you simulate it using multi-key bindings.

Open `keymap.json` and add:

---

***## 📁 File navigation (Telescope find_files)***

```json
[
  {
    "context": "Editor",
    "bindings": {
      "space f f": "file_finder::Toggle"
    }
  }
]
```

👉 Now:

* `Space f f` → fuzzy file search (Telescope-like)

---

***## 🔎 Live grep (Telescope live_grep)***

```json
{
  "context": "Editor",
  "bindings": {
    "space f g": "project_search::Toggle"
  }
}
```

👉 Now:

* `Space f g` → search in project

---

***## 🧠 Symbols (Telescope lsp symbols)***

```json
{
  "context": "Editor",
  "bindings": {
    "space f s": "outline::Toggle"
  }
}
```

---

***## 📂 Buffers / tabs (Telescope buffers)***

```json
{
  "context": "Editor",
  "bindings": {
    "space b b": "pane::ActivateNextItem"
  }
}
```

Better alternative:

```json
{
  "space b d": "pane::CloseActiveItem"
}
```

---

***## ⚡ Command palette (Telescope “everything”)***

```json
{
  "context": "Editor",
  "bindings": {
    "space p": "command_palette::Toggle"
  }
}
```

---

***# 🔭 Step 3 — Telescope-style navigation mapping***

| Neovim Telescope | Zed equivalent |
| ---------------- | -------------- |
| `<leader>ff`     | `space f f`    |
| `<leader>fg`     | `space f g`    |
| `<leader>fs`     | `space f s`    |
| `<leader>fb`     | `space b b`    |
| `<leader>fp`     | `space p`      |

---

***# 🪟 Step 4 — Make it feel like Telescope preview***

Zed doesn’t have a floating preview window, but you can mimic it:

***### Enable split workflow:***

* Open file → preview in editor
* Use:

```text
Ctrl + \
```

to split pane

Now you get:

> Left: search results
> Right: preview file (Telescope-like feel)

---

***# ⚡ Step 5 — Vim-like motion improvements***

Add mental Neovim equivalents:

| Action           | Zed         |
| ---------------- | ----------- |
| Go to definition | F12         |
| Find references  | Shift + F12 |
| Quick open       | Ctrl + P    |
| Go line          | Ctrl + G    |

---

***# 🧠 Key limitation (important)***

Zed does NOT support:

* real Lua plugins
* dynamic Telescope extensions
* fully customizable pickers

So:

> ❌ Not real Telescope
> ✔ But same workflow feel

---

***# 🚀 Best “LazyVim-like” key layout (recommended)***

```text
Space f f → files
Space f g → grep
Space f s → symbols
Space b b → buffers
Space p   → commands
```

This is the closest you’ll get to LazyVim muscle memory.

---

***# 🧩 Final reality check***

* Zed = **fast built-in pickers**
* Neovim = **fully extensible Telescope ecosystem**

But with good keymaps:

> 👉 Zed can feel like “minimal LazyVim without plugins”

---

If you want, I can give you:

* a full **ready-to-copy keymap.json for Laravel dev**
* or a **LazyVim → Zed conversion cheat sheet** (muscle memory mapping 1:1)

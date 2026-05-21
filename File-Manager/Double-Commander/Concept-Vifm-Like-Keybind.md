# Vifm-Like-Keybind.md

# Concepts

## ChatGPT: Vifm Like Hotkey

> ChatGPT Question:
> 
> Make double-commander's keyboard shortcuts like vifm, same to same

You can get very close to Vifm behavior in Double Commander by remapping almost everything in:

```text id="rj5rwp"
Configuration → Hot Keys
```

Below is a practical “same-to-same” mapping.

---

# Core movement

| Vifm     | Double Commander command |
| -------- | ------------------------ |
| `h`      | `cm_GoToParent`          |
| `j`      | `cm_CursorDown`          |
| `k`      | `cm_CursorUp`            |
| `l`      | `cm_Open`                |
| `gg`     | `cm_GoToFirstFile`       |
| `G`      | `cm_GoToLastFile`        |
| `Ctrl+d` | `cm_ViewDown`            |
| `Ctrl+u` | `cm_ViewUp`              |

---

# Tabs

| Vifm | Command      |
| ---- | ------------ |
| `gt` | `cm_NextTab` |
| `gT` | `cm_PrevTab` |
| `t`  | `cm_NewTab`  |

Suggested practical bindings:

| Key     |
| ------- |
| `Alt+l` |
| `Alt+h` |

because Double Commander lacks true multi-key Vim sequences.

---

# File operations

| Vifm | Double Commander        |
| ---- | ----------------------- |
| `yy` | `cm_CopyNamesToClip`    |
| `dd` | `cm_Delete`             |
| `p`  | `cm_PasteFromClipboard` |
| `r`  | `cm_RenameOnly`         |
| `cw` | `cm_RenameOnly`         |
| `dD` | permanent delete        |

---

# Search / fuzzy behavior

| Vifm | Double Commander   |
| ---- | ------------------ |
| `/`  | `cm_QuickSearch`   |
| `n`  | next search result |
| `N`  | previous result    |

---

# Selection

| Vifm    | Command                   |
| ------- | ------------------------- |
| `space` | `cm_MarkPlus`             |
| `v`     | `cm_MarkCurrentExtension` |
| `V`     | `cm_MarkCurrentPath`      |

---

# View / preview

| Vifm    | Command                 |
| ------- | ----------------------- |
| `i`     | `cm_ShowFileProperties` |
| `o`     | `cm_View`               |
| `Enter` | `cm_Open`               |

---

# Panels

| Vifm     | Double Commander |
| -------- | ---------------- |
| `Tab`    | `cm_FocusSwap`   |
| `Ctrl+w` | panel switching  |

---

# Directory history

| Vifm | Command                 |
| ---- | ----------------------- |
| `H`  | `cm_DirHistory` back    |
| `L`  | `cm_DirHistory` forward |

---

# Terminal integration

| Vifm | Double Commander  |
| ---- | ----------------- |
| `:`  | `cm_OpenTerminal` |

This is one of the best Vim-feeling tweaks.

---

# Better “real Vifm” behavior

Enable these options:

## 1. Disable confirmation dialogs

```text id="vv3ehq"
Configuration → Options → File operations
```

Turn off unnecessary prompts.

---

## 2. Use internal viewer/editor shortcuts

Map:

| Key  | Command |
| ---- | ------- |
| `F3` | viewer  |
| `F4` | editor  |

like orthodox file managers.

---

## 3. Enable quick search on typing

```text id="b8d3vk"
Configuration → Options → Quick Search
```

Makes `/`-style navigation smoother.

---

# Closest possible Vifm layout

Recommended UI:

```text id="h7a0rm"
View → Two panels
View → Brief
View → Flat view OFF
```

and hide toolbar/menu for terminal-like feel.

---

# Important limitation

Double Commander cannot fully replicate:

* Vim modal editing
* native multi-key sequences (`gg`, `dd`, `yy`)
* Vim command-line mode
* macros/registers

But with remaps it becomes surprisingly close.

---

# Best enhancement

Combine Double Commander with:

* fzf
* ripgrep
* bat
* embedded terminal

for a workflow very similar to Vifm + shell.

Docs:

* [Double Commander hotkeys docs](https://doublecmd.github.io/doc/en/configuration.html?utm_source=chatgpt.com#hotkeys)
* [Vifm keybindings reference](https://vifm.info/docs/v0.13/vifm-help.shtml?utm_source=chatgpt.com#keybindings)

===================================================================================

> ChatGPT Question: 
> 
> Make double-commander keyboard shortcuts like vifm, same to same, and cross-platform solution

For a truly **cross-platform** solution (Linux + Windows + macOS) with app-specific Vim-style hotkeys for Double Commander, the best option is:

# Best Cross-Platform Stack

| OS      | Tool               |
| ------- | ------------------ |
| Linux   | xremap             |
| Windows | AutoHotkey         |
| macOS   | Karabiner-Elements |

There is currently no single universal remapper that:

* supports Vim sequences (`gg`, `dd`)
* works app-specifically
* supports all 3 OSes equally well

---

# Recommended unified behavior

Use the SAME mappings everywhere:

| Vim  | Action |
| ---- | ------ |
| `h`  | left   |
| `j`  | down   |
| `k`  | up     |
| `l`  | open   |
| `gg` | top    |
| `G`  | bottom |
| `dd` | delete |
| `yy` | copy   |
| `p`  | paste  |

---

# Linux (xremap)

```yaml id="y1g5g6"
modmap:
  - name: Double Commander
    application:
      only:
        - Doublecmd

    remap:
      h: left
      j: down
      k: up
      l: enter

      g-g: home
      shift-g: end

      d-d: delete
      y-y: C-c
      p: C-v
```

* [xremap GitHub](https://github.com/xremap/xremap?utm_source=chatgpt.com)

---

# Windows (AutoHotkey)

```ahk id="2ucy2k"
#IfWinActive ahk_exe doublecmd.exe

h::Left
j::Down
k::Up
l::Enter

g::
KeyWait, g, D T0.3
if !ErrorLevel
    Send {Home}
return

+d::Delete
+p::^v

#IfWinActive
```

Better `gg` version:

```ahk id="zt68h0"
~g::
if (A_PriorHotkey = "~g" && A_TimeSincePriorHotkey < 300)
{
    Send {Home}
}
return
```

* [AutoHotkey official site](https://www.autohotkey.com/?utm_source=chatgpt.com)

---

# macOS (Karabiner)

Use:

* Complex Modifications
* app-specific conditions

Example concept:

```json id="r0v3z4"
{
  "type": "basic",
  "from": {
    "key_code": "g"
  },
  "to_if_alone": [
    {
      "key_code": "g"
    }
  ],
  "to_if_held_down": [
    {
      "key_code": "home"
    }
  ]
}
```

Target only Double Commander bundle ID.

* [Karabiner-Elements](https://karabiner-elements.pqrs.org/?utm_source=chatgpt.com)

---

# Most practical reality

If you want:

* exact Vim motions
* modal behavior
* native `gg/dd/yy`
* same config everywhere

then terminal managers are vastly better:

* Vifm
* Yazi
* ranger

GUI file managers fundamentally do not support Vim’s modal engine internally.

---

# Closest “single config” approach

If you really want one shared config philosophy:

* keep mappings conceptually identical
* use OS-native remapper underneath
* store configs in Git repo

Example:

```text id="s8j26n"
dotfiles/
 ├── xremap/
 ├── ahk/
 └── karabiner/
```

This is what most cross-platform Vim users do.

==================================================================================

> ChatGPT Question:
> 
> Make double commander's all hotkey like vifm's same to same. Make a autohotkey
> script for this requirement and how to run this script.

You can make Double Commander behave much more like Vifm by using an AutoHotkey script that remaps keys only when Double Commander is active.

Install first:

* [AutoHotkey official website](https://www.autohotkey.com/?utm_source=chatgpt.com)
* [Double Commander official website](https://doublecmd.sourceforge.io/?utm_source=chatgpt.com)
* [Vifm official website](https://vifm.info/?utm_source=chatgpt.com)

---

# AutoHotkey Script (Vifm-style keys for Double Commander)

Save this as:

```text
doublecmd_vifm.ahk
```

Then paste this script inside.

## AutoHotkey v2 Script

```ahk
#Requires AutoHotkey v2.0

; ==========================================================
; Double Commander -> Vifm-like Keybindings
; Works only when Double Commander window is active
; ==========================================================

#HotIf WinActive("ahk_exe doublecmd.exe")

; -------------------------
; Movement (hjkl)
; -------------------------
h::Send("{Left}")
j::Send("{Down}")
k::Send("{Up}")
l::Send("{Right}")

; -------------------------
; Open / Enter
; -------------------------
o::Send("{Enter}")

; -------------------------
; Go to parent directory
; -------------------------
u::Send("!{Up}")

; -------------------------
; Refresh
; -------------------------
r::Send("{F2}")

; -------------------------
; Rename
; -------------------------
cw::Send("{F6}")

; -------------------------
; Copy / Move
; -------------------------
yy::Send("{F5}")   ; copy
dd::Send("{F8}")   ; delete
pp::Send("^v")     ; paste

; -------------------------
; Create directory
; -------------------------
md::Send("+{F7}")

; -------------------------
; Search
; -------------------------
/::Send("^f")

; -------------------------
; Tabs
; -------------------------
gt::Send("^{Tab}")
gT::Send("^+{Tab}")

; -------------------------
; Jump to top / bottom
; -------------------------
gg::Send("^{Home}")
+g::Send("^{End}")

; -------------------------
; Toggle selection with space
; -------------------------
Space::Send("{Insert}")

; -------------------------
; Select all
; -------------------------
v::Send("^a")

; -------------------------
; Quit tab
; -------------------------
q::Send("^w")

; -------------------------
; Open terminal
; -------------------------
t::Send("^`")

; -------------------------
; Reload panel
; -------------------------
R::Send("^r")

; -------------------------
; Home directory
; -------------------------
gh::Send("!{Home}")

; -------------------------
; Root directory
; -------------------------
g/::Send("^\")

; -------------------------
; New tab
; -------------------------
tn::Send("^t")

; -------------------------
; Close tab
; -------------------------
tc::Send("^w")

; -------------------------
; Split focus panels
; -------------------------
Tab::Send("{Tab}")

#HotIf
```

---

# How to Run the Script

## 1. Install AutoHotkey

Download and install:

[AutoHotkey Download Page](https://www.autohotkey.com/download/?utm_source=chatgpt.com)

Choose **AutoHotkey v2**.

---

## 2. Create the Script File

1. Right-click on Desktop
2. New → AutoHotkey Script
3. Name it:

```text
doublecmd_vifm.ahk
```

4. Right-click → Edit Script
5. Paste the script above
6. Save

---

## 3. Run the Script

Double-click the `.ahk` file.

You will see a green “H” icon in the system tray.

Now the mappings work only inside Double Commander.

---

# Important Notes

Some keys depend on Double Commander’s own shortcuts.

You may want to set these inside Double Commander:

## Open Keyboard Settings

Inside Double Commander:

```text
Configuration → Options → Hot Keys
```

You can make these match Vifm even more closely.

---

# Recommended Double Commander Hotkeys

Set these manually for best Vifm feel:

| Action    | Suggested Key |
| --------- | ------------- |
| Copy      | F5            |
| Move      | F6            |
| Rename    | Shift+F6      |
| Delete    | F8            |
| Terminal  | Ctrl+`        |
| Search    | Ctrl+F        |
| New Tab   | Ctrl+T        |
| Close Tab | Ctrl+W        |

---

# Optional: Start Automatically with Windows

Press:

```text
Win + R
```

Type:

```text
shell:startup
```

Copy your `.ahk` file into that folder.

Now it launches automatically when Windows starts.

---

# If You Want Full Vim/Vifm Behavior

You can extend this with:

* Vim-style command mode (`:`)
* Visual mode
* Marks/bookmarks
* Registers
* Macros
* Leader key
* File previews
* Custom motions (`w`, `b`, `e`)
* NerdTree-style navigation

I can also generate:

* a **much more advanced Vim emulation**
* a **Neovim-like modal system**
* or a **true Vifm clone experience for Double Commander**.

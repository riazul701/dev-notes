# Vifm-Like-Keybind.md

# Concept

## ChatGPT: Double-Commander Issue/Conflict

> ChatGPT Question: 
> 
> In double-commander file window, pressing any single alphabet, presents "filter" field. How to turn it off on Windows-OS?

On Windows builds of **Double Commander**, there is usually **no separate checkbox in Options → File panels** for this—so you’re not missing it.

What you’re seeing is controlled by the **“Typing → Quick search/filter” behavior**, not a simple toggle in the main options tree.

### ✅ Fix (Windows version)

Do this instead:

1. Open **Configuration → Options**

2. Go to:
   **Keys → Typing**

3. Find entries like:

   * **Quick search**
   * **Quick filter**
   * or **Search / filter in file panel**

4. Change the action for **“alphanumeric keys” (A–Z / 0–9)** from:

   * *Quick filter* ➜ to **None / Command line / No action**

5. Apply / OK

### ⚠️ Important detail

Double Commander splits behavior into:

* **Quick search** (jump/highlight)
* **Quick filter** (hide non-matching files)

On Windows builds, typing letters is often mapped directly in **Keys → Typing**, not in the general options page—this is why you didn’t find it earlier.

---

### 🧠 Alternative workaround (if you don’t want to fully disable it)

If you just want to stop the popup but keep functionality:

* Assign quick search to a hotkey like `Ctrl+F` or `/`
* Leave “typing in file list” unassigned

---

If you want, tell me your **Double Commander version**, because the exact labels vary slightly between builds (Qt vs GTK, older vs newer Windows packages).

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

==================================================================================

> ChatGPT Question:
> 
> In below, AutoHotkey script, "cw" keyboard shortcut does not work and shows error

In AutoHotkey, `cw::` is interpreted as an invalid hotkey because multi-character sequences are not defined that way in v2.

You need to use a custom combination handler instead of `cw::`.

Replace this:

```ahk
cw::Send("{F6}")
```

with this:

```ahk
c & w::Send("{F6}")
```

However, `c & w` makes `c` a modifier key, which may not behave like Vim’s `cw`.

A better Vim-like approach is to use an input sequence:

```ahk
:*:cw::
{
    Send("{F6}")
}
```

But that triggers everywhere, not only inside Double Commander.

For your use case, the cleanest solution is:

```ahk
#HotIf WinActive("ahk_exe doublecmd.exe")

c::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input = "w")
        Send("{F6}")
    else
        Send("c" ih.Input)
}

#HotIf
```

This waits briefly after pressing `c`:

* if next key is `w` → sends `F6`
* otherwise types normally

You have the same issue with:

* `yy::`
* `dd::`
* `pp::`
* `md::`
* `gt::`
* `gg::`
* `gh::`
* `tn::`
* `tc::`

Those are also invalid in AutoHotkey v2 and should be rewritten similarly.

For example:

```ahk
y::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input = "y")
        Send("{F5}")
}
```

The reason single keys like `h::`, `j::`, `k::` work is because they are valid one-key hotkeys. Multi-letter sequences are not supported directly with `xx::` syntax in v2.

==================================================================================

> ChatGPT Question:
> 
> In AutoHotkey v2 following two entries make duplicate hotkey entry error
> 
> ```ahk
> g::
> {
>     ih := InputHook("L1 T0.3")
>     ih.Start()
>     ih.Wait()
> 
>     if (ih.Input = "t")
>         Send("{F6}")
>     else
>         Send("c" ih.Input)
> }
> ```
> 
> AND
> 
> ```ahk
> g::
> {
>     ih := InputHook("L1 T0.3")
>     ih.Start()
>     ih.Wait()
> 
>     if (ih.Input = "T")
>         Send("{F6}")
>     else
>         Send("c" ih.Input)
> }
> ```

You get a “duplicate hotkey” error because both blocks define the exact same hotkey:

```ahk
g::
```

In AutoHotkey v2, you cannot define `g::` twice, even if the internal `if` conditions differ.

Instead, combine both conditions into one hotkey:

```ahk id="1z8qwe"
$g::
{
    ih := InputHook("L1 T0.3")
    ih.Start()
    ih.Wait()

    if (ih.Input == "t")
        Send("{F6}")

    else if (ih.Input == "T")
        Send("{F7}")

    else
        Send("c" ih.Input)
}
```

Notes:

* `==` → case-sensitive comparison
* `=` → case-insensitive comparison
* `$g::` prevents recursive triggering issues

So:

* typing `gt` → sends `F6`
* typing `gT` → sends `F7`

Official docs:

* [AutoHotkey v2 Hotkeys](https://www.autohotkey.com/docs/v2/Hotkeys.htm?utm_source=chatgpt.com)
* [InputHook](https://www.autohotkey.com/docs/v2/lib/InputHook.htm?utm_source=chatgpt.com)

=================================================================================

> ChatGPT Question: 
> 
> In AutoHotkey difference between "g" and "+g" key

In AutoHotkey hotkeys:

* `"g"` means the **G key**
* `"+g"` means **Shift + G**

The `+` symbol is the modifier for **Shift**.

Example:

```ahk id="8r7nmk"
g::
{
    MsgBox("You pressed g")
}
```

Triggers when pressing `g`.

---

```ahk id="b6t4wa"
+g::
{
    MsgBox("You pressed Shift+g")
}
```

Triggers when pressing `Shift + g` (uppercase `G`).

---

Common modifier symbols in AutoHotkey:

| Symbol | Meaning |
| ------ | ------- |
| `+`    | Shift   |
| `^`    | Ctrl    |
| `!`    | Alt     |
| `#`    | Win key |

Example:

```ahk id="m2z8xu"
^+g::
```

means:

**Ctrl + Shift + G**

Official docs:
[AutoHotkey Hotkeys Documentation](https://www.autohotkey.com/docs/v2/Hotkeys.htm?utm_source=chatgpt.com)

==================================================================================

> ChatGPT Question: 
> 
> when using autohotkey v2 with double-commander, hotkey that is used in autohotkey
> script, can not type that key in double-commander's search field

That happens because the AutoHotkey v2 hotkey intercepts the key globally before Double Commander receives it.

The usual solution is to disable the hotkey when the search box (or any edit control) is focused.

Example:

```ahk id="m4q8zs"
#HotIf !ControlGetFocus("A")

y::
{
    MsgBox("Hotkey triggered")
}
```

But `ControlGetFocus()` returns a control name, not boolean, so better:

```ahk id="n7t2xv"
#HotIf !(InStr(ControlGetFocus("A"), "Edit"))

y::
{
    MsgBox("Hotkey triggered")
}
```

Meaning:

* If cursor is inside an Edit/Search field → normal typing
* Otherwise → hotkey works

For Double Commander specifically, you can scope it to that app:

```ahk id="k5w1pc"
#HotIf WinActive("ahk_exe doublecmd.exe") 
    && !(InStr(ControlGetFocus("A"), "Edit"))

y::
{
    MsgBox("Hotkey triggered")
}

#HotIf
```

Or simpler: completely disable the hotkey inside Double Commander:

```ahk id="h8u3rb"
#HotIf !WinActive("ahk_exe doublecmd.exe")

y::
{
    MsgBox("Hotkey triggered")
}

#HotIf
```

Useful debugging command:

```ahk id="c9f6jl"
F1::
{
    MsgBox(ControlGetFocus("A"))
}
```

Press `F1` while cursor is in Double Commander search field to see the actual control name.

==================================================================================

> ChatGPT Question:
> 
> Reply: "Press `F1` while cursor is in Double Commander search field to see the actual control name."
> Number appears like "787856" or "132284". Not any name.

That means Double Commander uses custom controls, not standard Windows `Edit` controls. The number you see is likely an internal window handle (HWND).

Instead of checking control name, use the control **class**:

```ahk id="d4m7qp"
F1::
{
    hwnd := ControlGetFocus("A")
    class := WinGetClass("ahk_id " hwnd)

    MsgBox("HWND: " hwnd "`nClass: " class)
}
```

Then click the search field and press `F1`.

You will probably get something like:

* `Edit`
* `TEdit`
* `LCL...`
* `TTntEdit`
* etc.

Then use that class in `#HotIf`.

Example:

```ahk id="u2x8vn"
#HotIf !(WinGetClass("ahk_id " ControlGetFocus("A")) = "TEdit")

y::
{
    MsgBox("Triggered")
}

#HotIf
```

Or if the class contains text:

```ahk id="a9k3rm"
#HotIf !InStr(WinGetClass("ahk_id " ControlGetFocus("A")), "Edit")

y::
{
    MsgBox("Triggered")
}

#HotIf
```

This is more reliable for Lazarus/Qt/custom GUI apps like Double Commander.

================================================================================

> ChatGPT Question: 
> 
> In autohotkey and double-commander, pressing "yb" works, but/alternatively 
> pressing "yy" does not work, same key pressing twice does not work, different 
> keys work.

Alright — here’s a **clean, stable “Vim-style” system for Double Commander using AutoHotkey v2 that avoids all the problems with `yy`, `InputHook`, and same-key sequences**.

The key idea:
👉 **stop trying to detect sequences after they happen**
👉 instead, use a **state/leader-key system**

---

# ✅ Reliable Vim-style solution (no InputHook, no yy problems)

## Option A (BEST): Leader key system

You press `y`, then another key.

### Example: `y y` → F5

```ahk
#HotIf WinActive("ahk_exe doublecmd.exe")

~y::
{
    static last := 0
    now := A_TickCount

    ; if second y within 400 ms
    if (now - last < 400)
    {
        Send("{F5}")
        last := 0
    }
    else
    {
        last := now
    }
}

#HotIf
```

### How it behaves

* `y` → normal typing (no interruption)
* `y y` quickly → triggers `{F5}`
* slow `y ... y` → treated as normal typing

---

# Option B (more “Vim-like”): real command mode

This is more powerful and stable long-term.

```ahk
#HotIf WinActive("ahk_exe doublecmd.exe")

global mode := "normal"

~Esc::
{
    global mode := "normal"
}

y::
{
    global mode

    if (mode = "normal")
    {
        mode := "y_wait"
        SetTimer(ResetMode, -500)
    }
}

~y::
{
    global mode

    if (mode = "y_wait")
    {
        Send("{F5}")
        mode := "normal"
    }
}

ResetMode()
{
    global mode := "normal"
}

#HotIf
```

### Behavior

* first `y` → enters temporary state
* second `y` → executes F5
* timeout resets automatically
* Esc cancels mode

This is much closer to Vim behavior.

---

# Option C (cleanest long-term): use combinations instead of doubles

Replace fragile `yy` with:

```ahk
#HotIf WinActive("ahk_exe doublecmd.exe")

y & j::Send("{F5}")
y & k::Send("{F2}")
y & l::Send("{Delete}")

#HotIf
```

### Why this is best

* no timing issues
* no InputHook
* no lost keystrokes
* works everywhere consistently

---

# 🚨 Important reality (why your original approach always breaks)

Double-key same-letter sequences like `yy` fail in Windows input systems because:

* first `y` activates hotkey
* second `y` is no longer a clean “raw keystroke”
* timing becomes unreliable per app (especially in Double Commander’s Lazarus UI)

So **InputHook + hotkey on same key will always be fragile**

---

# 🧠 Recommendation (what I would actually use)

For Double Commander:

* Use **Option A (leader key)** for simple behavior
* Use **Option C (combinations)** for power features
* Avoid InputHook entirely for keybinds

---

If you want, I can design a full “Double Commander Vim layer” (copy, move, rename, tabs, panels, search, etc.) that feels like Neovim but is fully stable in AutoHotkey v2.
